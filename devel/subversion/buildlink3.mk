# $NetBSD: buildlink3.mk,v 1.10 2005/05/23 23:40:35 epg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SUBVERSION_BASE_BUILDLINK3_MK:=	${SUBVERSION_BASE_BUILDLINK3_MK}+

.include "../../mk/bsd.prefs.mk"
.include "../../devel/subversion/Makefile.version"

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	subversion-base
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsubversion-base}
BUILDLINK_PACKAGES+=	subversion-base

.if !empty(SUBVERSION_BASE_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.subversion-base+=	subversion-base>=1.0.0
BUILDLINK_RECOMMENDED.subversion-base?=	subversion-base>=1.2.0
BUILDLINK_PKGSRCDIR.subversion-base?=	../../devel/subversion-base

BUILDLINK_FILES.subversion-base+=	bin/svn-config
.endif	# SUBVERSION_BASE_BUILDLINK3_MK

.include "../../devel/apr/buildlink3.mk"
.include "../../www/neon/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
