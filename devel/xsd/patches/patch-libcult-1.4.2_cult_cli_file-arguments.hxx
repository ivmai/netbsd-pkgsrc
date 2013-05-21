$NetBSD: patch-libcult-1.4.2_cult_cli_file-arguments.hxx,v 1.1 2013/05/21 16:36:22 joerg Exp $

--- libcult-1.4.2/cult/cli/file-arguments.hxx.orig	2013-05-14 19:55:31.000000000 +0000
+++ libcult-1.4.2/cult/cli/file-arguments.hxx
@@ -47,7 +47,8 @@ namespace Cult
         if (i >= size ())
           throw Bounds ();
 
-        args_.erase (args_.begin () + i);
+        Containers::Vector<String>::ConstIterator b(args_.begin());
+        args_.erase (b + i);
       }
 
     private:
