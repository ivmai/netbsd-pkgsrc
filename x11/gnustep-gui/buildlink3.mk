# $NetBSD: buildlink3.mk,v 1.21 2014/04/09 07:27:01 obache Exp $

BUILDLINK_TREE+=	gnustep-gui

.if !defined(GNUSTEP_GUI_BUILDLINK3_MK)
GNUSTEP_GUI_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gnustep-gui+=	gnustep-gui>=0.16.0
BUILDLINK_ABI_DEPENDS.gnustep-gui+=	gnustep-gui>=0.22.0nb6
BUILDLINK_PKGSRCDIR.gnustep-gui?=	../../x11/gnustep-gui

.include "../../devel/gnustep-base/buildlink3.mk"
.endif # GNUSTEP_GUI_BUILDLINK3_MK

BUILDLINK_TREE+=	-gnustep-gui
