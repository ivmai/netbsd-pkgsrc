# $NetBSD: buildlink3.mk,v 1.20 2010/09/14 11:01:13 wiz Exp $

BUILDLINK_TREE+=	xfce4-clipman-plugin

.if !defined(XFCE4_CLIPMAN_PLUGIN_BUILDLINK3_MK)
XFCE4_CLIPMAN_PLUGIN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-clipman-plugin+=	xfce4-clipman-plugin>=0.8.0
BUILDLINK_ABI_DEPENDS.xfce4-clipman-plugin?=	xfce4-clipman-plugin>=0.8.0nb3
BUILDLINK_PKGSRCDIR.xfce4-clipman-plugin?=	../../x11/xfce4-clipman-plugin

.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.endif # XFCE4_CLIPMAN_PLUGIN_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-clipman-plugin
