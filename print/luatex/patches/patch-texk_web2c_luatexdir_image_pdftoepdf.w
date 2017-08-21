$NetBSD: patch-texk_web2c_luatexdir_image_pdftoepdf.w,v 1.1 2017/08/21 10:15:22 jperkin Exp $

Avoid -Wreserved-user-defined-literal failures by using newlines.

--- texk/web2c/luatexdir/image/pdftoepdf.w.orig	2016-11-25 18:09:14.000000000 +0000
+++ texk/web2c/luatexdir/image/pdftoepdf.w
@@ -71,7 +71,11 @@ static char *get_file_checksum(const cha
         ck = (char *) malloc(PDF_CHECKSUM_SIZE);
         if (ck == NULL)
             formatted_error("pdf inclusion","out of memory while processing '%s'", a);
-        snprintf(ck, PDF_CHECKSUM_SIZE, "%" PRIu64 "_%" PRIu64, (uint64_t) size,(uint64_t) mtime);
+        snprintf(ck, PDF_CHECKSUM_SIZE, "%"
+PRIu64
+"_%"
+PRIu64
+, (uint64_t) size,(uint64_t) mtime);
    } else {
         switch (fe) {
             case FE_FAIL:
