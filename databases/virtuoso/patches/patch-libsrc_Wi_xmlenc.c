$NetBSD: patch-libsrc_Wi_xmlenc.c,v 1.1 2013/04/13 13:16:02 jaapb Exp $

use proper DES interface
--- libsrc/Wi/xmlenc.c.orig	2012-08-01 20:54:31.000000000 +0000
+++ libsrc/Wi/xmlenc.c
@@ -1762,7 +1762,7 @@ xenc_key_len_get (const char * algo)
   if (!algo)
     len = 0;
   else if (!strcmp (algo, XENC_TRIPLEDES_ALGO))
-    len = 3 * sizeof (des_cblock);
+    len = 3 * sizeof (DES_cblock);
   else if (!strcmp (algo, XENC_AES128_ALGO))
     len = 128;
   else if (!strcmp (algo, XENC_AES256_ALGO))
@@ -1814,7 +1814,7 @@ xenc_key_create_from_utok (u_tok_t * uto
 {
   xenc_key_t * key;
   P_SHA1_CTX * psha1;
-  des_cblock _key[5];
+  DES_cblock _key[5];
   int key_len = 0;
   caddr_t * utok_opts = (caddr_t *) xenc_get_option (ctx->wc_opts, "UsernameToken", NULL);
   caddr_t key_algo = xenc_get_option (utok_opts, "keyAlgorithm", XENC_TRIPLEDES_ALGO);
@@ -1843,13 +1843,13 @@ xenc_key_create_from_utok (u_tok_t * uto
 	      memset (&key->ki.triple_des.ks3, 0, sizeof (key->ki.triple_des.ks3));
 	      memset (&key->ki.triple_des.iv,  0, sizeof (key->ki.triple_des.iv));
 
-	      des_set_key_unchecked(&_key[0], key->ki.triple_des.ks1);
-	      des_set_key_unchecked(&_key[1], key->ki.triple_des.ks2);
-	      des_set_key_unchecked(&_key[2], key->ki.triple_des.ks3);
-
-	      memcpy (key->ki.triple_des.k1, &_key[0], sizeof (des_cblock));
-	      memcpy (key->ki.triple_des.k2, &_key[1], sizeof (des_cblock));
-	      memcpy (key->ki.triple_des.k3, &_key[2], sizeof (des_cblock));
+	      DES_set_key_unchecked(&_key[0], &key->ki.triple_des.ks1);
+	      DES_set_key_unchecked(&_key[1], &key->ki.triple_des.ks2);
+	      DES_set_key_unchecked(&_key[2], &key->ki.triple_des.ks3);
+
+	      memcpy (key->ki.triple_des.k1, &_key[0], sizeof (DES_cblock));
+	      memcpy (key->ki.triple_des.k2, &_key[1], sizeof (DES_cblock));
+	      memcpy (key->ki.triple_des.k3, &_key[2], sizeof (DES_cblock));
 	      break;
 	    }
 #ifdef AES_ENC_ENABLE
@@ -2073,7 +2073,7 @@ static
 int __xenc_key_3des_init (char *name, char *pwd, int lock)
 {
   char _key[KEYSIZB+1];
-  des_cblock key[3];
+  DES_cblock key[3];
 
   xenc_key_t * pkey = xenc_get_key_by_name (name, lock);
   if (NULL == pkey)
@@ -2093,13 +2093,13 @@ int __xenc_key_3des_init (char *name, ch
 	(unsigned char *)_key,
 	strlen(_key), 1, (unsigned char*) &key[0], pkey->ki.triple_des.iv);
 
-  des_set_key_unchecked(&key[0], pkey->ki.triple_des.ks1);
-  des_set_key_unchecked(&key[1], pkey->ki.triple_des.ks2);
-  des_set_key_unchecked(&key[2], pkey->ki.triple_des.ks3);
-
-  memcpy (pkey->ki.triple_des.k1, &key[0], sizeof (des_cblock));
-  memcpy (pkey->ki.triple_des.k2, &key[1], sizeof (des_cblock));
-  memcpy (pkey->ki.triple_des.k3, &key[2], sizeof (des_cblock));
+  DES_set_key_unchecked(&key[0], &pkey->ki.triple_des.ks1);
+  DES_set_key_unchecked(&key[1], &pkey->ki.triple_des.ks2);
+  DES_set_key_unchecked(&key[2], &pkey->ki.triple_des.ks3);
+
+  memcpy (pkey->ki.triple_des.k1, &key[0], sizeof (DES_cblock));
+  memcpy (pkey->ki.triple_des.k2, &key[1], sizeof (DES_cblock));
+  memcpy (pkey->ki.triple_des.k3, &key[2], sizeof (DES_cblock));
 
   xenc_store_key (pkey, lock);
   return 0;
@@ -2107,13 +2107,13 @@ int __xenc_key_3des_init (char *name, ch
 
 void xenc_key_3des_init (xenc_key_t * pkey, unsigned char * k1, unsigned char * k2, unsigned char * k3)
 {
-  memcpy (pkey->ki.triple_des.k1, k1, sizeof (des_cblock));
-  memcpy (pkey->ki.triple_des.k2, k2, sizeof (des_cblock));
-  memcpy (pkey->ki.triple_des.k3, k3, sizeof (des_cblock));
-
-  des_set_key_unchecked((const_des_cblock*) k1, pkey->ki.triple_des.ks1);
-  des_set_key_unchecked((const_des_cblock*) k2, pkey->ki.triple_des.ks2);
-  des_set_key_unchecked((const_des_cblock*) k3, pkey->ki.triple_des.ks3);
+  memcpy (pkey->ki.triple_des.k1, k1, sizeof (DES_cblock));
+  memcpy (pkey->ki.triple_des.k2, k2, sizeof (DES_cblock));
+  memcpy (pkey->ki.triple_des.k3, k3, sizeof (DES_cblock));
+
+  DES_set_key_unchecked((const_DES_cblock*) k1, &pkey->ki.triple_des.ks1);
+  DES_set_key_unchecked((const_DES_cblock*) k2, &pkey->ki.triple_des.ks2);
+  DES_set_key_unchecked((const_DES_cblock*) k3, &pkey->ki.triple_des.ks3);
 }
 
 
@@ -2145,20 +2145,20 @@ caddr_t bif_xenc_key_3des_rand_create (c
 {
   caddr_t name = bif_key_name_arg (qst, args, 0, "xenc_key_3DES_rand_create");
   xenc_key_t * k = 0;
-  des_cblock k1;
-  des_cblock k2;
-  des_cblock k3;
-  des_key_schedule ks1;
-  des_key_schedule ks2;
-  des_key_schedule ks3;
-
-  des_random_key (&k1);
-  des_random_key (&k2);
-  des_random_key (&k3);
-
-  if ( (des_set_key_checked (&k1, ks1) < 0) ||
-       (des_set_key_checked (&k2, ks2) < 0) ||
-       (des_set_key_checked (&k3, ks3) < 0) )
+  DES_cblock k1;
+  DES_cblock k2;
+  DES_cblock k3;
+  DES_key_schedule ks1;
+  DES_key_schedule ks2;
+  DES_key_schedule ks3;
+
+  DES_random_key (&k1);
+  DES_random_key (&k2);
+  DES_random_key (&k3);
+
+  if ( (DES_set_key_checked (&k1, &ks1) < 0) ||
+       (DES_set_key_checked (&k2, &ks2) < 0) ||
+       (DES_set_key_checked (&k3, &ks3) < 0) )
     GPF_T; /* parity check failed, library error - could not check result of it's own work */
 
   mutex_enter (xenc_keys_mtx);
@@ -2169,13 +2169,13 @@ caddr_t bif_xenc_key_3des_rand_create (c
       mutex_leave (xenc_keys_mtx);
       SQLR_NEW_KEY_EXIST_ERROR (name);
     }
-  memcpy (&k->ki.triple_des.k1, &k1, sizeof (des_cblock));
-  memcpy (&k->ki.triple_des.k2, &k2, sizeof (des_cblock));
-  memcpy (&k->ki.triple_des.k3, &k3, sizeof (des_cblock));
-
-  memcpy (&k->ki.triple_des.ks1, &ks1, sizeof (des_key_schedule));
-  memcpy (&k->ki.triple_des.ks2, &ks2, sizeof (des_key_schedule));
-  memcpy (&k->ki.triple_des.ks3, &ks3, sizeof (des_key_schedule));
+  memcpy (&k->ki.triple_des.k1, &k1, sizeof (DES_cblock));
+  memcpy (&k->ki.triple_des.k2, &k2, sizeof (DES_cblock));
+  memcpy (&k->ki.triple_des.k3, &k3, sizeof (DES_cblock));
+
+  memcpy (&k->ki.triple_des.ks1, &ks1, sizeof (DES_key_schedule));
+  memcpy (&k->ki.triple_des.ks2, &ks2, sizeof (DES_key_schedule));
+  memcpy (&k->ki.triple_des.ks3, &ks3, sizeof (DES_key_schedule));
 
   mutex_leave (xenc_keys_mtx);
 
@@ -2565,9 +2565,9 @@ caddr_t bif_xenc_key_serialize (caddr_t 
 
   if (k->xek_type == DSIG_KEY_3DES)
     {
-      memcpy (in_buf, k->ki.triple_des.k1, sizeof (des_cblock));
-      memcpy (in_buf + sizeof (des_cblock), k->ki.triple_des.k2, sizeof (des_cblock));
-      memcpy (in_buf + 2*sizeof (des_cblock), k->ki.triple_des.k3, sizeof (des_cblock));
+      memcpy (in_buf, k->ki.triple_des.k1, sizeof (DES_cblock));
+      memcpy (in_buf + sizeof (DES_cblock), k->ki.triple_des.k2, sizeof (DES_cblock));
+      memcpy (in_buf + 2*sizeof (DES_cblock), k->ki.triple_des.k3, sizeof (DES_cblock));
     }
   else if (k->xek_type == DSIG_KEY_RSA)
     {
@@ -5980,7 +5980,7 @@ void xenc_kt_test ()
       xenc_des3_decryptor (out, strses_length (out), in, key, &t);
       key_data_2 = strses_string (in);
 
-      if (memcmp (key_data, key_data_2, 3 * sizeof (des_cblock)))
+      if (memcmp (key_data, key_data_2, 3 * sizeof (DES_cblock)))
 	xenc_assert (0);
       dk_free_box (key_data_2);
       dk_free_box (key_data);
@@ -5988,13 +5988,13 @@ void xenc_kt_test ()
       new_key = xenc_build_encrypted_key ("virtdev_test_rest", in, XENC_TRIPLEDES_ALGO, &t);
 
       if (memcmp (new_key->ki.triple_des.k1,
-		  key->ki.triple_des.k1, sizeof (des_cblock)))
+		  key->ki.triple_des.k1, sizeof (DES_cblock)))
 	xenc_assert (0);
       if (memcmp (new_key->ki.triple_des.k2,
-		  key->ki.triple_des.k2, sizeof (des_cblock)))
+		  key->ki.triple_des.k2, sizeof (DES_cblock)))
 	xenc_assert (0);
       if (memcmp (new_key->ki.triple_des.k3,
-		  key->ki.triple_des.k3, sizeof (des_cblock)))
+		  key->ki.triple_des.k3, sizeof (DES_cblock)))
 	xenc_assert (0);
 
       strses_flush (in);
