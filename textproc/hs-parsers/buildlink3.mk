# $NetBSD: buildlink3.mk,v 1.4 2023/02/07 01:41:12 pho Exp $

BUILDLINK_TREE+=	hs-parsers

.if !defined(HS_PARSERS_BUILDLINK3_MK)
HS_PARSERS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-parsers+=	hs-parsers>=0.12.11
BUILDLINK_ABI_DEPENDS.hs-parsers+=	hs-parsers>=0.12.11nb1
BUILDLINK_PKGSRCDIR.hs-parsers?=	../../textproc/hs-parsers

.include "../../devel/hs-base-orphans/buildlink3.mk"
.include "../../textproc/hs-charset/buildlink3.mk"
.include "../../math/hs-scientific/buildlink3.mk"
.include "../../devel/hs-unordered-containers/buildlink3.mk"
.include "../../textproc/hs-attoparsec/buildlink3.mk"
.endif	# HS_PARSERS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-parsers
