# $NetBSD: buildlink3.mk,v 1.43 2012/02/06 12:41:37 wiz Exp $

BUILDLINK_TREE+=	nautilus

.if !defined(NAUTILUS_BUILDLINK3_MK)
NAUTILUS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.nautilus+=	nautilus>=2.12.1nb1
BUILDLINK_ABI_DEPENDS.nautilus?=	nautilus>=2.32.2.1nb5
BUILDLINK_PKGSRCDIR.nautilus?=	../../sysutils/nautilus

.include "../../devel/GConf/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../graphics/libexif/buildlink3.mk"
.include "../../graphics/librsvg/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/gnome-desktop/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # NAUTILUS_BUILDLINK3_MK

BUILDLINK_TREE+=	-nautilus
