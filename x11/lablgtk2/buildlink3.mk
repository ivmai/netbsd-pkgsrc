# $NetBSD: buildlink3.mk,v 1.2 2005/10/06 10:52:41 wiz Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LABLGTK2_BUILDLINK3_MK:=	${LABLGTK2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	lablgtk2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlablgtk2}
BUILDLINK_PACKAGES+=	lablgtk2

.if !empty(LABLGTK2_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.lablgtk2+=	lablgtk2>=2.4.0
BUILDLINK_PKGSRCDIR.lablgtk2?=	../../x11/lablgtk2
.endif	# LABLGTK2_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
