/*20180308 杨欣*/
drop table if exists sys_menu;
drop table if exists sys_user;
drop table if exists sys_roles;
drop table if exists sys_permissions;
drop table if exists sys_users_roles;
drop table if exists sys_roles_permissions;

create table sys_user (
  id bigint auto_increment,
  loginid varchar(100),
  username varchar(100),
  password varchar(100),
  locked bool default false,
  sex varchar(1) COLLATE utf8_bin DEFAULT '1' COMMENT '0:女',
  orgid varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '部门ID',
  email varchar(100) COLLATE utf8_bin DEFAULT NULL,
  mobile varchar(15) COLLATE utf8_bin DEFAULT NULL,
  idcard varchar(100),
  constraint pk_sys_users primary key(id)
) charset=utf8 ENGINE=InnoDB;
create unique index idx_sys_users_username on sys_user(username);
insert into sys_user values(1,'admin','超级管理员','e180a25583473cf34e8d6e1122bf2e0c',false,'1','1','123@gmail.com','123456',null);
insert into sys_user values(2,'guest','访客','32e817c08098ed0f106acb399775b1bf',false,'1','1','123@gmail.com','123456',null);
create table sys_role (
  id bigint auto_increment,
  role varchar(100),
  name varchar(100),
  description varchar(100),
  available bool default true,
  constraint pk_sys_roles primary key(id)
) charset=utf8 ENGINE=InnoDB;
create unique index idx_sys_roles_role on sys_role(role);
insert into sys_role(id,role,name,description,available) values(1,'admin','超级管理员','超级管理员',true);
create table sys_users_roles (
  user_id bigint,
  role_id bigint,
  constraint pk_sys_users_roles primary key(user_id, role_id)
) charset=utf8 ENGINE=InnoDB;
insert into sys_users_roles(user_id, role_id) values(1, 1);
create table sys_roles_permissions (
  role_id bigint,
  permission bigint,
  constraint pk_sys_roles_permissions primary key(role_id, permission)
) charset=utf8 ENGINE=InnoDB;
insert into sys_roles_permissions(role_id,permission) values(1, 3);
insert into sys_roles_permissions(role_id,permission) values(1, 4);
insert into sys_roles_permissions(role_id,permission) values(1, 5);
insert into sys_roles_permissions(role_id,permission) values(1, 6);
insert into sys_roles_permissions(role_id,permission) values(1, 7);
insert into sys_roles_permissions(role_id,permission) values(1, 8);
insert into sys_roles_permissions(role_id,permission) values(1, 9);
insert into sys_roles_permissions(role_id,permission) values(1, 10);
  create table sys_menu (
  id bigint auto_increment,
  name varchar(25) DEFAULT NULL,
  parent_id varchar(32) DEFAULT NULL,
  isparent varchar(5) DEFAULT NULL,
  sort int(20) DEFAULT NULL,
  icon varchar(50) DEFAULT '' COMMENT '图标',
  description varchar(500) DEFAULT '',
  if_show varchar(1) DEFAULT '1' COMMENT '是否显示。0：不显示。1：显示。',
  permission varchar(255) DEFAULT '' COMMENT '权限key',
  url varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into sys_menu(id,name,parent_id,isparent,sort,icon,description,if_show,permission,url)
values/*(null, '测试' ,'2', '0',0,null, '测试页面','1', 1, '/admin/test.shtml'),*/
      (2, '系统管理', '0', '1', 1, null, '系统管理', '1', null, null),
      (1, '在线办公', '0', '1', 0, null, '在线办公', '1', null, null),
      (3, '系统设置', '2', '1', '0', 'ti-save', '系统设置', '1', null, null),
      (4, '权限管理', '2', '1', '1', null, '权限管理', '1', null, null),
      (5, '流程管理', '2', '1', '1', null, '流程管理', '1', null, null),
      (null, '菜单管理', '3', '0', '1', null, '菜单管理', '1', '3', '/admin/menu/getListPage.shtml'),
      (8, '用户管理', '3', '0', '2', null, null, '1', 8, '/admin/user/getListPage.shtml'),
      (null, '图标展示', '3', '0', '2', null, '图标展示', '0', '3', '/admin/menu/getChangeIconPage.shtml'),
      (null, '修改图标', '3', '0', '3', null, '修改图标', '0', '3', '/admin/menu/changeIcon.shtml'),
      (null, '添加菜单', '3', '0', '4', null, '添加菜单', '0', '3', '/admin/menu/getEditPage.shtml'),
      (null, '显示树形菜单', '3', '0', '4', null, '显示树形菜单', '0', '3', '/admin/menu/getSelectOneMenuPage.shtml'),
      (null, '构造树形菜单', '3', '0', '4', null, '构造树形菜单', '0', '3', '/admin/menu/getAllMenuTree.shtml'),
      (null, '增加菜单', '3', '0', '4', null, '增加菜单', '0', '3', '/admin/menu/save.shtml'),
      (null, '角色管理', '4', '0', '0', null, '角色管理', '1', '4', '/admin/role/getListPage.shtml'),
      (null, '获取所有角色', '4', '0', '0', null, '角色管理', '0', '4', '/admin/role/listData.shtml'),
      (null, '获取角色树形菜单', '4', '0', '0', null, '角色管理', '0', '4', '/admin/role/getAllRoleTreeNode.shtml'),
      (null, '获取所有用户角色', '4', '0', '2', null, null, '0', 4, '/admin/role/getGiveUserRolePage.shtml'),
      (null, '授权页面', '4', '0', '0', null, '授权页面', '0', '4', '/admin/role/getGiveAuthPage.shtml'),
      (null, '获取角色权限', '4', '0', '0', null, '获取角色权限', '0', '4', '/admin/role/getRoleAuthByRoleid.shtml'),
      (null, '获取用户角色', '4', '0', '0', null, '获取用户角色', '0', '4', '/admin/role/getAllRoleByUserid.shtml'),
      (null, '保存角色', '4', '0', '0', null, '保存角色', '0', '4', '/admin/role/save.shtml'),
      (null, '授权', '4', '0', '0', null, '授权', '0', '4', '/admin/role/changeRoleAuth.shtml'),
      (null, '新增角色', '4', '0', '0', null, '新增角色', '0', '4', '/admin/role/getEditPage.shtml'),
      (null, '模型管理', '5', '0', '0', null, '模型管理', '1', '5', '/admin/model/getListPage.shtml'),
      (null, '获取定义模型', '5', '0', '0', null, '获取定义模型', '0', '5', '/admin/model/listData.shtml'),
      (null, '添加模型页面', '5', '0', '0', null, '添加模型页面', '0', '5', '/admin/model/getAddPage.shtml'),
      (null, '创建新模型', '5', '0', '0', null, '创建新模型', '0', '5', '/admin/model/save.shtml'),
      (null, '部署流程', '5', '0', '0', null, '部署流程', '0', '5', '/admin/model/deploy.shtml'),
      (null, '删除模型', '5', '0', '0', null, '删除模型', '0', '5', '/admin/model/delete.shtml'),
      (6, '组织结构', '3', null, '1', null, null, '1', '6', '/admin/org/getListPage.shtml'),
      (null, '获取树形组织机构', '6', '0', '1', null, null, '1', '6', '/admin/org/getOrgTree.shtml'),
      (null, '新增组织机构', '6', '0', '1', null, null, '7', '6', '/admin/org/save.shtml'),
      (null, '获取下属机构', '6', '0', '1', null, null, '1', '6', '/admin/org/listData.shtml'),
      (null, '选择父级机构', '6', '0', '1', null, null, '1', '6', '/admin/org/getSelectOneOrgPage.shtml'),
      (null, '机构编辑页面', '6', '0', '1', null, null, '1', '6', '/admin/org/getEditPage.shtml'),
      (null, '机构选择', '6', '0', '1', null, null, '1', '6', '/admin/org/getSelectManyOrgPage.shtml'),
      (7, '运行流程', '5', null, '1', null, '运行流程', '1', '7', '/admin/workflow/getListPage.shtml'),
      (null, '获取所有流程', '7', null, '1', null, '获取所有流程', '0', '7', '/admin/workflow/listData.shtml'),
      (null, '获取用户', '8', '0', '2', null, null, '0', 8, '/admin/user/listData.shtml'),
      (null, '新增用户', '8', '0', '2', null, null, '0', 8, '/admin/user/save.shtml'),
      (null, '填写用户信息', '8', '0', '2', null, null, '0', 8, '/admin/user/getEditPage.shtml'),
      (null, '获取用户角色', '8', '0', '2', null, null, '0', 8, '/admin/user/getGiveUserRolePage.shtml'),
      (null, '用户角色授权', '8', '0', '2', null, null, '0', 8, '/admin/user/giveUserRole.shtml'),
      (9, '发文管理', '1', '1', '1', 'ti-calendar', null, '1', 9, null),
      (null, '发文起草', '9', '0', '0', '', null, '1', 9, '/admin/bumph/getDraftListPage.shtml'),
      (null, '起草页面', '9', '0', '0', '', null, '1', 9, '/admin/bumph/getDraftEditPage.shtml'),
      (10, '通知公告', '1', '1', '3', 'ti-signal', null, '1', '10', null),
      (null, '发布新公告', '10', '0', '1', '', null, '1', '10', '/admin/notice/getListPage.shtml'),
      (null, '编辑新增通告', '10', '0', '1', '', null, '0', '10', '/admin/notice/getEditPage.shtml'),
      (null, '保存通告', '10', '0', '1', '', null, '0', '10', '/admin/notice/save.shtml'),
      (null, '发布通告', '10', '0', '1', '', null, '0', '10', '/admin/notice/publish.shtml'),
      (null, '获取所有通知', '10', '0', '1', '', null, '0', '10', '/admin/notice/getListData.shtml'),
      (null, '查看通告', '10', '0', '1', '', null, '0', '10', '/admin/notice/viewNotice.shtml'),
      (null, '签收通告', '10', '0', '1', '', null, '0', '10', '/admin/notice/sign.shtml')
;
DROP TABLE IF EXISTS sys_department;
CREATE TABLE sys_department (
  ids varchar(32) COLLATE utf8_bin NOT NULL,
  version bigint(20) DEFAULT NULL,
  allchildnodeids varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  departmentlevel bigint(20) DEFAULT NULL,
  depttype char(1) COLLATE utf8_bin DEFAULT NULL,
  description varchar(200) COLLATE utf8_bin DEFAULT NULL,
  images varchar(50) COLLATE utf8_bin DEFAULT NULL,
  isparent varchar(5) COLLATE utf8_bin DEFAULT NULL,
  names varchar(25) COLLATE utf8_bin DEFAULT NULL,
  orderids bigint(20) DEFAULT NULL,
  url varchar(100) COLLATE utf8_bin DEFAULT NULL,
  parentdepartmentids varchar(32) COLLATE utf8_bin DEFAULT NULL,
  principaluserids varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (ids)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS sys_org;
CREATE TABLE sys_org (
  id bigint auto_increment,
  version bigint(20) DEFAULT NULL,
  level bigint(20) DEFAULT NULL,
  type char(1) COLLATE utf8_bin DEFAULT NULL,
  description varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  image varchar(50) COLLATE utf8_bin DEFAULT NULL,
  isparent varchar(5) COLLATE utf8_bin DEFAULT '0',
  name varchar(25) COLLATE utf8_bin DEFAULT NULL,
  sort bigint(20) DEFAULT '0',
  url varchar(100) COLLATE utf8_bin DEFAULT NULL,
  parent_id varchar(32) COLLATE utf8_bin DEFAULT NULL,
  operate varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
INSERT INTO sys_org
VALUES (1, '0', '0', null, '总公司', '2.png', '1', '总公司', '0', null, '0', null),
  (null, null, null, null, '开发部门', null, null, '开发部', '1', null, '1', null);
;
DROP TABLE IF EXISTS oa_bumph;
CREATE TABLE oa_bumph (
  id bigint auto_increment,
  title varchar(255) DEFAULT NULL COMMENT '公文标题',
  sender_id varchar(50) DEFAULT NULL,
  ender_name varchar(50) DEFAULT NULL,
  sender_orgid varchar(50) DEFAULT NULL,
  sender_orgname varchar(50) DEFAULT NULL,
  doc_type varchar(1) DEFAULT NULL,
  doc_num varchar(100) DEFAULT NULL,
  doc_num_source varchar(100) DEFAULT NULL,
  doc_num_year varchar(5) DEFAULT NULL,
  doc_num_n int(11) DEFAULT NULL,
  content text,
  if_submit varchar(1) DEFAULT '0',
  if_send varchar(1) DEFAULT '0',
  if_complete varchar(1) DEFAULT '0',
  proc_ins_id varchar(50) DEFAULT NULL,
  first_leader_audit text,
  second_leader_audit text,
  create_time varchar(50) DEFAULT NULL,
  send_time varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS oa_notice;
CREATE TABLE oa_notice (
  id bigint auto_increment,
  title varchar(100) DEFAULT NULL,
  sub_title varchar(100) DEFAULT NULL,
  sender_id varchar(50) DEFAULT NULL,
  sender_name varchar(50) DEFAULT NULL,
  sender_orgid varchar(50) DEFAULT NULL,
  sender_orgname varchar(50) DEFAULT NULL,
  create_time date DEFAULT null COMMENT '创建时间',
  publish_time varchar(50) DEFAULT NULL COMMENT '发布时间',
  content longtext,
  to_org_id varchar(2000) DEFAULT NULL,
  to_org_name varchar(2000) DEFAULT NULL,
  if_publish varchar(1) DEFAULT '0' COMMENT '0:未发布。1:已发布。',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS oa_notice_user;
CREATE TABLE oa_notice_user (
  id bigint auto_increment,
  user_id varchar(50) DEFAULT NULL,
  user_name varchar(50) DEFAULT NULL,
  notice_id varchar(50) DEFAULT NULL,
  if_sign varchar(1) DEFAULT '0' COMMENT '0：未签收，1：已签收',
  sign_time varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
