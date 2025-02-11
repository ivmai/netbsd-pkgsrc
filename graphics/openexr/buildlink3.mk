# $NetBSD: buildlink3.mk,v 1.21 2023/06/06 08:02:12 wiz Exp $

BUILDLINK_TREE+=	openexr

.if !defined(OPENEXR_BUILDLINK3_MK)
OPENEXR_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.openexr+=	openexr>=3.0.5
BUILDLINK_ABI_DEPENDS.openexr+=	openexr>=3.1.7nb3
BUILDLINK_PKGSRCDIR.openexr?=	../../graphics/openexr

PTHREAD_OPTS+=	require

# C++14
GCC_REQD+=	6

.include "../../math/imath/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.endif # OPENEXR_BUILDLINK3_MK

BUILDLINK_TREE+=	-openexr
