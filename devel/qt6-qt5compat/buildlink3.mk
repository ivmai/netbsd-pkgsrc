# $NetBSD: buildlink3.mk,v 1.4 2023/05/22 20:59:58 wiz Exp $

BUILDLINK_TREE+=	qt6-qt5compat

.if !defined(QT6_QT5COMPAT_BUILDLINK3_MK)
QT6_QT5COMPAT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.qt6-qt5compat+=	qt6-qt5compat>=6.4.1
BUILDLINK_ABI_DEPENDS.qt6-qt5compat?=	qt6-qt5compat>=6.5.0nb2
BUILDLINK_PKGSRCDIR.qt6-qt5compat?=	../../devel/qt6-qt5compat

.include "../../x11/qt6-qtbase/buildlink3.mk"
.endif	# QT6_QT5COMPAT_BUILDLINK3_MK

BUILDLINK_TREE+=	-qt6-qt5compat
