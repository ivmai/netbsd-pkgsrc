$NetBSD: patch-js_src_vm_ArrayBufferObject.cpp,v 1.3 2023/01/24 17:57:09 nia Exp $

PaX MPROTECT safety for NetBSD.

https://bugzilla.mozilla.org/show_bug.cgi?id=1811913

--- js/src/vm/ArrayBufferObject.cpp.orig	2021-05-20 21:29:34.000000000 +0000
+++ js/src/vm/ArrayBufferObject.cpp
@@ -189,9 +189,17 @@ void* js::MapBufferMemory(size_t mappedS
   MOZ_ASSERT(data);
   memset(data, 0, mappedSize);
 #else   // !XP_WIN && !__wasi__
+
+#ifdef PROT_MPROTECT
+  void* data =
+      MozTaggedAnonymousMmap(nullptr, mappedSize,
+                             PROT_MPROTECT(PROT_EXEC | PROT_WRITE | PROT_READ),
+                             MAP_PRIVATE | MAP_ANON, -1, 0, "wasm-reserved");
+#else
   void* data =
       MozTaggedAnonymousMmap(nullptr, mappedSize, PROT_NONE,
                              MAP_PRIVATE | MAP_ANON, -1, 0, "wasm-reserved");
+#endif
   if (data == MAP_FAILED) {
     return nullptr;
   }
