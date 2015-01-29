$NetBSD: patch-src_video_wscons_SDL__wsconsevents.c,v 1.7 2015/01/29 11:28:50 jmcneill Exp $

--- src/video/wscons/SDL_wsconsevents.c.orig	2012-01-19 06:30:06.000000000 +0000
+++ src/video/wscons/SDL_wsconsevents.c
@@ -47,14 +47,31 @@ int WSCONS_InitKeyboard(_THIS)
     return -1;
   }
 
+#if defined(__NetBSD__)
+  if (private->kbdType == 0) {
+    /* wsmux with no keyboard attached, assumed USB */
+    private->kbdType = WSKBD_TYPE_USB;
+  }
+#endif
+
   if (tcgetattr(private->fd, &private->saved_tty) == -1) {
     WSCONS_ReportError("cannot get terminal attributes: %s", strerror(errno));
     return -1;
   }
+  if (ioctl(private->fd, WSKBDIO_GETKEYREPEAT, &private->saved_repeat) == -1) {
+    WSCONS_ReportError("cannot get repeat settings: %s", strerror(errno));
+    return -1;
+  }
   private->did_save_tty = 1;
+
+  if (ioctl(private->fd, KDSKBMODE, K_RAW) == -1) {
+    WSCONS_ReportError("cannot set raw keyboard mode: %s", strerror(errno));
+    return -1;
+  }
+
   tty = private->saved_tty;
   tty.c_iflag = IGNPAR | IGNBRK;
-  tty.c_oflag = 0;
+  //tty.c_oflag = 0;
   tty.c_cflag = CREAD | CS8;
   tty.c_lflag = 0;
   tty.c_cc[VTIME] = 0;
@@ -65,8 +82,12 @@ int WSCONS_InitKeyboard(_THIS)
     WSCONS_ReportError("cannot set terminal attributes: %s", strerror(errno));
     return -1;
   }
-  if (ioctl(private->fd, KDSKBMODE, K_RAW) == -1) {
-    WSCONS_ReportError("cannot set raw keyboard mode: %s", strerror(errno));
+
+  struct wskbd_keyrepeat_data repeat;
+  repeat.which = WSKBD_KEYREPEAT_DOALL;
+  repeat.del1 = repeat.delN = UINT_MAX;
+  if (ioctl(private->fd, WSKBDIO_SETKEYREPEAT, &repeat) == -1) {
+    WSCONS_ReportError("cannot set repeat settings: %s", strerror(errno));
     return -1;
   }
 
@@ -81,6 +102,10 @@ void WSCONS_ReleaseKeyboard(_THIS)
 			 strerror(errno));
     }
     if (private->did_save_tty) {
+      if (ioctl(private->fd, WSKBDIO_SETKEYREPEAT, &private->saved_repeat) == -1) {
+        WSCONS_ReportError("cannot restore repeat settings: %s",
+			   strerror(errno));
+      }
       if (tcsetattr(private->fd, TCSANOW, &private->saved_tty) < 0) {
 	WSCONS_ReportError("cannot restore keynoard attributes: %s",
 			   strerror(errno));
@@ -89,8 +114,57 @@ void WSCONS_ReleaseKeyboard(_THIS)
   }
 }
 
-static void updateMouse()
+int WSCONS_InitMouse(_THIS)
 {
+  if (private->mouseFd != -1) {
+#if defined(WSMOUSEIO_SETVERSION)
+    int version = WSMOUSE_EVENT_VERSION;
+    if (ioctl(private->mouseFd, WSMOUSEIO_SETVERSION, &version) == -1) {
+      WSCONS_ReportError("cannot set mouse API version: %s", strerror(errno));
+      return -1;
+    }
+#endif
+  }
+  return 0;
+}
+
+void WSCONS_ReleaseMouse(_THIS)
+{
+}
+
+#define NUMEVENTS 64
+
+static void updateMouse(_THIS)
+{
+  struct wscons_event evlist[NUMEVENTS];
+  struct wscons_event *ev = evlist;
+  int nev, i;
+  ssize_t len;
+
+  len = read(private->mouseFd, evlist, sizeof(evlist));
+  if (len == -1) {
+    WSCONS_ReportError("Failed to read wsmouse event: %s", strerror(errno));
+    return;
+  }
+
+  nev = len / sizeof(*ev);
+
+  for (i = 0; i < nev; i++, ev++) {
+    switch (ev->type) {
+    case WSCONS_EVENT_MOUSE_UP:
+      posted += SDL_PrivateMouseButton(SDL_RELEASED, ev->value+1, 0, 0);
+      break;
+    case WSCONS_EVENT_MOUSE_DOWN:
+      posted += SDL_PrivateMouseButton(SDL_PRESSED, ev->value+1, 0, 0);
+      break;
+    case WSCONS_EVENT_MOUSE_DELTA_X:
+      posted += SDL_PrivateMouseMotion(0, 1, ev->value, 0);
+      break;
+    case WSCONS_EVENT_MOUSE_DELTA_Y:
+      posted += SDL_PrivateMouseMotion(0, 1, 0, -ev->value);
+      break;
+    }
+  }
 }
 
 static SDLKey keymap[128];
@@ -120,19 +194,42 @@ static void updateKeyboard(_THIS)
     for (i = 0; i < n; i++) {
       unsigned char c = buf[i] & 0x7f;
       if (c == 224) // special key prefix -- what should we do with it?
-	continue;
+       continue;
       posted += SDL_PrivateKeyboard((buf[i] & 0x80) ? SDL_RELEASED : SDL_PRESSED,
-				    TranslateKey(c, &keysym));
+                                   TranslateKey(c, &keysym));
     }
   }
 }
 
 void WSCONS_PumpEvents(_THIS)
 {
+  static struct timeval zero;
+  int maxfd = 0;
+
+  if (private->fd > maxfd)
+    maxfd = private->fd;
+  if (private->mouseFd > maxfd)
+    maxfd = private->mouseFd;
+
   do {
+    fd_set fds;
+
     posted = 0;
-    updateMouse();
-    updateKeyboard(this);
+
+    FD_ZERO(&fds);
+    if (private->fd != -1)
+      FD_SET(private->fd, &fds);
+    if (private->mouseFd != -1)
+      FD_SET(private->mouseFd, &fds);
+
+    if (select(maxfd+1, &fds, NULL, NULL, &zero) > 0) {
+      if (private->mouseFd != -1 && FD_ISSET(private->mouseFd, &fds)) {
+        updateMouse(this);
+      }
+      if (private->fd != -1 && FD_ISSET(private->fd, &fds)) {
+        updateKeyboard(this);
+      }
+    }
   } while (posted);
 }
 
@@ -146,8 +243,10 @@ void WSCONS_InitOSKeymap(_THIS)
   }
 
   switch (private->kbdType) {
-#ifdef WSKBD_TYPE_ZAURUS
+#if defined(WSKBD_TYPE_ZAURUS)
   case WSKBD_TYPE_ZAURUS:
+#endif
+  case WSKBD_TYPE_USB:
     /* top row */
     keymap[2] = SDLK_1;
     keymap[3] = SDLK_2;
@@ -220,7 +319,6 @@ void WSCONS_InitOSKeymap(_THIS)
     keymap[77] = SDLK_RIGHT;
     keymap[80] = SDLK_DOWN;
     break;
-#endif /* WSKBD_TYPE_ZAURUS */
 
   default:
     WSCONS_ReportError("Unable to map keys for keyboard type %u", 
