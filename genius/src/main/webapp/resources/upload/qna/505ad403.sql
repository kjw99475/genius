-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.17-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- genius 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `genius` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `genius`;

-- 테이블 genius.tbl_bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_bbs` (
  `bbs_idx` int(11) NOT NULL AUTO_INCREMENT,
  `bbs_title` varchar(255) DEFAULT NULL,
  `category_code` varchar(50) NOT NULL,
  `member_id` varchar(50) DEFAULT NULL,
  `fileYN` varchar(3) DEFAULT NULL,
  `bbs_contents` text DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `read_cnt` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`bbs_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_bbs:~7 rows (대략적) 내보내기
INSERT INTO `tbl_bbs` (`bbs_idx`, `bbs_title`, `category_code`, `member_id`, `fileYN`, `bbs_contents`, `reg_date`, `read_cnt`, `modify_date`) VALUES
	(1, '자료실 제목1입니다.', 'bc01', 'test', 'N', '자료실 내용1입니다.', '2024-04-25 16:43:01', 1, NULL),
	(2, '자료실 제목2입니다.', 'bc02', 'test', 'N', '자료실 내용2입니다.', '2024-04-25 16:43:51', 1, NULL),
	(3, '테스트 제목', 'bc01', '홍길동', 'N', '테서터 내용', '2024-04-28 15:02:52', 0, NULL),
	(4, '제목수정테스트', 'bc01', '홍길동', 'N', '내용수정테스트', '2024-04-29 00:00:00', 0, NULL),
	(6, '제목임', 'bbs', '작성자임', NULL, '내용임', '2024-04-28 15:26:27', 0, NULL),
	(7, '테스트 제목ㅍㅇㄴ', 'bc01', '홍길동', NULL, '테서터 내용', '2024-04-28 00:00:00', 0, NULL),
	(9, '삭제용', 'bbs', '삭', NULL, '제제', '2024-04-12 00:00:00', 0, NULL);

