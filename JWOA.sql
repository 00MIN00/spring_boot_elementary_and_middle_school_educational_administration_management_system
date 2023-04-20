/*
Navicat MySQL Data Transfer

Source Server         : 172.19.130.1
Source Server Version : 80026
Source Host           : 172.19.130.1:3306
Source Database       : JWOA

Target Server Type    : MYSQL
Target Server Version : 80026
File Encoding         : 65001

Date: 2023-04-17 18:23:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clbum`
-- ----------------------------
DROP TABLE IF EXISTS `clbum`;
CREATE TABLE `clbum` (
  `uid` varchar(64) NOT NULL COMMENT '班级uid唯一码',
  `principal` varchar(64) NOT NULL COMMENT '负责人/班主任（对象）关联用户uid唯一码',
  `creationTime` date NOT NULL COMMENT '创建时间',
  `classSchedule` varchar(64) NOT NULL COMMENT '课程表代码',
  `seatingPlan` varchar(64) NOT NULL COMMENT '座位表代码',
  `clbumName` varchar(64) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `clbum_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级管理表';

-- ----------------------------
-- Records of clbum
-- ----------------------------
INSERT INTO `clbum` VALUES ('48e3cad0-c38d-48e2-b07e-4405e04bd6d1', '4456a36e-5840-45f7-8e0b-a43b170e6d38', '2023-03-15', '48e3cad0-c38d-48e2-b07e-4405e04bd6d1', '7837f09d-00fd-441c-b2e6-60b46760609b', '1班');
INSERT INTO `clbum` VALUES ('77904122-a2ad-4d1d-a88b-8adb4d7f09e9', '0ddf7c39-238a-4037-a5ed-db439383df6f', '2023-04-16', '77904122-a2ad-4d1d-a88b-8adb4d7f09e9', '7837f09d-00fd-441c-b2e6-60b46760609b', '9班');
INSERT INTO `clbum` VALUES ('ad9ed7c9-abc7-41df-8292-00fcfdbae232', '10de1c76-7c66-473b-9656-67d5925d26c1', '2023-04-10', 'ad9ed7c9-abc7-41df-8292-00fcfdbae232', '7837f09d-00fd-441c-b2e6-60b46760609b', '7班');
INSERT INTO `clbum` VALUES ('ef94d4d4-88fa-4ca3-9588-300ed1ad551f', '10de1c76-7c66-473b-9656-67d5925d26c1', '2023-03-15', 'ef94d4d4-88fa-4ca3-9588-300ed1ad551f', '7837f09d-00fd-441c-b2e6-60b46760609b', '4班');

-- ----------------------------
-- Table structure for `clbummain`
-- ----------------------------
DROP TABLE IF EXISTS `clbummain`;
CREATE TABLE `clbummain` (
  `uid` varchar(64) NOT NULL,
  `X` int NOT NULL,
  `Y` int NOT NULL,
  `studentUid` varchar(64) NOT NULL,
  `column_null` varchar(64) DEFAULT NULL,
  `clbumuid` varchar(64) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `clbummain_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of clbummain
-- ----------------------------
INSERT INTO `clbummain` VALUES ('083027c2-2545-47b7-a449-2fa8c7713509', '3', '4', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('08b4dd5e-0589-4e7a-8c74-c23e81e06869', '4', '1', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('197d0717-0fe4-4374-9659-8f8659e03af8', '5', '10', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('1bfe8451-2d88-4482-9824-a4904160ebbb', '5', '1', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('1c480404-4da9-4b6a-ad24-4127a050f5ea', '4', '8', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('1c57f8ef-1371-400f-8cea-9521d4ade4b1', '1', '1', '04e28d85-df76-469a-8110-a152ee2375d3', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('1f0aca2a-c2e7-4128-9b8b-73bb55bcfb74', '5', '2', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('1f283da6-3393-4bd5-b726-4aac8cfa9174', '1', '5', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('2273d380-65ed-4f77-abee-09f4703f7c94', '4', '2', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('22d43eeb-a338-4401-8951-25e63716d395', '5', '3', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('25ec9e40-448a-433c-a60f-800a45033c65', '1', '9', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('2eec09d4-df64-4533-a4da-91fdd0888c77', '3', '9', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('30dce533-1116-47a3-afd1-27e10bca9eaf', '1', '4', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('34adfafb-ad6c-4d1a-88ec-04993eedbceb', '2', '8', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('3a7e72b7-17d8-41a4-8f58-4fbff6d30e3a', '2', '7', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('4496b5c8-0c0a-4da4-8e77-5d36dbf85a29', '1', '8', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('4ba3d6be-5313-40a3-80c5-dfde30e1f646', '4', '10', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('4d808e58-c17c-42db-b0eb-de0fcae71663', '2', '3', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('4f72d087-6405-4b6a-bd8f-d38872ab686e', '2', '4', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('576d5e76-76f2-45c4-8def-2bc351bd501b', '1', '2', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('63939bc8-f401-4faf-96ba-43bc0ea2a788', '4', '5', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('6df303ce-bbf2-48ae-8961-9e43efb93162', '4', '3', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('6e01564d-6eba-41ee-9921-b0f42d21641c', '1', '7', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('6e74fb7e-05e4-47c6-9e2d-74c9e74dfb1b', '2', '1', '0b982431-0305-4e1c-bd79-d58f0e4108ae', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('72643d69-990a-47ab-bb33-078161dd813b', '3', '10', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('8162677f-8ebb-433d-b1e1-943c1aab9750', '5', '4', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('83bb8ac3-1407-4a70-ba35-212351c7ed98', '5', '5', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('86b03536-3596-4b99-9011-47cc47ec749d', '1', '6', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('8d525a9c-7396-498f-8de3-9d47a045df1d', '4', '4', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('8d5553a9-4e81-41b9-87ea-ef15299c59e8', '2', '5', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('9304f95c-780a-4e28-bdc3-c415cc3b2785', '3', '6', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('96784714-f075-4db1-8c0f-31af6590df5a', '4', '6', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('99e1b771-5e51-482a-b788-f6203e37b926', '5', '8', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('9a6b74b3-b13f-4253-9f8b-94a225afae00', '3', '7', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('9d8a907a-045b-4d13-bef5-2c5019fc461e', '3', '2', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('a2c31557-4845-49ca-b3a6-a93556a2b996', '2', '9', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('a445ec11-2a03-42f3-b604-dfa851975580', '1', '3', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('a511c9c8-9501-440b-8422-180c762d556c', '4', '9', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('b4713d1f-4b90-403c-9c60-0a28371a3609', '2', '2', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('b9f3e61a-3460-493a-b4b4-0a8db6394467', '2', '6', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('bc120b04-08ae-4194-982e-61faf9d6be58', '3', '8', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('c6d47049-91ad-447b-a35f-d34b1313e644', '3', '1', '0f907754-584a-4e3e-a32e-9839809ab6c2', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('c82d2315-077d-4529-b1b9-fc0104b6298a', '2', '10', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('c9cc33d6-4a5a-46a5-823a-243218e11bf7', '5', '7', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('c9d439bd-29f7-4a9d-a4d7-e5265658d20b', '1', '10', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('cea28ac1-65bd-41ad-af67-164a2da9da12', '5', '9', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('dca1b544-3916-4b52-b0d5-48d654e35ea1', '3', '3', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('eb517db2-7659-4b53-9ba8-af42ec336673', '3', '5', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('edaaab4a-38ac-46fc-b5b8-7c68d4a54c13', '5', '6', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');
INSERT INTO `clbummain` VALUES ('f869f849-f7c7-433f-9643-47411db168c7', '4', '7', '0', null, '48e3cad0-c38d-48e2-b07e-4405e04bd6d1');

-- ----------------------------
-- Table structure for `clbumUid`
-- ----------------------------
DROP TABLE IF EXISTS `clbumUid`;
CREATE TABLE `clbumUid` (
  `uid` varchar(64) NOT NULL,
  `clbumUidName` varchar(32) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `clbumUid_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='座位表列表';

-- ----------------------------
-- Records of clbumUid
-- ----------------------------
INSERT INTO `clbumUid` VALUES ('48e3cad0-c38d-48e2-b07e-4405e04bd6d1', 'sss');
INSERT INTO `clbumUid` VALUES ('77904122-a2ad-4d1d-a88b-8adb4d7f09e9', '99s');
INSERT INTO `clbumUid` VALUES ('ad9ed7c9-abc7-41df-8292-00fcfdbae232', '55');
INSERT INTO `clbumUid` VALUES ('ef94d4d4-88fa-4ca3-9588-300ed1ad551f', '4');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `uid` varchar(64) NOT NULL COMMENT '课程uid唯一码',
  `principal` varchar(32) NOT NULL COMMENT '课程名称 ',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('0', '放假');
INSERT INTO `course` VALUES ('1', '语文');
INSERT INTO `course` VALUES ('2', '数学');
INSERT INTO `course` VALUES ('3', '英语');
INSERT INTO `course` VALUES ('4', '思想品德');

-- ----------------------------
-- Table structure for `coursemain`
-- ----------------------------
DROP TABLE IF EXISTS `coursemain`;
CREATE TABLE `coursemain` (
  `uid` varchar(64) NOT NULL COMMENT 'uid',
  `X` int DEFAULT NULL,
  `Y` int DEFAULT NULL,
  `courseName` varchar(64) NOT NULL COMMENT '课程表名',
  `FacultyUid` varchar(64) DEFAULT NULL,
  `courseUid` varchar(64) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `coursemain_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of coursemain
-- ----------------------------
INSERT INTO `coursemain` VALUES ('05100f83-5604-48e8-8a23-9ae69fa659eb', '2', '3', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('06831d79-421a-4cf9-932f-e47b2815510c', '5', '2', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('0ced4ad2-4721-48a0-a4da-b96eceac79c3', '4', '3', '3', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('0e5710b2-b1d9-41a3-ad04-f7c0844c1304', '1', '6', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('1cf2f2f9-7755-4065-957e-3fd2aa130198', '4', '5', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('21e586fa-a32d-46dd-b9b9-5c3fcede847a', '6', '6', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('31ba8e98-a4a0-4101-a37b-4273505257df', '4', '1', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('34e5ae46-731d-4363-87aa-49b7c4100e57', '6', '4', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('352d95e4-c90e-440e-adf6-7cf991a9876b', '1', '3', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('3c828a66-afc9-4f4d-b557-a869452dc9f7', '2', '6', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('3f505d91-697c-451c-bd18-ac73491c153b', '3', '1', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('4d6b0a68-2642-4a14-af4d-7509fe86aba8', '1', '5', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('517eac51-589b-4654-ba65-38975178531f', '2', '2', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('58a30363-c3fb-433f-865c-3d4f44738e5d', '6', '3', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('590b38c5-bc8c-483a-ba06-b50d332ebf28', '3', '4', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('5aadc5ab-4f1a-4a6e-a446-b275697a781c', '2', '1', '4', '6c7b1a1d-735f-463d-8ea7-19d37619bd71', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('5e10ced6-dd68-4626-9276-39cac0a20a0a', '5', '4', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('611c6ca8-207b-47d8-ab62-9ba24753060e', '7', '4', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('6c469780-6fb7-41e2-9fe8-747fd3d2b311', '4', '6', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('6ccec25e-cd22-4a8b-b432-e303e7848675', '5', '6', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('728504da-1ee1-44c9-a7c0-988b630dc9ae', '7', '6', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('7a8ae5ea-8bf6-45d1-8746-bc631fdc0dec', '5', '5', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('7ac2210c-ca9f-4379-8f04-1a8d2c9df581', '2', '4', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('99f21e46-3b2e-44b6-8570-ff30759529a7', '3', '2', '2', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('a9fb4502-7fd3-4e5a-a8f7-77a75a3759b1', '4', '2', '2', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('b1342833-6ecd-49fd-a194-a72df0a22c98', '3', '6', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('b2179326-77b7-4e23-9947-4d8ebc21f68c', '3', '3', '3', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('b21eb305-6fe2-40b8-a769-41e730beff6a', '5', '1', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('b2d8b26a-6d88-4ed8-85a7-b769972abdc1', '5', '3', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('b3859131-d5f5-4ed5-973d-6c4f36772f47', '2', '5', '4', '6c7b1a1d-735f-463d-8ea7-19d37619bd71', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('bacb02c7-0a68-45c3-a40a-a9db5a3bd1b5', '6', '5', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('bc89d239-c462-417d-acc1-0beeb8b5c6d6', '7', '1', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('c46cd30a-9e27-459e-9d0a-4ae7c5675ec1', '6', '1', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('c6639d92-a47b-4294-b076-1a9698c77d3d', '7', '2', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('c74fab03-2d50-4b97-b8d8-a7c4a75ff1de', '3', '5', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('c8b3b752-2997-4994-9e69-28b918b276e3', '1', '4', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('cc4b20eb-0394-492b-aaa7-db761b1f6908', '7', '5', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('d0b2c0b4-06bd-480a-a534-289a06ce8436', '7', '3', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('d94c8e86-e0e8-4738-bccc-2981758d88f6', '1', '2', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('e325bd00-089f-4729-b8ad-b79c0f3ac920', '4', '4', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('e95173a6-f89b-4f32-8677-f4ba67839f3c', '1', '1', '0', '0', '7837f09d-00fd-441c-b2e6-60b46760609b');
INSERT INTO `coursemain` VALUES ('f5946434-5dc8-4085-99fa-3858b108a39d', '6', '2', '1', '10de1c76-7c66-473b-9656-67d5925d26c1', '7837f09d-00fd-441c-b2e6-60b46760609b');

-- ----------------------------
-- Table structure for `courseUid`
-- ----------------------------
DROP TABLE IF EXISTS `courseUid`;
CREATE TABLE `courseUid` (
  `uid` varchar(64) NOT NULL,
  `courseUidName` varchar(64) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `courseUid_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of courseUid
-- ----------------------------
INSERT INTO `courseUid` VALUES ('7837f09d-00fd-441c-b2e6-60b46760609b', 'ss');

-- ----------------------------
-- Table structure for `examination`
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination` (
  `uid` varchar(64) NOT NULL COMMENT '考试uid唯一码',
  `examinationName` varchar(32) NOT NULL COMMENT '考试名称',
  `examinationPrincipal` varchar(64) NOT NULL COMMENT '考试科目(课程uid唯一码)',
  `examinationDate` date NOT NULL COMMENT '考试时间',
  `teacherA` varchar(32) DEFAULT NULL COMMENT '监考老师',
  `teacherB` varchar(32) DEFAULT NULL COMMENT '监考老师2',
  `bz` text COMMENT '备注',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `examination_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='考试总表';

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES ('b5e0a04b-0b80-4035-86ec-d76326673c16', '测试', '320247fc-9a57-4344-beda-94d7f58b0046', '2023-03-16', '11', '111', null);

-- ----------------------------
-- Table structure for `Faculty`
-- ----------------------------
DROP TABLE IF EXISTS `Faculty`;
CREATE TABLE `Faculty` (
  `uid` varchar(64) NOT NULL COMMENT '用户uid唯一码',
  `loginId` varchar(32) NOT NULL COMMENT '登录账号',
  `userpassword` varchar(32) NOT NULL COMMENT '登陆密码\r\n',
  `jurisdiction` varchar(8) NOT NULL COMMENT '权限代码',
  `createDate` date NOT NULL COMMENT '注册时间/入职时间',
  `userName` varchar(32) NOT NULL COMMENT '用户名',
  `course` varchar(32) NOT NULL COMMENT '任教课程',
  `education` int NOT NULL COMMENT '学历代码',
  `userRank` int NOT NULL COMMENT '职称',
  `userImg` varchar(64) DEFAULT NULL COMMENT '用户头像',
  `phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `mailbox` varchar(32) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`uid`),
  UNIQUE KEY ` Faculty_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='教职员表';

-- ----------------------------
-- Records of Faculty
-- ----------------------------
INSERT INTO `Faculty` VALUES ('0ddf7c39-238a-4037-a5ed-db439383df6f', 'root', '123456', '0', '2023-03-22', 'root', '1', '6', '0', 'a.jpg', '222', '222');
INSERT INTO `Faculty` VALUES ('10de1c76-7c66-473b-9656-67d5925d26c1', '121523', '123456', '1', '2023-03-22', '张三风', '1', '6', '1', 'ui-danro.jpg', '222', '222');
INSERT INTO `Faculty` VALUES ('4456a36e-5840-45f7-8e0b-a43b170e6d38', '1200', '123456', '5', '2023-03-24', '司徒揭', '2', '6', '5', '4456a36e-5840-45f7-8e0b-a43b170e6d38.jpg', '222', '222');
INSERT INTO `Faculty` VALUES ('6c7b1a1d-735f-463d-8ea7-19d37619bd71', '0200', '123456', '5', '2023-03-22', '德地.凯文', '3', '6', '5', 'a.jpg', '222', '222');

-- ----------------------------
-- Table structure for `performance`
-- ----------------------------
DROP TABLE IF EXISTS `performance`;
CREATE TABLE `performance` (
  `uid` varchar(64) NOT NULL COMMENT '成绩uid唯一码',
  `studentIdUid` varchar(64) NOT NULL COMMENT '学生uid',
  `courseUid` varchar(64) NOT NULL COMMENT '课程uid唯一码',
  `examinationUid` varchar(64) NOT NULL COMMENT '考试uid唯一码',
  `performance` int NOT NULL COMMENT '成绩',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `performance_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='成绩总表';

-- ----------------------------
-- Records of performance
-- ----------------------------
INSERT INTO `performance` VALUES ('825e73d3-106e-45d4-ae41-457974a98af3', 'eacec3a9-f476-45f8-9dc7-0be2a8795a39', '1', '320247fc-9a57-4344-beda-94d7f58b0046', '89');
INSERT INTO `performance` VALUES ('bd64a6f3-ea62-4012-a847-9fb36754df3c', 'eacec3a9-f476-45f8-9dc7-0be2a8795a39', '3', '320247fc-9a57-4344-beda-94d7f58b0046', '55');
INSERT INTO `performance` VALUES ('ca2a59d7-0ba2-4cf8-9b9b-aeae70b19fba', '1729c592-e442-4241-9d22-82a1feae1300', '3', '320247fc-9a57-4344-beda-94d7f58b0046', '95');

-- ----------------------------
-- Table structure for `studentId`
-- ----------------------------
DROP TABLE IF EXISTS `studentId`;
CREATE TABLE `studentId` (
  `uid` varchar(64) NOT NULL COMMENT '学生uid唯一码',
  `studentId` varchar(32) NOT NULL COMMENT '学生学号',
  `studentName` varchar(32) NOT NULL COMMENT '学生姓名',
  `sex` bit(1) NOT NULL DEFAULT b'0' COMMENT '性别',
  `birthYear` date NOT NULL COMMENT '出生年份',
  `enrollmentDate` date NOT NULL COMMENT '入学时间',
  `studentClass` varchar(64) DEFAULT NULL COMMENT '班级关联，关联班级uid',
  `studentIdImg` varchar(64) DEFAULT NULL COMMENT '学生头像',
  `studentpassword` varchar(32) DEFAULT NULL,
  `jurisdiction` int NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `studentId_uid_uindex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生信息总表';

-- ----------------------------
-- Records of studentId
-- ----------------------------
INSERT INTO `studentId` VALUES ('04e28d85-df76-469a-8110-a152ee2375d3', '37887717633610109497106471664', '秋谨温', '', '2023-04-07', '2023-04-07', '48e3cad0-c38d-48e2-b07e-4405e04bd6d1', 'NULL.jpg', '71749512645911016187222431107', '100');
INSERT INTO `studentId` VALUES ('0b982431-0305-4e1c-bd79-d58f0e4108ae', '952445131601112666301766324179', '孔选沛', '', '2023-04-07', '2023-04-07', '48e3cad0-c38d-48e2-b07e-4405e04bd6d1', 'NULL.jpg', '988464731761212353745871468', '100');
INSERT INTO `studentId` VALUES ('0f907754-584a-4e3e-a32e-9839809ab6c2', '774095619064661875382917421', '牧氧晶', '', '2023-04-07', '2023-04-07', '48e3cad0-c38d-48e2-b07e-4405e04bd6d1', 'NULL.jpg', '918892912952508957533362508231', '100');
INSERT INTO `studentId` VALUES ('12163f08-d46c-46ac-b309-b3e27f870711', '68517631010386477725930555965', '席淤求', '', '2023-04-07', '2023-04-07', '', '12163f08-d46c-46ac-b309-b3e27f870711.jpg', '99454439177388964063218817890', '100');
INSERT INTO `studentId` VALUES ('1729c592-e442-4241-9d22-82a1feae1300', '54610229173897163770947429176', '後惯埃', '', '2023-04-07', '2023-04-07', '', '1729c592-e442-4241-9d22-82a1feae1300.jpg', '96850940043252729035626916674', '100');
INSERT INTO `studentId` VALUES ('18e3dd07-d4b6-45fe-8065-42434d13e8f8', '4173051825634642736554689862', '薛春猿', '', '2023-04-07', '2023-04-07', '', '18e3dd07-d4b6-45fe-8065-42434d13e8f8.jpg', '86075665111477217484659522711', '100');
INSERT INTO `studentId` VALUES ('1d29aadc-9bce-4131-9f07-daabed90bedb', '3459838802041671014811725474459', '姬识皋', '', '2023-04-07', '2023-04-07', '', '1d29aadc-9bce-4131-9f07-daabed90bedb.jpg', '945802723290993493305295840726', '100');
INSERT INTO `studentId` VALUES ('21e9a5bd-aea9-4151-b69a-2f8037c94eaf', '8691876787338210985983385229', '尉迟粤痈', '', '2023-04-07', '2023-04-07', '', '21e9a5bd-aea9-4151-b69a-2f8037c94eaf.jpg', '78044417249292794674175991901', '100');
INSERT INTO `studentId` VALUES ('234ac70d-abe8-4746-bce0-72abee829eba', '541471390202612551012369513303', '於蚜淫', '', '2023-04-07', '2023-04-07', '', '234ac70d-abe8-4746-bce0-72abee829eba.jpg', '6358158113636248513613594303', '100');
INSERT INTO `studentId` VALUES ('2c8ddaea-289c-47c6-bdc8-4b593691e35a', '65441421590824889281240199993', '万俟掏檀', '', '2023-04-07', '2023-04-07', '', '2c8ddaea-289c-47c6-bdc8-4b593691e35a.jpg', '27262345681877240778170900475', '100');
INSERT INTO `studentId` VALUES ('30b6f0dd-f78c-417c-84bd-61acf60c6887', '90365644046353731666097101305', '耿持矣', '', '2023-04-07', '2023-04-07', '', '30b6f0dd-f78c-417c-84bd-61acf60c6887.jpg', '1004535216494521958397181463839', '100');
INSERT INTO `studentId` VALUES ('3582054f-32d1-4fb1-a890-9a8492b5696e', '21536372926774736568261317978', '戚便诲', '', '2023-04-07', '2023-04-07', '', '3582054f-32d1-4fb1-a890-9a8492b5696e.jpg', '480489253415436191517840443959', '100');
INSERT INTO `studentId` VALUES ('39e24213-2d14-44e4-8a21-7ba752e286ff', '677350486272156223376819975207', '潘麻推', '', '2023-04-07', '2023-04-07', '', '39e24213-2d14-44e4-8a21-7ba752e286ff.jpg', '5189992288381122875843320254', '100');
INSERT INTO `studentId` VALUES ('3a86a50e-dc1f-4687-96db-04d631fadd6d', '734228555777396779994827588792', '上官锡万', '', '2023-04-07', '2023-04-07', '', '3a86a50e-dc1f-4687-96db-04d631fadd6d.jpg', '21637867921663536440497380222', '100');
INSERT INTO `studentId` VALUES ('400e252f-b911-49f1-893b-272dc4cf0d66', '491744878165376510512519443', '公西仟瞎', '', '2023-04-07', '2023-04-07', '', '400e252f-b911-49f1-893b-272dc4cf0d66.jpg', '893791672622380620625087', '100');
INSERT INTO `studentId` VALUES ('5b31251b-9981-4cb0-ab81-6af58c9fe55d', '14253994833863743867836132', '魏牟效', '', '2023-04-07', '2023-04-07', '', '5b31251b-9981-4cb0-ab81-6af58c9fe55d.jpg', '37067119429261046281838468213', '100');
INSERT INTO `studentId` VALUES ('6229359f-bd4d-4860-a4c3-de560a22a815', '914747584084261103082891003627', '古酉吗', '', '2023-04-07', '2023-04-07', '', '6229359f-bd4d-4860-a4c3-de560a22a815.jpg', '2490036271799229480865833791', '100');
INSERT INTO `studentId` VALUES ('65ef1278-e69c-42a1-8ff2-4f1e82f4c723', '8042252791019953284591018875420', '仉秒芯', '', '2023-04-07', '2023-04-07', '', '65ef1278-e69c-42a1-8ff2-4f1e82f4c723.jpg', '139286878360232234742378590499', '100');
INSERT INTO `studentId` VALUES ('68842cf7-8421-4225-8796-7f81e81aa111', '159492590356591939170980683', '党沮蛹', '', '2023-04-07', '2023-04-07', '', '68842cf7-8421-4225-8796-7f81e81aa111.jpg', '398355792229315197285895', '100');
INSERT INTO `studentId` VALUES ('699df475-ea47-4f31-8b28-54873e60a26f', '907324698940245399250744585', '郏绥侥', '', '2023-04-07', '2023-04-07', '', '699df475-ea47-4f31-8b28-54873e60a26f.jpg', '121670140406548808747921290', '100');
INSERT INTO `studentId` VALUES ('6aefb205-a0ac-43c8-b72e-ac3cf5ec245d', '2412314027121017911004905336393', '荣因主', '', '2023-04-07', '2023-04-07', '', '6aefb205-a0ac-43c8-b72e-ac3cf5ec245d.jpg', '40172050819493557980775913331', '100');
INSERT INTO `studentId` VALUES ('6d39afc5-b49e-4b31-917f-a383001597db', '13166323686118988107974693672', '岑沉灌', '', '2023-04-07', '2023-04-07', '', '6d39afc5-b49e-4b31-917f-a383001597db.jpg', '66120560896065993491286612278', '100');
INSERT INTO `studentId` VALUES ('7d44fec6-4acf-48e4-b062-d04b03a37307', '148291012664635602608661715349', '迪咸', '', '2023-04-07', '2023-04-07', '', '7d44fec6-4acf-48e4-b062-d04b03a37307.jpg', '64248114811955745092218493635', '100');
INSERT INTO `studentId` VALUES ('82bdaf23-4844-4377-af6f-33164926e7dd', '86357493101876364983381382881', '葛壤丹', '', '2023-04-07', '2023-04-07', '', '82bdaf23-4844-4377-af6f-33164926e7dd.jpg', '35541398711031619473941510579', '100');
INSERT INTO `studentId` VALUES ('84426c3e-c63a-4333-af5f-591b33ccc301', '291333123924964283627559530', '伯任贫', '', '2023-04-07', '2023-04-07', '', '84426c3e-c63a-4333-af5f-591b33ccc301.jpg', '746460152532345410231433532387', '100');
INSERT INTO `studentId` VALUES ('8caaaae0-55ab-40c4-a787-1cbc15f7e608', '655685245574594413625593202918', '衡寒犬', '', '2023-04-07', '2023-04-07', '', '8caaaae0-55ab-40c4-a787-1cbc15f7e608.jpg', '232668981384335792540778338405', '100');
INSERT INTO `studentId` VALUES ('8e549524-206f-4e5a-ba49-98e2b46992f3', '87512859188766659314884389523', '文拈卉', '', '2023-04-07', '2023-04-07', '', '8e549524-206f-4e5a-ba49-98e2b46992f3.jpg', '71973214167546325683684876480', '100');
INSERT INTO `studentId` VALUES ('91c6665f-47fa-43da-b7fe-751b86d385d7', '309467310131461010927849858683', '宫凄渊', '', '2023-04-07', '2023-04-07', '', '91c6665f-47fa-43da-b7fe-751b86d385d7.jpg', '205539865199491015188480194930', '100');
INSERT INTO `studentId` VALUES ('92486a8b-7853-411c-9807-598abaf4bfda', '45254620836667477620110742366', '单于缚焦', '', '2023-04-07', '2023-04-07', '', '92486a8b-7853-411c-9807-598abaf4bfda.jpg', '94483591646646676749907740463', '100');
INSERT INTO `studentId` VALUES ('99059b06-2229-4be3-b76b-0a5f1bc53799', '685858858345247742880668186236', '方赛蟹', '', '2023-04-07', '2023-04-07', '', '99059b06-2229-4be3-b76b-0a5f1bc53799.jpg', '8162005111827789893957231942', '100');
INSERT INTO `studentId` VALUES ('9c91b657-f7a6-41be-8292-7b05e81eebeb', '50810069361433969878989560160', '卢裕炒', '', '2023-04-07', '2023-04-07', '', '9c91b657-f7a6-41be-8292-7b05e81eebeb.jpg', '64433456263584820232589803292', '100');
INSERT INTO `studentId` VALUES ('a1afd677-2c2e-46f8-b876-34ae8164bab9', '44424136817229425251885930132', '尤热持', '', '2023-04-07', '2023-04-07', '', 'a1afd677-2c2e-46f8-b876-34ae8164bab9.jpg', '94607422807718399221921963168', '100');
INSERT INTO `studentId` VALUES ('a667db03-f0fe-437f-8bc1-6bf053b2a893', '841275848380199320115858323714', '章攫卢', '', '2023-04-07', '2023-04-07', '', 'a667db03-f0fe-437f-8bc1-6bf053b2a893.jpg', '495799686867394286846810756', '100');
INSERT INTO `studentId` VALUES ('a6978545-3ee3-42b1-beea-e40365fff4f3', '7616912568966976615809884396', '颜翻纯', '', '2023-04-07', '2023-04-07', '', 'a6978545-3ee3-42b1-beea-e40365fff4f3.jpg', '81977419514651991895197410640', '100');
INSERT INTO `studentId` VALUES ('affabacf-7291-4f8b-b0cd-cd4f4ff95619', '6107262057277163973053235350', '璩殷敌', '', '2023-04-07', '2023-04-07', '', 'affabacf-7291-4f8b-b0cd-cd4f4ff95619.jpg', '6536039339901916802141018695319', '100');
INSERT INTO `studentId` VALUES ('b21c64ba-ff61-4c1e-b54d-af8e04086b84', '34947549710089365741010588412668', '潘龙两', '', '2023-04-07', '2023-04-07', '', 'b21c64ba-ff61-4c1e-b54d-af8e04086b84.jpg', '7694226021781484994991511585', '100');
INSERT INTO `studentId` VALUES ('c5ba3a82-51e3-4446-8235-723f75c0a948', '732338676386738244520824837', '任蝶弹', '', '2023-04-07', '2023-04-07', '', 'c5ba3a82-51e3-4446-8235-723f75c0a948.jpg', '26072362910197129983697488136', '100');
INSERT INTO `studentId` VALUES ('c8def7b8-51d4-43ca-b243-5fc91513f2b3', '26518840472414414498388354107', '乌南首', '', '2023-04-07', '2023-04-07', '', 'c8def7b8-51d4-43ca-b243-5fc91513f2b3.jpg', '88137315957600933326103164503', '100');
INSERT INTO `studentId` VALUES ('c8fafea3-7640-4631-9044-076e96a61417', '58726497235584698955971009670', '山撤咱', '', '2023-04-07', '2023-04-07', '', 'c8fafea3-7640-4631-9044-076e96a61417.jpg', '757445636117668976734296242523', '100');
INSERT INTO `studentId` VALUES ('c9261640-800e-4e4d-a820-19905ef62055', '8046588138858657975701932692', '蒙菇剃', '', '2023-04-07', '2023-04-07', '', 'c9261640-800e-4e4d-a820-19905ef62055.jpg', '99215717725326366122854526528', '100');
INSERT INTO `studentId` VALUES ('cfdfc658-e0be-4e8c-89ae-05e060f417b5', '75486748704190833430938161327', '农忧诌', '', '2023-04-07', '2023-04-07', '', 'cfdfc658-e0be-4e8c-89ae-05e060f417b5.jpg', '530938226559878726195834951785', '100');
INSERT INTO `studentId` VALUES ('d799c2aa-a203-4eeb-a226-aa4b6abb494f', '329104952698509582870237723455', '井颧邮', '', '2023-04-07', '2023-04-07', '', 'd799c2aa-a203-4eeb-a226-aa4b6abb494f.jpg', '425818262942680670477972389', '100');
INSERT INTO `studentId` VALUES ('de5755cd-92e9-4705-8175-84b3dd1e745f', '1016540572420783110846828885129', '禄哉驭', '', '2023-04-07', '2023-04-07', '', 'de5755cd-92e9-4705-8175-84b3dd1e745f.jpg', '8712821001554507793580316671686', '100');
INSERT INTO `studentId` VALUES ('e1181523-6e0c-445a-a317-1fab5945c8ae', '78452610144458508471293209212', '邬惺钒', '', '2023-04-07', '2023-04-07', '', 'e1181523-6e0c-445a-a317-1fab5945c8ae.jpg', '92810672974466331616369217081', '100');
INSERT INTO `studentId` VALUES ('e41b05a1-606f-45e0-80c1-b83d4c8e933e', '622708844908837247834204165235', '奚莱陆', '', '2023-04-07', '2023-04-07', '', 'e41b05a1-606f-45e0-80c1-b83d4c8e933e.jpg', '25865471676794880469305264210', '100');
INSERT INTO `studentId` VALUES ('eacec3a9-f476-45f8-9dc7-0be2a8795a39', '2222', '诺艾尔', '', '2023-03-26', '2015-03-08', '701c9443-03ac-4cb8-b2f0-c165e3bea610', 'eacec3a9-f476-45f8-9dc7-0be2a8795a39.jpg', '159487', '100');
INSERT INTO `studentId` VALUES ('ef216bd3-e3d9-467b-9b1b-9973e7d2d9e5', '4742029918777878461863607848', '乐俯蕴', '', '2023-04-07', '2023-04-07', '', 'ef216bd3-e3d9-467b-9b1b-9973e7d2d9e5.jpg', '73061825157565374514971247886', '100');
INSERT INTO `studentId` VALUES ('f3b64ddd-ec40-443d-8324-96b6035feeaa', '3557046435652764210891286437', '解可著', '', '2023-04-07', '2023-04-07', '', 'f3b64ddd-ec40-443d-8324-96b6035feeaa.jpg', '816369042486793522306412958', '100');
INSERT INTO `studentId` VALUES ('f6a77e8e-a7f8-4a86-94b6-66ca884a1b81', '36373557892595776802400690345', '强莹掩', '', '2023-04-07', '2023-04-07', '', 'f6a77e8e-a7f8-4a86-94b6-66ca884a1b81.jpg', '263247402426304273883289464', '100');
INSERT INTO `studentId` VALUES ('fdbd6599-0b40-473a-a63a-cc2c24ba7a94', '754145953239498316295397586186', '宦垮蝗', '', '2023-04-07', '2023-04-07', '', 'fdbd6599-0b40-473a-a63a-cc2c24ba7a94.jpg', '268949579389196627126439746915', '100');
INSERT INTO `studentId` VALUES ('ffca99d5-b2d9-4416-b95d-239362af071b', '2744534629541349819188561', '甄柠延', '', '2023-04-07', '2023-04-07', '', 'ffca99d5-b2d9-4416-b95d-239362af071b.jpg', '29413611016699699893358362708', '100');
