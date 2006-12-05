# $NetBSD: buildlink3.mk,v 1.8 2006/12/05 17:43:06 tron Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NSPR_BUILDLINK3_MK:=	${NSPR_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	nspr
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nnspr}
BUILDLINK_PACKAGES+=	nspr
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}nspr

.if !empty(NSPR_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.nspr+=	nspr>=4.4.1nb1
.if ${OPSYS} == "Darwin"
BUILDLINK_ABI_DEPENDS.nspr+=	nspr>=4.6.1nb3
.else
BUILDLINK_ABI_DEPENDS.nspr+=	nspr>=4.6.1nb1
.endif
BUILDLINK_PKGSRCDIR.nspr?=	../../devel/nspr

BUILDLINK_FILES.nspr+=		lib/nspr/*
BUILDLINK_FILES.nspr+=		include/nspr/*

BUILDLINK_INCDIRS.nspr+=	include/nspr
BUILDLINK_LIBDIRS.nspr+=	lib/nspr
BUILDLINK_RPATHDIRS.nspr+=	lib/nspr

.endif	# NSPR_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
