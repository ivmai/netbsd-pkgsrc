#	$NetBSD: bsd.pkg.use.mk,v 1.73 2023/06/03 14:26:36 riastradh Exp $
#
# Turn USE_* macros into proper depedency logic.  Included near the top of
# bsd.pkg.mk, after bsd.prefs.mk.

# Package-settable variables:
#
# USE_BSD_MAKEFILE
#	Should be set to "yes" whenever a package uses a BSD-style
#	Makefile. These Makefiles typically end with a line including
#	<bsd.prog.mk>.
# Keywords: bsd make bsd.prog.mk

# USE_IMAKE
#	When set to "yes", means that the package uses imake as the
#	primary (and often only) build system. This is different from
#	USE_TOOLS+=imake, which only states that the package uses imake
#	among other tools.
#
#	Keywords: imake
#

.if defined(USE_BSD_MAKEFILE)
MAKE_ENV+=		${BSD_MAKE_ENV} INSTALL=${TOOLS_INSTALL:Q}
.  if !defined(TOOLS_PLATFORM.ctfconvert) && !defined(TOOLS_PLATFORM.ctfmerge)
MAKE_ENV+=		NOCTF=yes
.  endif
.  if defined(HAVE_LLVM)
MAKE_ENV+=		HAVE_LLVM=${HAVE_LLVM:Q}
MAKE_ENV+=		NOCLANGERROR=1
.  endif
.  if defined(HAVE_GCC)
MAKE_ENV+=		HAVE_GCC=${HAVE_GCC:Q}
MAKE_ENV+=		NOGCCERROR=1
.  endif
.endif

.if defined(USE_IMAKE) || !empty(USE_TOOLS:Mimake)
PLIST_SUBST+=		IMAKE_MAN_SOURCE_PATH=${IMAKE_MAN_SOURCE_PATH:Q}
PLIST_SUBST+=		IMAKE_MAN_DIR=${IMAKE_MAN_DIR:Q}
PLIST_SUBST+=		IMAKE_LIBMAN_DIR=${IMAKE_LIBMAN_DIR:Q}
PLIST_SUBST+=		IMAKE_KERNMAN_DIR=${IMAKE_KERNMAN_DIR:Q}
PLIST_SUBST+=		IMAKE_FILEMAN_DIR=${IMAKE_FILEMAN_DIR:Q}
PLIST_SUBST+=		IMAKE_GAMEMAN_DIR=${IMAKE_GAMEMAN_DIR:Q}
PLIST_SUBST+=		IMAKE_MISCMAN_DIR=${IMAKE_MISCMAN_DIR:Q}
PLIST_SUBST+=		IMAKE_MAN_SUFFIX=${IMAKE_MAN_SUFFIX:Q}
PLIST_SUBST+=		IMAKE_LIBMAN_SUFFIX=${IMAKE_LIBMAN_SUFFIX:Q}
PLIST_SUBST+=		IMAKE_KERNMAN_SUFFIX=${IMAKE_KERNMAN_SUFFIX:Q}
PLIST_SUBST+=		IMAKE_FILEMAN_SUFFIX=${IMAKE_FILEMAN_SUFFIX:Q}
PLIST_SUBST+=		IMAKE_GAMEMAN_SUFFIX=${IMAKE_GAMEMAN_SUFFIX:Q}
PLIST_SUBST+=		IMAKE_MISCMAN_SUFFIX=${IMAKE_MISCMAN_SUFFIX:Q}
PLIST_SUBST+=		IMAKE_MANNEWSUFFIX=${IMAKE_MANNEWSUFFIX:Q}
.endif

.if defined(USE_IMAKE)
MAKE_FLAGS+=		CC=${CC:Q} CXX=${CXX:Q}
MAKE_FLAGS+=		LOCAL_LDFLAGS=${LDFLAGS:Q}
.endif

PREFIX=			${LOCALBASE}

############################################################################
# General settings
############################################################################

### PKG_USE_KERBEROS

.if defined(PKG_USE_KERBEROS)
BUILD_DEFS+=		KERBEROS
.endif

### USE_LIBTOOL, PKG_[SH]LIBTOOL

#
# PKG_LIBTOOL is the path to the libtool script installed by libtool-base.
# LIBTOOL is the publicly-readable variable that should be used by
#	Makefiles to invoke the proper (wrapped) libtool.
#
.if defined(USE_LANGUAGES) && !empty(USE_LANGUAGES:Mfortran) || \
    defined(USE_LANGUAGES) && !empty(USE_LANGUAGES:Mfortran77)
.  if !empty(USE_CROSS_COMPILE:M[yY][eE][sS]) # XXX
PKG_FAIL_REASON+=	"Cross-compiling Fortran with libtool NYI."
.  endif

PKG_LIBTOOL?=		${LOCALBASE}/bin/libtool-fortran
PKG_SHLIBTOOL?=		${LOCALBASE}/bin/shlibtool-fortran

.  if defined(USE_LIBTOOL)
# XXX This really needs cross-libtool-fortran like cross-libtool-base.
TOOL_DEPENDS+=		libtool-fortran>=${_OPSYS_LIBTOOL_REQD:U${LIBTOOL_REQD}}:../../devel/libtool-fortran
.  endif
.else
.  if !empty(USE_CROSS_COMPILE:M[yY][eE][sS])
PKG_LIBTOOL?=		${LOCALBASE}/cross-${TARGET_ARCH:U${MACHINE_ARCH}}/bin/libtool
PKG_SHLIBTOOL?=		${LOCALBASE}/cross-${TARGET_ARCH:U${MACHINE_ARCH}}/bin/shlibtool
.  else
PKG_LIBTOOL?=		${LOCALBASE}/bin/libtool
PKG_SHLIBTOOL?=		${LOCALBASE}/bin/shlibtool
.  endif
.endif
LIBTOOL?=		${WRAPPER_BINDIR}/libtool
SHLIBTOOL?=		${WRAPPER_BINDIR}/shlibtool
.if defined(USE_LIBTOOL)
LIBTOOL_REQD?=		2.4.2nb9
.if !empty(USE_CROSS_COMPILE:M[yY][eE][sS])
TOOL_DEPENDS+=		cross-libtool-base-${MACHINE_ARCH}>=${_OPSYS_LIBTOOL_REQD:U${LIBTOOL_REQD}}:../../cross/cross-libtool-base
.else
TOOL_DEPENDS+=		libtool-base>=${_OPSYS_LIBTOOL_REQD:U${LIBTOOL_REQD}}:../../devel/libtool-base
.endif
CONFIGURE_ENV+=		LIBTOOL="${LIBTOOL} ${LIBTOOL_FLAGS}"
MAKE_ENV+=		LIBTOOL="${LIBTOOL} ${LIBTOOL_FLAGS}"
.endif

# PKGSRC_USE_MKTOOLS.  Cyclic dependencies prevent us from using mktools
# when building cwrappers, so use the shell tools in that instance.
.if ${_PKGSRC_USE_MKTOOLS} == "yes" && empty(PKGPATH:Mpkgtools/cwrappers)
TOOL_DEPENDS+=		mktools-[0-9]*:../../pkgtools/mktools
PKG_MKSYMLINKS?=	${LOCALBASE}/libexec/mktools/mk-buildlink-symlinks
.endif
