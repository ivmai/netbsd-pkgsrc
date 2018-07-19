# $NetBSD: buildlink3.mk,v 1.4 2018/07/19 15:15:23 jaapb Exp $

BUILDLINK_TREE+=	ocaml-ppx_ast

.if !defined(OCAML_PPX_AST_BUILDLINK3_MK)
OCAML_PPX_AST_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ocaml-ppx_ast+=	ocaml-ppx_ast>=0.9.1
BUILDLINK_ABI_DEPENDS.ocaml-ppx_ast+=	ocaml-ppx_ast>=0.9.2nb2
BUILDLINK_PKGSRCDIR.ocaml-ppx_ast?=	../../devel/ocaml-ppx_ast
.endif	# OCAML_PPX_AST_BUILDLINK3_MK

BUILDLINK_TREE+=	-ocaml-ppx_ast
