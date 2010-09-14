# $NetBSD: buildlink3.mk,v 1.11 2010/09/14 11:00:50 wiz Exp $

BUILDLINK_TREE+=	gnome-build

.if !defined(GNOME_BUILD_BUILDLINK3_MK)
GNOME_BUILD_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gnome-build+=	gnome-build>=0.1.3
BUILDLINK_ABI_DEPENDS.gnome-build?=	gnome-build>=2.24.1nb5
BUILDLINK_PKGSRCDIR.gnome-build?=	../../devel/gnome-build

.include "../../devel/gdl/buildlink3.mk"
.include "../../devel/libbonobo/buildlink3.mk"
.include "../../devel/libgnome/buildlink3.mk"
.include "../../devel/libgnomeui/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # GNOME_BUILD_BUILDLINK3_MK

BUILDLINK_TREE+=	-gnome-build
