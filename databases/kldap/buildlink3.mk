# $NetBSD: buildlink3.mk,v 1.15 2023/05/22 20:59:55 wiz Exp $

BUILDLINK_TREE+=	kldap

.if !defined(KLDAP_BUILDLINK3_MK)
KLDAP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kldap+=	kldap>=17.12.1
BUILDLINK_ABI_DEPENDS.kldap?=	kldap>=22.08.1nb6
BUILDLINK_PKGSRCDIR.kldap?=	../../databases/kldap

.include "../../textproc/kcompletion/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# KLDAP_BUILDLINK3_MK

BUILDLINK_TREE+=	-kldap
