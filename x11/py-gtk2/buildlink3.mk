# $NetBSD: buildlink3.mk,v 1.17 2006/07/02 10:44:45 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PY_GTK2_BUILDLINK3_MK:=	${PY_GTK2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pygtk2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npygtk2}
BUILDLINK_PACKAGES+=	pygtk2

.if !empty(PY_GTK2_BUILDLINK3_MK:M+)
.include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.pygtk2+=	${PYPKGPREFIX}-gtk2>=2.8.4
BUILDLINK_ABI_DEPENDS.pygtk2+=	py24-gtk2>=2.8.5nb1
BUILDLINK_PKGSRCDIR.pygtk2?=	../../x11/py-gtk2
.endif	# PY_GTK2_BUILDLINK3_MK

.include "../../devel/py-gobject/buildlink3.mk"
.include "../../devel/libglade2/buildlink3.mk"
.include "../../math/py-Numeric/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
