# $NetBSD: buildlink3.mk,v 1.42 2012/02/06 12:41:51 wiz Exp $
#

BUILDLINK_TREE+=	epiphany

.if !defined(EPIPHANY_BUILDLINK3_MK)
EPIPHANY_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.epiphany+=		epiphany>=2.28
BUILDLINK_ABI_DEPENDS.epiphany?=		epiphany>=2.30.6nb10
BUILDLINK_PKGSRCDIR.epiphany?=		../../www/epiphany

.include "../../mk/bsd.fast.prefs.mk"

.include "../../devel/GConf/buildlink3.mk"
.include "../../devel/nss/buildlink3.mk"
.include "../../www/webkit-gtk/buildlink3.mk"
.include "../../net/ORBit2/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # EPIPHANY_BUILDLINK3_MK

BUILDLINK_TREE+=	-epiphany
