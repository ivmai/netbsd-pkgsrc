# $NetBSD: buildlink3.mk,v 1.1 2004/03/18 23:29:36 xtraeme Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBDVBPSI_BUILDLINK3_MK:=	${LIBDVBPSI_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libdvbpsi
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibdvbpsi}
BUILDLINK_PACKAGES+=	libdvbpsi

.if !empty(LIBDVBPSI_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libdvbpsi+=	libdvbpsi>=0.1.3
BUILDLINK_PKGSRCDIR.libdvbpsi?=	../../multimedia/libdvbpsi
.endif	# LIBDVBPSI_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
