-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2024-12-13 21:46:04
-- 伺服器版本： 8.0.38
-- PHP 版本： 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `furnitureshop`
--

-- --------------------------------------------------------

--
-- 資料表結構 `addbook`
--

CREATE TABLE `addbook` (
  `addressid` int NOT NULL COMMENT '地址ID',
  `setdefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT '預設收件人',
  `emailid` int NOT NULL COMMENT '會員編號',
  `cname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '收件者姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '收件者電話',
  `myzip` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '郵遞區號',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '收件地址',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `addbook`
--

INSERT INTO `addbook` (`addressid`, `setdefault`, `emailid`, `cname`, `mobile`, `myzip`, `address`, `create_date`) VALUES
(1, 1, 1, '測試1', '0933555555', '103', '臺北市大同區', '2024-09-08 11:50:26'),
(2, 1, 1, '測試2', '0988888888', '223', '中正路2號', '2024-09-08 14:56:28'),
(3, 0, 1, '測試3', '0977777777', '223', '中正路1號', '2024-09-08 14:56:28');

-- --------------------------------------------------------

--
-- 資料表結構 `carousel`
--

CREATE TABLE `carousel` (
  `caro_id` int NOT NULL COMMENT '輪播編號',
  `caro_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '輪播標題',
  `caro_content` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '輪播內容介紹',
  `caro_online` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架',
  `caro_sort` int NOT NULL COMMENT '輪播排序',
  `caro_pic` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '輪播圖檔名稱',
  `p_id` int NOT NULL COMMENT '產品編號',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cartid` int NOT NULL COMMENT '購物車編號',
  `emailid` int DEFAULT NULL COMMENT '會員編號',
  `p_id` int NOT NULL COMMENT '產品編號',
  `qty` int NOT NULL COMMENT '產品數量',
  `orderid` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '訂單編號',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `ip` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '訂購者的IP',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入購物車時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `city`
--

CREATE TABLE `city` (
  `AutoNo` int NOT NULL COMMENT '城市編號',
  `Name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '城市名稱',
  `cityOrder` tinyint NOT NULL COMMENT '標記',
  `State` smallint NOT NULL COMMENT '狀態'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `city`
--

INSERT INTO `city` (`AutoNo`, `Name`, `cityOrder`, `State`) VALUES
(1, '臺北市', 0, 0),
(2, '基隆市', 0, 0),
(3, '新北市', 0, 0),
(4, '宜蘭縣', 0, 0),
(5, '新竹市', 0, 0),
(6, '新竹縣', 0, 0),
(7, '桃園市', 0, 0),
(8, '苗栗縣', 0, 0),
(9, '台中市', 0, 0),
(10, '彰化縣', 0, 0),
(11, '南投縣', 0, 0),
(12, '雲林縣', 0, 0),
(13, '嘉義市', 0, 0),
(14, '嘉義縣', 0, 0),
(15, '台南市', 0, 0),
(16, '高雄市', 0, 0),
(17, '南海諸島', 0, 0),
(18, '澎湖縣', 0, 0),
(19, '屏東縣', 0, 0),
(20, '台東縣', 0, 0),
(21, '花蓮縣', 0, 0),
(22, '金門縣', 0, 0),
(23, '連江縣', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `hot`
--

CREATE TABLE `hot` (
  `h_id` int NOT NULL COMMENT '熱銷商品流水號',
  `p_id` int NOT NULL COMMENT '產品編號',
  `h_sort` int DEFAULT NULL COMMENT '熱銷商品排名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `emailid` int NOT NULL COMMENT 'email流水號',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'email帳號',
  `pw1` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '密碼',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否啟動',
  `cname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '中文姓名',
  `tssn` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '身份證字號',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `imgname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '相片檔名',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`emailid`, `email`, `pw1`, `active`, `cname`, `tssn`, `birthday`, `imgname`, `create_date`) VALUES
(1, 'test@gmail.com', '123456', 1, '測試1', 'A123456789', '2024-09-01', NULL, '2024-09-01 09:20:29'),
(5, '44@gmail.com', '$2y$10$b5KbYRhn89HNLftojw5s8OC5l6aF2nX/d/4yCPDBNAI4jfGyuX9yu', 1, '測試2', NULL, '2020-02-04', NULL, '2024-10-26 11:01:40');

-- --------------------------------------------------------

--
-- 資料表結構 `multiselect`
--

CREATE TABLE `multiselect` (
  `msid` int NOT NULL COMMENT '多功能選擇ID',
  `mslevel` int NOT NULL COMMENT '多功能選擇層級',
  `msuplink` int NOT NULL COMMENT '上層連結',
  `opcode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '外掛參數',
  `msname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '多功能選擇名稱',
  `msort` int DEFAULT NULL COMMENT '各功能列表排序',
  `url1` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '外掛網址1',
  `url2` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '外掛網址2',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '修改日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `multiselect`
--

INSERT INTO `multiselect` (`msid`, `mslevel`, `msuplink`, `opcode`, `msname`, `msort`, `url1`, `url2`, `create_date`, `update_date`) VALUES
(1, 1, 0, NULL, '付款方式', 0, NULL, NULL, '2023-08-11 09:46:53', '2023-08-17 03:42:28'),
(2, 1, 0, NULL, '訂單處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(3, 2, 1, NULL, '貨到付款', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:37'),
(4, 2, 1, NULL, '信用卡付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:54'),
(5, 2, 1, NULL, '銀行轉帳', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:37'),
(6, 2, 1, NULL, '電子支付', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:51'),
(7, 2, 2, NULL, '處理中', 1, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:03'),
(8, 2, 2, NULL, '待出貨', 2, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:32'),
(9, 2, 2, NULL, '運送中', 3, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:45'),
(10, 2, 2, NULL, '收貨完成', 4, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:10'),
(11, 2, 2, NULL, '退貨中', 5, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:24'),
(12, 2, 2, NULL, '已關閉訂單', 6, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:35'),
(13, 2, 2, NULL, '無效訂單', 7, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 05:39:26'),
(14, 2, 2, NULL, '訂單確認', 8, NULL, NULL, '2023-08-18 06:13:47', '2023-10-23 12:37:36'),
(15, 2, 2, NULL, '平台出貨', 9, NULL, NULL, '2023-08-18 06:13:47', '2023-10-25 08:29:31'),
(34, 1, 0, NULL, '付款處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(35, 2, 34, NULL, '待貨到付款', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(36, 2, 34, NULL, '完成付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(37, 2, 34, NULL, '未完成付款', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(38, 2, 34, NULL, '貨到付款已完成', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `p_id` int NOT NULL COMMENT '產品編號',
  `classid` int NOT NULL COMMENT '產品類別',
  `p_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '產品名稱',
  `p_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '產品類型',
  `p_intro` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '產品簡介',
  `p_price` int DEFAULT NULL COMMENT '產品單價',
  `p_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上架',
  `p_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci COMMENT '產品詳細規格',
  `p_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '產品輸入日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_type`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(31, 147, '棕黑色餐椅', '餐椅', '椅套可除下清洗，有小朋友家庭的好選擇，經常曬晾或洗濯椅套，可以讓椅套保持清爽乾淨，更可減少家居的灰塵和污垢，只有6枚螺絲，組裝容易，實木椅框堅固耐用，無扶手設計讓你可以把餐椅完全推入桌底，節省空間', 1199, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"椅套可除下清洗，有小朋友家庭的好選擇，經常曬晾或洗濯椅套，可以讓椅套保持清爽乾淨，更可減少家居的灰塵和污垢，只有6枚螺絲，組裝容易，實木椅框堅固耐用，無扶手設計讓你可以把餐椅完全推入桌底，節省空間\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>椅套可除下清洗，有小朋友家庭的好選擇<br>經常曬晾或洗濯椅套，可以讓椅套保持清爽乾淨，更可減少家居的灰塵和污垢</p>\r\n        <p>實木椅框堅固耐用，只有6枚螺絲，組裝容易<br>無扶手設計讓你可以把餐椅完全推入桌底，節省空間</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>布套可拆洗<br>如果當地機構提供相關服務，可進行回收利用<br>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>布套的耐光等級5-6(抗褪色，等級1-8)；依據工業標準，耐光等級4以上適合居家空間使用</p>\r\n\r\n        <p>布套的耐磨性通過40,000次測試；通過測試次數15,000次以上，表示家具適合居家日常生活使用；通過測試次數30,000次以上表示家具擁有極佳的耐磨性</p>\r\n\r\n        <p>餐椅已經通過家用作測試，並且符合以下標準的安全、耐用及穩定性標準：EN 12520及EN 1022</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">框架</td>\r\n                <td class=\"td2\">實心松木, 染色</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">坐椅</td>\r\n                <td class=\"td2\">纖維板, 高回彈PU泡棉(冷塑泡棉) (35公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">靠背</td>\r\n                <td class=\"td2\">實心松木, PU泡棉 (35公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">布套/ 布料:</td>\r\n                <td class=\"td2\">100%聚酯纖維 (至少90%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">淨重</td>\r\n                <td class=\"td2\">3.56公斤</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p><span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            可用機洗，一般洗衣程序，水溫最高 40°C <br>\r\n            不可使用漂白劑。 <br>\r\n            請勿烘乾 <br>\r\n            熨斗熨燙溫度最高為150°C <br>\r\n            不可乾洗。 <br>\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">框架</span><br>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性<br>\r\n\r\n        </p>\r\n\r\n\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(32, 147, '米色泡膠餐椅', '餐椅', '吃得舒適又時尚， 無論你是長時間用餐，和親友共享開心的時光，或者是一人獨處，這款餐椅也很合適，\r\n波浪紋彈簧有很好的彈力，能提升舒適度，泡膠內墊有助分散椅墊的壓力，\r\n只要適時為椅子更換椅套，不單能為居家添上新鮮感，而且椅子將更加耐用，\r\n用膳完畢，可除下餐椅套可放入機洗，清潔容易，實木椅腳，耐用的天然材質', 4499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"吃得舒適又時尚， 無論你是長時間用餐，和親友共享開心的時光，或者是一人獨處，這款餐椅也很合適，\r\n波浪紋彈簧有很好的彈力，能提升舒適度，泡膠內墊有助分散椅墊的壓力，\r\n只要適時為椅子更換椅套，不單能為居家添上新鮮感，而且椅子將更加耐用，\r\n用膳完畢，可除下餐椅套可放入機洗，清潔容易，實木椅腳，耐用的天然材質\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n\r\n        <p>吃得舒適又時尚， 無論你是長時間用餐，和親友共享開心的時光，或者是一人獨處，這款餐椅也很合適</p>\r\n\r\n        <p>\r\n            波浪紋彈簧有很好的彈力，能提升舒適度泡膠內墊，有助分散椅墊的壓力\r\n            只要適時為椅子更換椅套，不單能為居家添上新鮮感，而且椅子將更加耐用\r\n        </p>\r\n\r\n        <p>\r\n            用膳完畢，可除下餐椅套可放入機洗，清潔容易\r\n            實木椅腳，耐用的天然材質\r\n        </p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>布套可拆洗<br>如果當地機構提供相關服務，可進行回收利用<br>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>布套的耐光等級5-6(抗褪色，等級1-8)；依據工業標準，耐光等級4以上適合居家空間使用</p>\r\n\r\n        <p>布套的耐磨性通過40,000次測試；通過測試次數15,000次以上，表示家具適合居家日常生活使用；通過測試次數30,000次以上表示家具擁有極佳的耐磨性</p>\r\n\r\n        <p>餐椅已經通過家用作測試，並且符合以下標準的安全、耐用及穩定性標準：EN 12520及EN 1022</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">實心木材, 黏著劑, 染色, 透明漆</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">扶手框架/ 靠背框架</td>\r\n                <td class=\"td2\">實心木材, 100%再生實心紙板, 黏著劑</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">舒適材質</td>\r\n                <td class=\"td2\">PU泡棉 (25公斤/立方公尺), 高回彈PU泡棉(冷塑泡棉) (35公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅框</td>\r\n                <td class=\"td2\">100% 聚丙烯, 實心木材, 鋼質, 黏著劑</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">魔鬼氈</td>\r\n                <td class=\"td2\">100%尼龍</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">布料</td>\r\n                <td class=\"td2\">100%聚酯纖維 (至少90%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">淨重</td>\r\n                <td class=\"td2\">3.56公斤</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p><span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            可用機洗，一般洗衣程序，水溫最高 40°C <br>\r\n            不可使用漂白劑。 <br>\r\n            請勿烘乾 <br>\r\n            熨斗熨燙溫度最高為150°C <br>\r\n            用四氯乙烯及碳氫化物所使用溶劑的專業乾洗，並採標準乾洗程序 <br>\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(33, 147, '白色透明餐椅', '餐椅', '弧形的座椅設計，配合圓形的背墊，讓你坐得舒適，容易組裝，不需使用工具或螺絲，椅腳以實心櫸木作製造，不單堅固而且增加了質感，容易清潔', 4999, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"弧形的座椅設計，配合圓形的背墊，讓你坐得舒適，容易組裝，不需使用工具或螺絲，椅腳以實心櫸木作製造，不單堅固而且增加了質感，容易清潔\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n\r\n        <p>\r\n            弧形的座椅設計，配合圓形的背墊，讓你坐得舒適\r\n            椅腳以實心櫸木作製造，不單堅固而且增加了質感且容易清潔\r\n        </p>\r\n        <p>容易組裝，不需使用工具或螺絲</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>經測試，適合公用空間使用，符合安全性、耐用度和穩定度標準：EN 16139-Level 1與ANSI/BIFMA x5.1</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">坐墊</td>\r\n                <td class=\"td2\">100 % 合成橡膠, 100 % 聚酯纖維 (100%再生材料), 聚酯纖維填充物</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">合成橡膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅框</td>\r\n                <td class=\"td2\">強化聚醯胺塑膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">嵌件</td>\r\n                <td class=\"td2\">黃銅</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅座</td>\r\n                <td class=\"td2\">綜合碳酸塑料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅腳</td>\r\n                <td class=\"td2\">實心櫸木, 透明壓克力漆</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <!-- <span class=\"ecSubtitle\"></span><br> -->\r\n            請勿洗滌<br>\r\n            不可使用漂白劑 <br>\r\n            請勿烘乾 <br>\r\n            請勿熨燙 <br>\r\n            不可乾洗 <br>\r\n            用乾淨的布擦乾<br>\r\n            有需要時，可用沾了肥皂水或溫和清潔劑的濕布清潔<br>\r\n            不可使用沙粉、鋼絲絨、溶解鈣的酸性清潔劑，或含有酒精、研磨劑的清潔劑\r\n            勿直接使用，需和水一起使用\r\n            用軟布沾水清潔即可\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(28, 147, '深棕色軟墊餐椅', '餐椅', '採用軟墊椅座，靠背角度舒適，讓你盡情享受用餐時光，久坐也不累，椅套以棉和聚酯纖維編織而成，略帶紋理，柔軟舒適。 染紗纖維營造同色系效果，感覺平和乾淨，布套可以拆下放入機洗，容易清潔，實木椅框，可使結構堅固耐用，容易配襯同系列的餐桌和長凳', 1999, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"採用軟墊椅座，靠背角度舒適，讓你盡情享受用餐時光，久坐也不累，椅套以棉和聚酯纖維編織而成，略帶紋理，柔軟舒適。 染紗纖維營造同色系效果，感覺平和乾淨，布套可以拆下放入機洗，容易清潔，實木椅框，可使結構堅固耐用，容易配襯同系列的餐桌和長凳\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n\r\n        <p>採用軟墊椅座，靠背角度舒適，讓你盡情享受用餐時光，久坐也不累</p>\r\n        <p>椅套以棉和聚酯纖維編織而成，略帶紋理，柔軟舒適。 染紗纖維營造同色系效果，感覺平和乾淨</p>\r\n\r\n        <p>布套可以拆下放入機洗，容易清潔，實木椅框，可使結構堅固耐用</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>餐椅已經通過家用作測試，並且符合以下標準的安全、耐用及穩定性標準：EN 12520及EN 1022</p>\r\n\r\n        <p>布套的耐磨性通過20,000次測試；通過測試次數15,000次以上，表示家具適合居家日常生活使用</p>\r\n\r\n        <p>布套的耐光等級5(抗褪色，等級1-8)；依據工業標準，耐光等級4以上適合居家空間使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n\r\n        <p>如果你的社區有設施，就能輕鬆分開回收或能源回收的物件</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">布套/ 布料</td>\r\n                <td class=\"td2\">65%聚酯纖維 (至少90%再生材料), 35%棉</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">框架</td>\r\n                <td class=\"td2\">實心橡膠木, 染色, 壓克力亮光漆</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅座</td>\r\n                <td class=\"td2\">纖維板, PU泡棉 (35公斤/立方公尺)</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            可用機洗，一般洗衣程序，水溫最高 40°C <br>\r\n            不可使用漂白劑 <br>\r\n            請勿烘乾 <br>\r\n            熨斗熨燙溫度最高為150°C <br>\r\n            用四氯乙烯及碳氫化物所使用溶劑的專業乾洗，並採標準乾洗程序\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">框架</span><br>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性<br>\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(29, 147, '米白色木質餐椅', '餐椅', '椅子配上座墊，非常適合長時間用餐或與家人進行桌上遊戲時使用', 2199, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"椅子配上座墊，非常適合長時間用餐或與家人進行桌上遊戲時使用\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>椅子配上座墊，非常適合長時間用餐或與家人進行桌上遊戲時使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>餐椅已經通過家用作測試，並且符合以下標準的安全、耐用及穩定性標準：EN 12520及EN 1022</p>\r\n\r\n        <p>布套的耐光等級5(抗褪色，等級1-8)；依據工業標準，耐光等級4以上適合居家空間使用</p>\r\n\r\n        <p>布套的耐磨性通過15,000次測試，表示家具適合居家日常生活使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">布套/ 布料</td>\r\n                <td class=\"td2\">80%棉, 20%聚酯纖維 (至少90%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">框架</td>\r\n                <td class=\"td2\">實心木材, 壓克力漆</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅座</td>\r\n                <td class=\"td2\">纖維板</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">舒適材質</td>\r\n                <td class=\"td2\">PU泡棉 (35公斤/立方公尺), 聚酯纖維填充物</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            可用機洗，一般洗衣程序，水溫最高 40°C <br>\r\n            不可使用漂白劑 <br>\r\n            請勿烘乾 <br>\r\n            熨斗熨燙溫度最高為150°C <br>\r\n            不可乾洗\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">框架</span><br>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性<br>\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(30, 147, '黑灰軟墊餐椅', '餐椅', '座椅含軟墊，椅背具有舒適角度，適合長時間用餐使用，扶手與圓弧形椅背設計，可增添舒適感，後靠時，扶手長度可提供適當支撐；用餐時，扶手較短，能讓你更靠近餐桌，弧形椅背設計，讓你坐得更舒適，鋼質框架，外覆粉末塗層，堅固耐用，不使用時餐椅可推到餐桌下方，不佔用空間', 4499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"座椅含軟墊，椅背具有舒適角度，適合長時間用餐使用，扶手與圓弧形椅背設計，可增添舒適感，後靠時，扶手長度可提供適當支撐；用餐時，扶手較短，能讓你更靠近餐桌，弧形椅背設計，讓你坐得更舒適，鋼質框架，外覆粉末塗層，堅固耐用，不使用時餐椅可推到餐桌下方，不佔用空間\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>座椅含軟墊，椅背具有舒適角度，適合長時間用餐使用</p>\r\n\r\n        <p>扶手與圓弧形椅背設計，可增添舒適感，後靠時，扶手長度可提供適當支撐；用餐時，扶手較短，能讓你更靠近餐桌，弧形椅背設計，讓你坐得更舒適</p>\r\n\r\n        <p>鋼質框架，外覆粉末塗層，堅固耐用，不使用時餐椅可推到餐桌下方，不佔用空間</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">紡織品</td>\r\n                <td class=\"td2\">100%聚酯纖維</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">框架</td>\r\n                <td class=\"td2\">100% 聚丙烯, 高回彈PU泡棉(冷塑泡棉) 60公斤/立方公尺, 纖維板, 鋼質</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">坐墊</td>\r\n                <td class=\"td2\">高回彈PU泡棉(冷塑泡棉) 60公斤/立方公尺</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">鋼質, 聚乙烯塑膠, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請用濕布擦拭乾淨<br>\r\n            請用抹布沾溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            請立即擦乾水漬，以免水分滲入\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(25, 147, '淺棕色木製餐椅', '餐椅', '經過染色和上漆處理的實木椅框，堅固耐用，而且可以讓其天然木紋展現光澤，木紋清楚可見，可營造自然、溫暖風格，椅子配上座墊，非常適合長時間用餐或與家人進行桌上遊戲時使用，椅套以棉和亞麻纖維混織而成，表面光滑的自然色系，呈現自然風格，搭配美觀的PINNTORP餐桌，透過簡潔的外觀、暖和的色調以及細緻的細節，打造完美，椅套可以拆下放入機洗，容易清潔', 1299, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"經過染色和上漆處理的實木椅框，堅固耐用，而且可以讓其天然木紋展現光澤，木紋清楚可見，可營造自然、溫暖風格，椅子配上座墊，非常適合長時間用餐或與家人進行桌上遊戲時使用，椅套以棉和亞麻纖維混織而成，表面光滑的自然色系，呈現自然風格，搭配美觀的PINNTORP餐桌，透過簡潔的外觀、暖和的色調以及細緻的細節，打造完美，椅套可以拆下放入機洗，容易清潔\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>經過染色和上漆處理的實木椅框，堅固耐用，而且可以讓其天然木紋展現光澤，木紋清楚可見，可營造自然、溫暖風格</p>\r\n\r\n        <p>椅套以棉和亞麻纖維混織而成，表面光滑的自然色系，呈現自然風格</p>\r\n        <p>椅子配上座墊，非常適合長時間用餐或與家人進行桌上遊戲時使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>餐椅已經通過家用作測試，並且符合以下標準的安全、耐用及穩定性標準：EN 12520及EN 1022</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">布料/ 布套</td>\r\n                <td class=\"td2\">80%棉, 20%亞麻</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅腳/ 框架</td>\r\n                <td class=\"td2\">實心松木, 染色, 壓克力亮光漆</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅座</td>\r\n                <td class=\"td2\">纖維板, PU泡棉 (35公斤/立方公尺), 聚酯纖維填充物</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">抗悶燒襯裡</td>\r\n                <td class=\"td2\">聚酯纖維填充物</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            可用機洗，一般洗衣程序，水溫最高 40°C <br>\r\n            請勿使用化學增豔劑<br>\r\n            不可使用漂白劑 <br>\r\n            請勿烘乾 <br>\r\n            熨斗熨燙溫度最高為150°C <br>\r\n            用四氯乙烯及碳氫化物所使用溶劑的專業乾洗，並採標準乾洗程序\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">框架</span><br>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性<br>\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(26, 147, '相思木餐椅', '餐椅', '椅子以實心洋槐木打造，鞏固的結構，天然材質，其顏色和紋理能隨年月而變化，讓每張椅子都變得獨一無二，編織椅墊既美觀、堅固又坐得舒適，搭配NACKANÄS餐桌，打造統一協調的外觀。備有多種尺寸以配合你空間的大小需要，彎型靠背、寬敞的編織座墊，坐得舒適，用餐、寫字或做文書工作都非常合適，中空的靠背設計，讓你可以把餐椅掛在牆上，節省地方', 1499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"椅子以實心洋槐木打造，鞏固的結構，天然材質，其顏色和紋理能隨年月而變化，讓每張椅子都變得獨一無二，編織椅墊既美觀、堅固又坐得舒適，搭配NACKANÄS餐桌，打造統一協調的外觀。備有多種尺寸以配合你空間的大小需要，彎型靠背、寬敞的編織座墊，坐得舒適，用餐、寫字或做文書工作都非常合適，中空的靠背設計，讓你可以把餐椅掛在牆上，節省地方\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>椅子以實心洋槐木打造，鞏固的結構，天然材質，其顏色和紋理能隨年月而變化，讓每張椅子都變得獨一無二，編織椅墊既美觀、堅固又坐得舒適</p>\r\n        <p>彎型靠背、寬敞的編織座墊，坐得舒適，用餐、寫字或做文書工作都非常合適，中空的靠背設計，讓你可以把餐椅掛在牆上，節省地方</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n        <p>如果你的社區有設施，就能輕鬆分開回收或能源回收的物件</p>\r\n    </div>\r\n\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">基本材質</td>\r\n                <td class=\"td2\">實心相思, 染色, 壓克力亮光漆</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">靠背</td>\r\n                <td class=\"td2\">層壓膠合塑形木板, 洋槐木實木貼皮, 染色, 壓克力亮光漆</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">彈性帶/ 表布</td>\r\n                <td class=\"td2\">100% 聚丙烯</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請勿洗滌<br>\r\n            不可使用漂白劑<br>\r\n            請勿烘乾<br>\r\n            請勿熨燙<br>\r\n            不可乾洗<br>\r\n            以吸塵器清理<br>\r\n            輕微污漬可用織物清潔劑，或用泡棉沾水或溫和清潔液擦拭清理<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(27, 147, '灰綠色軟墊餐椅', '餐椅', '吃得舒適又時尚，無論你是長時間用餐，和親友共享開心的時光，或者是一人獨處，這款餐椅也很合適，它仿如沙發般舒適，所以把它放在臥室、玄關、客廳或任何時候需要放鬆坐一坐，都很合適', 1499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"吃得舒適又時尚， 無論你是長時間用餐，和親友共享開心的時光，或者是一人獨處，這款餐椅也很合適，它仿如沙發般舒適，所以把它放在臥室、玄關、客廳或任何時候需要放鬆坐一坐，都很合適，而且不會佔用太多空間，靠背的角度為背部提供很好的承托，長時間坐在桌邊也很舒適，軟墊座椅可分散體重，減少坐骨壓力，金屬框架讓椅子更加堅固，HAKEBO布套觸感順滑，質感舒適，讓沙發坐得愜意舒適，可搭配多張同顏色的椅子，打造整體風格，或混搭不同顏色的椅子，增添變化，容易組裝，不需考慮哪支腳該放在前面，哪支放在後面， 因為所有支腳都是同一造型\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>吃得舒適又時尚， 無論你是長時間用餐，和親友共享開心的時光，或者是一人獨處，這款餐椅也很合適</p>\r\n        <p>它仿如沙發般舒適，所以把它放在臥室、玄關、客廳或任何時候需要放鬆坐一坐，都很合適，而且不會佔用太多空間</p>\r\n        <p>靠背的角度為背部提供很好的承托，長時間坐在桌邊也很舒適，軟墊座椅可分散體重，減少坐骨壓力</p>\r\n        <p>金屬框架讓椅子更加堅固，HAKEBO布套觸感順滑，質感舒適，讓沙發坐得愜意舒適</p>\r\n        <p>容易組裝，不需考慮哪支腳該放在前面，哪支放在後面， 因為所有支腳都是同一造型</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">布料</td>\r\n                <td class=\"td2\">100 % 聚酯纖維 (100%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">底框</td>\r\n                <td class=\"td2\">鋼質, 鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">背面支撐桿</td>\r\n                <td class=\"td2\">100% 聚丙烯</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">坐墊及椅背框架</td>\r\n                <td class=\"td2\">白楊木合板</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅墊泡棉</td>\r\n                <td class=\"td2\">PU泡棉 (35公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅背泡棉</td>\r\n                <td class=\"td2\">高回彈PU泡棉(冷塑泡棉) 55公斤/立方公尺, PU泡棉 (30公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">防護布料</td>\r\n                <td class=\"td2\">100% 聚丙烯</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">聚醯胺塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            請勿洗滌<br>\r\n            不可使用漂白劑<br>\r\n            請勿烘乾<br>\r\n            請勿熨燙<br>\r\n            不可乾洗<br>\r\n            以吸塵器清理<br>\r\n            輕微污漬可用織物清潔劑，或用泡棉沾水或溫和清潔液擦拭清理\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">框架</span><br>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性<br>\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(23, 147, '紅棕色軟墊餐椅', '餐椅', '軟墊座椅可分散體重，減少坐骨壓力，容易組裝，不需考慮哪支腳該放在前面，哪支放在後面， 因為所有支腳都是同一造型，可搭配多張同顏色的椅子，打造整體風格，或混搭不同顏色的椅子，增添變化，外型纖巧，不會佔用太多空間，適合放於任何房間，加上結構堅固，可應付經常性的使用，金屬框架讓椅子更加堅固，不使用時可疊起放置，節省地方', 529, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"軟墊座椅可分散體重，減少坐骨壓力，容易組裝，不需考慮哪支腳該放在前面，哪支放在後面， 因為所有支腳都是同一造型，可搭配多張同顏色的椅子，打造整體風格，或混搭不同顏色的椅子，增添變化，外型纖巧，不會佔用太多空間，適合放於任何房間，加上結構堅固，可應付經常性的使用，金屬框架讓椅子更加堅固，不使用時可疊起放置，節省地方\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>軟墊座椅可分散體重，減少坐骨壓力</p>\r\n\r\n        <p>容易組裝，不需考慮哪支腳該放在前面，哪支放在後面， 因為所有支腳都是同一造型</p>\r\n\r\n        <p>外型纖巧，不會佔用太多空間，適合放於任何房間，加上結構堅固，可應付經常性的使用，金屬框架讓椅子更加堅固</p>\r\n\r\n        <p>不使用時可疊起放置，節省地方</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">布料</td>\r\n                <td class=\"td2\">100 % 聚酯纖維 (100%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">框架</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅座</td>\r\n                <td class=\"td2\">層壓膠合塑形木板, PU泡棉 (35公斤/立方公尺), 聚丙烯纖維不織布</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">靠背</td>\r\n                <td class=\"td2\">聚丙烯塑膠, 聚酯纖維填充物</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性<br>\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">布套</span><br>\r\n            請勿洗滌<br>\r\n            不可使用漂白劑<br>\r\n            請勿烘乾<br>\r\n            請勿熨燙<br>\r\n            不可乾洗<br>\r\n            以吸塵器清理<br>\r\n            輕微污漬可用織物清潔劑，或用泡棉沾水或溫和清潔液擦拭清理\r\n        </p>\r\n\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:25:33'),
(24, 147, '灰色餐椅', '餐椅', '簡潔的設計讓椅子容易融入房間中。輕巧卻十分堅固，適合日常使用，全靠它的柔軟座墊和靈活靠背，讓你坐得舒服，軟墊座椅可分散體重，減少坐骨壓力，可疊起收藏，多買幾張以備不時之需，也不需佔太多地方', 999, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"簡潔的設計讓椅子容易融入房間中。輕巧卻十分堅固，適合日常使用，全靠它的柔軟座墊和靈活靠背，讓你坐得舒服，軟墊座椅可分散體重，減少坐骨壓力，可疊起收藏，多買幾張以備不時之需，也不需佔太多地方\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>吃得舒適又時尚， 無論你是長時間用餐，和親友共享開心的時光，或者是一人獨處，這款餐椅也很合適</p>\r\n        <p>它仿如沙發般舒適，所以把它放在臥室、玄關、客廳或任何時候需要放鬆坐一坐，都很合適，而且不會佔用太多空間</p>\r\n        <p>靠背的角度為背部提供很好的承托，長時間坐在桌邊也很舒適，軟墊座椅可分散體重，減少坐骨壓力</p>\r\n        <p>金屬框架讓椅子更加堅固，HAKEBO布套觸感順滑，質感舒適，讓沙發坐得愜意舒適</p>\r\n        <p>容易組裝，不需考慮哪支腳該放在前面，哪支放在後面， 因為所有支腳都是同一造型</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">布料</td>\r\n                <td class=\"td2\">100 % 聚酯纖維 (至少90%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">底框/ 橫木</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅座</td>\r\n                <td class=\"td2\">層壓膠合塑形木板</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">靠背</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅墊泡棉</td>\r\n                <td class=\"td2\">PU泡棉 (35公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">防護布套</td>\r\n                <td class=\"td2\">聚丙烯纖維不織布</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:37:21'),
(19, 147, '白色餐椅', '餐椅', '可將椅子堆疊收納，不用時也不佔空間', 349, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"可將椅子堆疊收納，不用時也不佔空間\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>不使用時可疊起放置，節省地方</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">底框/ 橫條軌道</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅座/ 靠背</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性<br>\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-13 14:21:40'),
(34, 148, '黑色吧檯椅附靠背', '吧檯椅', '可將椅子堆疊收納，不用時也不佔空間', 599, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"可將椅子堆疊收納，不用時也不佔空間\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>可堆疊收納，不佔空間，下方橫桿可擱腳，坐得更舒適</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>椅凳已經為家用作測試，並且符合以下標準的安全、耐用及穩定性標準：EN 12520及EN 1022</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>適用於高101-106公分的吧台桌</p>\r\n        <p>如果你的社區有相關設施，產品的塑膠部分可回收</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">框架</td>\r\n                <td class=\"td2\">鋼質, 環氧粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">坐墊/ 背面</td>\r\n                <td class=\"td2\">聚丙烯塑膠(至少50%再生材料)</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-14 15:43:50'),
(35, 148, '白色吧檯椅', '吧檯椅', '弧形座椅設計，讓你坐得更舒適，單手就能調整高度，貼心的放腳處設計，讓你坐得更舒適，特殊表面處理，使座椅格外耐磨', 4499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"弧形座椅設計，讓你坐得更舒適，單手就能調整高度，貼心的放腳處設計，讓你坐得更舒適，特殊表面處理，使座椅格外耐磨\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>弧形座椅設計，讓你坐得更舒適，單手就能調整高度，貼心的放腳處設計，讓你坐得更舒適</p>\r\n        <p>特殊表面處理，使座椅格外耐磨</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>經測試，適合公用空間使用，符合安全性、耐用度和穩定度標準：EN 16139-Level 1與ANSI/BIFMA x5.1</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>適用於90和110公分高的吧台</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">底座/ 外管/ 薄金屬板</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">蓋子/ 調整桿</td>\r\n                <td class=\"td2\">不鏽鋼</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">足環/ 止滑配件</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">放腳處</td>\r\n                <td class=\"td2\">鋁質, 不鏽鋼, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅座/ 蓋子</td>\r\n                <td class=\"td2\">強化聚丙烯塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-14 15:52:09'),
(36, 148, '樺木吧檯椅', '吧檯椅', '座椅中間有手提用孔洞，方便搬移，耐用的天然實木材質', 1499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"座椅中間有手提用孔洞，方便搬移，耐用的天然實木材質\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>座椅中間有手提用孔洞，方便搬移，耐用的天然實木材質</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>經測試，適合公用空間使用，符合安全性、耐用度和穩定度標準：EN 16139-Level 1與ANSI/BIFMA x5.1</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>適用於110公分高的吧台</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">支腳/ 椅座</td>\r\n                <td class=\"td2\">實心樺木, 黏著劑, 染色, 透明壓克力漆</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">腳踏板</td>\r\n                <td class=\"td2\">鋼質, 鍍鋅</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            組裝後及必要時，每兩周重新鎖緊螺絲，以增加穩固性\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-14 15:56:46'),
(37, 148, '淺灰色軟墊吧檯椅', '吧檯椅', '餐椅椅套可除下放入機洗，方便清潔，貼心的放腳處設計，讓你坐得更舒適', 2499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"餐椅椅套可除下放入機洗，方便清潔，貼心的放腳處設計，讓你坐得更舒適\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>餐椅椅套可除下放入機洗，方便清潔，貼心的放腳處設計，讓你坐得更舒適</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>椅凳已經為家用作測試，並且符合以下標準的安全、耐用及穩定性標準：EN 12520及EN 1022</p>\r\n\r\n        <p>布套的耐光等級5(抗褪色，等級1-8)；依據工業標準，耐光等級4以上適合居家空間使用</p>\r\n\r\n        <p>布套的耐磨性通過20,000次測試；通過測試次數15,000次以上，表示家具適合居家日常生活使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>適用於吧台桌及高87-91公分的櫃檯</p>\r\n        <p>建議僅於室內使用</p>\r\n\r\n        <p>如果你的社區有設施，就能輕鬆分開回收或能源回收的物件</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">實心木材, 壓克力漆</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅框</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">靠背框架</td>\r\n                <td class=\"td2\">鋼質</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支撐板</td>\r\n                <td class=\"td2\">聚乙烯塑膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">靠墊/ 坐墊</td>\r\n                <td class=\"td2\">100%聚酯纖維</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">背面布料/ 襯裡</td>\r\n                <td class=\"td2\">100%聚酯纖維 (100%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">背襯裡/<br> 抗悶燒襯裡</td>\r\n                <td class=\"td2\">聚酯纖維填充物</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">布套/ 布料</td>\r\n                <td class=\"td2\">65%聚酯纖維 (至少90%再生材料), 35%棉</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            可用機洗，一般洗衣程序，水溫最高 40°C <br>\r\n            不可使用漂白劑 <br>\r\n            請勿烘乾 <br>\r\n            熨斗熨燙溫度最高為150°C <br>\r\n            用四氯乙烯及碳氫化物所使用溶劑的專業乾洗，並採標準乾洗程序\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">框架</span><br>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-14 16:05:47');
INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_type`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(38, 149, '黑色辦公椅', '辦公椅', '適合辦公室使用，人體工學設計，功能眾多，可輕鬆貼合你的身形', 2199, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"適合辦公室使用，人體工學設計，功能眾多，可輕鬆貼合你的身形\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>提供10年品質保證；欲知更多細則，請參閱品質保證書</p>\r\n\r\n        <p>適合辦公室使用，人體工學設計，功能眾多，可輕鬆貼合你的身形，座椅高度可調整，讓背部與大腿成90度</p>\r\n\r\n        <p>備有自動傾斜張力，以你的體重決定靠背的阻力。 這種抗壓力功能，能幫你在坐下去時維持良好的姿態</p>\r\n\r\n        <p>同步傾斜機械裝置讓辦公椅和你的身軀同步移動。 當身軀往後傾斜時，靠背較座位的移動幅度更大，讓軀幹/臀部張開， 幫助血液循環和提升活力</p>\r\n\r\n        <p>當身軀傾斜時，同步傾斜機械能讓你的雙腳緊貼地板但視線仍然可以向著前方。 可伸展胸部又不會給大腿添加壓力，從而幫助血液循環</p>\r\n\r\n        <p>高椅背，圓弧造型，可為下背部提供良好支撐，避免感到疲累，讓你用放鬆的姿勢舒適久坐</p>\r\n\r\n        <p>傾斜功能在椅背處於直立位置時可鎖定，增加穩定度</p>\r\n\r\n        <p>布套可拆下放入機洗，常保乾淨清新</p>\r\n\r\n        <p>可另購扶手，以紓緩手臂和肩膀的壓力</p>\r\n\r\n        <p>當你站起來時，輪腳會自動鎖著，讓椅子保持原位，不會溜走</p>\r\n\r\n        <p>輪腳設計讓椅子在地毯、硬地，甚至是凹凸不平的地面也能輕鬆移動，輪腳外層為橡膠材質，可在任何材質的地板上滑順移動</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>此電競椅從設計到測試，符合以下標準規定對安全性、耐用度及穩定度的要求：EN 1335和ANSI/BIFMA X5.1.</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        人體工學\r\n        座椅高度可調整<br>\r\n\r\n        可自動調整椅背回彈力度<br>\r\n\r\n        傾斜裝置<br>\r\n\r\n        附同步傾仰功能<br>\r\n\r\n        可鎖定椅背斜度<br>\r\n\r\n        腰靠支撐<br>\r\n\r\n        布套可拆洗<br>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">網篩/ 布料/ 網篩</td>\r\n                <td class=\"td2\">100%聚酯纖維 (至少90%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">背面框架/ 氣壓筒/ 支腳</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅座/ 椅座</td>\r\n                <td class=\"td2\">PU泡棉 (35公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅框/ 椅框</td>\r\n                <td class=\"td2\">層壓膠合塑形木板</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">尾蓋/ 尾蓋</td>\r\n                <td class=\"td2\">強化聚醯胺塑膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">輪腳/ 輪腳</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            可用機洗，一般洗衣程序，水溫最高 40°C <br>\r\n            不可使用漂白劑 <br>\r\n            請勿烘乾 <br>\r\n            熨斗熨燙溫度最高為150°C <br>\r\n            用四氯乙烯及碳氫化物所使用溶劑的專業乾洗，並採標準乾洗程序\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">框架</span><br>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 08:32:09'),
(39, 149, 'bomstad 黑色辦公椅', '辦公椅', '旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力，可調整座椅高度，讓你坐得更舒適，附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定', 1799, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力，可調整座椅高度，讓你坐得更舒適，附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力</p>\r\n\r\n        <p>可調整座椅高度，讓你坐得更舒適</p>\r\n\r\n        <p>附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>經設計和測試，適合居家空間使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">織品部分</td>\r\n                <td class=\"td2\">100%聚酯纖維 (100%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅背框架</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅墊泡棉</td>\r\n                <td class=\"td2\">PU泡棉 (35公斤/立方公尺), 聚酯纖維填充物</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">扶手框架</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">尾蓋/ 尾蓋</td>\r\n                <td class=\"td2\">強化聚醯胺塑膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">合成皮革</td>\r\n                <td class=\"td2\">100%聚氨酯, 75%聚酯纖維, 25%棉</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">座椅</span><br>\r\n            輕微污漬可用織物清潔劑，或用泡棉沾水或溫和清潔液擦拭清理\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">框架</span><br>\r\n            可用溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 08:38:07'),
(40, 149, 'murum 黑色旋轉椅', '辦公椅', '旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力，可調整座椅高度，讓你坐得更舒適，附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定', 3299, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力，可調整座椅高度，讓你坐得更舒適，附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力</p>\r\n\r\n        <p>可調整座椅高度，讓你坐得更舒適</p>\r\n\r\n        <p>附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>經設計和測試，適合居家空間使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">星形底座軸/ 星形底座支腳</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">合成皮革</td>\r\n                <td class=\"td2\">100%聚酯纖維, 100%聚氨酯</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅墊泡棉/ 扶手泡棉</td>\r\n                <td class=\"td2\">PU泡棉 (35公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">布料</td>\r\n                <td class=\"td2\">100%聚酯纖維 (至少90%再生材料)</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            以吸塵器清理<br>\r\n            可用濕布擦拭乾淨\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 08:56:28'),
(41, 149, 'grann 白色辦公椅附扶手', '辦公椅', '旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力，可調整座椅高度，讓你坐得更舒適，附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定', 7999, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力，可調整座椅高度，讓你坐得更舒適，附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>提供10年品質保證；欲知更多細則，請參閱品質保證書</p>\r\n\r\n        <p>適合辦公室使用</p>\r\n\r\n        <p>備有自動傾斜張力，以你的體重決定靠背的阻力。 這種抗壓力功能，能幫你在坐下去時維持良好的姿態</p>\r\n\r\n        <p>人體工學設計，功能眾多，可輕鬆貼合你的身形，座椅高度可調整，讓背部與大腿成90度</p>\r\n\r\n        <p>可調節座位深度，讓你的背部獲得承托，體重可以平均分佈在整個椅墊上。 保持膝蓋血液流通，同時為膝蓋減壓</p>\r\n\r\n        <p>當身軀傾斜時，同步傾斜機械能讓你的雙腳緊貼地板但視線仍然可以向著前方。 可伸展胸部又不會給大腿添加壓力，從而幫助血液循環</p>\r\n\r\n        <p>傾斜鎖讓你調節椅背的傾斜角度，可鎖定在5個不同位置，從低角度到殊直角度，可調節腰部支撐，幫助維持正確坐姿，減少下背部分肌膚承受的壓力</p>\r\n\r\n        <p>同步傾斜機械裝置讓辦公椅和你的身軀同步移動。 當身軀往後傾斜時，靠背較座位的移動幅度更大，讓軀幹/臀部張開， 幫助血液循環和提升活力</p>\r\n\r\n        <p>高椅背，圓弧造型，可為下背部提供良好支撐，避免感到疲累，讓你用放鬆的姿勢舒適久坐</p>\r\n\r\n        <p>扶手可以調節高度和寬度，讓手臂肩膀輕鬆地放在上面休息，減輕頸部肩膊繃緊、疲倦和疼痛的情況</p>\r\n\r\n        <p>椅背的網眼材質可讓空氣流通，久坐也能感到舒適</p>\r\n\r\n        <p>輪腳設計讓椅子在地毯、硬地，甚至是凹凸不平的地面也能輕鬆移動</p>\r\n\r\n        <p>當你站起來時，輪腳會自動鎖著，讓椅子保持原位，不會溜走</p>\r\n\r\n        <p>經久使用後顏色變深，更顯美觀</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>辦公椅經測試適合辦公室使用，並符合以下標準規定對耐用和穩定性的要求：EN1335和ANSI/BIFMA x5.1</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            人體工學<br>\r\n            座椅高度可調整<br>\r\n\r\n            座椅深度可調整<br>\r\n\r\n            可調節的腰部支撐<br>\r\n\r\n            傾斜裝置<br>\r\n\r\n            可自動調整椅背回彈力度<br>\r\n\r\n            附同步傾仰功能<br>\r\n\r\n            可鎖定椅背斜度<br>\r\n\r\n            附2D可調整扶手\r\n        </p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">扶手靠墊</td>\r\n                <td class=\"td2\">合成橡膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">扶手固定裝置/ <br> 內置扶手/ <br> 內部框架/ <br> 扶手框架/ <br> 鈕扣/ <br> 安裝薄片</td>\r\n                <td class=\"td2\">強化聚醯胺塑膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">彈簧</td>\r\n                <td class=\"td2\">鋼質</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">皮革</td>\r\n                <td class=\"td2\">全染牛皮，表面經過塗飾、壓紋及上色處理</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">布料</td>\r\n                <td class=\"td2\">100%聚酯纖維 (至少90%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅背框架/ 椅背桿</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">坐椅框架</td>\r\n                <td class=\"td2\">層壓膠合塑形木板</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅墊泡棉</td>\r\n                <td class=\"td2\">高回彈PU泡棉(冷塑泡棉) 60公斤/立方公尺</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">頭部靠墊</td>\r\n                <td class=\"td2\">PU泡棉 (35公斤/立方公尺), 強化聚丙烯塑膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">星形底座</td>\r\n                <td class=\"td2\">鋁質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            以吸塵器清理<br>\r\n            可用濕布擦拭乾淨\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 08:56:28'),
(42, 149, 'gunnared 灰綠色/黑色會議椅', '辦公椅', '旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力，可調整座椅高度，讓你坐得更舒適，附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定', 4799, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\"\r\n        content=\"旋轉椅有可調整傾斜鬆緊度，你可依動作和重量調整阻力，轉動椅底的旋鈕便能增加或減少椅背傾斜的阻力，可調整座椅高度，讓你坐得更舒適，附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>提供10年品質保證；欲知更多細則，請參閱品質保證書</p>\r\n        <p>適合辦公室使用</p>\r\n        <p>座椅高度可調整，讓背部與大腿成90度，傾斜功能在椅背處於直立位置時可鎖定，增加穩定度</p>\r\n\r\n        <p>用六角扳手調整傾斜裝置，以符合你的體重和移動方式，提供舒適感受</p>\r\n\r\n        <p>扶手為你的前臂上半部分提供足夠的支撐，並能減少長時間會議，背部和肩膀承受的壓力</p>\r\n\r\n        <p>附安全輪腳，具有感壓煞車裝置，起身時可固定椅子，坐下後自動鬆開鎖定</p>\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>經測試，適合公用空間使用，符合安全性、耐用度和穩定度標準：EN 16139-Level 1</p>\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            不可拆下椅套清潔，請用海綿清理<br>\r\n            人體工學<br>\r\n            座椅高度可調整<br>\r\n            腰靠支撐<br>\r\n            傾斜裝置\r\n        </p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">扶手</td>\r\n                <td class=\"td2\">鋁質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">上鎖裝置</td>\r\n                <td class=\"td2\">鋼質, 鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">滑輪</td>\r\n                <td class=\"td2\">聚丙烯塑膠, 合成橡膠</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">坐墊</td>\r\n                <td class=\"td2\">鋼質</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">椅墊泡棉</td>\r\n                <td class=\"td2\">高回彈PU泡棉(冷塑泡棉) 65公斤/立方公尺</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">布料</td>\r\n                <td class=\"td2\">100%聚酯纖維 (至少90%再生材料)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">星形底座</td>\r\n                <td class=\"td2\">鋁質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            以吸塵器清理<br>\r\n            可用濕布擦拭乾淨\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 08:56:28'),
(43, 150, '米色椅凳', '椅凳|穿鞋椅', '有3種尺寸，柔軟的針織布套有不同顏色和圖案；可單獨或搭配多個使用，創造個人風格', 1799, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"有3種尺寸，柔軟的針織布套有不同顏色和圖案；可單獨或搭配多個使用，創造個人風格\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>有3種尺寸，柔軟的針織布套有不同顏色和圖案；可單獨或搭配多個使用，創造個人風格</p>\r\n\r\n        <p>布套可拆下用洗衣機洗滌，容易保養，底部防滑，可固定位置，還能上下堆疊，節省空間，採用真空包裝，容易帶回家</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">拉鍊/ 表布</td>\r\n                <td class=\"td2\">100%聚酯纖維</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">靠墊</td>\r\n                <td class=\"td2\">PU泡棉</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">背面布料</td>\r\n                <td class=\"td2\">100 % 聚酯纖維 (100%再生材料)</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            最高水洗溫度攝氏三十度，標準洗程序<br>\r\n            請分開清洗<br>\r\n            不可使用漂白劑<br>\r\n            請勿烘乾<br>\r\n            熨斗底板最高溫度攝氏一百一十度之熨燙及壓燙，且不應使用蒸氣\r\n            用四氯乙烯及碳氫化物所使用溶劑的專業乾洗，並採標準乾洗程序\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">靠墊/坐墊</span><br>\r\n            請勿洗滌 <br>\r\n            不可使用漂白劑 <br>\r\n            請勿烘乾 <br>\r\n            請勿熨燙 <br>\r\n            不可乾洗\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 15:20:09'),
(44, 150, 'gunnared 黑灰色收納椅凳', '椅凳|穿鞋椅', '有3種尺寸，柔軟的針織布套有不同顏色和圖案；可單獨或搭配多個使用，創造個人風格', 3499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"有3種尺寸，柔軟的針織布套有不同顏色和圖案；可單獨或搭配多個使用，創造個人風格\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>有3種尺寸，柔軟的針織布套有不同顏色和圖案；可單獨或搭配多個使用，創造個人風格</p>\r\n\r\n        <p>布套可拆下用洗衣機洗滌，容易保養，底部防滑，可固定位置，還能上下堆疊，節省空間，採用真空包裝，容易帶回家</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">拉鍊/ 表布</td>\r\n                <td class=\"td2\">100%聚酯纖維</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">靠墊</td>\r\n                <td class=\"td2\">PU泡棉</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">背面布料</td>\r\n                <td class=\"td2\">100 % 聚酯纖維 (100%再生材料)</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            最高水洗溫度攝氏三十度，標準洗程序<br>\r\n            請分開清洗<br>\r\n            不可使用漂白劑<br>\r\n            請勿烘乾<br>\r\n            熨斗底板最高溫度攝氏一百一十度之熨燙及壓燙，且不應使用蒸氣\r\n            用四氯乙烯及碳氫化物所使用溶劑的專業乾洗，並採標準乾洗程序\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">靠墊/坐墊</span><br>\r\n            請勿洗滌 <br>\r\n            不可使用漂白劑 <br>\r\n            請勿烘乾 <br>\r\n            請勿熨燙 <br>\r\n            不可乾洗\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 15:22:27'),
(45, 150, 'jonsbyn 櫸木黑色椅凳', '椅凳|穿鞋椅', '有3種尺寸，柔軟的針織布套有不同顏色和圖案；可單獨或搭配多個使用，創造個人風格', 1499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"有3種尺寸，柔軟的針織布套有不同顏色和圖案；可單獨或搭配多個使用，創造個人風格\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>有3種尺寸，柔軟的針織布套有不同顏色和圖案；可單獨或搭配多個使用，創造個人風格</p>\r\n\r\n        <p>布套可拆下用洗衣機洗滌，容易保養，底部防滑，可固定位置，還能上下堆疊，節省空間，採用真空包裝，容易帶回家</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">拉鍊/ 表布</td>\r\n                <td class=\"td2\">100%聚酯纖維</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">靠墊</td>\r\n                <td class=\"td2\">PU泡棉</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">背面布料</td>\r\n                <td class=\"td2\">100 % 聚酯纖維 (100%再生材料)</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            <span class=\"ecSubtitle\">可拆卸布套</span><br>\r\n            最高水洗溫度攝氏三十度，標準洗程序<br>\r\n            請分開清洗<br>\r\n            不可使用漂白劑<br>\r\n            請勿烘乾<br>\r\n            熨斗底板最高溫度攝氏一百一十度之熨燙及壓燙，且不應使用蒸氣\r\n            用四氯乙烯及碳氫化物所使用溶劑的專業乾洗，並採標準乾洗程序\r\n        </p>\r\n        <p>\r\n            <span class=\"ecSubtitle\">靠墊/坐墊</span><br>\r\n            請勿洗滌 <br>\r\n            不可使用漂白劑 <br>\r\n            請勿烘乾 <br>\r\n            請勿熨燙 <br>\r\n            不可乾洗\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 15:24:09'),
(46, 151, '黑色餐桌', '餐桌', '纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面', 799, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">桌面</td>\r\n                <td class=\"td2\">密集板, 美耐皿箔皮, 塑膠邊, 塑膠邊</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">底框/ 支腳</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    \r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請用抹布沾溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            請依照需求重新鎖緊螺絲，確保產品維持最佳狀態\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 15:51:15'),
(47, 151, '梣木餐桌(實木貼皮)', '餐桌', '纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面', 4999, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">桌面</td>\r\n                <td class=\"td2\">密集板, 美耐皿箔皮, 塑膠邊, 塑膠邊</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">底框/ 支腳</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    \r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請用抹布沾溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            請依照需求重新鎖緊螺絲，確保產品維持最佳狀態\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 15:53:14'),
(48, 152, '灰色吧台桌', '吧台桌', '纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面', 1999, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">桌面</td>\r\n                <td class=\"td2\">密集板, 美耐皿箔皮, 塑膠邊, 塑膠邊</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">底框/ 支腳</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    \r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請用抹布沾溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            請依照需求重新鎖緊螺絲，確保產品維持最佳狀態\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 15:55:14'),
(49, 152, '碳黑色吧台桌', '吧台桌', '纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面', 3499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">桌面</td>\r\n                <td class=\"td2\">密集板, 美耐皿箔皮, 塑膠邊, 塑膠邊</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">底框/ 支腳</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    \r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請用抹布沾溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            請依照需求重新鎖緊螺絲，確保產品維持最佳狀態\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 16:09:26'),
(50, 153, '米色/碳黑色,書桌/工作桌', '工作桌|辦公桌', '纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面', 2499, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">桌面</td>\r\n                <td class=\"td2\">密集板, 美耐皿箔皮, 塑膠邊, 塑膠邊</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">底框/ 支腳</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    \r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請用抹布沾溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            請依照需求重新鎖緊螺絲，確保產品維持最佳狀態\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 16:11:16'),
(51, 153, '染白橡木紋書桌/工作桌', '工作桌|辦公桌', '纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面', 3199, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>纖巧流線設計，節省地方；而且堅固耐用，能承受日常使用，堅固耐用的金屬桌框配平滑的美耐板桌面</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>建議僅於室內使用</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">桌面</td>\r\n                <td class=\"td2\">密集板, 美耐皿箔皮, 塑膠邊, 塑膠邊</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">底框/ 支腳</td>\r\n                <td class=\"td2\">鋼質, 環氧/聚酯粉末塗料</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">聚丙烯塑膠</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n    \r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請用抹布沾溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            請依照需求重新鎖緊螺絲，確保產品維持最佳狀態\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 16:12:22'),
(52, 155, 'grann/bomstad 金棕色/金屬三人座沙發', '皮沙發', '設計簡約，並提供特厚的座椅、內含軟墊的扶手和柔軟的靠墊，讓你坐得舒適，重量輕，不論是在家裡移動或搬到新家，都能輕鬆做到，輕微傾斜的椅腳確保沙發穩固，同時增添個人風格', 27990, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"含符合布套風格的椅腳套\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>含符合布套風格的椅腳套</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>布套的耐光等級5(抗褪色，等級1-8)；依據工業標準，耐光等級4以上適合居家空間使用</p>\r\n    </div>\r\n\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>固定式椅套</p>\r\n\r\n        <p>粒面皮革表面經過輕薄保護塗層處理，以保持略帶痕跡、皺紋和不同顏色的自然外觀。<br>因此，它和具有厚重保護塗層處理的皮革相比，對陽光、污垢、液體和防抓痕的抵抗力也較差</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">椅背及椅座框架</td>\r\n                <td class=\"td2\">合板, 密集板, 實心木材, 纖維板</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">扶手框架</td>\r\n                <td class=\"td2\">合板, 密集板, PU泡棉 (25公斤/立方公尺), 實心木材, 纖維板</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">背墊</td>\r\n                <td class=\"td2\">PU泡棉 (25公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">坐墊</td>\r\n                <td class=\"td2\">高回彈PU泡棉(冷塑泡棉) (35公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">皮革</td>\r\n                <td class=\"td2\">全染牛皮，表面經過塗飾、壓紋及上色處理</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">合成皮革部分</td>\r\n                <td class=\"td2\">100%聚氨酯, 75%聚酯纖維, 25%棉</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">鋼質, 鍍鉻</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請用抹布沾溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            避免直接曝曬在陽光下，以免乾燥的情形發生\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 16:20:28'),
(53, 155, 'grann/bomstad 黑色/金屬小雙人座沙發', '皮沙發', '設計簡約，並提供特厚的座椅、內含軟墊的扶手和柔軟的靠墊，讓你坐得舒適，重量輕，不論是在家裡移動或搬到新家，都能輕鬆做到，輕微傾斜的椅腳確保沙發穩固，同時增添個人風格', 19990, 1, '<div class=\"drop-box\">\r\n\r\n    <meta itemprop=\"description\" content=\"含符合布套風格的椅腳套\">\r\n    <p></p>\r\n    <p class=\"ecTitle\">產品描述</p>\r\n    <div class=\"longDesc\">\r\n        <p>含符合布套風格的椅腳套</p>\r\n\r\n    </div>\r\n    <p class=\"ecTitle\">安全與法規</p>\r\n    <div class=\"longDesc\">\r\n        <p>布套的耐光等級5(抗褪色，等級1-8)；依據工業標準，耐光等級4以上適合居家空間使用</p>\r\n    </div>\r\n\r\n    <p class=\"ecTitle\">額外資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>固定式椅套</p>\r\n\r\n        <p>粒面皮革表面經過輕薄保護塗層處理，以保持略帶痕跡、皺紋和不同顏色的自然外觀。<br>因此，它和具有厚重保護塗層處理的皮革相比，對陽光、污垢、液體和防抓痕的抵抗力也較差</p>\r\n    </div>\r\n    <p class=\"ecTitle\">商品規格</p>\r\n    <table class=\"ecTable\">\r\n        <tbody>\r\n            <tr>\r\n                <td class=\"td1\">椅背及椅座框架</td>\r\n                <td class=\"td2\">合板, 密集板, 實心木材, 纖維板</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">扶手框架</td>\r\n                <td class=\"td2\">合板, 密集板, PU泡棉 (25公斤/立方公尺), 實心木材, 纖維板</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">背墊</td>\r\n                <td class=\"td2\">PU泡棉 (25公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">坐墊</td>\r\n                <td class=\"td2\">高回彈PU泡棉(冷塑泡棉) (35公斤/立方公尺)</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">皮革</td>\r\n                <td class=\"td2\">全染牛皮，表面經過塗飾、壓紋及上色處理</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">合成皮革部分</td>\r\n                <td class=\"td2\">100%聚氨酯, 75%聚酯纖維, 25%棉</td>\r\n            </tr>\r\n            <tr>\r\n                <td class=\"td1\">支腳</td>\r\n                <td class=\"td2\">鋼質, 鍍鉻</td>\r\n            </tr>\r\n        </tbody>\r\n    </table>\r\n\r\n    <p class=\"ecTitle\">保養資訊</p>\r\n    <div class=\"longDesc\">\r\n        <p>\r\n            請用抹布沾溫和清潔劑擦拭乾淨<br>\r\n            用乾淨的布擦乾<br>\r\n            避免直接曝曬在陽光下，以免乾燥的情形發生\r\n        </p>\r\n    </div>\r\n    <style>\r\n        .ecTable {\r\n            width: 100%;\r\n            border: 1px solid gray;\r\n        }\r\n\r\n        .ecTable td {\r\n            border: 1px solid gray;\r\n            font-size: 14px\r\n        }\r\n\r\n        .ecTable .td1 {\r\n            width: 30%;\r\n            height: 25px;\r\n            padding: 5px;\r\n            line-height: 25px;\r\n            background-color: #eeeeee;\r\n            text-align: center;\r\n            font-weight: bold\r\n        }\r\n\r\n        .ecTable .td2 {\r\n            padding: 5px;\r\n            letter-spacing: 1px;\r\n            color: #4c4c4c\r\n        }\r\n\r\n        .ecTitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #ff9a03;\r\n            margin: 5px 0 5px 0;\r\n        }\r\n\r\n        .ecSubtitle {\r\n            font-size: 18px;\r\n            font-weight: bold;\r\n            color: #000;\r\n        }\r\n\r\n        .longDesc p {\r\n            margin-bottom: 16px\r\n        }\r\n    </style>\r\n    <br>\r\n</div>', '2024-10-15 16:22:52');

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int NOT NULL COMMENT '圖檔編號',
  `p_id` int NOT NULL COMMENT '產品編號',
  `img_file` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '圖檔名稱',
  `sort` int NOT NULL COMMENT '圖片順序',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `product_img`
--

INSERT INTO `product_img` (`img_id`, `p_id`, `img_file`, `sort`, `create_date`) VALUES
(40, 29, 'p29-4.webp', 4, '2024-10-14 08:40:46'),
(39, 29, 'p29-3.webp', 3, '2024-10-14 08:40:46'),
(38, 29, 'p29-2.webp', 2, '2024-10-14 08:40:46'),
(37, 29, 'p29-1.webp', 1, '2024-10-14 08:40:46'),
(36, 28, 'p28-4.webp', 4, '2024-10-14 08:00:40'),
(35, 28, 'p28-3.webp', 3, '2024-10-14 08:00:40'),
(34, 28, 'p28-2.webp', 2, '2024-10-14 08:00:40'),
(33, 28, 'p28-1.webp', 1, '2024-10-14 08:00:40'),
(32, 33, 'p33-4.webp', 4, '2024-10-14 07:49:49'),
(31, 33, 'p33-3.webp', 3, '2024-10-14 07:49:49'),
(30, 33, 'p33-2.webp', 2, '2024-10-14 07:49:49'),
(29, 33, 'p33-1.webp', 1, '2024-10-14 07:49:49'),
(28, 32, 'p32-4.webp', 4, '2024-10-13 16:24:46'),
(27, 32, 'p32-3.webp', 3, '2024-10-13 16:24:46'),
(26, 32, 'p32-2.webp', 2, '2024-10-13 16:24:46'),
(25, 32, 'p32-1.webp', 1, '2024-10-13 16:24:46'),
(24, 31, 'p31-4.webp', 4, '2024-10-13 16:13:30'),
(23, 31, 'p31-3.webp', 3, '2024-10-13 14:53:45'),
(22, 31, 'p31-2.webp', 2, '2024-10-13 14:53:45'),
(21, 31, 'p31-1.webp', 1, '2024-10-13 14:53:45'),
(41, 30, 'p30-1.webp', 1, '2024-10-14 09:06:10'),
(42, 30, 'p30-2.webp', 2, '2024-10-14 09:06:10'),
(43, 30, 'p30-3.webp', 3, '2024-10-14 09:06:10'),
(44, 30, 'p30-4.webp', 4, '2024-10-14 09:06:10'),
(45, 25, 'p25-1.webp', 1, '2024-10-14 09:06:39'),
(46, 25, 'p25-2.webp', 2, '2024-10-14 09:06:39'),
(47, 25, 'p25-3.webp', 3, '2024-10-14 09:06:39'),
(48, 25, 'p25-4.webp', 4, '2024-10-14 09:06:39'),
(49, 26, 'p26-1.webp', 1, '2024-10-14 09:19:33'),
(50, 26, 'p26-2.webp', 2, '2024-10-14 09:19:33'),
(51, 26, 'p26-3.webp', 3, '2024-10-14 09:19:33'),
(52, 26, 'p26-4.webp', 4, '2024-10-14 09:19:33'),
(53, 27, 'p27-1.webp', 1, '2024-10-14 11:16:01'),
(54, 27, 'p27-2.webp', 2, '2024-10-14 11:16:01'),
(55, 27, 'p27-3.webp', 3, '2024-10-14 11:16:01'),
(56, 27, 'p27-4.webp', 4, '2024-10-14 11:16:01'),
(57, 24, 'p24-1.webp', 1, '2024-10-14 11:24:12'),
(58, 24, 'p24-2.webp', 2, '2024-10-14 11:24:12'),
(59, 24, 'p24-3.webp', 3, '2024-10-14 11:24:12'),
(60, 24, 'p24-4.webp', 4, '2024-10-14 11:24:12'),
(61, 23, 'p23-1.webp', 1, '2024-10-14 11:32:07'),
(62, 23, 'p23-2.webp', 2, '2024-10-14 11:32:07'),
(63, 23, 'p23-3.webp', 3, '2024-10-14 11:32:07'),
(64, 23, 'p23-4.webp', 4, '2024-10-14 11:32:07'),
(65, 19, 'p19-1.webp', 1, '2024-10-14 14:10:31'),
(66, 19, 'p19-2.webp', 2, '2024-10-14 14:10:31'),
(67, 19, 'p19-3.webp', 3, '2024-10-14 14:10:31'),
(68, 19, 'p19-4.webp', 4, '2024-10-14 14:10:31'),
(69, 34, 'p34-1.webp', 1, '2024-10-14 15:47:49'),
(70, 34, 'p34-2.webp', 2, '2024-10-14 15:47:49'),
(71, 34, 'p34-3.webp', 3, '2024-10-14 15:47:49'),
(72, 34, 'p34-4.webp', 4, '2024-10-14 15:47:49'),
(73, 35, 'p35-1.webp', 1, '2024-10-14 15:54:24'),
(74, 35, 'p35-2.webp', 2, '2024-10-14 15:54:24'),
(75, 35, 'p35-3.webp', 3, '2024-10-14 15:54:24'),
(76, 35, 'p35-4.webp', 4, '2024-10-14 15:54:24'),
(89, 36, 'p36-1.webp', 1, '2024-10-15 09:33:39'),
(90, 36, 'p36-2.webp', 2, '2024-10-15 09:33:39'),
(91, 36, 'p36-3.webp', 3, '2024-10-15 09:33:39'),
(92, 36, 'p36-4.webp', 4, '2024-10-15 09:33:39'),
(93, 37, 'p37-1.webp', 1, '2024-10-15 09:33:39'),
(94, 37, 'p37-2.webp', 2, '2024-10-15 09:33:39'),
(95, 37, 'p37-3.webp', 3, '2024-10-15 09:33:39'),
(96, 37, 'p37-4.webp', 4, '2024-10-15 09:33:39'),
(97, 38, 'p38-1.webp', 1, '2024-10-15 09:33:39'),
(98, 38, 'p38-2.webp', 2, '2024-10-15 09:33:39'),
(99, 38, 'p38-3.webp', 3, '2024-10-15 09:33:39'),
(100, 38, 'p38-4.webp', 4, '2024-10-15 09:33:39'),
(101, 39, 'p39-1.webp', 1, '2024-10-15 09:33:39'),
(102, 39, 'p39-2.webp', 2, '2024-10-15 09:33:39'),
(103, 39, 'p39-3.webp', 3, '2024-10-15 09:33:39'),
(104, 39, 'p39-4.webp', 4, '2024-10-15 09:33:39'),
(105, 40, 'p40-1.webp', 1, '2024-10-15 09:33:39'),
(106, 40, 'p40-2.webp', 2, '2024-10-15 09:33:39'),
(107, 40, 'p40-3.webp', 3, '2024-10-15 09:33:39'),
(108, 40, 'p40-4.webp', 4, '2024-10-15 09:33:39'),
(109, 41, 'p41-1.webp', 1, '2024-10-15 09:33:39'),
(110, 41, 'p41-2.webp', 2, '2024-10-15 09:33:39'),
(111, 41, 'p41-3.webp', 3, '2024-10-15 09:33:39'),
(112, 41, 'p41-4.webp', 4, '2024-10-15 09:33:39'),
(113, 43, 'p43-1.webp', 1, '2024-10-15 17:34:29'),
(114, 43, 'p43-2.webp', 2, '2024-10-15 17:34:29'),
(115, 43, 'p43-3.webp', 3, '2024-10-15 17:34:29'),
(116, 43, 'p43-4.webp', 4, '2024-10-15 17:34:29'),
(117, 44, 'p44-1.webp', 1, '2024-10-15 17:34:29'),
(118, 44, 'p44-2.webp', 2, '2024-10-15 17:34:29'),
(119, 44, 'p44-3.webp', 3, '2024-10-15 17:34:29'),
(120, 44, 'p44-4.webp', 4, '2024-10-15 17:34:29'),
(121, 45, 'p45-1.webp', 1, '2024-10-15 17:34:29'),
(122, 45, 'p45-2.webp', 2, '2024-10-15 17:34:29'),
(123, 45, 'p45-3.webp', 3, '2024-10-15 17:34:29'),
(124, 45, 'p45-4.webp', 4, '2024-10-15 17:34:29'),
(125, 46, 'p46-1.webp', 1, '2024-10-15 17:34:29'),
(126, 46, 'p46-2.webp', 2, '2024-10-15 17:34:29'),
(127, 46, 'p46-3.webp', 3, '2024-10-15 17:34:29'),
(128, 46, 'p46-4.webp', 4, '2024-10-15 17:34:29'),
(129, 47, 'p47-1.webp', 1, '2024-10-15 17:34:29'),
(130, 47, 'p47-2.webp', 2, '2024-10-15 17:34:29'),
(131, 47, 'p47-3.webp', 3, '2024-10-15 17:34:29'),
(132, 47, 'p47-4.webp', 4, '2024-10-15 17:34:29'),
(133, 48, 'p48-1.webp', 1, '2024-10-15 17:34:29'),
(134, 48, 'p48-2.webp', 2, '2024-10-15 17:34:29'),
(135, 48, 'p48-3.webp', 3, '2024-10-15 17:34:29'),
(136, 48, 'p48-4.webp', 4, '2024-10-15 17:34:29'),
(137, 49, 'p49-1.webp', 1, '2024-10-15 17:34:29'),
(138, 49, 'p49-2.webp', 2, '2024-10-15 17:34:29'),
(139, 49, 'p49-3.webp', 3, '2024-10-15 17:34:29'),
(140, 49, 'p49-4.webp', 4, '2024-10-15 17:34:29'),
(141, 50, 'p50-1.webp', 1, '2024-10-15 17:34:29'),
(142, 50, 'p50-2.webp', 2, '2024-10-15 17:34:29'),
(143, 50, 'p50-3.webp', 3, '2024-10-15 17:34:29'),
(144, 50, 'p50-4.webp', 4, '2024-10-15 17:34:29'),
(145, 51, 'p51-1.webp', 1, '2024-10-15 17:34:29'),
(146, 51, 'p51-2.webp', 2, '2024-10-15 17:34:29'),
(147, 51, 'p51-3.webp', 3, '2024-10-15 17:34:29'),
(148, 51, 'p51-4.webp', 4, '2024-10-15 17:34:29'),
(149, 52, 'p52-1.webp', 1, '2024-10-15 17:34:29'),
(150, 52, 'p52-2.webp', 2, '2024-10-15 17:34:29'),
(151, 52, 'p52-3.webp', 3, '2024-10-15 17:34:29'),
(152, 52, 'p52-4.webp', 4, '2024-10-15 17:34:29'),
(153, 53, 'p53-1.webp', 1, '2024-10-15 17:34:29'),
(154, 53, 'p53-2.webp', 2, '2024-10-15 17:34:29'),
(155, 53, 'p53-3.webp', 3, '2024-10-15 17:34:29'),
(156, 53, 'p53-4.webp', 4, '2024-10-15 17:34:29');

-- --------------------------------------------------------

--
-- 資料表結構 `pyclass`
--

CREATE TABLE `pyclass` (
  `classid` int NOT NULL COMMENT '產品類別',
  `level` int NOT NULL COMMENT '所在層級',
  `fonticon` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '字型圖示',
  `cname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '類別名稱',
  `sort` int NOT NULL COMMENT '列表排序',
  `uplink` int NOT NULL COMMENT '上層連結',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '建立時間與更新時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `pyclass`
--

INSERT INTO `pyclass` (`classid`, `level`, `fonticon`, `cname`, `sort`, `uplink`, `create_date`) VALUES
(141, 1, NULL, '椅子', 1, 0, '2024-10-13 09:44:26'),
(142, 1, NULL, '桌子|茶几', 2, 0, '2024-10-13 09:44:26'),
(143, 1, NULL, '沙發', 3, 0, '2024-10-13 09:44:26'),
(144, 1, NULL, '收納', 4, 0, '2024-10-13 09:44:26'),
(145, 1, NULL, '餐具', 5, 0, '2024-10-13 09:44:26'),
(146, 1, NULL, '裝飾', 6, 0, '2024-10-13 09:44:26'),
(147, 2, NULL, '餐椅', 1, 141, '2024-10-13 09:50:42'),
(148, 2, NULL, '吧檯椅', 2, 141, '2024-10-13 09:50:42'),
(149, 2, NULL, '辦公椅', 3, 141, '2024-10-13 09:50:42'),
(150, 2, NULL, '椅凳|穿鞋椅', 4, 141, '2024-10-13 09:50:42'),
(151, 2, NULL, '餐桌', 1, 142, '2024-10-13 09:53:59'),
(152, 2, NULL, '吧檯桌', 2, 142, '2024-10-13 09:53:59'),
(153, 2, NULL, '工作桌|辦公桌', 3, 142, '2024-10-13 10:00:03'),
(154, 2, NULL, '玄關桌|茶几', 4, 142, '2024-10-13 09:53:59'),
(155, 2, NULL, '皮沙發', 1, 143, '2024-10-13 09:55:02'),
(156, 2, NULL, '布沙發', 2, 143, '2024-10-13 09:55:02'),
(157, 2, NULL, '電動沙發', 3, 143, '2024-10-13 09:55:02'),
(158, 2, NULL, '休閒椅|躺椅', 4, 143, '2024-10-13 09:55:02'),
(159, 2, NULL, '面紙盒', 1, 144, '2024-10-13 09:57:18'),
(160, 2, NULL, '層架|推車', 2, 144, '2024-10-13 09:57:18'),
(161, 2, NULL, '收納盒|箱|籃', 3, 144, '2024-10-13 09:57:18'),
(162, 2, NULL, '碗|盤', 1, 145, '2024-10-13 09:58:47'),
(163, 2, NULL, '刀|叉|筷|匙', 2, 145, '2024-10-13 09:58:47'),
(164, 2, NULL, '飲具', 3, 145, '2024-10-13 09:58:47'),
(165, 2, NULL, '時鐘', 1, 146, '2024-10-13 09:59:34'),
(166, 2, NULL, '畫|畫框', 2, 146, '2024-10-13 09:59:34'),
(167, 2, NULL, '各類擺飾', 3, 146, '2024-10-13 09:59:34');

-- --------------------------------------------------------

--
-- 資料表結構 `town`
--

CREATE TABLE `town` (
  `townNo` bigint NOT NULL COMMENT '鄕鎮市編號',
  `Name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '鄕鎮市名稱',
  `Post` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '郵遞區號',
  `State` smallint NOT NULL COMMENT '狀態',
  `AutoNo` int NOT NULL COMMENT '上層城市編號連結'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `town`
--

INSERT INTO `town` (`townNo`, `Name`, `Post`, `State`, `AutoNo`) VALUES
(1, '中正區', '100', 0, 1),
(2, '大同區', '103', 0, 1),
(3, '中山區', '104', 0, 1),
(4, '松山區', '105', 0, 1),
(5, '大安區', '106', 0, 1),
(6, '萬華區', '108', 0, 1),
(7, '信義區', '110', 0, 1),
(8, '士林區', '111', 0, 1),
(9, '北投區', '112', 0, 1),
(10, '內湖區', '114', 0, 1),
(11, '南港區', '115', 0, 1),
(12, '文山區', '116', 0, 1),
(13, '仁愛區', '200', 0, 2),
(14, '信義區', '201', 0, 2),
(15, '中正區', '202', 0, 2),
(16, '中山區', '203', 0, 2),
(17, '安樂區', '204', 0, 2),
(18, '暖暖區', '205', 0, 2),
(19, '七堵區', '206', 0, 2),
(20, '萬里區', '207', 0, 3),
(21, '金山區', '208', 0, 3),
(22, '板橋區', '220', 0, 3),
(23, '汐止區', '221', 0, 3),
(24, '深坑區', '222', 0, 3),
(25, '石碇區', '223', 0, 3),
(26, '瑞芳區', '224', 0, 3),
(27, '平溪區', '226', 0, 3),
(28, '雙溪區', '227', 0, 3),
(29, '貢寮區', '228', 0, 3),
(30, '新店區', '231', 0, 3),
(31, '坪林區', '232', 0, 3),
(32, '烏來區', '233', 0, 3),
(33, '永和區', '234', 0, 3),
(34, '中和區', '235', 0, 3),
(35, '土城區', '236', 0, 3),
(36, '三峽區', '237', 0, 3),
(37, '樹林區', '238', 0, 3),
(38, '鶯歌區', '239', 0, 3),
(39, '三重區', '241', 0, 3),
(40, '新莊區', '242', 0, 3),
(41, '泰山區', '243', 0, 3),
(42, '林口區', '244', 0, 3),
(43, '蘆洲區', '247', 0, 3),
(44, '五股區', '248', 0, 3),
(45, '八里區', '249', 0, 3),
(46, '淡水區', '251', 0, 3),
(47, '三芝區', '252', 0, 3),
(48, '石門區', '253', 0, 3),
(49, '宜蘭市', '260', 0, 4),
(50, '頭城鎮', '261', 0, 4),
(51, '礁溪鄉', '262', 0, 4),
(52, '壯圍鄉', '263', 0, 4),
(53, '員山鄉', '264', 0, 4),
(54, '羅東鎮', '265', 0, 4),
(55, '三星鄉', '266', 0, 4),
(56, '大同鄉', '267', 0, 4),
(57, '五結鄉', '268', 0, 4),
(58, '冬山鄉', '269', 0, 4),
(59, '蘇澳鎮', '270', 0, 4),
(60, '南澳鄉', '272', 0, 4),
(61, '釣魚台列嶼', '290', 0, 4),
(62, '新竹市(東區)', '300', 0, 5),
(63, '竹北市', '302', 0, 6),
(64, '湖口鄉', '303', 0, 6),
(65, '新豐鄉', '304', 0, 6),
(66, '新埔鎮', '305', 0, 6),
(67, '關西鎮', '306', 0, 6),
(68, '芎林鄉', '307', 0, 6),
(69, '寶山鄉', '308', 0, 6),
(70, '竹東鎮', '310', 0, 6),
(71, '五峰鄉', '311', 0, 6),
(72, '橫山鄉', '312', 0, 6),
(73, '尖石鄉', '313', 0, 6),
(74, '北埔鄉', '314', 0, 6),
(75, '峨眉鄉', '315', 0, 6),
(76, '中壢區', '320', 0, 7),
(77, '平鎮區', '324', 0, 7),
(78, '龍潭區', '325', 0, 7),
(79, '楊梅區', '326', 0, 7),
(80, '新屋區', '327', 0, 7),
(81, '觀音區', '328', 0, 7),
(82, '桃園區', '330', 0, 7),
(83, '龜山區', '333', 0, 7),
(84, '八德區', '334', 0, 7),
(85, '大溪區', '335', 0, 7),
(86, '復興區', '336', 0, 7),
(87, '大園區', '337', 0, 7),
(88, '蘆竹區', '338', 0, 7),
(89, '竹南鎮', '350', 0, 8),
(90, '頭份市', '351', 0, 8),
(91, '三灣鄉', '352', 0, 8),
(92, '南庄鄉', '353', 0, 8),
(93, '獅潭鄉', '354', 0, 8),
(94, '後龍鎮', '356', 0, 8),
(95, '通霄鎮', '357', 0, 8),
(96, '苑裡鎮', '358', 0, 8),
(97, '苗栗市', '360', 0, 8),
(98, '造橋鄉', '361', 0, 8),
(99, '頭屋鄉', '362', 0, 8),
(100, '公館鄉', '363', 0, 8),
(101, '大湖鄉', '364', 0, 8),
(102, '泰安鄉', '365', 0, 8),
(103, '銅鑼鄉', '366', 0, 8),
(104, '三義鄉', '367', 0, 8),
(105, '西湖鄉', '368', 0, 8),
(106, '卓蘭鎮', '369', 0, 8),
(107, '中區', '400', 0, 9),
(108, '東區', '401', 0, 9),
(109, '南區', '402', 0, 9),
(110, '西區', '403', 0, 9),
(111, '北區', '404', 0, 9),
(112, '北屯區', '406', 0, 9),
(113, '西屯區', '407', 0, 9),
(114, '南屯區', '408', 0, 9),
(115, '太平區', '411', 0, 9),
(116, '大里區', '412', 0, 9),
(117, '霧峰區', '413', 0, 9),
(118, '烏日區', '414', 0, 9),
(119, '豐原區', '420', 0, 9),
(120, '后里區', '421', 0, 9),
(121, '石岡區', '422', 0, 9),
(122, '東勢區', '423', 0, 9),
(123, '和平區', '424', 0, 9),
(124, '新社區', '426', 0, 9),
(125, '潭子區', '427', 0, 9),
(126, '大雅區', '428', 0, 9),
(127, '神岡區', '429', 0, 9),
(128, '大肚區', '432', 0, 9),
(129, '沙鹿區', '433', 0, 9),
(130, '龍井區', '434', 0, 9),
(131, '梧棲區', '435', 0, 9),
(132, '清水區', '436', 0, 9),
(133, '大甲區', '437', 0, 9),
(134, '外埔區', '438', 0, 9),
(135, '大安區', '439', 0, 9),
(136, '彰化市', '500', 0, 10),
(137, '芬園鄉', '502', 0, 10),
(138, '花壇鄉', '503', 0, 10),
(139, '秀水鄉', '504', 0, 10),
(140, '鹿港鎮', '505', 0, 10),
(141, '福興鄉', '506', 0, 10),
(142, '線西鄉', '507', 0, 10),
(143, '和美鎮', '508', 0, 10),
(144, '伸港鄉', '509', 0, 10),
(145, '員林市', '510', 0, 10),
(146, '社頭鄉', '511', 0, 10),
(147, '永靖鄉', '512', 0, 10),
(148, '埔心鄉', '513', 0, 10),
(149, '溪湖鎮', '514', 0, 10),
(150, '大村鄉', '515', 0, 10),
(151, '埔鹽鄉', '516', 0, 10),
(152, '田中鎮', '520', 0, 10),
(153, '北斗鎮', '521', 0, 10),
(154, '田尾鄉', '522', 0, 10),
(155, '埤頭鄉', '523', 0, 10),
(156, '溪州鄉', '524', 0, 10),
(157, '竹塘鄉', '525', 0, 10),
(158, '二林鎮', '526', 0, 10),
(159, '大城鄉', '527', 0, 10),
(160, '芳苑鄉', '528', 0, 10),
(161, '二水鄉', '530', 0, 10),
(162, '南投市', '540', 0, 11),
(163, '中寮鄉', '541', 0, 11),
(164, '草屯鎮', '542', 0, 11),
(165, '國姓鄉', '544', 0, 11),
(166, '埔里鎮', '545', 0, 11),
(167, '仁愛鄉', '546', 0, 11),
(168, '名間鄉', '551', 0, 11),
(169, '集集鎮', '552', 0, 11),
(170, '水里鄉', '553', 0, 11),
(171, '魚池鄉', '555', 0, 11),
(172, '信義鄉', '556', 0, 11),
(173, '竹山鎮', '557', 0, 11),
(174, '鹿谷鄉', '558', 0, 11),
(175, '斗南鎮', '630', 0, 12),
(176, '大埤鄉', '631', 0, 12),
(177, '虎尾鎮', '632', 0, 12),
(178, '土庫鎮', '633', 0, 12),
(179, '褒忠鄉', '634', 0, 12),
(180, '東勢鄉', '635', 0, 12),
(181, '臺西鄉', '636', 0, 12),
(182, '崙背鄉', '637', 0, 12),
(183, '麥寮鄉', '638', 0, 12),
(184, '斗六市', '640', 0, 12),
(185, '林內鄉', '643', 0, 12),
(186, '古坑鄉', '646', 0, 12),
(187, '莿桐鄉', '647', 0, 12),
(188, '西螺鎮', '648', 0, 12),
(189, '二崙鄉', '649', 0, 12),
(190, '北港鎮', '651', 0, 12),
(191, '水林鄉', '652', 0, 12),
(192, '口湖鄉', '653', 0, 12),
(193, '四湖鄉', '654', 0, 12),
(194, '元長鄉', '655', 0, 12),
(195, '嘉義市(東區)', '600', 0, 13),
(196, '番路鄉', '602', 0, 14),
(197, '梅山鄉', '603', 0, 14),
(198, '竹崎鄉', '604', 0, 14),
(199, '阿里山鄉', '605', 0, 14),
(200, '中埔鄉', '606', 0, 14),
(201, '大埔鄉', '607', 0, 14),
(202, '水上鄉', '608', 0, 14),
(203, '鹿草鄉', '611', 0, 14),
(204, '太保市', '612', 0, 14),
(205, '朴子市', '613', 0, 14),
(206, '東石鄉', '614', 0, 14),
(207, '六腳鄉', '615', 0, 14),
(208, '新港鄉', '616', 0, 14),
(209, '民雄鄉', '621', 0, 14),
(210, '大林鎮', '622', 0, 14),
(211, '溪口鄉', '623', 0, 14),
(212, '義竹鄉', '624', 0, 14),
(213, '布袋鎮', '625', 0, 14),
(214, '中西區', '700', 0, 15),
(215, '東區', '701', 0, 15),
(216, '南區', '702', 0, 15),
(217, '北區', '704', 0, 15),
(218, '安平區', '708', 0, 15),
(219, '安南區', '709', 0, 15),
(220, '永康區', '710', 0, 15),
(221, '歸仁區', '711', 0, 15),
(222, '新化區', '712', 0, 15),
(223, '左鎮區', '713', 0, 15),
(224, '玉井區', '714', 0, 15),
(225, '楠西區', '715', 0, 15),
(226, '南化區', '716', 0, 15),
(227, '仁德區', '717', 0, 15),
(228, '關廟區', '718', 0, 15),
(229, '龍崎區', '719', 0, 15),
(230, '官田區', '720', 0, 15),
(231, '麻豆區', '721', 0, 15),
(232, '佳里區', '722', 0, 15),
(233, '西港區', '723', 0, 15),
(234, '七股區', '724', 0, 15),
(235, '將軍區', '725', 0, 15),
(236, '學甲區', '726', 0, 15),
(237, '北門區', '727', 0, 15),
(238, '新營區', '730', 0, 15),
(239, '後壁區', '731', 0, 15),
(240, '白河區', '732', 0, 15),
(241, '東山區', '733', 0, 15),
(242, '六甲區', '734', 0, 15),
(243, '下營區', '735', 0, 15),
(244, '柳營區', '736', 0, 15),
(245, '鹽水區', '737', 0, 15),
(246, '善化區', '741', 0, 15),
(247, '大內區', '742', 0, 15),
(248, '山上區', '743', 0, 15),
(249, '新市區', '744', 0, 15),
(250, '安定區', '745', 0, 15),
(251, '新興區', '800', 0, 16),
(252, '前金區', '801', 0, 16),
(253, '苓雅區', '802', 0, 16),
(254, '鹽埕區', '803', 0, 16),
(255, '鼓山區', '804', 0, 16),
(256, '旗津區', '805', 0, 16),
(257, '前鎮區', '806', 0, 16),
(258, '三民區', '807', 0, 16),
(259, '楠梓區', '811', 0, 16),
(260, '小港區', '812', 0, 16),
(261, '左營區', '813', 0, 16),
(262, '仁武區', '814', 0, 16),
(263, '大社區', '815', 0, 16),
(264, '岡山區', '820', 0, 16),
(265, '路竹區', '821', 0, 16),
(266, '阿蓮區', '822', 0, 16),
(267, '田寮區', '823', 0, 16),
(268, '燕巢區', '824', 0, 16),
(269, '橋頭區', '825', 0, 16),
(270, '梓官區', '826', 0, 16),
(271, '彌陀區', '827', 0, 16),
(272, '永安區', '828', 0, 16),
(273, '湖內區', '829', 0, 16),
(274, '鳳山區', '830', 0, 16),
(275, '大寮區', '831', 0, 16),
(276, '林園區', '832', 0, 16),
(277, '鳥松區', '833', 0, 16),
(278, '大樹區', '840', 0, 16),
(279, '旗山區', '842', 0, 16),
(280, '美濃區', '843', 0, 16),
(281, '六龜區', '844', 0, 16),
(282, '內門區', '845', 0, 16),
(283, '杉林區', '846', 0, 16),
(284, '甲仙區', '847', 0, 16),
(285, '桃源區', '848', 0, 16),
(286, '那瑪夏區', '849', 0, 16),
(287, '茂林區', '851', 0, 16),
(288, '茄萣區', '852', 0, 16),
(289, '東沙', '817', 0, 17),
(290, '南沙', '819', 0, 17),
(291, '馬公市', '880', 0, 18),
(292, '西嶼鄉', '881', 0, 18),
(293, '望安鄉', '882', 0, 18),
(294, '七美鄉', '883', 0, 18),
(295, '白沙鄉', '884', 0, 18),
(296, '湖西鄉', '885', 0, 18),
(297, '屏東市', '900', 0, 19),
(298, '三地門鄉', '901', 0, 19),
(299, '霧臺鄉', '902', 0, 19),
(300, '瑪家鄉', '903', 0, 19),
(301, '九如鄉', '904', 0, 19),
(302, '里港鄉', '905', 0, 19),
(303, '高樹鄉', '906', 0, 19),
(304, '鹽埔鄉', '907', 0, 19),
(305, '長治鄉', '908', 0, 19),
(306, '麟洛鄉', '909', 0, 19),
(307, '竹田鄉', '911', 0, 19),
(308, '內埔鄉', '912', 0, 19),
(309, '萬丹鄉', '913', 0, 19),
(310, '潮州鎮', '920', 0, 19),
(311, '泰武鄉', '921', 0, 19),
(312, '來義鄉', '922', 0, 19),
(313, '萬巒鄉', '923', 0, 19),
(314, '崁頂鄉', '924', 0, 19),
(315, '新埤鄉', '925', 0, 19),
(316, '南州鄉', '926', 0, 19),
(317, '林邊鄉', '927', 0, 19),
(318, '東港鄉', '928', 0, 19),
(319, '琉球鄉', '929', 0, 19),
(320, '佳冬鄉', '931', 0, 19),
(321, '新園鄉', '932', 0, 19),
(322, '枋寮鄉', '940', 0, 19),
(323, '枋山鄉', '941', 0, 19),
(324, '春日鄉', '942', 0, 19),
(325, '獅子鄉', '943', 0, 19),
(326, '車城鄉', '944', 0, 19),
(327, '牡丹鄉', '945', 0, 19),
(328, '恆春鎮', '946', 0, 19),
(329, '滿州鄉', '947', 0, 19),
(330, '臺東市', '950', 0, 20),
(331, '綠島鄉', '951', 0, 20),
(332, '蘭嶼鄉', '952', 0, 20),
(333, '延平鄉', '953', 0, 20),
(334, '卑南鄉', '954', 0, 20),
(335, '鹿野鄉', '955', 0, 20),
(336, '關山鎮', '956', 0, 20),
(337, '海端鄉', '957', 0, 20),
(338, '池上鄉', '958', 0, 20),
(339, '東河鄉', '959', 0, 20),
(340, '成功鎮', '961', 0, 20),
(341, '長濱鄉', '962', 0, 20),
(342, '太麻里鄉', '963', 0, 20),
(343, '金峰鄉', '964', 0, 20),
(344, '大武鄉', '965', 0, 20),
(345, '達仁鄉', '966', 0, 20),
(346, '花蓮市', '970', 0, 21),
(347, '新城鄉', '971', 0, 21),
(348, '秀林鄉', '972', 0, 21),
(349, '吉安鄉', '973', 0, 21),
(350, '壽豐鄉', '974', 0, 21),
(351, '鳳林鎮', '975', 0, 21),
(352, '光復鄉', '976', 0, 21),
(353, '豐濱鄉', '977', 0, 21),
(354, '瑞穗鄉', '978', 0, 21),
(355, '萬榮鄉', '979', 0, 21),
(356, '玉里鎮', '981', 0, 21),
(357, '卓溪鄉', '982', 0, 21),
(358, '富里鄉', '983', 0, 21),
(359, '金沙鎮', '890', 0, 22),
(360, '金湖鎮', '891', 0, 22),
(361, '金寧鄉', '892', 0, 22),
(362, '金城鎮', '893', 0, 22),
(363, '烈嶼鄉', '894', 0, 22),
(364, '烏坵鄉', '896', 0, 22),
(365, '南竿鄉', '209', 0, 23),
(366, '北竿鄉', '210', 0, 23),
(367, '莒光鄉', '211', 0, 23),
(368, '東引鄉', '212', 0, 23),
(371, '新竹市(北區)', '300', 0, 5),
(372, '新竹市(香山區)', '300', 0, 5),
(373, '嘉義市(西區)', '600', 0, 13);

-- --------------------------------------------------------

--
-- 資料表結構 `uorder`
--

CREATE TABLE `uorder` (
  `orderid` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '訂單編號',
  `emailid` int NOT NULL COMMENT '會員編號',
  `addressid` int NOT NULL COMMENT '收件人編號',
  `howpay` tinyint NOT NULL DEFAULT '1' COMMENT '如何付款',
  `paystatus` int DEFAULT NULL COMMENT '付款狀態',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '備註',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '訂單時間'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `uorder`
--

INSERT INTO `uorder` (`orderid`, `emailid`, `addressid`, `howpay`, `paystatus`, `status`, `remark`, `create_date`) VALUES
('2024114702274712359', 5, 8, 3, 35, 7, NULL, '2024-11-04 18:27:47'),
('2024111402321435608', 5, 8, 3, 35, 7, NULL, '2024-11-04 18:32:14'),
('2024110621174452189', 5, 8, 3, 35, 7, NULL, '2024-11-06 13:17:44'),
('2024110621180487650', 5, 8, 3, 35, 7, NULL, '2024-11-06 13:18:04'),
('2024110621501131930', 5, 9, 3, 35, 7, NULL, '2024-11-06 13:50:11'),
('2024110621503747020', 5, 9, 3, 35, 7, NULL, '2024-11-06 13:50:37');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `addbook`
--
ALTER TABLE `addbook`
  ADD PRIMARY KEY (`addressid`);

--
-- 資料表索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`caro_id`);

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- 資料表索引 `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`AutoNo`);

--
-- 資料表索引 `hot`
--
ALTER TABLE `hot`
  ADD PRIMARY KEY (`h_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`emailid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 資料表索引 `multiselect`
--
ALTER TABLE `multiselect`
  ADD PRIMARY KEY (`msid`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`);

--
-- 資料表索引 `pyclass`
--
ALTER TABLE `pyclass`
  ADD PRIMARY KEY (`classid`);

--
-- 資料表索引 `town`
--
ALTER TABLE `town`
  ADD PRIMARY KEY (`townNo`);

--
-- 資料表索引 `uorder`
--
ALTER TABLE `uorder`
  ADD PRIMARY KEY (`orderid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addbook`
--
ALTER TABLE `addbook`
  MODIFY `addressid` int NOT NULL AUTO_INCREMENT COMMENT '地址ID', AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `carousel`
--
ALTER TABLE `carousel`
  MODIFY `caro_id` int NOT NULL AUTO_INCREMENT COMMENT '輪播編號', AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int NOT NULL AUTO_INCREMENT COMMENT '購物車編號', AUTO_INCREMENT=33;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `city`
--
ALTER TABLE `city`
  MODIFY `AutoNo` int NOT NULL AUTO_INCREMENT COMMENT '城市編號', AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `hot`
--
ALTER TABLE `hot`
  MODIFY `h_id` int NOT NULL AUTO_INCREMENT COMMENT '熱銷商品流水號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `emailid` int NOT NULL AUTO_INCREMENT COMMENT 'email流水號', AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `multiselect`
--
ALTER TABLE `multiselect`
  MODIFY `msid` int NOT NULL AUTO_INCREMENT COMMENT '多功能選擇ID', AUTO_INCREMENT=39;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int NOT NULL AUTO_INCREMENT COMMENT '產品編號', AUTO_INCREMENT=54;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int NOT NULL AUTO_INCREMENT COMMENT '圖檔編號', AUTO_INCREMENT=157;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `pyclass`
--
ALTER TABLE `pyclass`
  MODIFY `classid` int NOT NULL AUTO_INCREMENT COMMENT '產品類別', AUTO_INCREMENT=168;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `town`
--
ALTER TABLE `town`
  MODIFY `townNo` bigint NOT NULL AUTO_INCREMENT COMMENT '鄕鎮市編號', AUTO_INCREMENT=374;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
