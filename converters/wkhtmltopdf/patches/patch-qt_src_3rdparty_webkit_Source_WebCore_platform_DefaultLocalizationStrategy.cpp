$NetBSD: patch-qt_src_3rdparty_webkit_Source_WebCore_platform_DefaultLocalizationStrategy.cpp,v 1.1 2017/09/10 19:58:36 joerg Exp $

--- qt/src/3rdparty/webkit/Source/WebCore/platform/DefaultLocalizationStrategy.cpp.orig	2017-09-09 19:39:31.656799184 +0000
+++ qt/src/3rdparty/webkit/Source/WebCore/platform/DefaultLocalizationStrategy.cpp
@@ -48,12 +48,12 @@ namespace WebCore {
 //  2) It doesn't handle the %2$d syntax.
 // Note that because |format| is used as the second parameter to va_start, it cannot be a reference
 // type according to section 18.7/3 of the C++ N1905 standard.
-static String formatLocalizedString(String format, ...)
+static String formatLocalizedString(String *format, ...)
 {
 #if USE(CF)
     va_list arguments;
     va_start(arguments, format);
-    RetainPtr<CFStringRef> formatCFString(AdoptCF, format.createCFString());
+    RetainPtr<CFStringRef> formatCFString(AdoptCF, format->createCFString());
     RetainPtr<CFStringRef> result(AdoptCF, CFStringCreateWithFormatAndArguments(0, 0, formatCFString.get(), arguments));
     va_end(arguments);
     return result.get();
@@ -61,12 +61,12 @@ static String formatLocalizedString(Stri
     va_list arguments;
     va_start(arguments, format);
     QString result;
-    result.vsprintf(format.latin1().data(), arguments);
+    result.vsprintf(format->latin1().data(), arguments);
     va_end(arguments);
     return result;
 #else
     notImplemented();
-    return format;
+    return *format;
 #endif
 }
 
@@ -322,7 +322,8 @@ String DefaultLocalizationStrategy::cont
 #else
 #if USE(CF)
     RetainPtr<CFStringRef> selectedCFString(AdoptCF, truncatedStringForLookupMenuItem(selectedString).createCFString());
-    return formatLocalizedString(WEB_UI_STRING("Look Up “%@”", "Look Up context menu item with selected word"), selectedCFString.get());
+    String fmt(WEB_UI_STRING("Look Up “%@”", "Look Up context menu item with selected word"));
+    return formatLocalizedString(&fmt, selectedCFString.get());
 #else
     return WEB_UI_STRING("Look Up “<selection>”", "Look Up context menu item with selected word").replace("<selection>", truncatedStringForLookupMenuItem(selectedString));
 #endif
@@ -683,7 +684,8 @@ String DefaultLocalizationStrategy::cras
 
 String DefaultLocalizationStrategy::multipleFileUploadText(unsigned numberOfFiles)
 {
-    return formatLocalizedString(WEB_UI_STRING("%d files", "Label to describe the number of files selected in a file upload control that allows multiple files"), numberOfFiles);
+    String fmt(WEB_UI_STRING("%d files", "Label to describe the number of files selected in a file upload control that allows multiple files"));
+    return formatLocalizedString(&fmt, numberOfFiles);
 }
 
 String DefaultLocalizationStrategy::unknownFileSizeText()
@@ -727,7 +729,8 @@ String DefaultLocalizationStrategy::keyg
 String DefaultLocalizationStrategy::keygenKeychainItemName(const String& host)
 {
     RetainPtr<CFStringRef> hostCFString(AdoptCF, host.createCFString());
-    return formatLocalizedString(WEB_UI_STRING("Key from %@", "Name of keychain key generated by the KEYGEN tag"), hostCFString.get());
+    String fmt(WEB_UI_STRING("Key from %@", "Name of keychain key generated by the KEYGEN tag"));
+    return formatLocalizedString(fmt, hostCFString.get());
 }
 
 #endif
@@ -748,13 +751,16 @@ String DefaultLocalizationStrategy::imag
     RetainPtr<CFNumberRef> height(AdoptCF, CFNumberCreate(0, kCFNumberIntType, &heightInt));
     RetainPtr<CFStringRef> heightString(AdoptCF, CFNumberFormatterCreateStringWithNumber(0, formatter.get(), height.get()));
 
-    return formatLocalizedString(WEB_UI_STRING("%@ %@×%@ pixels", "window title for a standalone image (uses multiplication symbol, not x)"), filenameCFString.get(), widthString.get(), heightString.get());
+    String fmt(WEB_UI_STRING("%@ %@×%@ pixels", "window title for a standalone image (uses multiplication symbol, not x)"));
+    return formatLocalizedString(&fmt, filenameCFString.get(), widthString.get(), heightString.get());
 #else
     RetainPtr<CFStringRef> filenameCFString(AdoptCF, filename.createCFString());
-    return formatLocalizedString(WEB_UI_STRING("%@ %d×%d pixels", "window title for a standalone image (uses multiplication symbol, not x)"), filenameCFString.get(), size.width(), size.height());
+    String fmt(WEB_UI_STRING("%@ %d×%d pixels", "window title for a standalone image (uses multiplication symbol, not x)"));
+    return formatLocalizedString(&fmt, filenameCFString.get(), size.width(), size.height());
 #endif
 #else
-    return formatLocalizedString(WEB_UI_STRING("<filename> %d×%d pixels", "window title for a standalone image (uses multiplication symbol, not x)"), size.width(), size.height()).replace("<filename>", filename);
+    String fmt(WEB_UI_STRING("<filename> %d×%d pixels", "window title for a standalone image (uses multiplication symbol, not x)"));
+    return formatLocalizedString(&fmt, size.width(), size.height()).replace("<filename>", filename);
 #endif
 }
 
@@ -869,13 +875,20 @@ String DefaultLocalizationStrategy::loca
     int minutes = (seconds / 60) % 60;
     seconds %= 60;
 
-    if (days)
-        return formatLocalizedString(WEB_UI_STRING("%1$d days %2$d hours %3$d minutes %4$d seconds", "accessibility help text for media controller time value >= 1 day"), days, hours, minutes, seconds);
-    if (hours)
-        return formatLocalizedString(WEB_UI_STRING("%1$d hours %2$d minutes %3$d seconds", "accessibility help text for media controller time value >= 60 minutes"), hours, minutes, seconds);
-    if (minutes)
-        return formatLocalizedString(WEB_UI_STRING("%1$d minutes %2$d seconds", "accessibility help text for media controller time value >= 60 seconds"), minutes, seconds);
-    return formatLocalizedString(WEB_UI_STRING("%1$d seconds", "accessibility help text for media controller time value < 60 seconds"), seconds);
+    if (days) {
+        String fmt(WEB_UI_STRING("%1$d days %2$d hours %3$d minutes %4$d seconds", "accessibility help text for media controller time value >= 1 day"));
+        return formatLocalizedString(&fmt, days, hours, minutes, seconds);
+    }
+    if (hours) {
+        String fmt(WEB_UI_STRING("%1$d hours %2$d minutes %3$d seconds", "accessibility help text for media controller time value >= 60 minutes"));
+        return formatLocalizedString(&fmt, hours, minutes, seconds);
+    }
+    if (minutes) {
+        String fmt(WEB_UI_STRING("%1$d minutes %2$d seconds", "accessibility help text for media controller time value >= 60 seconds"));
+        return formatLocalizedString(&fmt, minutes, seconds);
+    }
+    String fmt(WEB_UI_STRING("%1$d seconds", "accessibility help text for media controller time value < 60 seconds"));
+    return formatLocalizedString(&fmt, seconds);
 }
 
 String DefaultLocalizationStrategy::validationMessageValueMissingText()
