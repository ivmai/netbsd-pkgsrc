$NetBSD: patch-src_gui-qt_highlight.pro,v 1.5 2023/05/24 15:53:35 schmonz Exp $

Restore non-.app macOS build settings from 3.59.

--- src/gui-qt/highlight.pro.orig	2023-05-19 11:27:59.000000000 +0000
+++ src/gui-qt/highlight.pro
@@ -82,8 +82,11 @@ macx-clang|macx-clang-arm64  {
     INCLUDEPATH += ../../include
     INCLUDEPATH+=/usr/local/Cellar/boost/1.81.0_1/include
 
-    QMAKE_MACOSX_DEPLOYMENT_TARGET=13.0
-    CONFIG += app_bundle
+    ###QMAKE_MACOSX_DEPLOYMENT_TARGET=13.0
+    ###CONFIG += app_bundle
+    QT_CONFIG -= no-pkg-config
+    CONFIG += link_pkgconfig
+    PKGCONFIG += lua
     LIBS += -L.. -lhighlight
     LIBS += -L/Users/andresimon/MyProjects/lua-5.4.1/src -llua
 
