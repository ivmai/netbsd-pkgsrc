# $NetBSD: buildlink3.mk,v 1.2 2004/03/05 21:08:52 minskim Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
CANNA_LIB_BUILDLINK3_MK:=	${CANNA_LIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	Canna-lib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NCanna-lib}
BUILDLINK_PACKAGES+=	Canna-lib

.if !empty(CANNA_LIB_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.Canna-lib+=	Canna-lib>=3.6pl4
BUILDLINK_PKGSRCDIR.Canna-lib?=	../../inputmethod/canna-lib

.endif	# CANNA_LIB_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
