$NetBSD: patch-version.cmake,v 1.2 2019/01/27 17:04:16 nia Exp $

Avoid looking for git to determine the version string.

--- version.cmake.orig	2019-01-27 00:06:06.000000000 +0000
+++ version.cmake
@@ -8,15 +8,6 @@ set(LIB_VERSION_ABI 0.7)
 set(LIB_VERSION_STRING ${LIB_VERSION_MAJOR}.${LIB_VERSION_MINOR}.${LIB_VERSION_PATCH})
 set(SUMMARY "${PROJECT_NAME} Game Boy Advance Emulator")
 
-find_program(GIT git)
-if(GIT AND NOT SKIP_GIT)
-	execute_process(COMMAND ${GIT} describe --always --abbrev=40 --dirty WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}" OUTPUT_VARIABLE GIT_COMMIT ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
-	execute_process(COMMAND ${GIT} describe --always --dirty WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}" OUTPUT_VARIABLE GIT_COMMIT_SHORT ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
-	execute_process(COMMAND ${GIT} symbolic-ref --short HEAD WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}" OUTPUT_VARIABLE GIT_BRANCH ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
-	execute_process(COMMAND ${GIT} rev-list HEAD --count WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}" OUTPUT_VARIABLE GIT_REV ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
-	execute_process(COMMAND ${GIT} describe --tag --exact-match WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}" OUTPUT_VARIABLE GIT_TAG ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
-endif()
-
 if(NOT GIT_REV)
 	set(GIT_REV -1)
 endif()
