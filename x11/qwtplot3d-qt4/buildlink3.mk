# $NetBSD: buildlink3.mk,v 1.4 2010/09/14 11:01:14 wiz Exp $

BUILDLINK_TREE+=	qwtplot3d

.if !defined(QWTPLOT3D_BUILDLINK3_MK)
QWTPLOT3D_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.qwtplot3d+=	qwtplot3d>=0.2.7
BUILDLINK_ABI_DEPENDS.qwtplot3d?=	qwtplot3d>=0.2.7nb3
BUILDLINK_PKGSRCDIR.qwtplot3d?=	../../x11/qwtplot3d-qt4

.include "../../x11/qt4-libs/buildlink3.mk"
.endif	# QWTPLOT3D_BUILDLINK3_MK

BUILDLINK_TREE+=	-qwtplot3d
