-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: songs
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES UTF8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'egoing','a59b62a99fbd7ef95764938d84da1dda982c47ce6472190f914619a81ebb8e7b'),(2,'duru','4347387e3d00dad3c0243cc440d090e2da18941d3f93974edd064db967b879a5'),(3,'taeho','c26140f0e41bb57687f9c58d4b25875e0c1e4d25f31cf91efb39a0fc9ab7dace'),(4,'sookbu ','82b6fba55af363a284dd6c6bbca588ad6116f08bbd9d3d2b2aa9c1e0815c66c3'),(5,'haaa','f244eacd3bfdf8aaa85974c787289fa128aaf67bac24df617d40ffd01aed74a3'),(6,'eg','d8c59e8348e0c03f9d2105eed9791438f9aea9586381b79deadbc857eef89d78'),(7,'egoing2','2ac28ea00a49064476004660c3465b7eb754e6b8bf38f093d4c7ce8074ebe57d');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `songtitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lyrics` text COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (34,'아무노래','왜들 그리 다운돼있어? \n뭐가 문제야 say something\n분위기가 겁나 싸해 \n요새는 이런 게 유행인가\n왜들 그리 재미없어? \n아 그건 나도 마찬가지\nTell me what I got to do \n급한 대로 블루투스 켜\n\n아무 노래나 일단 틀어 \n아무거나 신나는 걸로\n아무렇게나 춤춰 \n아무렇지 않아 보이게\n아무 생각 하기 싫어 \n아무개로 살래 잠시\nI’m sick and tired of my everyday\nKeep it up 한 곡 더\n\n아무 노래나 일단 틀어 \n아무렴 어때 It’s so boring\n아무래도 refresh가 시급한 듯해 \n쌓여가 스트레스가\n배꼽 빠질 만큼만 폭소하고 싶은 날이야\nWhat up my dawgs 어디야 너희\n올 때 병맥주랑 까까 몇 개 사 와 huh\n\n클럽은 구미가 잘 안 당겨\n우리 집 거실로 빨랑 모여\n외부인은 요령껏 차단 시켜\n밤새 수다 떨 시간도 모자라\n누군 힘들어 죽겠고 누군 축제\n괜히 싱숭생숭 I want my youth back\n좀 전까지 왁자지껄\n하다 한 명 두 명씩 자릴 떠\n\n왜들 그리 다운돼있어? \n뭐가 문제야 say something\n분위기가 겁나 싸해 \n요새는 이런 게 유행인가\n왜들 그리 재미없어? \n아 그건 나도 마찬가지\nTell me what I got to do \n급한 대로 블루투스 켜\n\n아무 노래나 일단 틀어 \n아무거나 신나는 걸로\n아무렇게나 춤춰\n아무렇지 않아 보이게\n아무 생각 하기 싫어 \n아무개로 살래 잠시\nI’m sick and tired of my everyday\nKeep it up 한 곡 더\n\n떠나질 못할 바엔\n창밖은 쳐다도 안 봐\n회까닥해서 추태를 부려도\nNo worries at all\n이미지 왜 챙겨 그래 봤자 우리끼린데\n\nOhh 늦기 전에 막판 스퍼트\n20대가 얼마 안 남았어\n편한 옷으로 갈아입어\nYou look nice, get’em high\n얼핏 보면 그냥 코미디\n이렇게 무해한 파티 처음이지?\n만감이 교차하는 새벽 2시경\n술잔과 감정이 소용돌이쳐\n\n왜들 그리 다운돼있어? \n뭐가 문제야 say something\n분위기가 겁나 싸해 \n요새는 이런 게 유행인가\n왜들 그리 재미없어? \n아 그건 나도 마찬가지\nTell me what I got to do \n급한 대로 블루투스 켜\n\n아무 노래나 일단 틀어 \n아무거나 신나는 걸로\n아무렇게나 춤춰 \n아무렇지 않아 보이게\n아무 생각 하기 싫어 \n아무개로 살래 잠시\nI’m sick and tired of my everyday\nKeep it up 한 곡 더\n아무 노래나 일단\n\n아무 노래 아무 노래 아무 노래나 틀어봐\n아무 노래 아무 노래 아무 노래나 틀어봐\n아무 노래 아무 노래 아무 노래나 틀어봐\n아무 노래 아무 노래 아무 노래나 KOZ','2020-04-27 14:26:50','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UuV2BmJ1p_I\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>',4),(36,'곰세마리','곰세마리가 한집에 있어\n아빠곰 엄마곰 애기곰\n\n아빠곰은 뚱뚱해 \n엄마곰은 날씬해\n애기곰은 너무 귀여워\n히쭉히쭉 잘한다','2020-04-27 16:16:35','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/twjpcB6mXjk\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>',4),(37,'찬찬찬','차디찬 그라스에 빨간 립스틱 \n음악에 묻혀 굳어버린 밤깊은 카페의 여인 \n가녀린 어깨위로 슬픔이 연기처럼 피어 오를때 \n사랑을 느끼면서 다가선 나를 향해 웃음을 던지면서\n술잔을 부딪히며 찬찬찬 \n\n그러나 마음줄수 없다는 그말 \n사랑을 할수 없다는 그말 \n쓸쓸히 창밖을 보니 \n주루룩 주루룩 주루룩 주루룩 \n밤새워 내리는 빗물\n\n노란 스탠드에 빨간 립스틱 그 누굴 찾아 \n여기 왔나 밤깊은 카페의 여인 \n가녀린 어깨위로 슬픔이 \n연가처럼 피어 오를때 \n사랑을 느끼면서 다가선 나를 향해 \n웃음을 던지면서 술잔을 부딪히며 찬찬찬 \n그러나 마음줄수 없다는 그말 \n사랑을 할수 없다는 그말 \n쓸쓸히 창밖을 보니 \n주루룩 주루룩 주루룩 주루룩 \n밤새워 내리는 빗물','2020-04-27 16:17:59','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fgyMtbK9Cz4\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>',4),(38,'찐이야','찐찐찐찐 찐이야 완전 찐이야\n진짜가 나타났다 지금\n찐찐찐찐 찐이야 완전 찐이야\n찐하게 사랑할 거야\n요즘 같이 가짜가 많은 세상에\n믿을 사람 바로 당신 뿐\n내 모든 걸 다 줘도 아깝지 않은\n내 인생에 전부인 사람\n끌리네 끌리네 자꾸 끌리네\n쏠리네 쏠리네 자꾸 쏠리네\n심장을 훔쳐간 사람\n찐찐찐찐 찐이야 완전 찐이야\n진짜가 나타났다 지금\n찐찐찐찐 찐이야 완전 찐이야\n찐하게 사랑할 거야\n\n찐이야~\n요즘 같이 가짜가 많은 세상에\n믿을 사람 바로 당신 뿐\n내 모든 걸 다 줘도 아깝지 않은\n내 인생에 전부인 사람\n끌리네 끌리네 자꾸 끌리네\n쏠리네 쏠리네 자꾸 쏠리네\n심장을 훔쳐간 사람\n찐찐찐찐 찐이야 완전 찐이야\n진짜가 나타났다 지금\n찐찐찐찐 찐이야 완전 찐이야\n찐하게 사랑할 거야\n찐하게 찐하게 찐하게 찐하게\n찐찐찐찐 찐이야 완전 찐이야\n진짜가 나타났다 지금\n찐찐찐찐 찐이야 완전 찐이야\n찐하게 사랑할 거야\n찐하게 찐하게 찐하게 찐하게\n사랑할 거야','2020-04-27 16:22:15','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/QMjkrcmo21Y\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>',4),(39,'짐살라빔','Hoo~ Hahaha\nAre you ready for this?\nZimzalabim!\n\n암거나 거나 거나 쫓다 지치지 마\n늘 바라 바라 바라봤자 꿈이 아냐\n널 꺼내 꺼내 꺼내 진짜 네 맘을 봐\n뭘 원해 원해 원해 Tell me\n신나는 하룰 만들어 볼까?\n \n네모난 지구 위로\n걱정은 모두 던져\nNananana nanananana higher\n입술에 피어나는\n주문에 너를 맡겨\nNananana nanananana ha!\n \nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\n\n어머 어머 어머 활짝 웃는 널 봐\n너무 너무 너무 깜짝 놀라진 마\n그게 바로 너야\n주문을 외는 순간 누구든 행복해져\nNananana nanananana higher\n\n틀에 박힌 세상 속에서\n길들여진 넌 매일 마냥 덤덤\n날 따라 해봐 뭐 더 필요해?\nHey girls! (A-ha!)\nYou ready? (Oh yeah!)\n너 몰래 자취를 감춘 꿈을 찾아서\n달려볼까 함께해줘 Boys\n\n장난스러운 목소리로\n마음껏 외쳐 모두 잊고\n\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\n\n별빛 가득한 눈을 봐\n(누구보다 빛나 보석처럼 반짝)\nOh 멀리서 헤매진 마\n(눈부시게 빛나 웃어봐 더 활짝)\n꿈은 네 안에 있는 걸\n\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\nZimzalabim Zim-zimzalabim\nZim-zimzalabim Zim-zim\n\nNanananana nananana\nNanananana nananana\nNanananana nananana\nNanananana nananana','2020-04-27 16:27:30','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/YBnGBb1wg98\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>',4);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-27 16:36:09
