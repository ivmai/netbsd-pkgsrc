# $NetBSD: buildlink3.mk,v 1.8 2023/02/07 01:40:30 pho Exp $

BUILDLINK_TREE+=	hs-colour

.if !defined(HS_COLOUR_BUILDLINK3_MK)
HS_COLOUR_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-colour+=	hs-colour>=2.3.6
BUILDLINK_ABI_DEPENDS.hs-colour+=	hs-colour>=2.3.6nb3
BUILDLINK_PKGSRCDIR.hs-colour?=		../../devel/hs-colour
.endif	# HS_COLOUR_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-colour
