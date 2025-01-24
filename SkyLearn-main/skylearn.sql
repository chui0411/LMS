/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : skylearn

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 24/01/2025 00:12:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts_departmenthead
-- ----------------------------
DROP TABLE IF EXISTS `accounts_departmenthead`;
CREATE TABLE `accounts_departmenthead`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `department_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `accounts_departmenth_department_id_35df83b0_fk_course_pr`(`department_id` ASC) USING BTREE,
  CONSTRAINT `accounts_departmenth_department_id_35df83b0_fk_course_pr` FOREIGN KEY (`department_id`) REFERENCES `course_program` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accounts_departmenthead_user_id_62937520_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_departmenthead
-- ----------------------------

-- ----------------------------
-- Table structure for accounts_parent
-- ----------------------------
DROP TABLE IF EXISTS `accounts_parent`;
CREATE TABLE `accounts_parent`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `relation_ship` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  UNIQUE INDEX `student_id`(`student_id` ASC) USING BTREE,
  CONSTRAINT `accounts_parent_student_id_554fb6f9_fk_accounts_student_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accounts_parent_user_id_23ea51f7_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_parent
-- ----------------------------

-- ----------------------------
-- Table structure for accounts_student
-- ----------------------------
DROP TABLE IF EXISTS `accounts_student`;
CREATE TABLE `accounts_student`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `program_id` bigint NULL DEFAULT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_id`(`student_id` ASC) USING BTREE,
  INDEX `accounts_student_program_id_cbc959aa_fk_course_program_id`(`program_id` ASC) USING BTREE,
  CONSTRAINT `accounts_student_program_id_cbc959aa_fk_course_program_id` FOREIGN KEY (`program_id`) REFERENCES `course_program` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accounts_student_student_id_d0d56f60_fk_accounts_user_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_student
-- ----------------------------

-- ----------------------------
-- Table structure for accounts_user
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user`;
CREATE TABLE `accounts_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_student` tinyint(1) NOT NULL,
  `is_lecturer` tinyint(1) NOT NULL,
  `is_parent` tinyint(1) NOT NULL,
  `is_dep_head` tinyint(1) NOT NULL,
  `gender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `picture` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user
-- ----------------------------

-- ----------------------------
-- Table structure for accounts_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user_groups`;
CREATE TABLE `accounts_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `accounts_user_groups_user_id_group_id_59c0b32f_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `accounts_user_groups_group_id_bd11a704_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for accounts_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `accounts_user_user_permissions`;
CREATE TABLE `accounts_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `accounts_user_user_p_permission_id_113bb443_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add user dashboard module', 1, 'add_userdashboardmodule');
INSERT INTO `auth_permission` VALUES (2, 'Can change user dashboard module', 1, 'change_userdashboardmodule');
INSERT INTO `auth_permission` VALUES (3, 'Can delete user dashboard module', 1, 'delete_userdashboardmodule');
INSERT INTO `auth_permission` VALUES (4, 'Can view user dashboard module', 1, 'view_userdashboardmodule');
INSERT INTO `auth_permission` VALUES (5, 'Can add bookmark', 2, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (6, 'Can change bookmark', 2, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (7, 'Can delete bookmark', 2, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (8, 'Can view bookmark', 2, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (9, 'Can add pinned application', 3, 'add_pinnedapplication');
INSERT INTO `auth_permission` VALUES (10, 'Can change pinned application', 3, 'change_pinnedapplication');
INSERT INTO `auth_permission` VALUES (11, 'Can delete pinned application', 3, 'delete_pinnedapplication');
INSERT INTO `auth_permission` VALUES (12, 'Can view pinned application', 3, 'view_pinnedapplication');
INSERT INTO `auth_permission` VALUES (13, 'Can add log entry', 4, 'add_logentry');
INSERT INTO `auth_permission` VALUES (14, 'Can change log entry', 4, 'change_logentry');
INSERT INTO `auth_permission` VALUES (15, 'Can delete log entry', 4, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (16, 'Can view log entry', 4, 'view_logentry');
INSERT INTO `auth_permission` VALUES (17, 'Can add permission', 5, 'add_permission');
INSERT INTO `auth_permission` VALUES (18, 'Can change permission', 5, 'change_permission');
INSERT INTO `auth_permission` VALUES (19, 'Can delete permission', 5, 'delete_permission');
INSERT INTO `auth_permission` VALUES (20, 'Can view permission', 5, 'view_permission');
INSERT INTO `auth_permission` VALUES (21, 'Can add group', 6, 'add_group');
INSERT INTO `auth_permission` VALUES (22, 'Can change group', 6, 'change_group');
INSERT INTO `auth_permission` VALUES (23, 'Can delete group', 6, 'delete_group');
INSERT INTO `auth_permission` VALUES (24, 'Can view group', 6, 'view_group');
INSERT INTO `auth_permission` VALUES (25, 'Can add content type', 7, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (26, 'Can change content type', 7, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (27, 'Can delete content type', 7, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (28, 'Can view content type', 7, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (29, 'Can add session', 8, 'add_session');
INSERT INTO `auth_permission` VALUES (30, 'Can change session', 8, 'change_session');
INSERT INTO `auth_permission` VALUES (31, 'Can delete session', 8, 'delete_session');
INSERT INTO `auth_permission` VALUES (32, 'Can view session', 8, 'view_session');
INSERT INTO `auth_permission` VALUES (33, 'Can add activity log', 9, 'add_activitylog');
INSERT INTO `auth_permission` VALUES (34, 'Can change activity log', 9, 'change_activitylog');
INSERT INTO `auth_permission` VALUES (35, 'Can delete activity log', 9, 'delete_activitylog');
INSERT INTO `auth_permission` VALUES (36, 'Can view activity log', 9, 'view_activitylog');
INSERT INTO `auth_permission` VALUES (37, 'Can add news and events', 10, 'add_newsandevents');
INSERT INTO `auth_permission` VALUES (38, 'Can change news and events', 10, 'change_newsandevents');
INSERT INTO `auth_permission` VALUES (39, 'Can delete news and events', 10, 'delete_newsandevents');
INSERT INTO `auth_permission` VALUES (40, 'Can view news and events', 10, 'view_newsandevents');
INSERT INTO `auth_permission` VALUES (41, 'Can add session', 11, 'add_session');
INSERT INTO `auth_permission` VALUES (42, 'Can change session', 11, 'change_session');
INSERT INTO `auth_permission` VALUES (43, 'Can delete session', 11, 'delete_session');
INSERT INTO `auth_permission` VALUES (44, 'Can view session', 11, 'view_session');
INSERT INTO `auth_permission` VALUES (45, 'Can add semester', 12, 'add_semester');
INSERT INTO `auth_permission` VALUES (46, 'Can change semester', 12, 'change_semester');
INSERT INTO `auth_permission` VALUES (47, 'Can delete semester', 12, 'delete_semester');
INSERT INTO `auth_permission` VALUES (48, 'Can view semester', 12, 'view_semester');
INSERT INTO `auth_permission` VALUES (49, 'Can add user', 13, 'add_user');
INSERT INTO `auth_permission` VALUES (50, 'Can change user', 13, 'change_user');
INSERT INTO `auth_permission` VALUES (51, 'Can delete user', 13, 'delete_user');
INSERT INTO `auth_permission` VALUES (52, 'Can view user', 13, 'view_user');
INSERT INTO `auth_permission` VALUES (53, 'Can add department head', 14, 'add_departmenthead');
INSERT INTO `auth_permission` VALUES (54, 'Can change department head', 14, 'change_departmenthead');
INSERT INTO `auth_permission` VALUES (55, 'Can delete department head', 14, 'delete_departmenthead');
INSERT INTO `auth_permission` VALUES (56, 'Can view department head', 14, 'view_departmenthead');
INSERT INTO `auth_permission` VALUES (57, 'Can add parent', 15, 'add_parent');
INSERT INTO `auth_permission` VALUES (58, 'Can change parent', 15, 'change_parent');
INSERT INTO `auth_permission` VALUES (59, 'Can delete parent', 15, 'delete_parent');
INSERT INTO `auth_permission` VALUES (60, 'Can view parent', 15, 'view_parent');
INSERT INTO `auth_permission` VALUES (61, 'Can add student', 16, 'add_student');
INSERT INTO `auth_permission` VALUES (62, 'Can change student', 16, 'change_student');
INSERT INTO `auth_permission` VALUES (63, 'Can delete student', 16, 'delete_student');
INSERT INTO `auth_permission` VALUES (64, 'Can view student', 16, 'view_student');
INSERT INTO `auth_permission` VALUES (65, 'Can add course', 17, 'add_course');
INSERT INTO `auth_permission` VALUES (66, 'Can change course', 17, 'change_course');
INSERT INTO `auth_permission` VALUES (67, 'Can delete course', 17, 'delete_course');
INSERT INTO `auth_permission` VALUES (68, 'Can view course', 17, 'view_course');
INSERT INTO `auth_permission` VALUES (69, 'Can add program', 18, 'add_program');
INSERT INTO `auth_permission` VALUES (70, 'Can change program', 18, 'change_program');
INSERT INTO `auth_permission` VALUES (71, 'Can delete program', 18, 'delete_program');
INSERT INTO `auth_permission` VALUES (72, 'Can view program', 18, 'view_program');
INSERT INTO `auth_permission` VALUES (73, 'Can add upload video', 19, 'add_uploadvideo');
INSERT INTO `auth_permission` VALUES (74, 'Can change upload video', 19, 'change_uploadvideo');
INSERT INTO `auth_permission` VALUES (75, 'Can delete upload video', 19, 'delete_uploadvideo');
INSERT INTO `auth_permission` VALUES (76, 'Can view upload video', 19, 'view_uploadvideo');
INSERT INTO `auth_permission` VALUES (77, 'Can add upload', 20, 'add_upload');
INSERT INTO `auth_permission` VALUES (78, 'Can change upload', 20, 'change_upload');
INSERT INTO `auth_permission` VALUES (79, 'Can delete upload', 20, 'delete_upload');
INSERT INTO `auth_permission` VALUES (80, 'Can view upload', 20, 'view_upload');
INSERT INTO `auth_permission` VALUES (81, 'Can add course offer', 21, 'add_courseoffer');
INSERT INTO `auth_permission` VALUES (82, 'Can change course offer', 21, 'change_courseoffer');
INSERT INTO `auth_permission` VALUES (83, 'Can delete course offer', 21, 'delete_courseoffer');
INSERT INTO `auth_permission` VALUES (84, 'Can view course offer', 21, 'view_courseoffer');
INSERT INTO `auth_permission` VALUES (85, 'Can add course allocation', 22, 'add_courseallocation');
INSERT INTO `auth_permission` VALUES (86, 'Can change course allocation', 22, 'change_courseallocation');
INSERT INTO `auth_permission` VALUES (87, 'Can delete course allocation', 22, 'delete_courseallocation');
INSERT INTO `auth_permission` VALUES (88, 'Can view course allocation', 22, 'view_courseallocation');
INSERT INTO `auth_permission` VALUES (89, 'Can add taken course', 23, 'add_takencourse');
INSERT INTO `auth_permission` VALUES (90, 'Can change taken course', 23, 'change_takencourse');
INSERT INTO `auth_permission` VALUES (91, 'Can delete taken course', 23, 'delete_takencourse');
INSERT INTO `auth_permission` VALUES (92, 'Can view taken course', 23, 'view_takencourse');
INSERT INTO `auth_permission` VALUES (93, 'Can add result', 24, 'add_result');
INSERT INTO `auth_permission` VALUES (94, 'Can change result', 24, 'change_result');
INSERT INTO `auth_permission` VALUES (95, 'Can delete result', 24, 'delete_result');
INSERT INTO `auth_permission` VALUES (96, 'Can view result', 24, 'view_result');
INSERT INTO `auth_permission` VALUES (97, 'Can add Question', 25, 'add_question');
INSERT INTO `auth_permission` VALUES (98, 'Can change Question', 25, 'change_question');
INSERT INTO `auth_permission` VALUES (99, 'Can delete Question', 25, 'delete_question');
INSERT INTO `auth_permission` VALUES (100, 'Can view Question', 25, 'view_question');
INSERT INTO `auth_permission` VALUES (101, 'Can add Quiz', 26, 'add_quiz');
INSERT INTO `auth_permission` VALUES (102, 'Can change Quiz', 26, 'change_quiz');
INSERT INTO `auth_permission` VALUES (103, 'Can delete Quiz', 26, 'delete_quiz');
INSERT INTO `auth_permission` VALUES (104, 'Can view Quiz', 26, 'view_quiz');
INSERT INTO `auth_permission` VALUES (105, 'Can add Essay Style Question', 27, 'add_essayquestion');
INSERT INTO `auth_permission` VALUES (106, 'Can change Essay Style Question', 27, 'change_essayquestion');
INSERT INTO `auth_permission` VALUES (107, 'Can delete Essay Style Question', 27, 'delete_essayquestion');
INSERT INTO `auth_permission` VALUES (108, 'Can view Essay Style Question', 27, 'view_essayquestion');
INSERT INTO `auth_permission` VALUES (109, 'Can add Multiple Choice Question', 28, 'add_mcquestion');
INSERT INTO `auth_permission` VALUES (110, 'Can change Multiple Choice Question', 28, 'change_mcquestion');
INSERT INTO `auth_permission` VALUES (111, 'Can delete Multiple Choice Question', 28, 'delete_mcquestion');
INSERT INTO `auth_permission` VALUES (112, 'Can view Multiple Choice Question', 28, 'view_mcquestion');
INSERT INTO `auth_permission` VALUES (113, 'Can add sitting', 29, 'add_sitting');
INSERT INTO `auth_permission` VALUES (114, 'Can change sitting', 29, 'change_sitting');
INSERT INTO `auth_permission` VALUES (115, 'Can delete sitting', 29, 'delete_sitting');
INSERT INTO `auth_permission` VALUES (116, 'Can view sitting', 29, 'view_sitting');
INSERT INTO `auth_permission` VALUES (117, 'Can see completed exams.', 29, 'view_sittings');
INSERT INTO `auth_permission` VALUES (118, 'Can add User Progress', 30, 'add_progress');
INSERT INTO `auth_permission` VALUES (119, 'Can change User Progress', 30, 'change_progress');
INSERT INTO `auth_permission` VALUES (120, 'Can delete User Progress', 30, 'delete_progress');
INSERT INTO `auth_permission` VALUES (121, 'Can view User Progress', 30, 'view_progress');
INSERT INTO `auth_permission` VALUES (122, 'Can add Choice', 31, 'add_choice');
INSERT INTO `auth_permission` VALUES (123, 'Can change Choice', 31, 'change_choice');
INSERT INTO `auth_permission` VALUES (124, 'Can delete Choice', 31, 'delete_choice');
INSERT INTO `auth_permission` VALUES (125, 'Can view Choice', 31, 'view_choice');
INSERT INTO `auth_permission` VALUES (126, 'Can add invoice', 32, 'add_invoice');
INSERT INTO `auth_permission` VALUES (127, 'Can change invoice', 32, 'change_invoice');
INSERT INTO `auth_permission` VALUES (128, 'Can delete invoice', 32, 'delete_invoice');
INSERT INTO `auth_permission` VALUES (129, 'Can view invoice', 32, 'view_invoice');

-- ----------------------------
-- Table structure for core_activitylog
-- ----------------------------
DROP TABLE IF EXISTS `core_activitylog`;
CREATE TABLE `core_activitylog`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_activitylog
-- ----------------------------

-- ----------------------------
-- Table structure for core_newsandevents
-- ----------------------------
DROP TABLE IF EXISTS `core_newsandevents`;
CREATE TABLE `core_newsandevents`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `posted_as` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_date` datetime(6) NULL DEFAULT NULL,
  `upload_time` datetime(6) NULL DEFAULT NULL,
  `summary_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `summary_ru` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_en` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_ru` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `summary_es` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `summary_fr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_es` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_fr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_newsandevents
-- ----------------------------

-- ----------------------------
-- Table structure for core_semester
-- ----------------------------
DROP TABLE IF EXISTS `core_semester`;
CREATE TABLE `core_semester`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `semester` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_current_semester` tinyint(1) NULL DEFAULT NULL,
  `next_semester_begins` date NULL DEFAULT NULL,
  `session_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `core_semester_session_id_5eb6ae4a_fk_core_session_id`(`session_id` ASC) USING BTREE,
  CONSTRAINT `core_semester_session_id_5eb6ae4a_fk_core_session_id` FOREIGN KEY (`session_id`) REFERENCES `core_session` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_semester
-- ----------------------------

-- ----------------------------
-- Table structure for core_session
-- ----------------------------
DROP TABLE IF EXISTS `core_session`;
CREATE TABLE `core_session`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `session` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_current_session` tinyint(1) NULL DEFAULT NULL,
  `next_session_begins` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `session`(`session` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_session
-- ----------------------------

-- ----------------------------
-- Table structure for course_course
-- ----------------------------
DROP TABLE IF EXISTS `course_course`;
CREATE TABLE `course_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `credit` int NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `year` int NOT NULL,
  `semester` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_elective` tinyint(1) NOT NULL,
  `program_id` bigint NOT NULL,
  `summary_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `summary_ru` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_en` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_ru` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `summary_es` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `summary_fr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_es` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_fr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  UNIQUE INDEX `code`(`code` ASC) USING BTREE,
  INDEX `course_course_program_id_dda9b2de_fk_course_program_id`(`program_id` ASC) USING BTREE,
  CONSTRAINT `course_course_program_id_dda9b2de_fk_course_program_id` FOREIGN KEY (`program_id`) REFERENCES `course_program` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_course
-- ----------------------------

-- ----------------------------
-- Table structure for course_courseallocation
-- ----------------------------
DROP TABLE IF EXISTS `course_courseallocation`;
CREATE TABLE `course_courseallocation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lecturer_id` bigint NOT NULL,
  `session_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_courseallocation_lecturer_id_ae68368a_fk_accounts_user_id`(`lecturer_id` ASC) USING BTREE,
  INDEX `course_courseallocation_session_id_3101be0e_fk_core_session_id`(`session_id` ASC) USING BTREE,
  CONSTRAINT `course_courseallocation_lecturer_id_ae68368a_fk_accounts_user_id` FOREIGN KEY (`lecturer_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_courseallocation_session_id_3101be0e_fk_core_session_id` FOREIGN KEY (`session_id`) REFERENCES `core_session` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_courseallocation
-- ----------------------------

-- ----------------------------
-- Table structure for course_courseallocation_courses
-- ----------------------------
DROP TABLE IF EXISTS `course_courseallocation_courses`;
CREATE TABLE `course_courseallocation_courses`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseallocation_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `course_courseallocation__courseallocation_id_cour_fc6e91fc_uniq`(`courseallocation_id` ASC, `course_id` ASC) USING BTREE,
  INDEX `course_courseallocat_course_id_74f75d98_fk_course_co`(`course_id` ASC) USING BTREE,
  CONSTRAINT `course_courseallocat_course_id_74f75d98_fk_course_co` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_courseallocat_courseallocation_id_e203c2aa_fk_course_co` FOREIGN KEY (`courseallocation_id`) REFERENCES `course_courseallocation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_courseallocation_courses
-- ----------------------------

-- ----------------------------
-- Table structure for course_courseoffer
-- ----------------------------
DROP TABLE IF EXISTS `course_courseoffer`;
CREATE TABLE `course_courseoffer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dep_head_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_courseoffer_dep_head_id_e54ea754_fk_accounts_`(`dep_head_id` ASC) USING BTREE,
  CONSTRAINT `course_courseoffer_dep_head_id_e54ea754_fk_accounts_` FOREIGN KEY (`dep_head_id`) REFERENCES `accounts_departmenthead` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_courseoffer
-- ----------------------------

-- ----------------------------
-- Table structure for course_program
-- ----------------------------
DROP TABLE IF EXISTS `course_program`;
CREATE TABLE `course_program`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `summary_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `summary_ru` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_en` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_ru` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `summary_es` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `summary_fr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_es` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_fr` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title` ASC) USING BTREE,
  UNIQUE INDEX `title_en`(`title_en` ASC) USING BTREE,
  UNIQUE INDEX `title_ru`(`title_ru` ASC) USING BTREE,
  UNIQUE INDEX `title_es`(`title_es` ASC) USING BTREE,
  UNIQUE INDEX `title_fr`(`title_fr` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_program
-- ----------------------------

-- ----------------------------
-- Table structure for course_upload
-- ----------------------------
DROP TABLE IF EXISTS `course_upload`;
CREATE TABLE `course_upload`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `course_id` bigint NOT NULL,
  `title_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_ru` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_es` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_fr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_upload_course_id_624ff4d6_fk_course_course_id`(`course_id` ASC) USING BTREE,
  CONSTRAINT `course_upload_course_id_624ff4d6_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_upload
-- ----------------------------

-- ----------------------------
-- Table structure for course_uploadvideo
-- ----------------------------
DROP TABLE IF EXISTS `course_uploadvideo`;
CREATE TABLE `course_uploadvideo`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `video` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `course_id` bigint NOT NULL,
  `summary_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `summary_ru` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_ru` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `summary_es` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `summary_fr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_es` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_fr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  INDEX `course_uploadvideo_course_id_0725e558_fk_course_course_id`(`course_id` ASC) USING BTREE,
  CONSTRAINT `course_uploadvideo_course_id_0725e558_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_uploadvideo
-- ----------------------------

-- ----------------------------
-- Table structure for dashboard_userdashboardmodule
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_userdashboardmodule`;
CREATE TABLE `dashboard_userdashboardmodule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `column` int UNSIGNED NOT NULL,
  `order` int NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `children` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dashboard_userdashboardmodule_user_id_97c13132`(`user_id` ASC) USING BTREE,
  CONSTRAINT `dashboard_userdashbo_user_id_97c13132_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dashboard_userdashboardmodule
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_accounts_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (14, 'accounts', 'departmenthead');
INSERT INTO `django_content_type` VALUES (15, 'accounts', 'parent');
INSERT INTO `django_content_type` VALUES (16, 'accounts', 'student');
INSERT INTO `django_content_type` VALUES (13, 'accounts', 'user');
INSERT INTO `django_content_type` VALUES (4, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (6, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (5, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'core', 'activitylog');
INSERT INTO `django_content_type` VALUES (10, 'core', 'newsandevents');
INSERT INTO `django_content_type` VALUES (12, 'core', 'semester');
INSERT INTO `django_content_type` VALUES (11, 'core', 'session');
INSERT INTO `django_content_type` VALUES (17, 'course', 'course');
INSERT INTO `django_content_type` VALUES (22, 'course', 'courseallocation');
INSERT INTO `django_content_type` VALUES (21, 'course', 'courseoffer');
INSERT INTO `django_content_type` VALUES (18, 'course', 'program');
INSERT INTO `django_content_type` VALUES (20, 'course', 'upload');
INSERT INTO `django_content_type` VALUES (19, 'course', 'uploadvideo');
INSERT INTO `django_content_type` VALUES (1, 'dashboard', 'userdashboardmodule');
INSERT INTO `django_content_type` VALUES (2, 'jet', 'bookmark');
INSERT INTO `django_content_type` VALUES (3, 'jet', 'pinnedapplication');
INSERT INTO `django_content_type` VALUES (32, 'payments', 'invoice');
INSERT INTO `django_content_type` VALUES (31, 'quiz', 'choice');
INSERT INTO `django_content_type` VALUES (27, 'quiz', 'essayquestion');
INSERT INTO `django_content_type` VALUES (28, 'quiz', 'mcquestion');
INSERT INTO `django_content_type` VALUES (30, 'quiz', 'progress');
INSERT INTO `django_content_type` VALUES (25, 'quiz', 'question');
INSERT INTO `django_content_type` VALUES (26, 'quiz', 'quiz');
INSERT INTO `django_content_type` VALUES (29, 'quiz', 'sitting');
INSERT INTO `django_content_type` VALUES (24, 'result', 'result');
INSERT INTO `django_content_type` VALUES (23, 'result', 'takencourse');
INSERT INTO `django_content_type` VALUES (8, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'core', '0001_initial', '2025-01-24 08:09:17.090052');
INSERT INTO `django_migrations` VALUES (2, 'accounts', '0001_initial', '2025-01-24 08:09:17.155485');
INSERT INTO `django_migrations` VALUES (3, 'course', '0001_initial', '2025-01-24 08:09:17.546359');
INSERT INTO `django_migrations` VALUES (4, 'contenttypes', '0001_initial', '2025-01-24 08:09:17.572059');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2025-01-24 08:09:17.634361');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0001_initial', '2025-01-24 08:09:17.788281');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2025-01-24 08:09:17.828666');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2025-01-24 08:09:17.839185');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2025-01-24 08:09:17.847481');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2025-01-24 08:09:17.855489');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2025-01-24 08:09:17.860288');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2025-01-24 08:09:17.868487');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2025-01-24 08:09:17.876858');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2025-01-24 08:09:17.884352');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2025-01-24 08:09:17.894635');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2025-01-24 08:09:17.909153');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2025-01-24 08:09:17.917294');
INSERT INTO `django_migrations` VALUES (18, 'accounts', '0002_initial', '2025-01-24 08:09:18.450233');
INSERT INTO `django_migrations` VALUES (19, 'admin', '0001_initial', '2025-01-24 08:09:18.525184');
INSERT INTO `django_migrations` VALUES (20, 'admin', '0002_logentry_remove_auto_add', '2025-01-24 08:09:18.538150');
INSERT INTO `django_migrations` VALUES (21, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-24 08:09:18.552113');
INSERT INTO `django_migrations` VALUES (22, 'core', '0002_newsandevents_summary_en_newsandevents_summary_ru_and_more', '2025-01-24 08:09:18.576050');
INSERT INTO `django_migrations` VALUES (23, 'core', '0003_newsandevents_summary_es_newsandevents_summary_fr_and_more', '2025-01-24 08:09:18.600981');
INSERT INTO `django_migrations` VALUES (24, 'course', '0002_course_summary_en_course_summary_ru_course_title_en_and_more', '2025-01-24 08:09:18.758150');
INSERT INTO `django_migrations` VALUES (25, 'course', '0003_course_summary_es_course_summary_fr_course_title_es_and_more', '2025-01-24 08:09:18.928170');
INSERT INTO `django_migrations` VALUES (26, 'course', '0004_alter_course_code_alter_course_credit_and_more', '2025-01-24 08:09:19.420932');
INSERT INTO `django_migrations` VALUES (27, 'dashboard', '0001_initial', '2025-01-24 08:09:19.432381');
INSERT INTO `django_migrations` VALUES (28, 'dashboard', '0002_auto_20201228_1929', '2025-01-24 08:09:20.008219');
INSERT INTO `django_migrations` VALUES (29, 'jet', '0001_initial', '2025-01-24 08:09:20.148276');
INSERT INTO `django_migrations` VALUES (30, 'jet', '0002_delete_userdashboardmodule', '2025-01-24 08:09:20.150271');
INSERT INTO `django_migrations` VALUES (31, 'jet', '0003_auto_20201228_1540', '2025-01-24 08:09:20.153263');
INSERT INTO `django_migrations` VALUES (32, 'jet', '0004_auto_20201228_1802', '2025-01-24 08:09:20.156254');
INSERT INTO `django_migrations` VALUES (33, 'payments', '0001_initial', '2025-01-24 08:09:20.211679');
INSERT INTO `django_migrations` VALUES (34, 'quiz', '0001_initial', '2025-01-24 08:09:20.699522');
INSERT INTO `django_migrations` VALUES (35, 'quiz', '0002_choice_choice_en_choice_choice_ru_and_more', '2025-01-24 08:09:20.798397');
INSERT INTO `django_migrations` VALUES (36, 'quiz', '0003_choice_choice_es_choice_choice_fr_and_more', '2025-01-24 08:09:20.900376');
INSERT INTO `django_migrations` VALUES (37, 'quiz', '0004_alter_essayquestion_options_and_more', '2025-01-24 08:09:21.527593');
INSERT INTO `django_migrations` VALUES (38, 'result', '0001_initial', '2025-01-24 08:09:21.685317');
INSERT INTO `django_migrations` VALUES (39, 'result', '0002_alter_result_level_alter_takencourse_comment_and_more', '2025-01-24 08:09:21.733671');
INSERT INTO `django_migrations` VALUES (40, 'sessions', '0001_initial', '2025-01-24 08:09:21.759477');
INSERT INTO `django_migrations` VALUES (41, 'jet', '0001_squashed_0004_auto_20201228_1802', '2025-01-24 08:09:21.764704');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for jet_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `jet_bookmark`;
CREATE TABLE `jet_bookmark`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `date_add` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jet_bookmark_user_id_8efdc332_fk_accounts_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `jet_bookmark_user_id_8efdc332_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jet_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for jet_pinnedapplication
-- ----------------------------
DROP TABLE IF EXISTS `jet_pinnedapplication`;
CREATE TABLE `jet_pinnedapplication`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `date_add` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jet_pinnedapplication_user_id_7765bcf9_fk_accounts_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `jet_pinnedapplication_user_id_7765bcf9_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jet_pinnedapplication
-- ----------------------------

-- ----------------------------
-- Table structure for payments_invoice
-- ----------------------------
DROP TABLE IF EXISTS `payments_invoice`;
CREATE TABLE `payments_invoice`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` double NULL DEFAULT NULL,
  `amount` double NULL DEFAULT NULL,
  `payment_complete` tinyint(1) NOT NULL,
  `invoice_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `payments_invoice_user_id_2f564088_fk_accounts_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `payments_invoice_user_id_2f564088_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payments_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_choice
-- ----------------------------
DROP TABLE IF EXISTS `quiz_choice`;
CREATE TABLE `quiz_choice`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `question_id` bigint NOT NULL,
  `choice_text_en` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `choice_text_ru` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `choice_text_es` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `choice_text_fr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `quiz_choice_question_id_6297ad3f_fk_quiz_mcqu`(`question_id` ASC) USING BTREE,
  CONSTRAINT `quiz_choice_question_id_6297ad3f_fk_quiz_mcqu` FOREIGN KEY (`question_id`) REFERENCES `quiz_mcquestion` (`question_ptr_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_choice
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_essayquestion
-- ----------------------------
DROP TABLE IF EXISTS `quiz_essayquestion`;
CREATE TABLE `quiz_essayquestion`  (
  `question_ptr_id` bigint NOT NULL,
  PRIMARY KEY (`question_ptr_id`) USING BTREE,
  CONSTRAINT `quiz_essayquestion_question_ptr_id_11ba056e_fk_quiz_question_id` FOREIGN KEY (`question_ptr_id`) REFERENCES `quiz_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_essayquestion
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_mcquestion
-- ----------------------------
DROP TABLE IF EXISTS `quiz_mcquestion`;
CREATE TABLE `quiz_mcquestion`  (
  `question_ptr_id` bigint NOT NULL,
  `choice_order` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`question_ptr_id`) USING BTREE,
  CONSTRAINT `quiz_mcquestion_question_ptr_id_7b24b73b_fk_quiz_question_id` FOREIGN KEY (`question_ptr_id`) REFERENCES `quiz_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_mcquestion
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_progress
-- ----------------------------
DROP TABLE IF EXISTS `quiz_progress`;
CREATE TABLE `quiz_progress`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `quiz_progress_user_id_af390dea_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_progress
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_question
-- ----------------------------
DROP TABLE IF EXISTS `quiz_question`;
CREATE TABLE `quiz_question`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `figure` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `explanation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_en` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content_ru` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `explanation_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `explanation_ru` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `content_es` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content_fr` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `explanation_es` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `explanation_fr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_question
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_question_quiz
-- ----------------------------
DROP TABLE IF EXISTS `quiz_question_quiz`;
CREATE TABLE `quiz_question_quiz`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_id` bigint NOT NULL,
  `quiz_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `quiz_question_quiz_question_id_quiz_id_3414207a_uniq`(`question_id` ASC, `quiz_id` ASC) USING BTREE,
  INDEX `quiz_question_quiz_quiz_id_eccb418d_fk_quiz_quiz_id`(`quiz_id` ASC) USING BTREE,
  CONSTRAINT `quiz_question_quiz_question_id_2b2637b3_fk_quiz_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `quiz_question_quiz_quiz_id_eccb418d_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_question_quiz
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_quiz
-- ----------------------------
DROP TABLE IF EXISTS `quiz_quiz`;
CREATE TABLE `quiz_quiz`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `random_order` tinyint(1) NOT NULL,
  `answers_at_end` tinyint(1) NOT NULL,
  `exam_paper` tinyint(1) NOT NULL,
  `single_attempt` tinyint(1) NOT NULL,
  `pass_mark` smallint NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `course_id` bigint NOT NULL,
  `description_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description_ru` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_en` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_ru` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description_es` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description_fr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `title_es` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_fr` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  INDEX `quiz_quiz_course_id_dd25aae3_fk_course_course_id`(`course_id` ASC) USING BTREE,
  CONSTRAINT `quiz_quiz_course_id_dd25aae3_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_quiz
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_sitting
-- ----------------------------
DROP TABLE IF EXISTS `quiz_sitting`;
CREATE TABLE `quiz_sitting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_order` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `question_list` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `incorrect_questions` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `current_score` int NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `user_answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start` datetime(6) NOT NULL,
  `end` datetime(6) NULL DEFAULT NULL,
  `course_id` bigint NOT NULL,
  `quiz_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `quiz_sitting_quiz_id_a3187627_fk_quiz_quiz_id`(`quiz_id` ASC) USING BTREE,
  INDEX `quiz_sitting_user_id_cfb694f3_fk_accounts_user_id`(`user_id` ASC) USING BTREE,
  INDEX `quiz_sitting_course_id_72b033f6_fk_course_course_id`(`course_id` ASC) USING BTREE,
  CONSTRAINT `quiz_sitting_course_id_72b033f6_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `quiz_sitting_quiz_id_a3187627_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `quiz_sitting_user_id_cfb694f3_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quiz_sitting
-- ----------------------------

-- ----------------------------
-- Table structure for result_result
-- ----------------------------
DROP TABLE IF EXISTS `result_result`;
CREATE TABLE `result_result`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gpa` double NULL DEFAULT NULL,
  `cgpa` double NULL DEFAULT NULL,
  `semester` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `result_result_student_id_59df1edd_fk_accounts_student_id`(`student_id` ASC) USING BTREE,
  CONSTRAINT `result_result_student_id_59df1edd_fk_accounts_student_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of result_result
-- ----------------------------

-- ----------------------------
-- Table structure for result_takencourse
-- ----------------------------
DROP TABLE IF EXISTS `result_takencourse`;
CREATE TABLE `result_takencourse`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignment` decimal(5, 2) NOT NULL,
  `mid_exam` decimal(5, 2) NOT NULL,
  `quiz` decimal(5, 2) NOT NULL,
  `attendance` decimal(5, 2) NOT NULL,
  `final_exam` decimal(5, 2) NOT NULL,
  `total` decimal(5, 2) NOT NULL,
  `grade` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `point` decimal(5, 2) NOT NULL,
  `comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `result_takencourse_course_id_56fd5eb6_fk_course_course_id`(`course_id` ASC) USING BTREE,
  INDEX `result_takencourse_student_id_c971277a_fk_accounts_student_id`(`student_id` ASC) USING BTREE,
  CONSTRAINT `result_takencourse_course_id_56fd5eb6_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `result_takencourse_student_id_c971277a_fk_accounts_student_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of result_takencourse
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
