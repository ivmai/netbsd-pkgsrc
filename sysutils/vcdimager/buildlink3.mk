# $NetBSD: buildlink3.mk,v 1.7 2023/04/19 08:08:45 adam Exp $

BUILDLINK_TREE+=	vcdimager

.if !defined(VCDIMAGER_BUILDLINK3_MK)
VCDIMAGER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.vcdimager+=	vcdimager>=2.0.1
BUILDLINK_ABI_DEPENDS.vcdimager+=	vcdimager>=2.0.1nb7
BUILDLINK_PKGSRCDIR.vcdimager?=		../../sysutils/vcdimager

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/popt/buildlink3.mk"
.include "../../misc/libcdio/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.endif # VCDIMAGER_BUILDLINK3_MK

BUILDLINK_TREE+=	-vcdimager
