# $NetBSD: buildlink3.mk,v 1.20 2010/09/14 11:01:03 wiz Exp $

BUILDLINK_TREE+=	gnome-mag

.if !defined(GNOME_MAG_BUILDLINK3_MK)
GNOME_MAG_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gnome-mag+=	gnome-mag>=0.12.0
BUILDLINK_ABI_DEPENDS.gnome-mag?=	gnome-mag>=0.16.1nb2
BUILDLINK_PKGSRCDIR.gnome-mag?=	../../x11/gnome-mag

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libbonobo/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # GNOME_MAG_BUILDLINK3_MK

BUILDLINK_TREE+=	-gnome-mag
