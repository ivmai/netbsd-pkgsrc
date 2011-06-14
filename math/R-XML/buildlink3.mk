# $NetBSD: buildlink3.mk,v 1.1 2011/06/14 21:30:08 alnsn Exp $

BUILDLINK_TREE+=	RXML

.if !defined(RXML_BUILDLINK3_MK)
RXML_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.RXML+=	R-XML>=3.4.0
BUILDLINK_ABI_DEPENDS.RXML+=	R-XML>=3.4.0
BUILDLINK_PKGSRCDIR.RXML?=	../../math/R-XML
.endif # RXML_BUILDLINK3_MK

BUILDLINK_TREE+=	-RXML
