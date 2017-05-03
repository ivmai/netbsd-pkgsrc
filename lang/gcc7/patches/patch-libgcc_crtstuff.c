$NetBSD: patch-libgcc_crtstuff.c,v 1.1 2017/05/03 00:21:03 maya Exp $

--- libgcc/crtstuff.c.orig	2017-01-01 12:07:43.000000000 +0000
+++ libgcc/crtstuff.c
@@ -81,7 +81,7 @@ call_ ## FUNC (void)					\
 #endif
 
 #if defined(TARGET_DL_ITERATE_PHDR) && \
-   (defined(__DragonFly__) || defined(__FreeBSD__) || defined(__NetBSD__))
+   (defined(__DragonFly__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__))
 #define BSD_DL_ITERATE_PHDR_AVAILABLE
 #endif
  
