# $NetBSD: buildlink3.mk,v 1.21 2023/04/19 08:08:45 adam Exp $

BUILDLINK_TREE+=	gdome2

.if !defined(GDOME2_BUILDLINK3_MK)
GDOME2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gdome2+=	gdome2>=0.8.1nb1
BUILDLINK_ABI_DEPENDS.gdome2+=	gdome2>=0.8.1nb16
BUILDLINK_PKGSRCDIR.gdome2?=	../../textproc/gdome2

.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.endif # GDOME2_BUILDLINK3_MK

BUILDLINK_TREE+=	-gdome2
