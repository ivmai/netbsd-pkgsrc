# $NetBSD: buildlink3.mk,v 1.27 2023/05/22 21:00:10 wiz Exp $

BUILDLINK_TREE+=	kwidgetsaddons

.if !defined(KWIDGETSADDONS_BUILDLINK3_MK)
KWIDGETSADDONS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kwidgetsaddons+=	kwidgetsaddons>=5.18.0
BUILDLINK_ABI_DEPENDS.kwidgetsaddons?=	kwidgetsaddons>=5.98.0nb6
BUILDLINK_PKGSRCDIR.kwidgetsaddons?=	../../x11/kwidgetsaddons

.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# KWIDGETSADDONS_BUILDLINK3_MK

BUILDLINK_TREE+=	-kwidgetsaddons
