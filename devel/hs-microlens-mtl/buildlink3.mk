# $NetBSD: buildlink3.mk,v 1.4 2023/02/07 01:40:43 pho Exp $

BUILDLINK_TREE+=	hs-microlens-mtl

.if !defined(HS_MICROLENS_MTL_BUILDLINK3_MK)
HS_MICROLENS_MTL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-microlens-mtl+=	hs-microlens-mtl>=0.2.0
BUILDLINK_ABI_DEPENDS.hs-microlens-mtl+=	hs-microlens-mtl>=0.2.0.3nb1
BUILDLINK_PKGSRCDIR.hs-microlens-mtl?=		../../devel/hs-microlens-mtl

.include "../../devel/hs-microlens/buildlink3.mk"
.include "../../devel/hs-transformers-compat/buildlink3.mk"
.endif	# HS_MICROLENS_MTL_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-microlens-mtl
