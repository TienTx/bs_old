-- MySQL dump 10.16  Distrib 10.1.9-MariaDB, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: dbBS2
-- ------------------------------------------------------
-- Server version	10.1.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblAddress`
--

DROP TABLE IF EXISTS `tblAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblAddress` (
  `idAddress` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lane` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ward` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblAddress`
--

LOCK TABLES `tblAddress` WRITE;
/*!40000 ALTER TABLE `tblAddress` DISABLE KEYS */;
INSERT INTO `tblAddress` VALUES (1,'10',NULL,'Tran Phu','Tran Phu','Ha Dong','Ha Noi','Viet Nam'),(2,'123','170','Tân Triều','Tân Triều','Thanh Trì','Hà Nội','Việt Nam'),(3,'123','123','123123','123123','123123','123123','Việt Nam'),(4,'123345','123123','123564','123456','123345','123456','Việt Nam'),(5,'123345','123123','123564','123456','123345','Hà Nội','Việt Nam'),(6,'12356','170','Trần Phú','Tân Triều','Thanh Trì','Hà Nội','Việt Nam'),(7,'123123','123123','123123','123123','Phương Gay','123123','Việt Nam'),(8,'123123','Quân Gay','123123','123123','Phương Gay','123123','Việt Nam'),(9,'74','90','Van An','to doan ket','Lai Chau','Lai Chau','Việt Nam'),(10,'123123','123123','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam'),(11,'123','Trần Phú','Tân Triều','123123','123345','Hà Nội','Việt Nam'),(12,'a','a','a','a','a','a','a'),(13,'a','a','a','a','a','a','a'),(14,'123','123','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam'),(15,'123','123','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam'),(16,'123','123123aaaa','123123','to doan ket','Phương Gay','123123','Việt Nam'),(17,'34','90','123123','to doan ket','Phương Gay','Lai Chau','Việt Nam'),(18,'43','Quân Gay','Van An','to doan ket','Lai Chau','Lai Chau','Việt Nam'),(19,'43','Quân Gay','Van An','to doan ket','Lai Chau','Lai Chau','Việt Nam'),(20,'43','Quân Gay','Van An','to doan ket','Lai Chau','Lai Chau','Việt Nam'),(21,'43','Quân Gay','Van An','to doan ket','Lai Chau','Lai Chau','Việt Nam'),(22,'23','Quân Gay','Van An','123123','Phương Gay','Lai Chau','Việt Nam');
/*!40000 ALTER TABLE `tblAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblBank`
--

DROP TABLE IF EXISTS `tblBank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBank` (
  `idBank` int(11) NOT NULL AUTO_INCREMENT,
  `blance` float DEFAULT NULL,
  PRIMARY KEY (`idBank`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBank`
--

LOCK TABLES `tblBank` WRITE;
/*!40000 ALTER TABLE `tblBank` DISABLE KEYS */;
INSERT INTO `tblBank` VALUES (1,50000000),(2,10000000),(3,400000),(4,50000000),(5,50000000),(6,50000000),(7,50000000),(8,50000000),(9,50000000),(10,50000000),(11,50000000),(12,50000000),(13,50000000),(14,50000000),(15,50000000),(16,50000000),(17,50000000),(18,50000000),(19,50000000),(20,50000000),(21,50000000),(22,50000000),(23,50000000);
/*!40000 ALTER TABLE `tblBank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblBook`
--

DROP TABLE IF EXISTS `tblBook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBook` (
  `idBook` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `publishYear` varchar(45) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `originalPrice` float DEFAULT NULL,
  `salePrice` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `idCategory` int(11) DEFAULT NULL,
  `idBookSet` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT '0',
  `ratePoint` float DEFAULT '0',
  PRIMARY KEY (`idBook`),
  KEY `fk_tblBook_tblBookSet_idx` (`idBookSet`),
  KEY `fk_tblBook_tblCategory_idx` (`idCategory`),
  CONSTRAINT `fk_tblBook_tblBookSet` FOREIGN KEY (`idBookSet`) REFERENCES `tblBookSet` (`idBookSet`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tblBook_tblCategory` FOREIGN KEY (`idCategory`) REFERENCES `tblCategory` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBook`
--

LOCK TABLES `tblBook` WRITE;
/*!40000 ALTER TABLE `tblBook` DISABLE KEYS */;
INSERT INTO `tblBook` VALUES (1,'nguoi-me-so-0.jpg','Người mẹ số 0 - cuốn sách cảm động về tình cảm gia đình','Marjolijn Hof-Thi Zinsmeister Ngô chuyển ngữ','Đang cập nhật','2015','Người mẹ số 0 ấn tượng ngay từ tựa đề. Tôi đợi mãi Tiki chưa có hàng nên đã nhờ bạn mua ở hội chợ sách. Cuốn sách nhỏ nhắn, mỏng, chứa đựng trong đó một câu chuyện giản dị và sâu sắc. Câu chuyện về một câu bé được nhận làm con nuôi và quá trình cậu bé tìm hiểu về người mẹ sinh ra mình là ai, là người như thế nào? Cốt truyện giản đơn, gần như không có biến cố gì đặc biệt, chỉ đơn thuần là những suy nghĩ và tưởng tượng của cậu bé về người mẹ, về thái độ và cảm xúc của người mẹ ruột trong giây phút Người mẹ số 0 ấn tượng ngay từ tựa đề. Tôi đợi mãi Tiki chưa có hàng nên đã nhờ bạn mua ở hội chợ sách. Cuốn sách nhỏ nhắn, mỏng, chứa đựng trong đó một câu chuyện giản dị và sâu sắc. Câu chuyện về một câu bé được nhận làm con nuôi và quá trình cậu bé tìm hiểu về người mẹ sinh ra mình là ai, là người như thế nào? Cốt truyện giản đơn, gần như không có biến cố gì đặc biệt, chỉ đơn thuần là những suy nghĩ và tưởng tượng của cậu bé về người mẹ, về thái độ và cảm xúc của người mẹ ruột trong giây phút Người mẹ số 0 ấn tượng ngay từ tựa đề. Tôi đợi mãi Tiki chưa có hàng nên đã nhờ bạn mua ở hội chợ sách. Cuốn sách nhỏ nhắn, mỏng, chứa đựng trong đó một câu chuyện giản dị và sâu sắc. Câu chuyện về một câu bé được nhận làm con nuôi và quá trình cậu bé tìm hiểu về người mẹ sinh ra mình là ai, là người như thế nào? Cốt truyện giản đơn, gần như không có biến cố gì đặc biệt, chỉ đơn thuần là những suy nghĩ và tưởng tượng của cậu bé về người mẹ, về thái độ và cảm xúc của người mẹ ruột trong giây phút',43000,30000,100,1,1,0,0),(2,'toi_thay_hoa_vang.jpg','Tôi Thấy Hoa Vàng Trên Cỏ Xanh','Nguyễn Nhật Ánh','Nhà Xuất Bản Trẻ','11-2010','Ta bắt gặp trong Tôi Thấy Hoa Vàng Trên Cỏ Xanh một thế giới đấy bất ngờ và thi vị non trẻ với những suy ngẫm giản dị thôi nhưng gần gũi đến lạ. Câu chuyện của Tôi Thấy Hoa Vàng Trên Cỏ Xanh có chút này chút kia, để ai soi vào cũng thấy mình trong đó, kiểu như lá thư tình đầu đời của cu Thiều chẳng hạn... ngây ngô và khờ khạo. Ta bắt gặp trong Tôi Thấy Hoa Vàng Trên Cỏ Xanh một thế giới đấy bất ngờ và thi vị non trẻ với những suy ngẫm giản dị thôi nhưng gần gũi đến lạ. Câu chuyện của Tôi Thấy Ho Ta bắt gặp trong Tôi Thấy Hoa Vàng Trên Cỏ Xanh một thế giới đấy bất ngờ và thi vị non trẻ với những suy ngẫm giản dị thôi nhưng gần gũi đến lạ. Câu chuyện của Tôi Thấy Hoa Vàng Trên Cỏ Xanh có chút này chút kia, để ai soi vào cũng thấy mình trong đó, kiểu như lá thư tình đầu đời của cu Thiều chẳng hạn... ngây ngô và khờ khạo. Ta bắt gặp trong Tôi Thấy Hoa Vàng Trên Cỏ Xanh một thế giới đấy bất ngờ và thi vị non trẻ với những suy ngẫm giản dị thôi nhưng gần gũi đến lạ. Câu chuyện của Tôi Thấy Ho Ta bắt gặp trong Tôi Thấy Hoa Vàng Trên Cỏ Xanh một thế giới đấy bất ngờ và thi vị non trẻ với những suy ngẫm giản dị thôi nhưng gần gũi đến lạ. Câu chuyện của Tôi Thấy Hoa Vàng Trên Cỏ Xanh có chút này chút kia, để ai soi vào cũng thấy mình trong đó, kiểu như lá thư tình đầu đời của cu Thiều chẳng hạn... ngây ngô và khờ khạo. Ta bắt gặp trong Tôi Thấy Hoa Vàng Trên Cỏ Xanh một thế giới đấy bất ngờ và thi vị non trẻ với những suy ngẫm giản dị thôi nhưng gần gũi đến lạ. Câu chuyện của Tôi Thấy Ho',82000,57400,100,2,1,0,0),(3,'chuyen-fuu-luu.jpg','Chuyến Phiêu Lưu Đến Xứ Sở Bên Kia Thác Mây Mù','Nguyệt Nguyệt','Nhà Xuất Bản Trẻ','2015','Chuyến phiêu lưu đến xử sở bên kia thác mây mù của nữ tác giả trẻ Nguyệt Nguyệt đã đem đến cho các em thiếu nhi một cuộc phiêu lưu, một thế giới đầy màu sắc và những tiếng cười rộn rã. Chuyến phiêu lưu đến xử sở bên kia thác mây mù của nữ tác giả trẻ Nguyệt Nguyệt đã đem đến cho các em thiếu nhi một cuộc phiêu lưu, một thế giới đầy màu sắc và những tiếng cười rộn rã. Chuyến phiêu lưu đến xử sở bên kia thác mây mù của nữ tác giả trẻ Nguyệt Nguyệt đã đem đến cho các em thiếu nhi một cuộc phiêu lưu, một thế giới đầy màu sắc và những tiếng cười rộn rã. Chuyến phiêu lưu đến xử sở bên kia thác mây mù của nữ tác giả trẻ Nguyệt Nguyệt đã đem đến cho các em thiếu nhi một cuộc phiêu lưu, một thế giới đầy màu sắc và những tiếng cười rộn rã. Chuyến phiêu lưu đến xử sở bên kia thác mây mù của nữ tác giả trẻ Nguyệt Nguyệt đã đem đến cho các em thiếu nhi một cuộc phiêu lưu, một thế giới đầy màu sắc và những tiếng cười rộn rã. Chuyến phiêu lưu đến xử sở bên kia thác mây mù của nữ tác giả trẻ Nguyệt Nguyệt đã đem đến cho các em thiếu nhi một cuộc phiêu lưu, một thế giới đầy màu sắc và những tiếng cười rộn rã.',25000,25000,100,2,1,0,0),(4,'img894_9.jpg','Tôi Là Bêtô (Tái Bản 2015)','Nguyễn Nhật Ánh','NXB Trẻ','09-2015','Tôi Là Bêtô là tác phẩm mới nhất của nhà văn chuyên viết cho thanh thiếu niên của Nguyễn Nhật Ánh. Anh đã được đông đảo bạn đọc biết đến qua các tác phẩm quen thuộc như Thằng quỷ nhỏ, Trại hoa vàng, Bong bóng lên trời, Cô gái đến từ hôm qua… và hai bộ truyện nhiều tập Kính vạn hoa và Chuyện xứ Lang Biang. Với Tôi là Bêtô, đây là lần đầu tiên anh viết một tác phẩm qua lời kể của một chú cún. Trong thiên truyện này, thế giới được nhìn một cách trong trẻo nhưng lồng trong đó không thiếu những ý tứ  Tôi Là Bêtô là tác phẩm mới nhất của nhà văn chuyên viết cho thanh thiếu niên của Nguyễn Nhật Ánh. Anh đã được đông đảo bạn đọc biết đến qua các tác phẩm quen thuộc như Thằng quỷ nhỏ, Trại hoa vàng, Bong bóng lên trời, Cô gái đến từ hôm qua… và hai bộ truyện nhiều tập Kính vạn hoa và Chuyện xứ Lang Biang. Với Tôi là Bêtô, đây là lần đầu tiên anh viết một tác phẩm qua lời kể của một chú cún. Trong thiên truyện này, thế giới được nhìn một cách trong trẻo nhưng lồng trong đó không thiếu những ý tứ  Tôi Là Bêtô là tác phẩm mới nhất của nhà văn chuyên viết cho thanh thiếu niên của Nguyễn Nhật Ánh. Anh đã được đông đảo bạn đọc biết đến qua các tác phẩm quen thuộc như Thằng quỷ nhỏ, Trại hoa vàng, Bong bóng lên trời, Cô gái đến từ hôm qua… và hai bộ truyện nhiều tập Kính vạn hoa và Chuyện xứ Lang Biang. Với Tôi là Bêtô, đây là lần đầu tiên anh viết một tác phẩm qua lời kể của một chú cún. Trong thiên truyện này, thế giới được nhìn một cách trong trẻo nhưng lồng trong đó không thiếu những ý tứ  Tôi Là Bêtô là tác phẩm mới nhất của nhà văn chuyên viết cho thanh thiếu niên của Nguyễn Nhật Ánh. Anh đã được đông đảo bạn đọc biết đến qua các tác phẩm quen thuộc như Thằng quỷ nhỏ, Trại hoa vàng, Bong bóng lên trời, Cô gái đến từ hôm qua… và hai bộ truyện nhiều tập Kính vạn hoa và Chuyện xứ Lang Biang. Với Tôi là Bêtô, đây là lần đầu tiên anh viết một tác phẩm qua lời kể của một chú cún. Trong thiên truyện này, thế giới được nhìn một cách trong trẻo nhưng lồng trong đó không thiếu những ý tứ ',60000,42000,100,2,1,0,0),(5,'chien_binh_cau_vong_sap_xuat_ban-240412_2.jpg','Chiến Binh Cầu Vồng (Tái Bản)','Andrea Hirata ','Đang cập nhật','04-2014','Cuốn sách nhỏ bé chứa đựng bên trong nó nghị lực phi thường của 10 đứa trẻ nghèo đói (nhưng ham học mãnh liệt), 1 người cha đánh cá nghèo khổ (phải gồng mình nuôi mười bốn miệng ăn nhưng dám-can-đảm cho con trai của mình đi học), 1 thầy hiệu trưởng (yêu nghề, yêu học trò đến khi nhắm mắt vẫn không yên) và 1 cô giáo (dám đương đầu với thế lực, cửa quyền để bảo vệ đến cùng ngôi trường xiêu vẹo). Cuốn sách nhỏ bé chứa đựng bên trong nó nghị lực phi thường của 10 đứa trẻ nghèo đói (nhưng ham học mãn Cuốn sách nhỏ bé chứa đựng bên trong nó nghị lực phi thường của 10 đứa trẻ nghèo đói (nhưng ham học mãnh liệt), 1 người cha đánh cá nghèo khổ (phải gồng mình nuôi mười bốn miệng ăn nhưng dám-can-đảm cho con trai của mình đi học), 1 thầy hiệu trưởng (yêu nghề, yêu học trò đến khi nhắm mắt vẫn không yên) và 1 cô giáo (dám đương đầu với thế lực, cửa quyền để bảo vệ đến cùng ngôi trường xiêu vẹo). Cuốn sách nhỏ bé chứa đựng bên trong nó nghị lực phi thường của 10 đứa trẻ nghèo đói (nhưng ham học mãn Cuốn sách nhỏ bé chứa đựng bên trong nó nghị lực phi thường của 10 đứa trẻ nghèo đói (nhưng ham học mãnh liệt), 1 người cha đánh cá nghèo khổ (phải gồng mình nuôi mười bốn miệng ăn nhưng dám-can-đảm cho con trai của mình đi học), 1 thầy hiệu trưởng (yêu nghề, yêu học trò đến khi nhắm mắt vẫn không yên) và 1 cô giáo (dám đương đầu với thế lực, cửa quyền để bảo vệ đến cùng ngôi trường xiêu vẹo). Cuốn sách nhỏ bé chứa đựng bên trong nó nghị lực phi thường của 10 đứa trẻ nghèo đói (nhưng ham học mãn Cuốn sách nhỏ bé chứa đựng bên trong nó nghị lực phi thường của 10 đứa trẻ nghèo đói (nhưng ham học mãnh liệt), 1 người cha đánh cá nghèo khổ (phải gồng mình nuôi mười bốn miệng ăn nhưng dám-can-đảm cho con trai của mình đi học), 1 thầy hiệu trưởng (yêu nghề, yêu học trò đến khi nhắm mắt vẫn không yên) và 1 cô giáo (dám đương đầu với thế lực, cửa quyền để bảo vệ đến cùng ngôi trường xiêu vẹo). Cuốn sách nhỏ bé chứa đựng bên trong nó nghị lực phi thường của 10 đứa trẻ nghèo đói (nhưng ham học mãn',90000,63000,100,2,1,0,0),(6,'10_1_5.jpg','Chuyến Phiêu Lưu Diệu Kỳ Của Edward Tulane (Tái Bản)','Kate Di Camillo','NXB Mỹ Thuật','04-2014','Chuyến phiêu lưu diệu kỳ của Edward Tulane do nhà văn Mỹ Kate DiCamilo - người \"săn\" giải thưởng sách thiếu nhi - viết được đánh giá là \"quyển sách tuyệt vời được viết bằng văn phong giản dị nhưng đầy sức lay chuyển\". Chuyến phiêu lưu diệu kỳ của Edward Tulane do nhà văn Mỹ Kate DiCamilo - người \"săn\" giải thưởng sách thiếu nhi - viết được đánh giá là \"quyển sách tuyệt vời được viết bằng văn phong giản dị nhưng đầy sức lay chuyển\". Chuyến phiêu lưu diệu kỳ của Edward Tulane do nhà văn Mỹ Kate DiCamilo - người \"săn\" giải thưởng sách thiếu nhi - viết được đánh giá là \"quyển sách tuyệt vời được viết bằng văn phong giản dị nhưng đầy sức lay chuyển\". Chuyến phiêu lưu diệu kỳ của Edward Tulane do nhà văn Mỹ Kate DiCamilo - người \"săn\" giải thưởng sách thiếu nhi - viết được đánh giá là \"quyển sách tuyệt vời được viết bằng văn phong giản dị nhưng đầy sức lay chuyển\". Chuyến phiêu lưu diệu kỳ của Edward Tulane do nhà văn Mỹ Kate DiCamilo - người \"săn\" giải thưởng sách thiếu nhi - viết được đánh giá là \"quyển sách tuyệt vời được viết bằng văn phong giản dị nhưng đầy sức lay chuyển\". Chuyến phiêu lưu diệu kỳ của Edward Tulane do nhà văn Mỹ Kate DiCamilo - người \"săn\" giải thưởng sách thiếu nhi - viết được đánh giá là \"quyển sách tuyệt vời được viết bằng văn phong giản dị nhưng đầy sức lay chuyển\". Chuyến phiêu lưu diệu kỳ của Edward Tulane do nhà văn Mỹ Kate DiCamilo - người \"săn\" giải thưởng sách thiếu nhi - viết được đánh giá là \"quyển sách tuyệt vời được viết bằng văn phong giản dị nhưng đầy sức lay chuyển\". Chuyến phiêu lưu diệu kỳ của Edward Tulane do nhà văn Mỹ Kate DiCamilo - người \"săn\" giải thưởng sách thiếu nhi - viết được đánh giá là \"quyển sách tuyệt vời được viết bằng văn phong giản dị nhưng đầy sức lay chuyển\".',55000,39000,100,2,1,0,0),(7,'mua-thu-cay-duong.jpg','Mùa Thu Của Cây Dương (Tái Bản)','Kazumi Yumoto','	NXB Văn Hóa - Văn Nghệ','12-2013','Mùa hè năm lên sáu tuổi, gia đình mẹ con Chiaki lâm vào cảnh khốn cùng. Mẹ cô bé quá đỗi tiều tụy không thể chăm lo nổi cho Chiaki nhạy cảm và đang khủng hoảng bởi sự đi bất ngờ của bố. Nhưng, từ sau khi dọn đến khu căn hộ cho thuê có tên Cây Dương, Chiaki dần tìm lại hạnh phúc tuổi thơ tưởng chừng đã mất, nhờ có bà cụ chủ nhà - khó tính, nấu ăn dở, ưa sạch sẽ, hay dọa trẻ con… nhưng âm thầm tốt bụng. Thời gian thấm thoắt trôi, hai mươi năm sau Chiaki nhận được tin bà qua đời. Mùa hè năm lên sáu Mùa hè năm lên sáu tuổi, gia đình mẹ con Chiaki lâm vào cảnh khốn cùng. Mẹ cô bé quá đỗi tiều tụy không thể chăm lo nổi cho Chiaki nhạy cảm và đang khủng hoảng bởi sự đi bất ngờ của bố. Nhưng, từ sau khi dọn đến khu căn hộ cho thuê có tên Cây Dương, Chiaki dần tìm lại hạnh phúc tuổi thơ tưởng chừng đã mất, nhờ có bà cụ chủ nhà - khó tính, nấu ăn dở, ưa sạch sẽ, hay dọa trẻ con… nhưng âm thầm tốt bụng. Thời gian thấm thoắt trôi, hai mươi năm sau Chiaki nhận được tin bà qua đời. Mùa hè năm lên sáu Mùa hè năm lên sáu tuổi, gia đình mẹ con Chiaki lâm vào cảnh khốn cùng. Mẹ cô bé quá đỗi tiều tụy không thể chăm lo nổi cho Chiaki nhạy cảm và đang khủng hoảng bởi sự đi bất ngờ của bố. Nhưng, từ sau khi dọn đến khu căn hộ cho thuê có tên Cây Dương, Chiaki dần tìm lại hạnh phúc tuổi thơ tưởng chừng đã mất, nhờ có bà cụ chủ nhà - khó tính, nấu ăn dở, ưa sạch sẽ, hay dọa trẻ con… nhưng âm thầm tốt bụng. Thời gian thấm thoắt trôi, hai mươi năm sau Chiaki nhận được tin bà qua đời. Mùa hè năm lên sáu Mùa hè năm lên sáu tuổi, gia đình mẹ con Chiaki lâm vào cảnh khốn cùng. Mẹ cô bé quá đỗi tiều tụy không thể chăm lo nổi cho Chiaki nhạy cảm và đang khủng hoảng bởi sự đi bất ngờ của bố. Nhưng, từ sau khi dọn đến khu căn hộ cho thuê có tên Cây Dương, Chiaki dần tìm lại hạnh phúc tuổi thơ tưởng chừng đã mất, nhờ có bà cụ chủ nhà - khó tính, nấu ăn dở, ưa sạch sẽ, hay dọa trẻ con… nhưng âm thầm tốt bụng. Thời gian thấm thoắt trôi, hai mươi năm sau Chiaki nhận được tin bà qua đời. Mùa hè năm lên sáu',42000,29000,100,3,1,0,0),(8,'khu_vuon_mua_ha.jpg','Khu vườn mùa hạ (Natsu no niwa)','Kazumi Yumoto','NXB Văn Học','06-2010','Chắc rằng nhiều người trong chúng ta đã trải qua một tuổi thơ với đầy những thắc mắc mà người lớn luôn bảo rằng \"Khi lớn lên con sẽ hiểu,\" hoặc họ sẽ nói đại khái một điều gì đấy mà chúng ta chẳng kịp nhớ và hiểu. Ba cậu học sinh lớp 6 (học sinh cuối cấp ở một trường tiểu học Nhật Bản) cũng có những thắc mắc về cuộc sống, về những điều mà có khi sống gần trọn cuộc đời người ta vẫn chưa hiểu nổi. Chắc rằng nhiều người trong chúng ta đã trải qua một tuổi thơ với đầy những thắc mắc mà người lớn luô Chắc rằng nhiều người trong chúng ta đã trải qua một tuổi thơ với đầy những thắc mắc mà người lớn luôn bảo rằng \"Khi lớn lên con sẽ hiểu,\" hoặc họ sẽ nói đại khái một điều gì đấy mà chúng ta chẳng kịp nhớ và hiểu. Ba cậu học sinh lớp 6 (học sinh cuối cấp ở một trường tiểu học Nhật Bản) cũng có những thắc mắc về cuộc sống, về những điều mà có khi sống gần trọn cuộc đời người ta vẫn chưa hiểu nổi. Chắc rằng nhiều người trong chúng ta đã trải qua một tuổi thơ với đầy những thắc mắc mà người lớn luô Chắc rằng nhiều người trong chúng ta đã trải qua một tuổi thơ với đầy những thắc mắc mà người lớn luôn bảo rằng \"Khi lớn lên con sẽ hiểu,\" hoặc họ sẽ nói đại khái một điều gì đấy mà chúng ta chẳng kịp nhớ và hiểu. Ba cậu học sinh lớp 6 (học sinh cuối cấp ở một trường tiểu học Nhật Bản) cũng có những thắc mắc về cuộc sống, về những điều mà có khi sống gần trọn cuộc đời người ta vẫn chưa hiểu nổi. Chắc rằng nhiều người trong chúng ta đã trải qua một tuổi thơ với đầy những thắc mắc mà người lớn luôChắc rằng nhiều người trong chúng ta đã trải qua một tuổi thơ với đầy những thắc mắc mà người lớn luôn bảo rằng \"Khi lớn lên con sẽ hiểu,\" hoặc họ sẽ nói đại khái một điều gì đấy mà chúng ta chẳng kịp nhớ và hiểu. Ba cậu học sinh lớp 6 (học sinh cuối cấp ở một trường tiểu học Nhật Bản) cũng có những thắc mắc về cuộc sống, về những điều mà có khi sống gần trọn cuộc đời người ta vẫn chưa hiểu nổi. Chắc rằng nhiều người trong chúng ta đã trải qua một tuổi thơ với đầy những thắc mắc mà người lớn luô',41000,29000,100,3,1,0,0),(9,'pippi_tat_dai-pp_4.jpg','Pippi tất dài ( Tái Bản)','Astrid Lindgren','NXB Văn Học','08-2014','Pippi tất dài, một cái tên đã được hàng triệu trẻ em của bao nhiêu thế hệ trên thế giới yêu mến. Cô bé tóc đỏ, mặt đầy tàn nhang tinh quái đó là giấc mơ sống động mà có lẽ chưa từng một ai không ôm ấp khi nghĩ về tuổi thơ, trẻ thơ. Pippi tất dài, một cái tên đã được hàng triệu trẻ em của bao nhiêu thế hệ trên thế giới yêu mến. Cô bé tóc đỏ, mặt đầy tàn nhang tinh quái đó là giấc mơ sống động mà có lẽ chưa từng một ai không ôm ấp khi nghĩ về tuổi thơ, trẻ thơ.Pippi tất dài, một cái tên đã được hàng triệu trẻ em của bao nhiêu thế hệ trên thế giới yêu mến. Cô bé tóc đỏ, mặt đầy tàn nhang tinh quái đó là giấc mơ sống động mà có lẽ chưa từng một ai không ôm ấp khi nghĩ về tuổi thơ, trẻ thơ. Pippi tất dài, một cái tên đã được hàng triệu trẻ em của bao nhiêu thế hệ trên thế giới yêu mến. Cô bé tóc đỏ, mặt đầy tàn nhang tinh quái đó là giấc mơ sống động mà có lẽ chưa từng một ai không ôm ấp khi nghĩ về tuổi thơ, trẻ thơ.Pippi tất dài, một cái tên đã được hàng triệu trẻ em của bao nhiêu thế hệ trên thế giới yêu mến. Cô bé tóc đỏ, mặt đầy tàn nhang tinh quái đó là giấc mơ sống động mà có lẽ chưa từng một ai không ôm ấp khi nghĩ về tuổi thơ, trẻ thơ. Pippi tất dài, một cái tên đã được hàng triệu trẻ em của bao nhiêu thế hệ trên thế giới yêu mến. Cô bé tóc đỏ, mặt đầy tàn nhang tinh quái đó là giấc mơ sống động mà có lẽ chưa từng một ai không ôm ấp khi nghĩ về tuổi thơ, trẻ thơ.Pippi tất dài, một cái tên đã được hàng triệu trẻ em của bao nhiêu thế hệ trên thế giới yêu mến. Cô bé tóc đỏ, mặt đầy tàn nhang tinh quái đó là giấc mơ sống động mà có lẽ chưa từng một ai không ôm ấp khi nghĩ về tuổi thơ, trẻ thơ. Pippi tất dài, một cái tên đã được hàng triệu trẻ em của bao nhiêu thế hệ trên thế giới yêu mến. Cô bé tóc đỏ, mặt đầy tàn nhang tinh quái đó là giấc mơ sống động mà có lẽ chưa từng một ai không ôm ấp khi nghĩ về tuổi thơ, trẻ thơ.',76000,53000,100,1,1,0,0),(10,'chai-thoi-gian.jpg','Chai Thời Gian','Praphatsorn Seiwikun','	NXB Thời Đại','07-2013','Chai thời gian, ca khúc xưa cũ đã cùng Fatso đi qua tuổi niên thiếu bỗng êm ả vang lên trong một quán cóc nhỏ, gọi về những kỷ niệm. Chai thời gian, ca khúc xưa cũ đã cùng Fatso đi qua tuổi niên thiếu bỗng êm ả vang lên trong một quán cóc nhỏ, gọi về những kỷ niệm.Chai thời gian, ca khúc xưa cũ đã cùng Fatso đi qua tuổi niên thiếu bỗng êm ả vang lên trong một quán cóc nhỏ, gọi về những kỷ niệm. Chai thời gian, ca khúc xưa cũ đã cùng Fatso đi qua tuổi niên thiếu bỗng êm ả vang lên trong một quán cóc nhỏ, gọi về những kỷ niệm.Chai thời gian, ca khúc xưa cũ đã cùng Fatso đi qua tuổi niên thiếu bỗng êm ả vang lên trong một quán cóc nhỏ, gọi về những kỷ niệm. Chai thời gian, ca khúc xưa cũ đã cùng Fatso đi qua tuổi niên thiếu bỗng êm ả vang lên trong một quán cóc nhỏ, gọi về những kỷ niệm.Chai thời gian, ca khúc xưa cũ đã cùng Fatso đi qua tuổi niên thiếu bỗng êm ả vang lên trong một quán cóc nhỏ, gọi về những kỷ niệm. Chai thời gian, ca khúc xưa cũ đã cùng Fatso đi qua tuổi niên thiếu bỗng êm ả vang lên trong một quán cóc nhỏ, gọi về những kỷ niệm.',75000,5300,100,3,1,0,0),(11,'di_vao_nghien_cuu.jpg','Đi Vào Nghiên Cứu Khoa Học','Nguyễn Văn Tuấn','Nhà xuất bản Tổng Hợp','12-2011','Đây là cuốn sách thứ 9 của tôi đã in ở Việt Nam. Cuốn trước bàn về chất lượng giáo dục (sắp tái bản), nhưng cuốn này bàn về làm khoa học.  Đối tượng chính của cuốn sách này là các bạn sinh viên và nghiên cứu sinh. Tuy nhiên, các nhà nghiên cứu cũng có thể tìm thấy trong sách nhiều thông tin đáng quan tâm, như làm thế nào để đánh giá một câu hỏi nghiên cứu (research question), thế nào là bài báo khoa học, làm thể nào để thành công trong khoa học, cách viết bài báo khoa học, cách trình bày báo cáoĐây là cuốn sách thứ 9 của tôi đã in ở Việt Nam. Cuốn trước bàn về chất lượng giáo dục (sắp tái bản), nhưng cuốn này bàn về làm khoa học.  Đối tượng chính của cuốn sách này là các bạn sinh viên và nghiên cứu sinh. Tuy nhiên, các nhà nghiên cứu cũng có thể tìm thấy trong sách nhiều thông tin đáng quan tâm, như làm thế nào để đánh giá một câu hỏi nghiên cứu (research question), thế nào là bài báo khoa học, làm thể nào để thành công trong khoa học, cách viết bài báo khoa học, cách trình bày báo cáoĐây là cuốn sách thứ 9 của tôi đã in ở Việt Nam. Cuốn trước bàn về chất lượng giáo dục (sắp tái bản), nhưng cuốn này bàn về làm khoa học.  Đối tượng chính của cuốn sách này là các bạn sinh viên và nghiên cứu sinh. Tuy nhiên, các nhà nghiên cứu cũng có thể tìm thấy trong sách nhiều thông tin đáng quan tâm, như làm thế nào để đánh giá một câu hỏi nghiên cứu (research question), thế nào là bài báo khoa học, làm thể nào để thành công trong khoa học, cách viết bài báo khoa học, cách trình bày báo cáoĐây là cuốn sách thứ 9 của tôi đã in ở Việt Nam. Cuốn trước bàn về chất lượng giáo dục (sắp tái bản), nhưng cuốn này bàn về làm khoa học.  Đối tượng chính của cuốn sách này là các bạn sinh viên và nghiên cứu sinh. Tuy nhiên, các nhà nghiên cứu cũng có thể tìm thấy trong sách nhiều thông tin đáng quan tâm, như làm thế nào để đánh giá một câu hỏi nghiên cứu (research question), thế nào là bài báo khoa học, làm thể nào để thành công trong khoa học, cách viết bài báo khoa học, cách trình bày báo cáo',65000,49000,100,4,2,0,0),(12,'h_235.jpg','Siêu Kinh Tế Học Hài Hước (Tái Bản 2016)','Stephen J. Dubner ','Đang cập nhật','	12-2015','Kinh tế học hài hước - cuốn sách bán chạy nhất theo bình chọn của New York Times - với hơn 4 triệu bản được dịch ra 35 thứ tiếng, thực sự là cuộc cách mạng trong tư duy khiến bất cứ ai từng đọc qua cũng phải thay đổi cách nhìn nhận về thế giới xung quanh. Kinh tế học hài hước - cuốn sách bán chạy nhất theo bình chọn của New York Times - với hơn 4 triệu bản được dịch ra 35 thứ tiếng, thực sự là cuộc cách mạng trong tư duy khiến bất cứ ai từng đọc qua cũng phải thay đổi cách nhìn nhận về thế giới Kinh tế học hài hước - cuốn sách bán chạy nhất theo bình chọn của New York Times - với hơn 4 triệu bản được dịch ra 35 thứ tiếng, thực sự là cuộc cách mạng trong tư duy khiến bất cứ ai từng đọc qua cũng phải thay đổi cách nhìn nhận về thế giới xung quanh. Kinh tế học hài hước - cuốn sách bán chạy nhất theo bình chọn của New York Times - với hơn 4 triệu bản được dịch ra 35 thứ tiếng, thực sự là cuộc cách mạng trong tư duy khiến bất cứ ai từng đọc qua cũng phải thay đổi cách nhìn nhận về thế giới Kinh tế học hài hước - cuốn sách bán chạy nhất theo bình chọn của New York Times - với hơn 4 triệu bản được dịch ra 35 thứ tiếng, thực sự là cuộc cách mạng trong tư duy khiến bất cứ ai từng đọc qua cũng phải thay đổi cách nhìn nhận về thế giới xung quanh. Kinh tế học hài hước - cuốn sách bán chạy nhất theo bình chọn của New York Times - với hơn 4 triệu bản được dịch ra 35 thứ tiếng, thực sự là cuộc cách mạng trong tư duy khiến bất cứ ai từng đọc qua cũng phải thay đổi cách nhìn nhận về thế giới ',109000,76000,100,4,2,0,0),(13,'20408617.jpg','Kể chuyện về kim loại','X.L. Venetxki','NXB Khoa học Kỹ thuật','Đang cập nhật','Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗTác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗTác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗi chương, với vô số các. Tác giả của cuốn sách này là X.I. Venetxki. Qua mỗ',-1,-1,0,2,2,0,0),(14,'3f8e09ee49b538ec00ba24e1e8528eec_3.jpg','Tám mươi ngày vòng quanh thế giới','Jules Verne','NXB Thời Đại','Đang cập nhật','Vậy là ngài Fogg đã thắng cuộc! Ngài đã hoàn thành chuyến đi vòng quanh thế giới trong tám mươi ngày! Để làm được việc đó, ngài đã sử dụng tất cả các phương tiện chuyên chở: tàu khách, xe lửa, xe ngựa, du thuyền, tàu chở hàng, xe trượt tuyết, voi. Con người hào hoa phong nhã đã tỏ rõ những phẩm chất kỳ diệu của mình là sự bình tĩnh và chính xác gần như tuyệt đối. Để rồi sau đó ngài đã được gì từ chuyến đi đặc biệt kia? Vậy là ngài Fogg đã thắng cuộc! Ngài đã hoàn thành chuyến đi vòng quanh thế gVậy là ngài Fogg đã thắng cuộc! Ngài đã hoàn thành chuyến đi vòng quanh thế giới trong tám mươi ngày! Để làm được việc đó, ngài đã sử dụng tất cả các phương tiện chuyên chở: tàu khách, xe lửa, xe ngựa, du thuyền, tàu chở hàng, xe trượt tuyết, voi. Con người hào hoa phong nhã đã tỏ rõ những phẩm chất kỳ diệu của mình là sự bình tĩnh và chính xác gần như tuyệt đối. Để rồi sau đó ngài đã được gì từ chuyến đi đặc biệt kia? Vậy là ngài Fogg đã thắng cuộc! Ngài đã hoàn thành chuyến đi vòng quanh thế gVậy là ngài Fogg đã thắng cuộc! Ngài đã hoàn thành chuyến đi vòng quanh thế giới trong tám mươi ngày! Để làm được việc đó, ngài đã sử dụng tất cả các phương tiện chuyên chở: tàu khách, xe lửa, xe ngựa, du thuyền, tàu chở hàng, xe trượt tuyết, voi. Con người hào hoa phong nhã đã tỏ rõ những phẩm chất kỳ diệu của mình là sự bình tĩnh và chính xác gần như tuyệt đối. Để rồi sau đó ngài đã được gì từ chuyến đi đặc biệt kia? Vậy là ngài Fogg đã thắng cuộc! Ngài đã hoàn thành chuyến đi vòng quanh thế g',-1,-1,0,2,2,0,0),(15,'vat_chu-vat_chu.jpg','Vật Chủ (Tiểu Thuyết Khoa Học Viễn Tưởng)','Stephenie Meyer','NXB Văn Hoá Sài Gòn','06-2010','Trái  đất bị xâm chiếm bởi một kẻ thù giấu mặt. Con người trở thành vật chủ của những kẻ xâm lược ấy, cơ thể vẫn nguyên vẹn song tâm trí thì hoàn toàn bị kiểm soát. Cuộc sống thường ngày vẫn tiếp diễn như không có gì thay đổi. Nhưng tất cả chỉ là vẻ bề ngoài. Trái  đất bị xâm chiếm bởi một kẻ thù giấu mặt. Con người trở thành vật chủ của những kẻ xâm lược ấy, cơ thể vẫn nguyên vẹn song tâm trí thì hoàn toàn bị kiểm soát. Cuộc sống thường ngày vẫn tiếp diễn như không có gì thay đổi. Nhưng tất cả Trái  đất bị xâm chiếm bởi một kẻ thù giấu mặt. Con người trở thành vật chủ của những kẻ xâm lược ấy, cơ thể vẫn nguyên vẹn song tâm trí thì hoàn toàn bị kiểm soát. Cuộc sống thường ngày vẫn tiếp diễn như không có gì thay đổi. Nhưng tất cả chỉ là vẻ bề ngoài. Trái  đất bị xâm chiếm bởi một kẻ thù giấu mặt. Con người trở thành vật chủ của những kẻ xâm lược ấy, cơ thể vẫn nguyên vẹn song tâm trí thì hoàn toàn bị kiểm soát. Cuộc sống thường ngày vẫn tiếp diễn như không có gì thay đổi. Nhưng tất cả Trái  đất bị xâm chiếm bởi một kẻ thù giấu mặt. Con người trở thành vật chủ của những kẻ xâm lược ấy, cơ thể vẫn nguyên vẹn song tâm trí thì hoàn toàn bị kiểm soát. Cuộc sống thường ngày vẫn tiếp diễn như không có gì thay đổi. Nhưng tất cả chỉ là vẻ bề ngoài. Trái  đất bị xâm chiếm bởi một kẻ thù giấu mặt. Con người trở thành vật chủ của những kẻ xâm lược ấy, cơ thể vẫn nguyên vẹn song tâm trí thì hoàn toàn bị kiểm soát. Cuộc sống thường ngày vẫn tiếp diễn như không có gì thay đổi. Nhưng tất cả ',135000,95000,100,3,2,0,0),(16,'27712_34210.jpg','Xứ Cát - Tiểu Thuyết Khoa Học Giả Tưởng Lớn Nhất Mọi Thời Đại','Frank Herbert','Nxb văn học','04/2009','Mãi mãi được vinh danh là một chiến thắng của trí tưởng tượng. Xứ Cát là câu chuyện về chàng Công tước trẻ tuổi Paul Atreides trên hành tinh sa mạc Arrakis, người đã đơn độc dấn thân vào một cuộc phiêu lưu sinh tử, không hề biết rằng mỗi hành động của mình sẽ góp phần quyết định vận mệnh của cả thiên hà. Mãi mãi được vinh danh là một chiến thắng của trí tưởng tượng. Xứ Cát là câu chuyện về chàng Công tước trẻ tuổi Paul Atreides trên hành tinh sa mạc Arrakis, người đã đơn độc dấn thân vào một cuộMãi mãi được vinh danh là một chiến thắng của trí tưởng tượng. Xứ Cát là câu chuyện về chàng Công tước trẻ tuổi Paul Atreides trên hành tinh sa mạc Arrakis, người đã đơn độc dấn thân vào một cuộc phiêu lưu sinh tử, không hề biết rằng mỗi hành động của mình sẽ góp phần quyết định vận mệnh của cả thiên hà. Mãi mãi được vinh danh là một chiến thắng của trí tưởng tượng. Xứ Cát là câu chuyện về chàng Công tước trẻ tuổi Paul Atreides trên hành tinh sa mạc Arrakis, người đã đơn độc dấn thân vào một cuộMãi mãi được vinh danh là một chiến thắng của trí tưởng tượng. Xứ Cát là câu chuyện về chàng Công tước trẻ tuổi Paul Atreides trên hành tinh sa mạc Arrakis, người đã đơn độc dấn thân vào một cuộc phiêu lưu sinh tử, không hề biết rằng mỗi hành động của mình sẽ góp phần quyết định vận mệnh của cả thiên hà. Mãi mãi được vinh danh là một chiến thắng của trí tưởng tượng. Xứ Cát là câu chuyện về chàng Công tước trẻ tuổi Paul Atreides trên hành tinh sa mạc Arrakis, người đã đơn độc dấn thân vào một cuộ',12000,96000,100,3,2,0,0);
/*!40000 ALTER TABLE `tblBook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblBookDeals`
--

DROP TABLE IF EXISTS `tblBookDeals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBookDeals` (
  `idBookDeals` int(11) NOT NULL AUTO_INCREMENT,
  `idDeals` int(11) DEFAULT NULL,
  `idBook` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBookDeals`),
  KEY `fk_tblBookDeals_tblDeals_idx` (`idDeals`),
  KEY `fk_tblBookDeals_tblBook_idx` (`idBook`),
  CONSTRAINT `fk_tblBookDeals_tblBook` FOREIGN KEY (`idBook`) REFERENCES `tblBook` (`idBook`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tblBookDeals_tblDeals` FOREIGN KEY (`idDeals`) REFERENCES `tblDeals` (`idDeals`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBookDeals`
--

LOCK TABLES `tblBookDeals` WRITE;
/*!40000 ALTER TABLE `tblBookDeals` DISABLE KEYS */;
INSERT INTO `tblBookDeals` VALUES (2,1,2),(4,1,9),(7,1,3),(9,1,14),(10,1,13),(12,3,1),(14,3,6),(15,3,13),(16,1,5),(17,1,7),(18,1,10),(21,10,5),(22,10,4);
/*!40000 ALTER TABLE `tblBookDeals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblBookOrder`
--

DROP TABLE IF EXISTS `tblBookOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBookOrder` (
  `idBookOrder` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `idBook` int(11) DEFAULT NULL,
  `idCart` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBookOrder`),
  KEY `fk_tblBookOrder_tblBook_idx` (`idBook`),
  KEY `fk_tblBookOrder_tblCart_idx` (`idCart`),
  CONSTRAINT `fk_tblBookOrder_tblBook` FOREIGN KEY (`idBook`) REFERENCES `tblBook` (`idBook`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tblBookOrder_tblCart` FOREIGN KEY (`idCart`) REFERENCES `tblCart` (`idCart`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBookOrder`
--

LOCK TABLES `tblBookOrder` WRITE;
/*!40000 ALTER TABLE `tblBookOrder` DISABLE KEYS */;
INSERT INTO `tblBookOrder` VALUES (1,4,384000,16,1),(2,1,76000,12,1),(3,1,96000,16,2),(4,1,30000,1,2),(5,1,53000,9,2),(6,1,57400,2,3),(7,1,25000,3,3),(8,1,42000,4,3),(9,6,150000,3,5),(10,6,150000,3,6),(11,6,150000,3,7),(12,6,150000,3,8),(13,6,150000,3,9),(14,6,150000,3,10),(15,6,150000,3,11),(16,6,150000,3,12),(17,10,950000,15,13),(18,10,490000,11,14),(19,8,768000,16,15),(20,7,672000,16,16),(21,9,864000,16,17),(22,10,960000,16,18),(23,10,960000,16,19),(24,10,300000,1,20),(25,8,240000,1,21),(26,10,530000,9,22),(27,8,240000,1,23),(28,8,424000,9,24),(29,3,75000,3,25),(30,8,768000,16,25),(31,10,960000,16,26),(32,1,76000,12,27),(33,1,30000,1,27),(34,1,96000,16,27),(35,1,96000,16,28),(36,1,76000,12,28),(37,1,53000,9,28),(38,7,672000,16,29),(39,1,96000,16,30),(40,1,76000,12,30),(41,1,53000,9,30),(42,1,95000,15,30),(43,1,96000,16,31),(44,7,532000,12,31),(45,10,530000,9,31),(46,8,240000,1,32),(47,1,96000,16,33),(48,7,665000,15,33),(49,7,665000,15,34),(50,9,270000,1,34),(51,1,96000,16,35),(52,5,475000,15,35);
/*!40000 ALTER TABLE `tblBookOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblBookSet`
--

DROP TABLE IF EXISTS `tblBookSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBookSet` (
  `idBookSet` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idBookSet`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBookSet`
--

LOCK TABLES `tblBookSet` WRITE;
/*!40000 ALTER TABLE `tblBookSet` DISABLE KEYS */;
INSERT INTO `tblBookSet` VALUES (1,'Bộ sách cho Thiếu nhi','Bộ sách dành cho Thiếu nhi'),(2,'Bộ sách cho Nghiên cứu khoa học','Bộ sách dành cho nghiên cứu khoa học');
/*!40000 ALTER TABLE `tblBookSet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCardBank`
--

DROP TABLE IF EXISTS `tblCardBank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCardBank` (
  `idCardBank` int(11) NOT NULL AUTO_INCREMENT,
  `cardType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nameOwner` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nameCard` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateReissue` date DEFAULT NULL,
  `idBank` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCardBank`),
  KEY `fk_tblCardBank_tblBank_idx` (`idBank`),
  CONSTRAINT `fk_tblCardBank_tblBank` FOREIGN KEY (`idBank`) REFERENCES `tblBank` (`idBank`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCardBank`
--

LOCK TABLES `tblCardBank` WRITE;
/*!40000 ALTER TABLE `tblCardBank` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblCardBank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCardPoint`
--

DROP TABLE IF EXISTS `tblCardPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCardPoint` (
  `idCardPoint` int(11) NOT NULL AUTO_INCREMENT,
  `cardCode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `points` int(11) DEFAULT '0',
  `idCustomer` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCardPoint`),
  KEY `fk_tblCardPoint_tblCustomer_idx` (`idCustomer`),
  CONSTRAINT `fk_tblCardPoint_tblCustomer` FOREIGN KEY (`idCustomer`) REFERENCES `tblCustomer` (`idCustomer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCardPoint`
--

LOCK TABLES `tblCardPoint` WRITE;
/*!40000 ALTER TABLE `tblCardPoint` DISABLE KEYS */;
INSERT INTO `tblCardPoint` VALUES (1,'QWERTY',78,1),(2,'ASDFGH',13,2),(3,'604A8E',5,27),(4,'D41PKT',10,28),(5,'6A559R',5,29),(6,'MOGAEI',10,33),(7,'VE9NAW',0,36),(12,'LPSUYX',0,41),(13,'KPCQ7J',0,42),(14,'L0ZGG6',0,43),(15,'UI552V',0,44),(16,'3NY1MA',0,45),(17,'N77PVE',13,46);
/*!40000 ALTER TABLE `tblCardPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCart`
--

DROP TABLE IF EXISTS `tblCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCart` (
  `idCart` int(11) NOT NULL AUTO_INCREMENT,
  `bonnusPoint` int(11) DEFAULT '0',
  PRIMARY KEY (`idCart`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCart`
--

LOCK TABLES `tblCart` WRITE;
/*!40000 ALTER TABLE `tblCart` DISABLE KEYS */;
INSERT INTO `tblCart` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,7),(29,7),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0);
/*!40000 ALTER TABLE `tblCart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCartSave`
--

DROP TABLE IF EXISTS `tblCartSave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCartSave` (
  `idCartSave` int(11) NOT NULL AUTO_INCREMENT,
  `idCart` int(11) DEFAULT NULL,
  `idCustomerMember` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCartSave`),
  KEY `fk_tblCartSave_tblCart_idx` (`idCart`),
  KEY `fk_tblCartSave_tblCustomerMember_idx` (`idCustomerMember`),
  CONSTRAINT `fk_tblCartSave_tblCart` FOREIGN KEY (`idCart`) REFERENCES `tblCart` (`idCart`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tblCartSave_tblCustomerMember` FOREIGN KEY (`idCustomerMember`) REFERENCES `tblCustomerMember` (`idCustomerMember`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCartSave`
--

LOCK TABLES `tblCartSave` WRITE;
/*!40000 ALTER TABLE `tblCartSave` DISABLE KEYS */;
INSERT INTO `tblCartSave` VALUES (2,27,1);
/*!40000 ALTER TABLE `tblCartSave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCategory`
--

DROP TABLE IF EXISTS `tblCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCategory` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCategory`
--

LOCK TABLES `tblCategory` WRITE;
/*!40000 ALTER TABLE `tblCategory` DISABLE KEYS */;
INSERT INTO `tblCategory` VALUES (1,'Tình cảm','Sách tình cảm'),(2,'Truyện ngắn','Sách truyện ngắn'),(3,'Tiểu thuyết','Sách tiểu thuyết'),(4,'Sách nghiên cứu','Sách nghiên cứu');
/*!40000 ALTER TABLE `tblCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCustomer`
--

DROP TABLE IF EXISTS `tblCustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCustomer` (
  `idCustomer` int(11) NOT NULL AUTO_INCREMENT,
  `phoneNum` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idPerson` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCustomer`),
  KEY `fk_tblCustomer_tblPerson_idx` (`idPerson`),
  CONSTRAINT `fk_tblCustomer_tblPerson` FOREIGN KEY (`idPerson`) REFERENCES `tblPerson` (`idPerson`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCustomer`
--

LOCK TABLES `tblCustomer` WRITE;
/*!40000 ALTER TABLE `tblCustomer` DISABLE KEYS */;
INSERT INTO `tblCustomer` VALUES (1,'0123123123','txt.d12ptit@gmail.com',2),(2,'0123456789','tienxuantran@gmail.com',3),(3,'0123456789','email@gmail.com',4),(4,'0123456678','tien1@gmail.com',5),(5,'0123456678','tien1@gmail.com',6),(6,'0123456789','132@gmail.com',7),(7,'0123456789','123@gmail.com',1),(8,'0123456789','123@gmail.com',1),(9,'0123456789','123@gmail.com',1),(10,'0123456789','123@gmail.com',1),(14,'0123456789','tienxuantran@gmail.com',1),(15,'0123456678','tienxuantran@gmail.com',1),(16,'01663936645','tienxuantran@gmail.com',1),(17,'01663936645','tienxuantran@gmail.com',1),(18,'0123456789','tienxuantran@gmail.com',1),(19,'0123456789','123@gmail.com',1),(20,'0123456789','txt.d12ptit@gmail.com',8),(21,'0123456789','txt.d12ptit@gmail.com',9),(22,'0156994','quannalc@gmail.com',10),(23,'0123456789','txt.d12ptit@gmail.com',11),(24,'0123456789','tienxuantran@gmail.com',12),(25,'123456789','duongph@gmail.com',13),(26,'123456789','duongph@gmail.com',14),(27,'0123456789','tienxuantran@gmail.com',1),(28,'0123456789','tienxuantran@gmail.com',1),(29,'0123456789','tienxuantran@gmail.com',1),(30,'0123456789','tctc@gmail.com',1),(31,'0123456789','tctc@gmail.com',1),(32,'0123456789','tctc@gmail.com',1),(33,'0123456789','tienxuantran@gmail.com',1),(34,'0123456789','tctc@gmail.com',1),(35,'0123456789','tctc@gmail.com',1),(36,'0123456789','tctc@gmail.com',1),(37,'0123456789','binhanhvu.gnt@gmail.com',15),(38,'0123456789','binhanhvu.gnt@gmail.com',16),(39,'0123123123','bav@gmail.com',17),(40,'0123234234','nguyenanhphuong@gmail.com',18),(41,'0123234234','nguyenanhquan@gmail.com',19),(42,'0123234234','nguyenanhquan@gmail.com',20),(43,'0123234234','nguyenanhquan@gmail.com',21),(44,'0123234234','nguyenanhquan@gmail.com',22),(45,'0123123123','gay@gmail.com',23),(46,'0123456789','tienxuantran@gmail.com',1);
/*!40000 ALTER TABLE `tblCustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCustomerMember`
--

DROP TABLE IF EXISTS `tblCustomerMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCustomerMember` (
  `idCustomerMember` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idKcoinBank` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `idCustomer` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCustomerMember`),
  KEY `fk_tblCustomerMember_tblKcoinBank_idx` (`idKcoinBank`),
  KEY `fk_tblCustomerMember_tblCustomer_idx` (`idCustomer`),
  CONSTRAINT `fk_tblCustomerMember_tblCustomer` FOREIGN KEY (`idCustomer`) REFERENCES `tblCustomer` (`idCustomer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tblCustomerMember_tblKcoinBank` FOREIGN KEY (`idKcoinBank`) REFERENCES `tblKcoinBank` (`idKcoinBank`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCustomerMember`
--

LOCK TABLES `tblCustomerMember` WRITE;
/*!40000 ALTER TABLE `tblCustomerMember` DISABLE KEYS */;
INSERT INTO `tblCustomerMember` VALUES (1,'tientxc','tientxc',1,'2016-03-23',1),(2,'tienxuantran','123456',2,'2016-03-27',2),(3,'tendemho','123456',3,'2016-03-27',3),(4,'tien123','123456',1,'2016-03-27',6),(5,'tientx3','tientx3',1,'2016-04-11',20),(6,'tientx4','tientx4',1,'2016-04-11',21),(7,'maxcda101','chochimcu',1,'2016-04-11',22),(8,'abcabc','abcabc',1,'2016-04-13',23),(11,'binhvu','binhvu',1,'2016-04-19',37),(13,'binhanhvu','binhanhvu',1,'2016-04-19',39),(14,'phuonganhnguyen','phuonganhnguyen',1,'2016-04-19',40),(15,'nguyenanhquan','nguyenanhquan',1,'2016-04-19',41),(19,'gaygay','gaygay',1,'2016-04-19',45);
/*!40000 ALTER TABLE `tblCustomerMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDeals`
--

DROP TABLE IF EXISTS `tblDeals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDeals` (
  `idDeals` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT '0',
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`idDeals`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDeals`
--

LOCK TABLES `tblDeals` WRITE;
/*!40000 ALTER TABLE `tblDeals` DISABLE KEYS */;
INSERT INTO `tblDeals` VALUES (1,'SEALEOFF50','Giảm giá 50% tất cả các loại sách',50,'2016-04-06','2016-12-06',1),(3,'SEALEOFF2','Giảm giá 2% tất cả các loại sách',2,'2016-06-06','2016-10-06',1),(10,'SEALEOFF10','Giảm giá 10% tất cả các loại sách',10,'2016-06-06','2016-10-06',1);
/*!40000 ALTER TABLE `tblDeals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblEmployee`
--

DROP TABLE IF EXISTS `tblEmployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEmployee` (
  `idEmployee` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phoneNum` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idPerson` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`),
  KEY `fk_tblEmployee_tblPerson_idx` (`idPerson`),
  CONSTRAINT `fk_tblEmployee_tblPerson` FOREIGN KEY (`idPerson`) REFERENCES `tblPerson` (`idPerson`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblEmployee`
--

LOCK TABLES `tblEmployee` WRITE;
/*!40000 ALTER TABLE `tblEmployee` DISABLE KEYS */;
INSERT INTO `tblEmployee` VALUES (1,'tientx','tientx','0123456789','txt.d12ptit@gmail.com','seller',1),(2,'phuongbn','phuongbn','0123456789','phuongbn@gmail.com','staffManager',1),(3,'tientx2','tientx2','0123456789','tientx2@gmail.com','staffStore',1);
/*!40000 ALTER TABLE `tblEmployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblFullName`
--

DROP TABLE IF EXISTS `tblFullName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblFullName` (
  `idFullName` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middleName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idFullName`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblFullName`
--

LOCK TABLES `tblFullName` WRITE;
/*!40000 ALTER TABLE `tblFullName` DISABLE KEYS */;
INSERT INTO `tblFullName` VALUES (1,'Tien','Xuan','Tran'),(2,'Tiến','Xuân','Trần'),(3,'Tên','Đệm','Họ'),(4,'tien1','tien1','tien1'),(5,'tien1','tien1','tien1'),(6,'tien1','tien1','tien1'),(7,'0','0','0'),(8,'Trần','Trần','Trần'),(9,'Trần','Quân','Phương'),(10,'Quan','Anh','nguyen'),(11,'1231213123','ưẻwre','ưẻ'),(12,'Tiến','Xuân','Trần'),(13,'Duong','Hoang','Pham'),(14,'Duong','Hoang','Pham'),(15,'Binh','Anh','Vu'),(16,'Binh','Anh','Vu'),(17,'Bình','Anh','Vũ'),(18,'Phuong','Anh','Nguyen'),(19,'Quân','Anh','Nguyễn'),(20,'Quân','Anh','Nguyễn'),(21,'Quân','Anh','Nguyễn'),(22,'Quân','Anh','Nguyễn'),(23,'Gay','Gay','Gay');
/*!40000 ALTER TABLE `tblFullName` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKcoinBank`
--

DROP TABLE IF EXISTS `tblKcoinBank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblKcoinBank` (
  `idKcoinBank` int(11) NOT NULL AUTO_INCREMENT,
  `idBank` int(11) DEFAULT NULL,
  PRIMARY KEY (`idKcoinBank`),
  KEY `fk_tblKcoinBank_tblBank_idx` (`idBank`),
  CONSTRAINT `fk_tblKcoinBank_tblBank` FOREIGN KEY (`idBank`) REFERENCES `tblBank` (`idBank`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKcoinBank`
--

LOCK TABLES `tblKcoinBank` WRITE;
/*!40000 ALTER TABLE `tblKcoinBank` DISABLE KEYS */;
INSERT INTO `tblKcoinBank` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23);
/*!40000 ALTER TABLE `tblKcoinBank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblOrder`
--

DROP TABLE IF EXISTS `tblOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblOrder` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `idPayment` int(11) DEFAULT NULL,
  `idShippingInfor` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `state` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fk_tblOrder_tblPayment_idx` (`idPayment`),
  KEY `fk_tblOrder_tblShippingInfor_idx` (`idShippingInfor`),
  CONSTRAINT `fk_tblOrder_tblPayment` FOREIGN KEY (`idPayment`) REFERENCES `tblPayment` (`idPayment`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tblOrder_tblShippingInfor` FOREIGN KEY (`idShippingInfor`) REFERENCES `tblShippingInfor` (`idShippingInfor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblOrder`
--

LOCK TABLES `tblOrder` WRITE;
/*!40000 ALTER TABLE `tblOrder` DISABLE KEYS */;
INSERT INTO `tblOrder` VALUES (1,1,1,'2016-03-28','Đang xử lý'),(2,2,2,'2016-03-28','Đang xử lý'),(4,5,5,'2016-03-29','Đã gửi'),(19,22,22,'2016-03-29','Đang giao hàng'),(20,23,23,'2016-03-30','Đã gửi'),(21,24,24,'2016-03-30','Đang giao hàng'),(22,25,25,'2016-04-01','Đã nhận'),(23,26,83,'2016-04-18','Đã gửi'),(24,29,86,'2016-04-18','Đã gửi'),(25,30,87,'2016-04-18','Đã gửi'),(26,31,88,'2016-04-18','Đã gửi'),(27,32,89,'2016-04-18','Đã gửi'),(28,33,90,'2016-04-18','Đã gửi'),(29,34,94,'2016-04-18','Đã gửi'),(30,35,97,'2016-04-18','Đã gửi'),(31,36,98,'2016-04-19','Đã gửi');
/*!40000 ALTER TABLE `tblOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPayment`
--

DROP TABLE IF EXISTS `tblPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPayment` (
  `idPayment` int(11) NOT NULL AUTO_INCREMENT,
  `idCart` int(11) DEFAULT NULL,
  `idBank` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPayment`),
  KEY `fk_tblPayment_tblCart_idx` (`idCart`),
  KEY `fk_tblPayment_tblBank_idx` (`idBank`),
  CONSTRAINT `fk_tblPayment_tblBank` FOREIGN KEY (`idBank`) REFERENCES `tblBank` (`idBank`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tblPayment_tblCart` FOREIGN KEY (`idCart`) REFERENCES `tblCart` (`idCart`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPayment`
--

LOCK TABLES `tblPayment` WRITE;
/*!40000 ALTER TABLE `tblPayment` DISABLE KEYS */;
INSERT INTO `tblPayment` VALUES (1,2,4),(2,3,5),(4,4,7),(5,5,8),(6,6,9),(7,7,10),(8,8,11),(9,9,12),(10,10,13),(11,11,14),(12,12,15),(13,13,16),(14,14,17),(17,17,NULL),(18,18,NULL),(19,19,NULL),(20,20,NULL),(21,21,NULL),(22,22,18),(23,23,NULL),(24,24,NULL),(25,25,NULL),(26,26,19),(29,28,22),(30,29,23),(31,30,NULL),(32,31,NULL),(33,32,NULL),(34,33,NULL),(35,34,NULL),(36,35,NULL);
/*!40000 ALTER TABLE `tblPayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPerson`
--

DROP TABLE IF EXISTS `tblPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPerson` (
  `idPerson` int(11) NOT NULL AUTO_INCREMENT,
  `idFullName` int(11) DEFAULT NULL,
  `idAddress` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPerson`),
  KEY `fk_tblPerson_tblFullName_idx` (`idFullName`),
  KEY `fk_tblPerson_tblAddress_idx` (`idAddress`),
  CONSTRAINT `fk_tblPerson_tblAddress` FOREIGN KEY (`idAddress`) REFERENCES `tblAddress` (`idAddress`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tblPerson_tblFullName` FOREIGN KEY (`idFullName`) REFERENCES `tblFullName` (`idFullName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPerson`
--

LOCK TABLES `tblPerson` WRITE;
/*!40000 ALTER TABLE `tblPerson` DISABLE KEYS */;
INSERT INTO `tblPerson` VALUES (1,1,1),(2,1,1),(3,2,2),(4,3,3),(5,4,4),(6,5,5),(7,6,6),(8,8,7),(9,9,8),(10,10,9),(11,11,10),(12,12,11),(13,13,12),(14,14,13),(15,15,14),(16,16,15),(17,17,16),(18,18,17),(19,19,18),(20,20,19),(21,21,20),(22,22,21),(23,23,22);
/*!40000 ALTER TABLE `tblPerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblShippingInfor`
--

DROP TABLE IF EXISTS `tblShippingInfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblShippingInfor` (
  `idShippingInfor` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lane` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ward` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idCustomer` int(11) DEFAULT NULL,
  PRIMARY KEY (`idShippingInfor`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblShippingInfor`
--

LOCK TABLES `tblShippingInfor` WRITE;
/*!40000 ALTER TABLE `tblShippingInfor` DISABLE KEYS */;
INSERT INTO `tblShippingInfor` VALUES (1,'3','170','Tân Triều','Thanh Trì','Thanh Trì','Hà Nội','Việt Nam',1),(2,'333','Fafim','Ntssss','Ngã Tư Sở','Đống Đa','Hà Nội','Việt Nam',1),(3,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(4,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(5,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(6,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(7,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(8,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(9,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(10,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(11,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(12,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(13,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(14,'123123','123123','123123','123123','123123','123123','Việt Nam',1),(15,'123123','123123','123123','123123','123123','123123','Việt Nam',7),(16,'123123','123123','123123','123123','123123','123123','Việt Nam',8),(17,'123123','123123','123123','123123','123123','123123','Việt Nam',9),(18,'123123','123123','123123','123123','123123','123123','Việt Nam',10),(19,'02','170','Trần Phú','Tân Triều','Thanh Trì','Hà Nội','Việt Nam',14),(20,'123345','123','123123','123123','Thanh Trì','Hà Nội','Việt Nam',15),(21,'123345','170','123123','Trần Phú','Thanh Trì','Hà Nội','Việt Nam',16),(22,'02','Trần Phú','Tân Triều','Trần Phú','Thanh Trì','Hà Nội','Việt Nam',1),(23,'123','Trần Phú','Trần Phú','Tân Triều','Thanh Trì','Hà Nội','Việt Nam',17),(24,'123','170','Trần Phú','Tân Triều','Thanh Trì','Hà Nội','Việt Nam',18),(25,'123123','123123aaaa','123123aaaa','123123aaa','123123aa','123123a','Việt Nam',19),(26,'123','Trần Phú','Tân Triều','Trần Phú','Thanh Trì','Hà Nội','Việt Nam',1),(27,'123','Trần Phú','Tân Triều','Trần Phú','Thanh Trì','Hà Nội','Việt Nam',1),(28,'123','Trần Phú','Tân Triều','Trần Phú','Thanh Trì','Hà Nội','Việt Nam',1),(29,'123','Trần Phú','Tân Triều','Trần Phú','Thanh Trì','Hà Nội','Việt Nam',1),(30,'123','Trần Phú','Tân Triều','Trần Phú','Thanh Trì','Hà Nội','Việt Nam',1),(31,'123','Trần Phú','Tân Triều','Trần Phú','Thanh Trì','Hà Nội','Việt Nam',1),(32,'123','Trần Phú','Tân Triều','Trần Phú','Thanh Trì','Hà Nội','Việt Nam',1),(33,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(34,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(35,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(36,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(37,'74','123123','123123','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(38,'74','123123','123123','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(39,'74','123123','123123','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(40,'74','123123','123123','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(41,'74','123123','123123','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(42,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(43,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(44,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(45,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(46,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(47,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(48,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(49,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(50,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(51,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(52,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(53,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(54,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(55,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(56,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(57,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(58,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(59,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(60,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(61,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(62,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(63,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(64,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(65,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(66,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(67,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(68,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(69,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(70,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(71,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(72,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(73,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(74,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(75,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(76,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(77,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(78,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(79,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(80,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(81,'74','90','123123','to doan ket','Phương Gay','123123','Việt Nam',1),(82,'123123','Quân Gay','Van An','to doan ket','Phương Gay','Lai Chau','Việt Nam',1),(83,'123123','123123','Van An','123123aaa','Phương Gay','123123','Việt Nam',1),(84,'333','Fafim','Ntssss','Ngã Tư Sở','Đống Đa','Hà Nội','Việt Nam',1),(85,'333','Fafim','aaaaaddd','Ngã Tư Sở','Đống Đa','Hà Nội','Việt Nam',1),(86,'333','Fafim','aaaaaddd','Ngã Tư Sở','Đống Đa','Hà Nội','Việt Nam',1),(87,'123123','123123','123123aaaa','to doan ket','Lai Chau','Lai Chau','Việt Nam',1),(88,'123123','123123','123123','123123','123123','Lai Chau','Việt Nam',27),(89,'74','123123','123123','123123aaa','Lai Chau','Lai Chau','Việt Nam',28),(90,'74','Quân Gay','123123','to doan ket','Phương Gay','123123a','Việt Nam',29),(91,'123123','123123aaaa','123123aaaa','to doan ket','Lai Chau','123123','Việt Nam',30),(92,'123123','123123aaaa','123123aaaa','to doan ket','Lai Chau','123123','Việt Nam',31),(93,'123123','123123','123123aaaa','123123aaa','123123','123123','Việt Nam',32),(94,'123123','123123','123123aaaa','123123aaa','123123','123123','Việt Nam',33),(95,'74','123123','123123','to doan ket','123123','Lai Chau','Việt Nam',34),(96,'74','123123','123123','to doan ket','123123','Lai Chau','Việt Nam',35),(97,'74','123123','123123','to doan ket','123123','Lai Chau','Việt Nam',36),(98,'74','123123','Van An','123123','Lai Chau','Lai Chau','Việt Nam',46);
/*!40000 ALTER TABLE `tblShippingInfor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-20  1:32:45
