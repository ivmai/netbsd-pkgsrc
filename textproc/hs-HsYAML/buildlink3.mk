# $NetBSD: buildlink3.mk,v 1.7 2023/02/07 01:41:07 pho Exp $

BUILDLINK_TREE+=	hs-HsYAML

.if !defined(HS_HSYAML_BUILDLINK3_MK)
HS_HSYAML_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-HsYAML+=	hs-HsYAML>=0.2.1
BUILDLINK_ABI_DEPENDS.hs-HsYAML+=	hs-HsYAML>=0.2.1.1nb1
BUILDLINK_PKGSRCDIR.hs-HsYAML?=		../../textproc/hs-HsYAML
.endif	# HS_HSYAML_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-HsYAML
