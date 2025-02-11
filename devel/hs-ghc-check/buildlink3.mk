# $NetBSD: buildlink3.mk,v 1.4 2023/02/07 01:40:35 pho Exp $

BUILDLINK_TREE+=	hs-ghc-check

.if !defined(HS_GHC_CHECK_BUILDLINK3_MK)
HS_GHC_CHECK_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-ghc-check+=	hs-ghc-check>=0.5.0
BUILDLINK_ABI_DEPENDS.hs-ghc-check+=	hs-ghc-check>=0.5.0.8nb1
BUILDLINK_PKGSRCDIR.hs-ghc-check?=	../../devel/hs-ghc-check

.include "../../devel/hs-ghc-paths/buildlink3.mk"
.include "../../devel/hs-safe-exceptions/buildlink3.mk"
.include "../../devel/hs-th-compat/buildlink3.mk"
.endif	# HS_GHC_CHECK_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-ghc-check
