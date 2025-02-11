# $NetBSD: buildlink3.mk,v 1.9 2023/04/19 08:08:43 adam Exp $

BUILDLINK_TREE+=	gnome-tracker

.if !defined(GNOME_TRACKER_BUILDLINK3_MK)
GNOME_TRACKER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gnome-tracker+=	gnome-tracker>=1.8.0
BUILDLINK_ABI_DEPENDS.gnome-tracker?=	gnome-tracker>=3.0.1nb13
BUILDLINK_PKGSRCDIR.gnome-tracker?=	../../sysutils/gnome-tracker

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../net/libsoup/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../textproc/json-glib/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.endif	# GNOME_TRACKER_BUILDLINK3_MK

BUILDLINK_TREE+=	-gnome-tracker
