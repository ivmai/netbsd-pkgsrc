# $NetBSD: buildlink3.mk,v 1.38 2023/06/07 11:27:32 micha Exp $

BUILDLINK_TREE+=	vala

.if !defined(VALA_BUILDLINK3_MK)
VALA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.vala+=	vala>=0.56
BUILDLINK_ABI_DEPENDS.vala+=	vala>=0.56.8nb1
BUILDLINK_PKGSRCDIR.vala?=	../../lang/vala
BUILDLINK_DEPMETHOD.vala?=	build

VALAC=		${PREFIX}/bin/valac-0.56
VAPIGEN=	${PREFIX}/bin/vapigen-0.56
.if defined(GNU_CONFIGURE)
CONFIGURE_ENV+=	VALAC=${VALAC} VAPIGEN=${VAPIGEN}
.endif

.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/libltdl/buildlink3.mk"
.include "../../graphics/graphviz/buildlink3.mk"
.endif	# VALA_BUILDLINK3_MK

BUILDLINK_TREE+=	-vala
