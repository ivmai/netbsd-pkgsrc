$NetBSD: patch-qtbase_tests_auto_corelib_io_qprocess_qprocess.pro,v 1.2 2014/04/23 07:05:31 adam Exp $

* Pass whitespace(s) in filename test cases.

--- qtbase/tests/auto/corelib/io/qprocess/qprocess.pro.orig	2014-02-01 20:37:28.000000000 +0000
+++ qtbase/tests/auto/corelib/io/qprocess/qprocess.pro
@@ -3,10 +3,7 @@ TEMPLATE = subdirs
 include(qprocess.pri)
 SUBDIRS  = $$SUBPROGRAMS
 # Add special cases
-SUBDIRS += testProcessSpacesArgs/nospace.pro \
-           testProcessSpacesArgs/onespace.pro \
-           testProcessSpacesArgs/twospaces.pro \
-           testSpaceInName
+SUBDIRS += testProcessSpacesArgs/nospace.pro
 
 win32:!wince* {
     SUBDIRS += \
