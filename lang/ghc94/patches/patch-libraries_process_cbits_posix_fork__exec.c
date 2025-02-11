$NetBSD: patch-libraries_process_cbits_posix_fork__exec.c,v 1.2 2023/01/21 13:20:34 pho Exp $

Ensure _POSIX_PTHREAD_SEMANTICS is defined on SunOS.

Pull request:
https://github.com/haskell/process/pull/274

--- libraries/process/cbits/posix/fork_exec.c.orig	2021-10-28 20:42:10.000000000 +0000
+++ libraries/process/cbits/posix/fork_exec.c
@@ -1,3 +1,7 @@
+#ifdef __sun
+#define _POSIX_PTHREAD_SEMANTICS
+#endif
+
 #include "common.h"
 
 #include <sys/types.h>
