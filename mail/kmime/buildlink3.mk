# $NetBSD: buildlink3.mk,v 1.14 2023/05/22 21:00:03 wiz Exp $

BUILDLINK_TREE+=	kmime

.if !defined(KMIME_BUILDLINK3_MK)
KMIME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kmime+=	kmime>=17.12.1
BUILDLINK_ABI_DEPENDS.kmime?=	kmime>=22.08.1nb5
BUILDLINK_PKGSRCDIR.kmime?=	../../mail/kmime

.include "../../devel/ki18n/buildlink3.mk"
.include "../../textproc/kcodecs/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# KMIME_BUILDLINK3_MK

BUILDLINK_TREE+=	-kmime