-- 테이블 genius.tbl_bbs_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_bbs_category` (
  `category_code` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_bbs_category:~3 rows (대략적) 내보내기
INSERT INTO `tbl_bbs_category` (`category_code`, `name`) VALUES
	('bc01', 'bbs'),
	('bc02', 'qna'),
	('bc03', 'faq');

-- 테이블 genius.tbl_bbs_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_bbs_file` (
  `file_idx` int(11) NOT NULL AUTO_INCREMENT,
  `bbs_idx` int(11) DEFAULT NULL,
  `save_name` varchar(255) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`file_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_bbs_file:~0 rows (대략적) 내보내기

-- 테이블 genius.tbl_book 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_book` (
  `book_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_code` varchar(50) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `category_class_code` varchar(50) NOT NULL,
  `category_subject_code` varchar(50) NOT NULL,
  `sales_start_date` date DEFAULT NULL,
  `sales_end_date` date DEFAULT NULL,
  `sales_status` varchar(50) DEFAULT NULL COMMENT '1:판매중, 2:판매준비중, 3:판매종료, 4:품절',
  `book_img` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) NOT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `discount_per` int(11) DEFAULT NULL,
  `book_info` text NOT NULL,
  `rank_avg` decimal(3,1) DEFAULT 0.0,
  `video` varchar(255) DEFAULT NULL,
  `isbn` varchar(20) NOT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `contents` text NOT NULL,
  `publication_date` date NOT NULL,
  PRIMARY KEY (`book_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_book:~8 rows (대략적) 내보내기
INSERT INTO `tbl_book` (`book_idx`, `book_code`, `book_name`, `author`, `price`, `quantity`, `category_class_code`, `category_subject_code`, `sales_start_date`, `sales_end_date`, `sales_status`, `book_img`, `publisher`, `discount_price`, `discount_per`, `book_info`, `rank_avg`, `video`, `isbn`, `tags`, `contents`, `publication_date`) VALUES
	(1, 'b0001', '초등 수학1', '교육부', 111, 0, 'c01', 's03', NULL, NULL, '1', '/resources/img/category/sample.jpg', '천재교과서', 3400, 0, '문제와 문제 사이의 연결고리, 연습과 실전 사이의 징검다리 그동안 설맞이팀이 출제했던 모든 문항에, 최신 경향을 고려한 신규문항이 추가된 110문항 수록 단순히 문제만 모아 두는 것을 넘어, 수학 학습에 도움이 되도록 설계된 든든한 길잡이', 4.9, '/resources/video/welcomeboard%20(2).mp4', '9791156149637', '수학, 초등', '수학을 만나요| 9까지의 수|여러 가지 모양|덧셈과 뺄셈|비교하기|50까지의 수|수학이랑 함께해요', '2024-02-15'),
	(2, 'b0002', '초등 수학익힘1', '교육부', 2130, 12, 'c01', 's03', NULL, NULL, '2', 'https://mall.chunjaetext.co.kr/web/product/small/202402/c92bb75807729444600df21b9257ccf9.jpg', '천재교과서', 3300, NULL, '천재교과서에서 출판한 초등수학익힘1 입니다.', 0.0, NULL, '	9791156149644', '수학, 초등', '1. 9까지의 수|2. 여러 가지 모양|3. 덧셈과 뺄셈|4. 비교하기|5. 50까지의 수', '2024-02-15'),
	(3, 'b0003', '초등 사회3', '박용조', 7650, 1212, 'c03', 's04', NULL, NULL, '4', 'https://mall.chunjaetext.co.kr/web/product/small/202202/c83c028c1a65b3e3df71c62b2ef96681.jpg', '천재교과서', 3200, NULL, '천재교과서에서 출판한 초등 사회3 입니다.', 0.0, NULL, '9791156144540', '사회, 초등', '1. 우리 고장의 모습|1-1 우리가 생각하는 고장의 모습|1-2 실제로 본 우리 고장의 모습|단원 정리하기|2. 우리가 알아보는 고장 이야기|2-1 우리 고장의 옛이야기|단원 정리하기|3. 교통과 통신수단의 변화|3-1 교통수단의 발달과 생활 모습의 변화|3-2 통신수단의 발달과 생활 모습의 변화|단원 정리하기', '2024-02-13'),
	(4, 'b0004', '초등 과학3', '이상원', 7230, 11, 'c03', 's07', NULL, NULL, '1', 'https://mall.chunjaetext.co.kr/web/product/small/202202/ebf8677ce645d66fbe5b0f34494dbac4.jpg', '천재교과서', 3100, NULL, '천재교과서에서 출판한 초등 과학3 입니다.', 0.0, NULL, '9791156144427', '과학, 초등', '1. 탐구야, 만나서 반가워!|1-1어떻게 관찰할까요?|1-2어떻게 측정할까요?|1-3어떻게 분류할까요?|1-4어떻게 예상할까요?|1-5어떻게 추리할까요?|1-6어떻게 의사소통할까요?|2. 물질의 성질|2-1탐정이 되어 물체를 알아맞혀 볼까요?|2-2여러 가지 물체를 이루는 재료|2-3여러 가지 물질의 성질|2-4생활에서 이용되는 물질의 성질|2-5같은 물체를 다른 물질로 만드는 까닭|2-6서로 다른 물질을 섞을 때의 변화|3. 여러 가지 곤충의 한살이|3-1알을 낳는 동물의 한살이|3-2새끼를 낳는 동물의 한살이|4. 자석의 이용|4-1쇠붙이가 붙는 섬의 비밀은 무엇일까요?|4-2자석에 붙는 물체|4-3자석과 철의 만남|4-5자석에서 철이 많이 붙는 부분|4-6자석이 가리키는 방향|5. 지구의 모습|5-1지구의 모양|5-2지구 표면의 모습|5-3지구의 육지와 바다|5-4소중한 공기|5-5달의 모양과 표면 모습', '2024-01-25'),
	(5, 'b0005', '초등 음악4', '양종모', 3980, 14, 'c04', 's12', NULL, NULL, '4', 'https://mall.chunjaetext.co.kr/web/product/small/20200417/2998e02520fa7ec4f017c68eaa9a704a.jpg', '천재교과서', 3000, NULL, '천재교과서에서 출판한 초등 음악4 입니다.', 0.0, NULL, '9791156141570', '음악, 초등', '1. 즐겁게 노래해요|1-1즐거운노래|1-2재미있는 노랫말|1-3가락의 움직임|1-4흥겨운 장단|2. 두근두근 리듬을 알아봐요|2-1음의 길고 짧음|2-2장단의 세|2-3강약약 3박자|2-4신나는 사물놀이|2-5마음을 담은 노래|3. 음악과 친구 해요|3-1장단꼴 바꾸기|3-2가락 악기 연주|3-3소리의 어울림|3-4가락의 멋, 시김새|4. 음악을 생활화해요|4-1스스로 연주하기|4-2덩실덩실 노래와 춤|4-3음악에서 만나는 사람들|4-4신명 나는 국악 합주|4-5느낌을 담은 노랫말|5. 아름다운 음악을 만들어요|5-1노래의 형식|5-2음악의 분위기|5-3노래로 듣는 옛이야기|5-4주변의 소리|5-5장단의 한배', '2024-01-16'),
	(6, 'b0006', '초등 체육4', '박명기', 4160, 31, 'c04', 's08', NULL, NULL, '1', 'https://mall.chunjaetext.co.kr/web/product/small/20200417/5dff2644e0a35678e4bbbdac22c2185d.jpg', '천재교과서', 2900, NULL, '천재교과서에서 출판한 초등 체육4 입니다.', 0.0, NULL, '9791156141679', '체육, 초등', '1. 건강|1-1건강 쑥쑥, 건강한 여가 생활|1-2힘 쑥쑥, 체역 운동 방법|2. 도전|2-1부드럽게 떼굴떼굴, 매트 운동|2-2우아하게 사뿐사뿐, 평균대 운동|2-3힘차게 폴짝폴짝, 뜀틀 운동|3. 경쟁|3-1손으로 통통, 농구형 게임|3-2발로 팡팡, 축구형 게임|3-3채로 톡톡, 하키형 게임|4. 표현|4-1쿵쿵따라, 신체 리듬 표현|4-2빙그르르, 도구 리듬 표현|5. 안전|5-1안전하고 바르게, 운동 장비 안전|5-2재미있고 조심스럽게, 게임 활동 안전', '2024-01-17'),
	(16, 'b0008', '초등 수학1', '교육부', 3400, 0, 'c01', 's03', NULL, NULL, '1', '/resources/img/category/sample.jpg', '천재교과서', 3400, 0, '문제와 문제 사이의 연결고리, 연습과 실전 사이의 징검다리 그동안 설맞이팀이 출제했던 모든 문항에, 최신 경향을 고려한 신규문항이 추가된 110문항 수록 단순히 문제만 모아 두는 것을 넘어, 수학 학습에 도움이 되도록 설계된 든든한 길잡이', 0.0, '/resources/video/welcomeboard%20(2).mp4', '10', NULL, '수학을 만나요| 9까지의 수|여러 가지 모양|덧셈과 뺄셈|비교하기|50까지의 수|수학이랑 함께해요', '2024-02-15'),
	(17, 'b0015', '초등 수학1', '교육부', 2000, 0, 'c01', 's03', NULL, NULL, '1', '/resources/img/category/sample.jpg', '천재교과서', 3400, 0, '문제와 문제 사이의 연결고리, 연습과 실전 사이의 징검다리 그동안 설맞이팀이 출제했던 모든 문항에, 최신 경향을 고려한 신규문항이 추가된 110문항 수록 단순히 문제만 모아 두는 것을 넘어, 수학 학습에 도움이 되도록 설계된 든든한 길잡이', 0.0, '/resources/video/welcomeboard%20(2).mp4', '15151515', NULL, '수학을 만나요| 9까지의 수|여러 가지 모양|덧셈과 뺄셈|비교하기|50까지의 수|수학이랑 함께해요', '2024-02-15');

-- 테이블 genius.tbl_book_img 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_book_img` (
  `book_img_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_code` varchar(50) DEFAULT NULL,
  `save_name` varchar(255) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`book_img_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_book_img:~0 rows (대략적) 내보내기

-- 테이블 genius.tbl_cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cart_idx` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `book_code` varchar(50) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `reg_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`cart_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_cart:~8 rows (대략적) 내보내기
INSERT INTO `tbl_cart` (`cart_idx`, `member_id`, `book_code`, `quantity`, `reg_date`) VALUES
	(2, 'test', 'b0002', 2, '2024-04-25 16:41:49'),
	(4, 'test', 'b0001', 2, '2024-04-28 15:31:21'),
	(5, 'test', 'b0003', 3, '2024-04-28 15:31:21'),
	(6, 'test', 'b0005', 1, '2024-04-28 15:46:59'),
	(7, 'test', 'b0006', 1, '2024-04-28 15:46:59'),
	(8, 'test1', 'b0002', 2, '2024-04-28 16:05:58'),
	(9, 'test1', 'b0001', 2, '2024-04-28 16:05:58'),
	(10, 'test1', 'b0003', 1, '2024-04-28 16:05:58');

-- 테이블 genius.tbl_class_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_class_category` (
  `category_code` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_class_category:~12 rows (대략적) 내보내기
INSERT INTO `tbl_class_category` (`category_code`, `name`) VALUES
	('c01', '초등 1학년'),
	('c02', '초등 2학년'),
	('c03', '초등 3학년'),
	('c04', '초등 4학년'),
	('c05', '초등 5학년'),
	('c06', '초등 6학년'),
	('c07', '중등 1학년'),
	('c08', '중등 2학년'),
	('c09', '중등 3학년'),
	('c10', '고등 1학년'),
	('c11', '고등 2학년'),
	('c12', '고등 3학년');

-- 테이블 genius.tbl_delivery 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_delivery` (
  `delivery_idx` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) NOT NULL,
  `member_id` varchar(50) NOT NULL,
  `total_price` int(11) NOT NULL,
  `delivery_code` varchar(50) NOT NULL,
  `delivery_start_date` datetime DEFAULT NULL,
  `delivery_end_date` datetime DEFAULT NULL,
  `delivery_addr1` varchar(50) NOT NULL,
  `delivery_addr2` varchar(50) NOT NULL,
  `delivery_state` varchar(3) DEFAULT NULL,
  `delivery_company` varchar(50) NOT NULL,
  PRIMARY KEY (`delivery_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_delivery:~1 rows (대략적) 내보내기
INSERT INTO `tbl_delivery` (`delivery_idx`, `order_num`, `member_id`, `total_price`, `delivery_code`, `delivery_start_date`, `delivery_end_date`, `delivery_addr1`, `delivery_addr2`, `delivery_state`, `delivery_company`) VALUES
	(1, 'o00001', 'test', 5530, 'd000001', NULL, NULL, '서울시 중랑구', '테스트주소', NULL, '우체국 택배');

-- 테이블 genius.tbl_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_member` (
  `member_idx` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `member_name` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `addr1` varchar(255) NOT NULL,
  `addr2` varchar(255) NOT NULL,
  `point` int(11) DEFAULT 0,
  `profile` varchar(255) DEFAULT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  `admin_YN` varchar(2) DEFAULT 'N',
  `modify_date` datetime DEFAULT NULL,
  `leave_date` datetime DEFAULT NULL,
  `status` varchar(2) DEFAULT 'Y',
  `terms1` varchar(2) DEFAULT NULL,
  `terms2` varchar(2) DEFAULT NULL,
  `terms3` varchar(2) DEFAULT NULL,
  `terms4` varchar(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_member:~7 rows (대략적) 내보내기
INSERT INTO `tbl_member` (`member_idx`, `member_id`, `member_name`, `pwd`, `birthday`, `phone`, `gender`, `zip_code`, `addr1`, `addr2`, `point`, `profile`, `reg_date`, `admin_YN`, `modify_date`, `leave_date`, `status`, `terms1`, `terms2`, `terms3`, `terms4`, `email`) VALUES
	(1, 'test', '테스트', '1234', '1996-04-25', '0106298567', '남', '683-111', '서울시 중랑구', '테스트주소', 6400, NULL, '2024-04-25 16:06:29', 'N', NULL, '0000-00-00 00:00:00', 'Y', 'Y', 'Y', 'Y', 'Y', 'test@naver.com'),
	(2, 'test1', '테스트', '1234', '1998-06-17', '01043734547', '남', '683-111', '서울시 중랑구', '테스트주소', 0, NULL, '2024-04-26 15:21:15', 'N', NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'test1@naver.com'),
	(3, 'test2', '테스트3', '1234', '2024-04-26', '01044444444', '남', '683-111', '서울시 중랑구', '테스트주소', 0, NULL, '2024-04-26 15:22:01', 'N', NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'test2@naver.com'),
	(4, 'admin', '관리자', '1234', '2024-04-27', '01012341234', '여', '111-111', '서울시 동작구', '신대방 최고', 100000, NULL, '2024-04-27 22:23:51', 'Y', NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', NULL),
	(5, 'gee1', '장지현', '123456', '2024-04-02', '01084676191', '여', '08511', '서울 금천구 디지털로 185', '11층 5강의실', 0, 'test.png', '2024-04-28 01:06:03', 'N', NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'wkdwl578@naver.com'),
	(6, 'gee2', '장지현2', '1234', '2024-03-31', '01011112222', '남', '07067', '서울 동작구 대림로 2', '신대방역', 0, NULL, '2024-04-28 01:07:49', 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'N', NULL),
	(7, 'mong1', '몽구리', '1234', '2024-01-10', '01012341234', '여', '07574', '서울 강서구 양천로 442', '아무데나', 0, NULL, '2024-04-28 01:15:18', 'N', NULL, NULL, 'Y', 'Y', 'Y', 'N', 'N', NULL);

-- 테이블 genius.tbl_member_profile 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_member_profile` (
  `member_profile_idx` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `save_name` varchar(255) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_profile_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_member_profile:~0 rows (대략적) 내보내기

-- 테이블 genius.tbl_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `order_idx` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) NOT NULL,
  `member_id` varchar(50) NOT NULL,
  `order_date` datetime NOT NULL,
  `cancel_YN` varchar(3) DEFAULT 'N',
  `cancel_date` datetime DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `order_state` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`order_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_order:~1 rows (대략적) 내보내기
INSERT INTO `tbl_order` (`order_idx`, `order_num`, `member_id`, `order_date`, `cancel_YN`, `cancel_date`, `total_price`, `order_state`) VALUES
	(1, 'o00001', 'test', '2024-04-22 16:19:36', 'Y', '2024-04-27 16:43:56', 5530, 'Y');

-- 테이블 genius.tbl_orderdetail 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_orderdetail` (
  `orderdetail_idx` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) NOT NULL,
  `book_code` varchar(50) NOT NULL,
  `category_class_code` varchar(50) NOT NULL,
  `category_subject_code` varchar(50) NOT NULL,
  `order_state` varchar(3) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderdetail_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_orderdetail:~2 rows (대략적) 내보내기
INSERT INTO `tbl_orderdetail` (`orderdetail_idx`, `order_num`, `book_code`, `category_class_code`, `category_subject_code`, `order_state`, `order_date`, `price`, `total_price`, `amount`) VALUES
	(1, 'o00001', 'b0001', 'c01', 's03', 'Y', '2024-04-22 16:19:36', 3400, 5530, 1),
	(2, 'o00001', 'b0002', 'c01', 's03', 'Y', '2024-04-22 16:19:36', 2130, 5530, 1);

-- 테이블 genius.tbl_payment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_payment` (
  `payment_idx` int(11) NOT NULL AUTO_INCREMENT,
  `payment_num` varchar(50) NOT NULL,
  `member_id` varchar(50) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `use_type` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_payment:~6 rows (대략적) 내보내기
INSERT INTO `tbl_payment` (`payment_idx`, `payment_num`, `member_id`, `price`, `method`, `company`, `reg_date`, `use_type`, `title`) VALUES
	(1, 'p000001', 'test', 5530, '계좌이체', 'toss', '2024-04-28 14:11:03', '충전', '포인트 충전'),
	(2, '175-191773', 'test', 100, 'point', 'html5_inicis', '2024-04-28 14:11:03', '충전', '포인트 충전'),
	(3, '445-768636', 'test', 100, 'point', 'html5_inicis', '2024-04-28 14:11:03', '충전', '포인트 충전'),
	(4, '699-864107', 'test', 100, 'point', 'html5_inicis', '2024-04-28 14:37:47', '충전', '포인트 충전'),
	(5, '770-92355', 'test', 500, 'point', 'html5_inicis', '2024-04-28 14:58:52', '충전', '포인트 충전'),
	(6, '152-629983', 'test', 100, 'point', 'html5_inicis', '2024-04-28 15:04:15', '충전', '포인트 충전');

-- 테이블 genius.tbl_qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_qna` (
  `qna_idx` int(11) NOT NULL AUTO_INCREMENT,
  `reg_date` datetime DEFAULT current_timestamp(),
  `modify_date` datetime DEFAULT NULL,
  `ref_idx` int(11) DEFAULT NULL,
  `category_code` varchar(50) DEFAULT NULL,
  `answerYN` varchar(10) DEFAULT 'N',
  `title` text NOT NULL,
  `read_cnt` int(11) DEFAULT 0,
  `contents` text NOT NULL,
  `member_id` varchar(50) NOT NULL,
  PRIMARY KEY (`qna_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_qna:~7 rows (대략적) 내보내기
INSERT INTO `tbl_qna` (`qna_idx`, `reg_date`, `modify_date`, `ref_idx`, `category_code`, `answerYN`, `title`, `read_cnt`, `contents`, `member_id`) VALUES
	(1, '2024-04-25 16:37:50', NULL, 1, 'bc02', 'N', '질문 제목입니다.', 0, '질문 내용입니다.', 'test'),
	(2, '2024-04-28 23:17:12', NULL, 1, NULL, 'Y', '답변 제목입니다.', 0, '답변 내용입니다.', 'admin'),
	(3, '2024-04-28 23:27:49', NULL, 3, NULL, 'N', '질문 있는데요', 0, '질문 있어요', 'test'),
	(4, '2024-04-28 23:28:32', NULL, 4, NULL, 'N', '또 질문 있어요', 0, '또 질문 할게요', 'test'),
	(5, '2024-04-28 23:29:25', NULL, 4, NULL, 'Y', '답변 드려요', 0, '답변이에요', 'admin'),
	(6, '2024-04-29 00:30:04', NULL, 3, NULL, 'Y', '답변', 0, '답변', 'admin'),
	(9, '2024-04-29 01:19:41', NULL, 9, 'bc02', 'N', '질문test', 0, '질문test', 'test1');

-- 테이블 genius.tbl_release 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_release` (
  `release_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_code` varchar(50) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `category_class_code` varchar(50) NOT NULL,
  `category_subject_code` varchar(50) NOT NULL,
  PRIMARY KEY (`release_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_release:~1 rows (대략적) 내보내기
INSERT INTO `tbl_release` (`release_idx`, `book_code`, `book_name`, `price`, `amount`, `release_date`, `category_class_code`, `category_subject_code`) VALUES
	(1, 'b0001', '초등 수학1', 3400, 1, '2024-04-25 16:45:32', 'c01', 's01');

-- 테이블 genius.tbl_review 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_review` (
  `review_idx` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `book_code` varchar(50) NOT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  `rank` int(11) DEFAULT NULL,
  `review_contents` text DEFAULT NULL,
  PRIMARY KEY (`review_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_review:~20 rows (대략적) 내보내기
INSERT INTO `tbl_review` (`review_idx`, `member_id`, `book_code`, `reg_date`, `rank`, `review_contents`) VALUES
	(1, 'test', 'b0001', '2024-04-25 16:30:17', 3, '아직 4살인 제가 봐도 살짝 부족한 감이 있네요;;'),
	(2, 'test1', 'b0001', '2024-04-26 15:22:37', 5, '올해 쉰살인 저에게는 아직 어렵네요 덧셈은 어느정도 이해 했는데 아직 뺼셈은 좀  힘드네요 열심히 공부하겠습니다.'),
	(3, 'test2', 'b0001', '2024-04-26 15:23:47', 5, '저희 집 강아지가 맘에 들어하네요 한 권 더 구매해야겠습니다. :D'),
	(88, 'test', 'b0001', '2024-04-28 15:22:43', 4, '4'),
	(89, 'test', 'b0001', '2024-04-28 15:31:10', 5, 'fffff'),
	(100, 'test', 'b0001', '2024-04-28 16:00:08', 5, '5'),
	(101, 'test', 'b0001', '2024-04-28 16:00:46', 5, '5'),
	(102, 'test', 'b0001', '2024-04-28 16:01:08', 5, '5'),
	(103, 'test', 'b0001', '2024-04-28 16:07:02', 5, 'ㄹ'),
	(104, 'test', 'b0001', '2024-04-28 16:07:24', 5, 'ㅅ'),
	(105, 'test', 'b0001', '2024-04-28 16:07:30', 5, 'ㅎㅎㅎ'),
	(106, 'test', 'b0001', '2024-04-28 16:12:12', 5, 'ㅇㅇ'),
	(107, 'test', 'b0001', '2024-04-28 16:16:03', 5, 'ㅇㅇ'),
	(109, 'test', 'b0001', '2024-04-28 16:27:23', 5, 'ㄹㄹㄹ'),
	(111, 'test', 'b0001', '2024-04-28 16:43:45', 5, 'ㄹㄹ'),
	(112, 'test', 'b0001', '2024-04-28 16:44:56', 5, 'ㅇㅇ'),
	(113, 'test', 'b0001', '2024-04-28 16:47:45', 5, 'ㄹㄹ'),
	(114, 'test', 'b0001', '2024-04-28 16:47:58', 5, 'ㄹㄹ'),
	(115, 'test', 'b0001', '2024-04-28 16:53:40', 5, 'ㄹㄹㄹㄹ'),
	(116, 'test', 'b0001', '2024-04-28 16:53:49', 5, 'ㅇㅇㅇ');

-- 테이블 genius.tbl_store 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_store` (
  `store_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_code` varchar(50) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `store_date` datetime DEFAULT NULL,
  `category_class_code` varchar(50) DEFAULT NULL,
  `category_subject_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`store_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_store:~1 rows (대략적) 내보내기
INSERT INTO `tbl_store` (`store_idx`, `book_code`, `book_name`, `price`, `amount`, `store_date`, `category_class_code`, `category_subject_code`) VALUES
	(1, 'b0001', '초등 수학1', 3400, 100, '2024-04-25 16:44:51', 'c01', 's01');

-- 테이블 genius.tbl_subject_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_subject_category` (
  `category_code` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 genius.tbl_subject_category:~20 rows (대략적) 내보내기
INSERT INTO `tbl_subject_category` (`category_code`, `name`) VALUES
	('s01', '국어'),
	('s02', '영어'),
	('s03', '수학'),
	('s04', '사회'),
	('s05', '역사'),
	('s06', '도덕'),
	('s07', '과학'),
	('s08', '체육'),
	('s09', '예술'),
	('s10', '제2외국어'),
	('s11', '기술가정'),
	('s12', '음악'),
	('s13', '정보'),
	('s14', '교양'),
	('s15', '전문교과'),
	('s16', '기타'),
	('s17', '선택'),
	('s18', '실과'),
	('s19', '한문'),
	('s20', '미술');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
