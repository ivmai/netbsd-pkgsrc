# $NetBSD: buildlink2.mk,v 1.3 2002/09/27 23:52:38 rh Exp $
#

.if !defined(GNUSTEP_MAKE_BUILDLINK2_MK)
GNUSTEP_MAKE_BUILDLINK2_MK=		# defined

BUILDLINK_PACKAGES+=			gnustep-make
BUILDLINK_DEPENDS.gnustep-make?=	gnustep-make>=1.5.0nb2
BUILDLINK_PKGSRCDIR.gnustep-make?=	../../devel/gnustep-make

EVAL_PREFIX+=	BUILDLINK_PREFIX.gnustep-make=gnustep-make
BUILDLINK_PREFIX.gnustep-make_DEFAULT=	${LOCALBASE}

BUILDLINK_TARGETS+=	gnustep-make-buildlink

GNUSTEP_ROOT=		${PREFIX}/share/GNUstep
GNUSTEP_LOCAL_ROOT=	${GNUSTEP_ROOT}/Local
GNUSTEP_SYSTEM_ROOT=	${GNUSTEP_ROOT}/System
GNUSTEP_NETWORK_ROOT=	${GNUSTEP_ROOT}/Network
GNUSTEP_MAKEFILES=	${GNUSTEP_SYSTEM_ROOT}/Makefiles
GNUSTEP_HOST=		${MACHINE_GNU_PLATFORM}
GNUSTEP_HOST_CPU=	${MACHINE_GNU_ARCH:S/i386/ix86/}
GNUSTEP_HOST_VENDOR=	${LOWER_VENDOR}
GNUSTEP_HOST_OS=	${LOWER_OPSYS}${APPEND_ELF}
GNUSTEP_USER_ROOT=	${BUILDLINK_DIR}/share/GNUstep
GNUSTEP_PATHLIST=	${GNUSTEP_USER_ROOT}:${GNUSTEP_LOCAL_ROOT}:${GNUSTEP_NETWORK_ROOT}:${GNUSTEP_SYSTEM_ROOT}
GNUSTEP_PATH=		${GNUSTEP_USER_ROOT}/Tools:${GNUSTEP_USER_ROOT}/Tools/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}/gnu-gnu-gnu:${GNUSTEP_USER_ROOT}/Tools/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}:${GNUSTEP_LOCAL_ROOT}/Tools:${GNUSTEP_LOCAL_ROOT}/Tools/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}/gnu-gnu-gnu:${GNUSTEP_LOCAL_ROOT}/Tools/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}:${GNUSTEP_NETWORK_ROOT}/Tools:${GNUSTEP_NETWORK_ROOT}/Tools/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}/gnu-gnu-gnu:${GNUSTEP_NETWORK_ROOT}/Tools/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}:${GNUSTEP_SYSTEM_ROOT}/Tools:${GNUSTEP_SYSTEM_ROOT}/Tools/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}/gnu-gnu-gnu:${GNUSTEP_SYSTEM_ROOT}/Tools/${GNUSTEP_HOST_CPU}/${GNUSTEP_HOST_OS}
GUILE_LOAD_PATH=	${GNUSTEP_USER_ROOT}/Libraries/Guile:${GNUSTEP_LOCAL_ROOT}/Libraries/Guile:${GNUSTEP_NETWORK_ROOT}/Libraries/Guile:${GNUSTEP_SYSTEM_ROOT}/Libraries/Guile
GNUSTEP_FLATTENED=	# defined

PATH:=		${GNUSTEP_PATH}:${PATH}

MAKE_ENV+=	GNUSTEP_ROOT="${GNUSTEP_ROOT}"
MAKE_ENV+=	GNUSTEP_LOCAL_ROOT="${GNUSTEP_LOCAL_ROOT}"
MAKE_ENV+=	GNUSTEP_SYSTEM_ROOT="${GNUSTEP_SYSTEM_ROOT}"
MAKE_ENV+=	GNUSTEP_NETWORK_ROOT="${GNUSTEP_NETWORK_ROOT}"
MAKE_ENV+=	GNUSTEP_MAKEFILES="${GNUSTEP_MAKEFILES}"
MAKE_ENV+=	GNUSTEP_HOST="${GNUSTEP_HOST}"
MAKE_ENV+=	GNUSTEP_HOST_CPU="${GNUSTEP_HOST_CPU}"
MAKE_ENV+=	GNUSTEP_HOST_VENDOR="${GNUSTEP_HOST_VENDOR}"
MAKE_ENV+=	GNUSTEP_HOST_OS="${GNUSTEP_HOST_OS}"
MAKE_ENV+=	GNUSTEP_USER_ROOT="${GNUSTEP_USER_ROOT}"
MAKE_ENV+=	GNUSTEP_PATHLIST="${GNUSTEP_PATHLIST}"
MAKE_ENV+=	GNUSTEP_FLATTENED=""
MAKE_ENV+=	GUILE_LOAD_PATH="${GUILE_LOAD_PATH}"

PLIST_SUBST+=	GNUSTEP_HOST_CPU=${GNUSTEP_HOST_CPU}
PLIST_SUBST+=	APPEND_ELF=${APPEND_ELF}

.if defined(GNU_CONFIGURE)
CONFIGURE_ENV+=	GNUSTEP_ROOT="${GNUSTEP_ROOT}"
CONFIGURE_ENV+=	GNUSTEP_LOCAL_ROOT="${GNUSTEP_LOCAL_ROOT}"
CONFIGURE_ENV+=	GNUSTEP_SYSTEM_ROOT="${GNUSTEP_SYSTEM_ROOT}"
CONFIGURE_ENV+=	GNUSTEP_NETWORK_ROOT="${GNUSTEP_NETWORK_ROOT}"
CONFIGURE_ENV+=	GNUSTEP_MAKEFILES="${GNUSTEP_MAKEFILES}"
CONFIGURE_ENV+=	GNUSTEP_HOST="${GNUSTEP_HOST}"
CONFIGURE_ENV+=	GNUSTEP_HOST_CPU="${GNUSTEP_HOST_CPU}"
CONFIGURE_ENV+=	GNUSTEP_HOST_VENDOR="${GNUSTEP_HOST_VENDOR}"
CONFIGURE_ENV+=	GNUSTEP_HOST_OS="${GNUSTEP_HOST_OS}"
CONFIGURE_ENV+=	GNUSTEP_USER_ROOT="${GNUSTEP_USER_ROOT}"
CONFIGURE_ENV+=	GNUSTEP_PATHLIST="${GNUSTEP_PATHLIST}"
CONFIGURE_ENV+=	GNUSTEP_FLATTENED=""
CONFIGURE_ENV+=	GUILE_LOAD_PATH="${GUILE_LOAD_PATH}"
.endif

gnustep-make-buildlink: _BUILDLINK_USE

.endif	# GNUSTEP_MAKE_BUILDLINK2_MK
