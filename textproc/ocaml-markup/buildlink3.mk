# $NetBSD: buildlink3.mk,v 1.5 2018/07/19 15:15:29 jaapb Exp $

BUILDLINK_TREE+=	ocaml-markup

.if !defined(OCAML_MARKUP_BUILDLINK3_MK)
OCAML_MARKUP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ocaml-markup+=	ocaml-markup>=0.7.2
BUILDLINK_ABI_DEPENDS.ocaml-markup+=	ocaml-markup>=0.7.6nb1
BUILDLINK_PKGSRCDIR.ocaml-markup?=	../../textproc/ocaml-markup

.endif	# OCAML_MARKUP_BUILDLINK3_MK

BUILDLINK_TREE+=	-ocaml-markup
