# $NetBSD: buildlink3.mk,v 1.7 2023/05/22 21:00:02 wiz Exp $

BUILDLINK_TREE+=	fcitx5-qt

.if !defined(FCITX5_QT_BUILDLINK3_MK)
FCITX5_QT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.fcitx5-qt+=	fcitx5-qt>=5.0.2
BUILDLINK_ABI_DEPENDS.fcitx5-qt?=	fcitx5-qt>=5.0.3nb8
BUILDLINK_PKGSRCDIR.fcitx5-qt?=	../../inputmethod/fcitx5-qt

.include "../../inputmethod/fcitx5/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# FCITX5_QT_BUILDLINK3_MK

BUILDLINK_TREE+=	-fcitx5-qt
