# $NetBSD: buildlink3.mk,v 1.2 2022/06/28 11:31:18 wiz Exp $

BUILDLINK_TREE+=	mysql-cluster

.if !defined(MYSQL_CLUSTER_BUILDLINK3_MK)
MYSQL_CLUSTER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mysql-cluster+=	mysql-cluster>=7.3.7
BUILDLINK_ABI_DEPENDS.mysql-cluster?=	mysql-cluster>=7.5.25nb1
BUILDLINK_PKGSRCDIR.mysql-cluster?=	../../databases/mysql75-cluster
BUILDLINK_INCDIRS.mysql-cluster?=	include/mysql
BUILDLINK_LIBDIRS.mysql-cluster?=	lib

.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif	# MYSQL_CLUSTER_BUILDLINK3_MK

BUILDLINK_TREE+=	-mysql-cluster
