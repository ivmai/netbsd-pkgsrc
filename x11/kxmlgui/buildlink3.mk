# $NetBSD: buildlink3.mk,v 1.38 2023/05/22 21:00:11 wiz Exp $

BUILDLINK_TREE+=	kxmlgui

.if !defined(KXMLGUI_BUILDLINK3_MK)
KXMLGUI_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kxmlgui+=	kxmlgui>=5.19.0
BUILDLINK_ABI_DEPENDS.kxmlgui?=	kxmlgui>=5.98.0nb6
BUILDLINK_PKGSRCDIR.kxmlgui?=	../../x11/kxmlgui

.include "../../misc/attica-qt5/buildlink3.mk"
.include "../../x11/kglobalaccel/buildlink3.mk"
.include "../../x11/ktextwidgets/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# KXMLGUI_BUILDLINK3_MK

BUILDLINK_TREE+=	-kxmlgui
