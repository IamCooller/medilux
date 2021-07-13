-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 13 2021 г., 09:52
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `medilux`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'U6doLZhfCNhz1J3T8s3hm9VUHjV1sSYLWNuxX30xijlDsoXqn6KrmCHUcODX15nbAuIltroRnKawohzEfc4PzZA1Rbm9ETYhuO9qWLb3ddzNqtSNhOYtVS5qAhcAOznxVeJBFRx0G0I6EEd6XAbQ2dqfjapNHsrAPbUygTaS21p1PBcYNLvBwQTjEZBQpV3qle7P61amruvCeo0ChWnuk5Jv6RwYJzlUv5B5gUFBfOpnJwuhGLxnIvNHBgZcywH6', 1, '2021-05-28 11:38:33', '2021-05-28 11:38:33');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_ip`
--

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_session`
--

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `session_id`, `ip`, `date_added`, `date_modified`) VALUES
(1, 1, '5670462ceec5eb09e72e6cd0f9', '127.0.0.1', '2021-05-31 11:33:43', '2021-05-31 11:33:43');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Brands', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `titleThree` varchar(255) DEFAULT NULL,
  `titleTwo` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`, `titleThree`, `titleTwo`) VALUES
(107, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 1, '', ''),
(194, 8, 1, '', '', 'catalog/demo/images/brands/6а.png', 6, '', ''),
(193, 8, 1, '', '', 'catalog/demo/images/brands/7а.png', 7, '', ''),
(192, 8, 1, '', '', 'catalog/demo/images/brands/8а.png', 8, '', ''),
(191, 8, 1, '', '', 'catalog/demo/images/brands/9а.png', 9, '', ''),
(190, 8, 1, '', '', 'catalog/demo/images/brands/10а.png', 10, '', ''),
(189, 8, 1, '', '', 'catalog/demo/images/brands/11а.png', 11, '', ''),
(188, 8, 1, '', '', 'catalog/demo/images/brands/21а.png', 12, '', ''),
(187, 8, 1, '', '', 'catalog/demo/images/brands/22а.png', 13, '', ''),
(185, 8, 1, '', '', 'catalog/demo/images/brands/19а.png', 15, '', ''),
(156, 7, 1, 'Полное сопровождение проекта', '', 'catalog/demo/images/banner.jpg', 0, 'Вы говорите нам ваши потребности, остальное – наша работа!', 'От идеи до установки.'),
(108, 6, 1, 'Полное сопровождение проекта', '', 'catalog/demo/images/aboutMain.png', 0, '', ''),
(157, 7, 1, 'Полное сопровождение проекта', '', 'catalog/demo/images/banner.jpg', 0, 'Вы говорите нам ваши потребности, остальное – наша работа!', 'От идеи до установки.'),
(155, 7, 1, 'Полное сопровождение проекта', '', 'catalog/demo/images/banner.jpg', 0, 'Вы говорите нам ваши потребности, остальное – наша работа!', 'От идеи до установки.'),
(154, 7, 1, 'Полное сопровождение проекта', '', 'catalog/demo/images/banner.jpg', 0, 'Вы говорите нам ваши потребности, остальное – наша работа!', 'От идеи до установки.'),
(186, 8, 1, '', '', 'catalog/demo/images/brands/20а.png', 14, '', ''),
(184, 8, 1, '', '', 'catalog/demo/images/brands/18а.png', 16, '', ''),
(183, 8, 1, '', '', 'catalog/demo/images/brands/17а.png', 17, '', ''),
(182, 8, 1, '', '', 'catalog/demo/images/brands/15а.png', 18, '', ''),
(181, 8, 1, '', '', 'catalog/demo/images/brands/14а.png', 19, '', ''),
(180, 8, 1, '', '', 'catalog/demo/images/brands/13а.png', 20, '', ''),
(179, 8, 1, '', '', 'catalog/demo/images/brands/12а.png', 21, '', ''),
(195, 8, 1, '', '', 'catalog/demo/images/brands/5а.png', 5, '', ''),
(196, 8, 1, '', '', 'catalog/demo/images/brands/4а.png', 4, '', ''),
(197, 8, 1, '', '', 'catalog/demo/images/brands/3а.png', 3, '', ''),
(198, 8, 1, '', '', 'catalog/demo/images/brands/2а.png', 2, '', ''),
(199, 8, 1, '', '', 'catalog/demo/images/brands/1а.png', 1, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog`
--

CREATE TABLE `oc_blog` (
  `blog_id` int(11) NOT NULL,
  `allow_comment` int(1) NOT NULL DEFAULT 1,
  `count_read` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `author` varchar(255) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_blog`
--

INSERT INTO `oc_blog` (`blog_id`, `allow_comment`, `count_read`, `sort_order`, `status`, `author`, `date_added`, `image`) VALUES
(1, 1, 0, 0, 1, 'John', '2021-07-07 11:57:37', 'catalog/demo/about1.png'),
(2, 1, 1, 0, 1, 'John', '2021-07-07 13:22:47', 'catalog/demo/aboutMain2.png'),
(3, 1, 2, 0, 1, 'John', '2021-07-07 13:26:47', 'catalog/demo/banner11.png'),
(4, 1, 1, 0, 1, 'John', '2021-07-07 13:27:04', 'catalog/demo/images/news.jpg'),
(5, 1, 3, 0, 1, 'John', '2021-07-07 13:27:23', 'catalog/demo/aboutMain.png'),
(6, 1, 1, 0, 1, 'John', '2021-07-07 14:23:32', 'catalog/demo/images/catalog/catalog1.jpg'),
(7, 1, 0, 0, 1, 'John', '2021-07-07 14:23:54', 'catalog/demo/images/catalog/catalog4.jpg'),
(8, 1, 25, 0, 1, 'John', '2021-07-07 14:24:15', 'catalog/demo/images/catalog/catalog1.jpg'),
(9, 1, 16, 0, 1, 'John', '2021-07-07 14:24:34', 'catalog/demo/images/catalog/catalog5.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category`
--

CREATE TABLE `oc_blog_category` (
  `blog_category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_description`
--

CREATE TABLE `oc_blog_category_description` (
  `blog_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `page_title` varchar(255) NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_to_layout`
--

CREATE TABLE `oc_blog_category_to_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_to_store`
--

CREATE TABLE `oc_blog_category_to_store` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_comment`
--

CREATE TABLE `oc_blog_comment` (
  `blog_comment_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_description`
--

CREATE TABLE `oc_blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `tags` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_blog_description`
--

INSERT INTO `oc_blog_description` (`blog_id`, `language_id`, `title`, `page_title`, `meta_keyword`, `meta_description`, `short_description`, `description`, `tags`) VALUES
(1, 1, 'Ультразвуковый денситометр SONOST-3000', '', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus rutrum ligula ac tincidunt dignissim.     ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(34, 34, 34); font-family: consolas, &amp;quot;lucida console&amp;quot;, &amp;quot;courier new&amp;quot;, monospace; font-size: 12px; white-space: pre-wrap;&quot;&gt;\r\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus rutrum ligula ac tincidunt dignissim.дмава&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', ''),
(2, 1, 'Ультразвуковый денситометр SONOST-3000', 'sadasd', '', '', 'Какой-то краткий текст', '&lt;p&gt;dadasd&lt;/p&gt;', ''),
(3, 1, ' Ультразвуковый денситометр SONOST-3000                     ', 'asd', '', '', 'Краткий текст', '&lt;p&gt;asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd&lt;/p&gt;', ''),
(5, 1, 'Ультразвуковый денситометр SONOST-3000', 'fdsfsd', '', '', 'Ультразвуковый денситометр SONOST-300021313ыв', '&lt;p&gt;vfdsfsf&lt;/p&gt;', ''),
(4, 1, 'Ультразвуковый денситометр SONOST-300023', 'sadasd', '', '', 'Ультразвуковый денситометр SONOST-3000412', '&lt;p&gt;asds&lt;/p&gt;', ''),
(6, 1, 'Ультразвуковый денситометр SONOST-3000йсвысыв', '', '', '', 'Очень важный текст', '', ''),
(7, 1, 'Ультразвуковый денситометр SONOST-3000', '', '', '', 'Текст', '', ''),
(8, 1, 'Ультразвуковый денситометр SONOST-3000', '', '', '', 'Тексттт', '', ''),
(9, 1, ' Ультразвуковый денситометр SONOST-3000                     ', '', '', '', 'Кратко здесь есть текст аууу', '  &lt;div class=&quot;newsOne__content&quot; style=&quot;color: rgb(33, 37, 41); font-family: Montserrat, sans-serif; font-size: 16px; background-color: rgb(250, 250, 250);&quot;&gt;&lt;img src=&quot;http://medilux/image/catalog/demo/images/catalog/catalog5.jpg&quot; alt=&quot; Ультразвуковый денситометр SONOST-3000                     &quot; title=&quot; Ультразвуковый денситометр SONOST-3000                     &quot; style=&quot;border-style: none; float: left; margin-right: 40px; margin-bottom: 15px; max-width: 419px; height: auto; width: 419px;&quot;&gt;&lt;p style=&quot;margin-bottom: 1rem; font-size: 12px; line-height: 1.25; color: rgb(79, 79, 79);&quot;&gt;Наша сервисная служба установила рентгеновский аппарат Jumong в клинику «Дентал форте элит», г. Набережные Челны.Jumong – классический цифровой рентгенографический аппарат на два рабочих места.&lt;/p&gt;&lt;h5 style=&quot;margin-bottom: 0.5rem; line-height: 1.28; font-size: 14px; color: rgb(0, 0, 0);&quot;&gt;Основные преимущества рентген аппарата Jumong:&lt;/h5&gt;&lt;ul style=&quot;padding-left: 2rem; margin-bottom: 1rem;&quot;&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; color: rgb(79, 79, 79); margin-bottom: 10px;&quot;&gt;Прекрасно подходит для медицинских учреждений с широким диапазоном исследований и большим потоком пациентов.&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; color: rgb(79, 79, 79); margin-bottom: 10px;&quot;&gt;Простота и удобство системы заключается в напольно-рельсовом механизме плавного перемещения стойки рентгеновской трубки, что дает возможность точно позиционировать необходимую область исследования.&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; color: rgb(79, 79, 79); margin-bottom: 10px;&quot;&gt;Аппарат оснащен двумя высококачественными цифровыми детекторами (производство Южная Корея) с активной матрицей 3072 х 3072 пикселей. Оценить снимок, обладающий высокой пространственной разрешающей способностью и контрастностью, можно уже через 3 секунды.&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; color: rgb(79, 79, 79); margin-bottom: 10px;&quot;&gt;Детекторы (один в столе, второй на вертикальной стойке) позволяют делать весь спектр рентгенографических снимков.&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; color: rgb(79, 79, 79); margin-bottom: 10px;&quot;&gt;Надежная фиксация стойки детектора и рентгеновской трубки при вертикальном перемещении осуществляется за счет магнитных тормозов (Опционально доступно автоматизированное перемещение).&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; color: rgb(79, 79, 79); margin-bottom: 10px;&quot;&gt;Рентгеновский стол снимков с механизированным перемещением в 4-х направлениях (Опционально доступно в 6 направлениях).&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; color: rgb(79, 79, 79); margin-bottom: 10px;&quot;&gt;Двухфокусная рентгеновская трубка за счет большой теплоемкости (300 кТЕ) чрезвычайно надежна и долговечна. Два фокусных пятна позволяют настроить параметры под любые задачи.&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;div class=&quot;newsOne__aditional&quot; style=&quot;font-size: 12px; line-height: 1.25; color: rgb(79, 79, 79); margin-top: 30px; font-family: Montserrat, sans-serif; background-color: rgb(250, 250, 250);&quot;&gt;Ознакомиться с ним подробнее и оставить заявку можно здесь:&amp;nbsp;&lt;a href=&quot;http://medilux/#&quot; style=&quot;color: rgb(57, 49, 133);&quot;&gt;Ссылка на страницу в каталоге этого товара&lt;/a&gt;&lt;/div&gt;&lt;ul&gt;\r\n                &lt;/ul&gt;', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_related`
--

CREATE TABLE `oc_blog_related` (
  `parent_blog_id` int(11) NOT NULL DEFAULT 0,
  `child_blog_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_related_products`
--

CREATE TABLE `oc_blog_related_products` (
  `blog_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_to_category`
--

CREATE TABLE `oc_blog_to_category` (
  `blog_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_to_layout`
--

CREATE TABLE `oc_blog_to_layout` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `oc_blog_to_layout`
--

INSERT INTO `oc_blog_to_layout` (`blog_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(8, 0, 0),
(7, 0, 0),
(6, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_to_store`
--

CREATE TABLE `oc_blog_to_store` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_blog_to_store`
--

INSERT INTO `oc_blog_to_store` (`blog_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_cart`
--

CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `information` tinyint(1) NOT NULL,
  `image_full` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`, `information`, `image_full`) VALUES
(77, 'catalog/demo/images/icons/icon8.png', 0, 1, 1, 1, 1, '2021-06-10 11:23:40', '2021-07-09 16:50:48', 0, 'catalog/demo/images/catalog/catalog8.jpg'),
(61, 'catalog/demo/images/icons/icon1.png', 0, 1, 1, 0, 1, '2021-06-10 10:46:59', '2021-07-09 11:32:54', 0, 'catalog/demo/images/catalog/catalog1.jpg'),
(62, '', 61, 0, 1, 0, 1, '2021-06-10 10:48:23', '2021-06-10 10:48:23', 0, NULL),
(63, '', 61, 0, 1, 0, 1, '2021-06-10 10:48:46', '2021-06-10 10:48:46', 0, NULL),
(64, '', 61, 0, 1, 0, 1, '2021-06-10 10:49:09', '2021-06-10 10:49:09', 0, NULL),
(65, 'catalog/demo/images/icons/icon2.png', 0, 1, 1, 0, 1, '2021-06-10 11:17:32', '2021-07-09 11:34:02', 0, 'catalog/demo/images/catalog/catalog2.jpg'),
(66, 'catalog/demo/images/icons/icon3.png', 0, 1, 1, 0, 1, '2021-06-10 11:18:21', '2021-07-09 11:28:59', 0, 'catalog/demo/images/catalog/catalog3.jpg'),
(67, 'catalog/demo/images/icons/icon4.png', 0, 1, 1, 0, 1, '2021-06-10 11:18:54', '2021-07-09 11:30:12', 0, 'catalog/demo/images/catalog/catalog4.jpg'),
(68, '', 67, 0, 1, 0, 1, '2021-06-10 11:19:16', '2021-06-10 11:19:16', 0, NULL),
(69, '', 67, 0, 1, 0, 1, '2021-06-10 11:19:40', '2021-06-10 11:19:40', 0, NULL),
(70, '', 67, 0, 1, 0, 1, '2021-06-10 11:20:02', '2021-06-10 11:20:02', 0, NULL),
(71, 'catalog/demo/images/icons/icon5.png', 0, 1, 1, 0, 1, '2021-06-10 11:20:26', '2021-07-09 11:27:44', 0, 'catalog/demo/images/catalog/catalog5.jpg'),
(72, 'catalog/demo/images/icons/icon6.png', 0, 1, 1, 0, 1, '2021-06-10 11:21:02', '2021-07-09 11:34:36', 0, 'catalog/demo/images/catalog/catalog6.jpg'),
(73, '', 72, 0, 1, 0, 1, '2021-06-10 11:21:42', '2021-06-10 11:21:42', 0, NULL),
(74, '', 72, 0, 1, 0, 1, '2021-06-10 11:22:05', '2021-06-10 11:58:17', 0, NULL),
(75, '', 72, 0, 1, 0, 1, '2021-06-10 11:22:27', '2021-06-10 11:22:27', 0, NULL),
(80, '', 77, 0, 1, 0, 1, '2021-06-10 11:24:48', '2021-06-10 11:24:48', 0, NULL),
(79, '', 77, 0, 1, 0, 1, '2021-06-10 11:24:25', '2021-06-10 11:24:25', 0, NULL),
(78, '', 77, 0, 1, 0, 1, '2021-06-10 11:24:04', '2021-06-10 11:24:04', 0, NULL),
(76, 'catalog/demo/images/icons/icon7.png', 72, 1, 1, 0, 1, '2021-06-10 11:22:54', '2021-06-10 11:23:19', 0, NULL),
(59, '', 59, 0, 1, 0, 1, '2021-05-31 11:39:58', '2021-05-31 11:40:30', 0, NULL),
(81, '', 77, 0, 1, 0, 1, '2021-06-10 11:25:12', '2021-06-10 11:25:12', 0, NULL),
(82, '', 77, 0, 1, 0, 1, '2021-06-10 11:25:29', '2021-06-10 11:25:29', 0, NULL),
(83, 'catalog/demo/images/icons/icon9.png', 0, 1, 1, 0, 1, '2021-06-10 11:25:49', '2021-07-09 11:30:38', 0, 'catalog/demo/images/catalog/catalog9.jpg'),
(84, 'catalog/demo/images/icons/icon10.png', 0, 1, 1, 0, 1, '2021-06-10 11:26:18', '2021-07-09 11:29:38', 0, 'catalog/demo/images/catalog/catalog10.jpg'),
(85, 'catalog/demo/images/icons/icon11.png', 0, 1, 1, 0, 1, '2021-06-10 11:26:37', '2021-07-09 11:33:30', 0, 'catalog/demo/images/catalog/catalog11.jpg'),
(86, 'catalog/demo/images/icons/icon12.png', 0, 1, 1, 0, 1, '2021-06-10 11:26:56', '2021-07-09 11:32:16', 0, 'catalog/demo/images/catalog/catalog12.jpg'),
(87, 'catalog/demo/images/icons/icon7.png', 0, 0, 1, 0, 1, '2021-07-09 12:17:46', '2021-07-09 12:17:46', 0, 'catalog/demo/images/catalog/catalog7.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `header` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `header`, `short_description`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(78, 1, 'Кольпоскопы', '', '', '', 'Кольпоскопы', '', ''),
(79, 1, 'Гинекологические кресла', '', '', '', 'Гинекологические кресла', '', ''),
(80, 1, 'Гинекологические светильники', '', '', '', 'Гинекологические светильники', '', ''),
(77, 1, 'Акушерство и гинекология', '', '', '', 'Акушерство и гинекология', '', ''),
(65, 1, 'УЗИ аппараты', '', '', '', 'УЗИ аппараты', '', ''),
(61, 1, 'Рентген оборудование', '', '', '', 'Рентген оборудование', '', ''),
(62, 1, 'Цифровые рентгены', '', '', '', 'Цифровые рентгены', '', ''),
(63, 1, 'Денситометры', '', '', '', 'Денситометры', '', ''),
(64, 1, 'Маммографы', '', '', '', 'Маммографы', '', ''),
(81, 1, 'Фетальные мониторы', '', '', '', 'Фетальные мониторы', '', ''),
(82, 1, 'Весы и ростомеры', '', '', '', 'Весы и ростомеры', '', ''),
(83, 1, 'Неонатология', '', '', '', 'Неонатология', '', ''),
(84, 1, 'Лабораторная диагностика', '', '', '', 'Лабораторная диагностика', '', ''),
(85, 1, 'Стерилизация и дезинфекция', '', '', '', 'Стерилизация и дезинфекция', '', ''),
(66, 1, 'Жесткая эндоскопия', '', '', '', 'Жесткая эндоскопия', '', ''),
(67, 1, 'ЛОР-оборудование', '', '', '', 'ЛОР-оборудование', '', ''),
(68, 1, 'ЛОР-комбайны', '', '', '', 'ЛОР-комбайны', '', ''),
(69, 1, 'ЛОР-кресла', '', '', '', 'ЛОР-кресла', '', ''),
(70, 1, 'Инфузионные помпы', '', '', '', 'Инфузионные помпы', '', ''),
(71, 1, 'Видеосистемы', '', '', '', 'Видеосистемы', '', ''),
(72, 1, 'Хирургия и реанимация', '', '', '', 'Хирургия и реанимация', '', ''),
(73, 1, 'ЭХВЧ', '', '', '', 'ЭХВЧ', '', ''),
(74, 1, 'Мониторы пациента', '', '', '', 'Мониторы пациента', '', ''),
(75, 1, 'ИВЛ', '', '', '', 'ИВЛ', '', ''),
(76, 1, 'Функциональная диагностика', '', '', '', 'Функциональная диагностика', '', ''),
(59, 1, 'Каталог', '', '', '', 'Catalogs', '', ''),
(87, 1, 'Функциональная диагностика ', '', '', '', 'Функциональная диагностика ', '', ''),
(86, 1, 'Прочие медицинские товары', '', '', '', 'Прочие медицинские товары', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_filter`
--

INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES
(77, 1),
(77, 2),
(77, 3),
(77, 4),
(77, 5),
(77, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_image`
--

CREATE TABLE `oc_category_image` (
  `category_image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(79, 77, 0),
(78, 78, 1),
(78, 77, 0),
(77, 77, 0),
(76, 76, 1),
(76, 72, 0),
(75, 75, 1),
(75, 72, 0),
(74, 74, 1),
(74, 72, 0),
(73, 73, 1),
(73, 72, 0),
(72, 72, 0),
(71, 71, 0),
(70, 70, 1),
(70, 67, 0),
(69, 69, 1),
(69, 67, 0),
(68, 68, 1),
(68, 67, 0),
(67, 67, 0),
(66, 66, 0),
(61, 61, 0),
(65, 65, 0),
(64, 64, 1),
(64, 61, 0),
(63, 63, 1),
(63, 61, 0),
(62, 61, 0),
(79, 79, 1),
(86, 86, 0),
(85, 85, 0),
(84, 84, 0),
(83, 83, 0),
(82, 77, 0),
(82, 82, 1),
(81, 81, 1),
(81, 77, 0),
(80, 80, 1),
(80, 77, 0),
(62, 62, 1),
(59, 59, 0),
(87, 87, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(87, 0, 0),
(61, 0, 0),
(62, 0, 0),
(63, 0, 0),
(64, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 15),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(59, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(20, 'Белоруссия (Беларусь)', 'BY', 'BLR', '', 0, 1),
(80, 'Грузия', 'GE', 'GEO', '', 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(115, 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', 0, 1),
(176, 'Российская Федерация', 'RU', 'RUS', '', 0, 1),
(220, 'Украина', 'UA', 'UKR', '', 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Рубль', 'RUB', '', 'р.', '0', 1.00000000, 1, '2021-07-13 06:42:11');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text DEFAULT NULL,
  `wishlist` text DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_affiliate`
--

CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT 0.00,
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_approval`
--

CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_online`
--

INSERT INTO `oc_customer_online` (`ip`, `customer_id`, `url`, `referer`, `date_added`) VALUES
('127.0.0.1', 0, 'http://medilux/akusherstvo-i-ginekologiya/ultrazvukovyj-densitometr-sonost-3000-2', 'http://medilux/akusherstvo-i-ginekologiya', '2021-07-13 06:50:54');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_search`
--

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `informations` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_search`
--

INSERT INTO `oc_customer_search` (`customer_search_id`, `store_id`, `language_id`, `customer_id`, `keyword`, `category_id`, `sub_category`, `description`, `products`, `informations`, `ip`, `date_added`) VALUES
(1, 0, 1, 0, 'mac', 0, 0, 0, 4, 0, '127.0.0.1', '2021-06-03 10:39:13'),
(2, 0, 1, 0, 'вываыв', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 10:53:18'),
(3, 0, 1, 0, 'mac', 0, 0, 0, 4, 0, '127.0.0.1', '2021-06-03 10:53:23'),
(4, 0, 1, 0, 'mac', 0, 0, 0, 4, 0, '127.0.0.1', '2021-06-03 10:56:06'),
(5, 0, 1, 0, 'вы', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 10:56:15'),
(6, 0, 1, 0, 'mac', 0, 0, 0, 4, 0, '127.0.0.1', '2021-06-03 10:57:04'),
(7, 0, 1, 0, 'mac', 0, 0, 0, 4, 0, '127.0.0.1', '2021-06-03 10:57:13'),
(8, 0, 1, 0, 'mac', 0, 0, 0, 4, 0, '127.0.0.1', '2021-06-03 10:57:22'),
(9, 0, 1, 0, 'asdsdd', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 11:37:26'),
(10, 0, 1, 0, 'asdsdd', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 11:37:29'),
(11, 0, 1, 0, 'dssda', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 11:38:18'),
(12, 0, 1, 0, 'dssda', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 11:39:20'),
(13, 0, 1, 0, 'dssdas', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 11:39:24'),
(14, 0, 1, 0, 'dcd', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 11:39:32'),
(15, 0, 1, 0, 'dcd', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 11:40:31'),
(16, 0, 1, 0, 'asd', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 11:40:39'),
(17, 0, 1, 0, 'asd', 0, 0, 0, 0, 0, '127.0.0.1', '2021-06-03 11:40:43'),
(18, 0, 1, 0, 'gdf', 0, 0, 0, 0, 0, '127.0.0.1', '2021-07-06 16:26:37'),
(19, 0, 1, 0, 'Ультразвуковый ', 0, 0, 0, 2, 0, '127.0.0.1', '2021-07-07 17:38:15');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_wishlist`
--

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturn/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0),
(34, 'advertise_google', 'admin/model/catalog/product/deleteProduct/after', 'extension/advertise/google/deleteProduct', 1, 0),
(35, 'advertise_google', 'admin/model/catalog/product/copyProduct/after', 'extension/advertise/google/copyProduct', 1, 0),
(36, 'advertise_google', 'admin/view/common/column_left/before', 'extension/advertise/google/admin_link', 1, 0),
(37, 'advertise_google', 'admin/model/catalog/product/addProduct/after', 'extension/advertise/google/addProduct', 1, 0),
(38, 'advertise_google', 'catalog/controller/checkout/success/before', 'extension/advertise/google/before_checkout_success', 1, 0),
(39, 'advertise_google', 'catalog/view/common/header/after', 'extension/advertise/google/google_global_site_tag', 1, 0),
(40, 'advertise_google', 'catalog/view/common/success/after', 'extension/advertise/google/google_dynamic_remarketing_purchase', 1, 0),
(41, 'advertise_google', 'catalog/view/product/product/after', 'extension/advertise/google/google_dynamic_remarketing_product', 1, 0),
(42, 'advertise_google', 'catalog/view/product/search/after', 'extension/advertise/google/google_dynamic_remarketing_searchresults', 1, 0),
(43, 'advertise_google', 'catalog/view/product/category/after', 'extension/advertise/google/google_dynamic_remarketing_category', 1, 0),
(44, 'advertise_google', 'catalog/view/common/home/after', 'extension/advertise/google/google_dynamic_remarketing_home', 1, 0),
(45, 'advertise_google', 'catalog/view/checkout/cart/after', 'extension/advertise/google/google_dynamic_remarketing_cart', 1, 0),
(84, 'optimblog_catalog_language_product', 'catalog/language/product/product/after', 'extension/information/optimblog/languageProduct', 1, 0),
(83, 'optimblog_admin_language_customer_search', 'admin/language/extension/report/customer_search/after', 'extension/extension/information/languageCustomerSearch', 1, 0),
(82, 'optimblog_admin_language_review', 'admin/language/catalog/review/after', 'extension/extension/information/languageReview', 1, 0),
(81, 'optimblog_admin_language_information', 'admin/language/catalog/information/after', 'extension/extension/information/languageInformation', 1, 0),
(80, 'optimblog_admin_language_product', 'admin/language/catalog/product/after', 'extension/extension/information/languageProduct', 1, 0),
(79, 'optimblog_admin_language_category', 'admin/language/catalog/category/after', 'extension/extension/information/languageCategory', 1, 0),
(78, 'optimblog_catalog_model_product_review_total', 'catalog/model/catalog/review/getTotalReviewsByProductId/before', 'extension/information/optimblog/getTotalReviewsByProductId', 1, 0),
(77, 'optimblog_catalog_model_product_review', 'catalog/model/catalog/review/getReviewsByProductId/before', 'extension/information/optimblog/getReviewsByProductId', 1, 0),
(76, 'optimblog_catalog_model_product_related', 'catalog/model/catalog/product/getProductRelated/before', 'extension/information/optimblog/getProductRelated', 1, 0),
(75, 'optimblog_catalog_model_product_get', 'catalog/model/catalog/product/getProduct/before', 'extension/information/optimblog/getProduct', 1, 0),
(74, 'optimblog_catalog_model_informations_get', 'catalog/model/catalog/information/getInformations/before', 'extension/information/optimblog/getInformations', 1, 0),
(73, 'optimblog_catalog_model_information_get', 'catalog/model/catalog/information/getInformation/before', 'extension/information/optimblog/getInformation', 1, 0),
(72, 'optimblog_catalog_information_write', 'catalog/controller/information/information/write/before', 'extension/information/optimblog/informationWrite', 1, 0),
(71, 'optimblog_catalog_information_review', 'catalog/controller/information/information/review/before', 'extension/information/optimblog/informationReview', 1, 0),
(70, 'optimblog_catalog_view_information', 'catalog/view/information/information/before', 'extension/information/optimblog/viewInformationBefore', 1, 0),
(69, 'optimblog_catalog_view_product', 'catalog/view/product/product/before', 'extension/information/optimblog/viewProduct', 1, 0),
(68, 'optimblog_catalog_view_category', 'catalog/view/product/category/before', 'extension/information/optimblog/viewCategory', 1, 0),
(67, 'optimblog_catalog_view_header', 'catalog/view/common/header/before', 'extension/information/optimblog/viewHeaderBefore', 1, 0),
(85, 'optimblog_catalog_language_information', 'catalog/language/information/information/after', 'extension/information/optimblog/languageInformation', 1, 0),
(86, 'optimblog_catalog_language_review', 'catalog/language/mail/review/after', 'extension/information/optimblog/languageReview', 1, 0),
(87, 'optimblog_catalog_controller_category_type', 'catalog/controller/product/category/before', 'extension/information/optimblog/controllerCategoryType', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(50, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward'),
(42, 'advertise', 'google'),
(49, 'theme', 'medilux'),
(44, 'module', 'special'),
(45, 'module', 'store'),
(46, 'module', 'html'),
(47, 'module', 'filter'),
(48, 'module', 'bestseller'),
(53, 'information', 'optimblog'),
(52, 'module', 'newsletter');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension_install`
--

CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_extension_install`
--

INSERT INTO `oc_extension_install` (`extension_install_id`, `extension_download_id`, `filename`, `date_added`) VALUES
(11, 0, 'optimblog.ocmod.zip', '2021-07-07 10:31:05'),
(6, 0, 'localcopy_oc3.ocmod.zip', '2021-06-10 15:46:09'),
(10, 0, 'auto-complete-meta-tags-title_oc3.x.ocmod.zip', '2021-07-02 15:05:52'),
(9, 0, 'fix_opencart3036.ocmod.zip', '2021-06-10 17:13:55'),
(8, 0, 'newsletter-subscription_oc3.ocmod.zip', '2021-06-10 15:46:50'),
(12, 0, 'blog_oc3.ocmod.zip', '2021-07-07 11:36:49'),
(13, 0, 'ocfilter.opencart-3.ocmod.zip', '2021-07-09 16:26:45');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension_path`
--

CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_extension_path`
--

INSERT INTO `oc_extension_path` (`extension_path_id`, `extension_install_id`, `path`, `date_added`) VALUES
(106, 11, 'admin/controller/extension/information', '2021-07-07 10:31:08'),
(107, 11, 'admin/model/extension/information', '2021-07-07 10:31:08'),
(108, 11, 'catalog/controller/extension/information', '2021-07-07 10:31:08'),
(109, 11, 'catalog/model/extension/information', '2021-07-07 10:31:08'),
(110, 11, 'catalog/view/javascript/optimblog.js', '2021-07-07 10:31:08'),
(111, 11, 'admin/controller/extension/extension/information.php', '2021-07-07 10:31:08'),
(112, 11, 'admin/controller/extension/information/optimblog.php', '2021-07-07 10:31:08'),
(113, 11, 'admin/language/en-gb/extension/information', '2021-07-07 10:31:08'),
(114, 11, 'admin/language/ru-ru/extension/information', '2021-07-07 10:31:08'),
(115, 11, 'admin/model/extension/information/optimblog.php', '2021-07-07 10:31:08'),
(116, 11, 'admin/view/template/extension/information', '2021-07-07 10:31:08'),
(117, 11, 'catalog/controller/extension/information/category.php', '2021-07-07 10:31:08'),
(118, 11, 'catalog/controller/extension/information/optimblog.php', '2021-07-07 10:31:08'),
(119, 11, 'catalog/language/en-gb/extension/information', '2021-07-07 10:31:08'),
(120, 11, 'catalog/language/en-gb/information/category.php', '2021-07-07 10:31:08'),
(121, 11, 'catalog/language/ru-ru/extension/information', '2021-07-07 10:31:08'),
(122, 11, 'catalog/language/ru-ru/information/category.php', '2021-07-07 10:31:08'),
(123, 11, 'catalog/model/extension/information/optimblog_category.php', '2021-07-07 10:31:08'),
(124, 11, 'catalog/model/extension/information/optimblog_information.php', '2021-07-07 10:31:08'),
(125, 11, 'catalog/model/extension/information/optimblog_product.php', '2021-07-07 10:31:08'),
(126, 11, 'catalog/model/extension/information/optimblog_review.php', '2021-07-07 10:31:08'),
(127, 11, 'admin/language/en-gb/extension/extension/information.php', '2021-07-07 10:31:08'),
(128, 11, 'admin/language/en-gb/extension/information/optimblog.php', '2021-07-07 10:31:08'),
(129, 11, 'admin/language/en-gb/extension/information/optimblog_category.php', '2021-07-07 10:31:08'),
(130, 11, 'admin/language/en-gb/extension/information/optimblog_customer_search.php', '2021-07-07 10:31:08'),
(131, 11, 'admin/language/en-gb/extension/information/optimblog_information.php', '2021-07-07 10:31:08'),
(132, 11, 'admin/language/en-gb/extension/information/optimblog_product.php', '2021-07-07 10:31:08'),
(133, 11, 'admin/language/en-gb/extension/information/optimblog_review.php', '2021-07-07 10:31:08'),
(134, 11, 'admin/language/ru-ru/extension/extension/information.php', '2021-07-07 10:31:08'),
(135, 11, 'admin/language/ru-ru/extension/information/optimblog.php', '2021-07-07 10:31:08'),
(136, 11, 'admin/language/ru-ru/extension/information/optimblog_category.php', '2021-07-07 10:31:08'),
(137, 11, 'admin/language/ru-ru/extension/information/optimblog_customer_search.php', '2021-07-07 10:31:08'),
(138, 11, 'admin/language/ru-ru/extension/information/optimblog_information.php', '2021-07-07 10:31:08'),
(139, 11, 'admin/language/ru-ru/extension/information/optimblog_product.php', '2021-07-07 10:31:08'),
(140, 11, 'admin/language/ru-ru/extension/information/optimblog_review.php', '2021-07-07 10:31:08'),
(141, 11, 'admin/view/template/extension/extension/information.twig', '2021-07-07 10:31:08'),
(142, 11, 'admin/view/template/extension/information/optimblog.twig', '2021-07-07 10:31:08'),
(143, 11, 'catalog/language/en-gb/extension/information/optimblog_information.php', '2021-07-07 10:31:08'),
(144, 11, 'catalog/language/en-gb/extension/information/optimblog_product.php', '2021-07-07 10:31:08'),
(145, 11, 'catalog/language/en-gb/extension/information/optimblog_review.php', '2021-07-07 10:31:08'),
(146, 11, 'catalog/language/ru-ru/extension/information/optimblog_information.php', '2021-07-07 10:31:08'),
(147, 11, 'catalog/language/ru-ru/extension/information/optimblog_product.php', '2021-07-07 10:31:08'),
(148, 11, 'catalog/language/ru-ru/extension/information/optimblog_review.php', '2021-07-07 10:31:08'),
(89, 8, 'admin/model/common', '2021-06-10 15:46:53'),
(90, 8, 'admin/controller/common/newsletter.php', '2021-06-10 15:46:53'),
(91, 8, 'admin/model/common/newsletter.php', '2021-06-10 15:46:53'),
(92, 8, 'admin/controller/extension/module/newsletter.php', '2021-06-10 15:46:53'),
(93, 8, 'admin/model/extension/module/newsletter.php', '2021-06-10 15:46:53'),
(94, 8, 'admin/view/template/common/newsletter.twig', '2021-06-10 15:46:53'),
(95, 8, 'catalog/controller/extension/module/newsletter.php', '2021-06-10 15:46:53'),
(96, 8, 'catalog/model/extension/module/newsletter.php', '2021-06-10 15:46:53'),
(97, 8, 'catalog/view/javascript/jquery/jquery.cookie.js', '2021-06-10 15:46:53'),
(98, 8, 'admin/language/en-gb/extension/module/newsletter.php', '2021-06-10 15:46:54'),
(99, 8, 'admin/language/ru-ru/extension/module/newsletter.php', '2021-06-10 15:46:54'),
(100, 8, 'admin/view/template/extension/module/newsletter.twig', '2021-06-10 15:46:54'),
(101, 8, 'catalog/language/en-gb/extension/module/newsletter.php', '2021-06-10 15:46:54'),
(102, 8, 'catalog/language/ru-ru/extension/module/newsletter.php', '2021-06-10 15:46:54'),
(103, 8, 'catalog/view/theme/default/stylesheet/newsletter.css', '2021-06-10 15:46:54'),
(104, 8, 'catalog/view/theme/default/template/extension/module/newsletter.twig', '2021-06-10 15:46:54'),
(105, 9, 'system/modification.xml', '2021-06-10 17:13:58'),
(149, 11, 'catalog/view/theme/medilux/template/information/category.twig', '2021-07-07 10:31:08'),
(150, 12, 'admin/controller/blog', '2021-07-07 11:36:53'),
(151, 12, 'admin/model/blog', '2021-07-07 11:36:53'),
(152, 12, 'catalog/controller/blog', '2021-07-07 11:36:53'),
(153, 12, 'catalog/model/blog', '2021-07-07 11:36:53'),
(154, 12, 'admin/controller/blog/blog.php', '2021-07-07 11:36:53'),
(155, 12, 'admin/controller/blog/blog_category.php', '2021-07-07 11:36:53'),
(156, 12, 'admin/controller/blog/blog_comment.php', '2021-07-07 11:36:53'),
(157, 12, 'admin/controller/blog/blog_setting.php', '2021-07-07 11:36:53'),
(158, 12, 'admin/language/en-gb/blog', '2021-07-07 11:36:53'),
(159, 12, 'admin/language/ru-ru/blog', '2021-07-07 11:36:53'),
(160, 12, 'admin/model/blog/blog.php', '2021-07-07 11:36:53'),
(161, 12, 'admin/model/blog/blog_category.php', '2021-07-07 11:36:53'),
(162, 12, 'admin/model/blog/blog_comment.php', '2021-07-07 11:36:53'),
(163, 12, 'admin/model/blog/blog_setting.php', '2021-07-07 11:36:53'),
(164, 12, 'admin/view/template/blog', '2021-07-07 11:36:53'),
(165, 12, 'catalog/controller/blog/blog.php', '2021-07-07 11:36:53'),
(166, 12, 'catalog/controller/blog/category.php', '2021-07-07 11:36:53'),
(167, 12, 'catalog/controller/blog/home.php', '2021-07-07 11:36:53'),
(168, 12, 'catalog/language/en-gb/blog', '2021-07-07 11:36:53'),
(169, 12, 'catalog/language/ru-ru/blog', '2021-07-07 11:36:53'),
(170, 12, 'catalog/model/blog/blog.php', '2021-07-07 11:36:53'),
(171, 12, 'catalog/model/blog/blog_category.php', '2021-07-07 11:36:53'),
(172, 12, 'admin/controller/extension/module/blog_category.php', '2021-07-07 11:36:53'),
(173, 12, 'admin/controller/extension/module/blog_latest.php', '2021-07-07 11:36:53'),
(174, 12, 'admin/language/en-gb/blog/blog.php', '2021-07-07 11:36:53'),
(175, 12, 'admin/language/en-gb/blog/blog_category.php', '2021-07-07 11:36:53'),
(176, 12, 'admin/language/en-gb/blog/blog_comment.php', '2021-07-07 11:36:53'),
(177, 12, 'admin/language/en-gb/blog/blog_setting.php', '2021-07-07 11:36:53'),
(178, 12, 'admin/language/ru-ru/blog/blog.php', '2021-07-07 11:36:53'),
(179, 12, 'admin/language/ru-ru/blog/blog_category.php', '2021-07-07 11:36:53'),
(180, 12, 'admin/language/ru-ru/blog/blog_comment.php', '2021-07-07 11:36:53'),
(181, 12, 'admin/language/ru-ru/blog/blog_setting.php', '2021-07-07 11:36:53'),
(182, 12, 'admin/view/template/blog/blog_category_form.twig', '2021-07-07 11:36:53'),
(183, 12, 'admin/view/template/blog/blog_category_list.twig', '2021-07-07 11:36:53'),
(184, 12, 'admin/view/template/blog/blog_comment_list.twig', '2021-07-07 11:36:53'),
(185, 12, 'admin/view/template/blog/blog_form.twig', '2021-07-07 11:36:53'),
(186, 12, 'admin/view/template/blog/blog_list.twig', '2021-07-07 11:36:53'),
(187, 12, 'admin/view/template/blog/blog_setting.twig', '2021-07-07 11:36:53'),
(188, 12, 'catalog/controller/extension/module/blog_category.php', '2021-07-07 11:36:53'),
(189, 12, 'catalog/controller/extension/module/blog_latest.php', '2021-07-07 11:36:53'),
(190, 12, 'catalog/language/en-gb/blog/blog.php', '2021-07-07 11:36:53'),
(191, 12, 'catalog/language/ru-ru/blog/blog.php', '2021-07-07 11:36:53'),
(192, 12, 'admin/language/en-gb/extension/module/blog_category.php', '2021-07-07 11:36:53'),
(193, 12, 'admin/language/en-gb/extension/module/blog_latest.php', '2021-07-07 11:36:53'),
(194, 12, 'admin/language/ru-ru/extension/module/blog_category.php', '2021-07-07 11:36:53'),
(195, 12, 'admin/language/ru-ru/extension/module/blog_latest.php', '2021-07-07 11:36:53'),
(196, 12, 'admin/view/template/extension/module/blog_category.twig', '2021-07-07 11:36:53'),
(197, 12, 'admin/view/template/extension/module/blog_latest.twig', '2021-07-07 11:36:53'),
(198, 12, 'catalog/view/theme/default/stylesheet/blog.css', '2021-07-07 11:36:53'),
(199, 12, 'catalog/view/theme/default/template/blog', '2021-07-07 11:36:53'),
(200, 12, 'catalog/view/theme/default/template/blog/blog.twig', '2021-07-07 11:36:53'),
(201, 12, 'catalog/view/theme/default/template/blog/blog_category.twig', '2021-07-07 11:36:53'),
(202, 12, 'catalog/view/theme/default/template/blog/blog_home.twig', '2021-07-07 11:36:53'),
(203, 12, 'catalog/view/theme/default/template/blog/comment.twig', '2021-07-07 11:36:53'),
(204, 12, 'catalog/view/theme/default/template/extension/module/blog_category.twig', '2021-07-07 11:36:53'),
(205, 12, 'catalog/view/theme/default/template/extension/module/blog_latest.twig', '2021-07-07 11:36:53'),
(206, 13, 'admin/language/en', '2021-07-09 16:26:48'),
(207, 13, 'admin/language/en-us', '2021-07-09 16:26:48'),
(208, 13, 'admin/language/english', '2021-07-09 16:26:48'),
(209, 13, 'admin/language/ru', '2021-07-09 16:26:48'),
(210, 13, 'admin/language/russian', '2021-07-09 16:26:48'),
(211, 13, 'catalog/language/en', '2021-07-09 16:26:48'),
(212, 13, 'catalog/language/en-us', '2021-07-09 16:26:48'),
(213, 13, 'catalog/language/english', '2021-07-09 16:26:48'),
(214, 13, 'catalog/language/ru', '2021-07-09 16:26:48'),
(215, 13, 'catalog/language/russian', '2021-07-09 16:26:48'),
(216, 13, 'system/config/ocfilter.php', '2021-07-09 16:26:48'),
(217, 13, 'system/library/ocfilter.php', '2021-07-09 16:26:48'),
(218, 13, 'admin/language/en/extension', '2021-07-09 16:26:48'),
(219, 13, 'admin/language/en-us/extension', '2021-07-09 16:26:48'),
(220, 13, 'admin/language/english/extension', '2021-07-09 16:26:48'),
(221, 13, 'admin/language/ru/extension', '2021-07-09 16:26:48'),
(222, 13, 'admin/language/russian/extension', '2021-07-09 16:26:48'),
(223, 13, 'admin/model/extension/ocfilter.php', '2021-07-09 16:26:48'),
(224, 13, 'admin/model/extension/ocfilter_page.php', '2021-07-09 16:26:48'),
(225, 13, 'admin/view/image/ocfilter', '2021-07-09 16:26:48'),
(226, 13, 'admin/view/javascript/ocfilter', '2021-07-09 16:26:48'),
(227, 13, 'admin/view/stylesheet/ocfilter', '2021-07-09 16:26:48'),
(228, 13, 'catalog/language/en/extension', '2021-07-09 16:26:48'),
(229, 13, 'catalog/language/en-us/extension', '2021-07-09 16:26:48'),
(230, 13, 'catalog/language/english/extension', '2021-07-09 16:26:48'),
(231, 13, 'catalog/language/ru/extension', '2021-07-09 16:26:48'),
(232, 13, 'catalog/language/russian/extension', '2021-07-09 16:26:48'),
(233, 13, 'catalog/view/javascript/ocfilter', '2021-07-09 16:26:48'),
(234, 13, 'admin/controller/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(235, 13, 'admin/language/en/extension/module', '2021-07-09 16:26:48'),
(236, 13, 'admin/language/en-us/extension/module', '2021-07-09 16:26:48'),
(237, 13, 'admin/language/english/extension/module', '2021-07-09 16:26:48'),
(238, 13, 'admin/language/ru/extension/module', '2021-07-09 16:26:48'),
(239, 13, 'admin/language/russian/extension/module', '2021-07-09 16:26:48'),
(240, 13, 'admin/view/image/ocfilter/delete-value.png', '2021-07-09 16:26:48'),
(241, 13, 'admin/view/image/ocfilter/select-text.png', '2021-07-09 16:26:48'),
(242, 13, 'admin/view/image/ocfilter/sort-handler.png', '2021-07-09 16:26:48'),
(243, 13, 'admin/view/javascript/ocfilter/ocfilter.js', '2021-07-09 16:26:48'),
(244, 13, 'admin/view/stylesheet/ocfilter/ocfilter.css', '2021-07-09 16:26:48'),
(245, 13, 'catalog/controller/extension/feed/ocfilter_sitemap.php', '2021-07-09 16:26:48'),
(246, 13, 'catalog/controller/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(247, 13, 'catalog/language/en/extension/module', '2021-07-09 16:26:48'),
(248, 13, 'catalog/language/en-us/extension/module', '2021-07-09 16:26:48'),
(249, 13, 'catalog/language/english/extension/module', '2021-07-09 16:26:48'),
(250, 13, 'catalog/language/ru/extension/module', '2021-07-09 16:26:48'),
(251, 13, 'catalog/language/russian/extension/module', '2021-07-09 16:26:48'),
(252, 13, 'catalog/model/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(253, 13, 'catalog/view/javascript/ocfilter/nouislider.min.css', '2021-07-09 16:26:48'),
(254, 13, 'catalog/view/javascript/ocfilter/nouislider.min.js', '2021-07-09 16:26:48'),
(255, 13, 'catalog/view/javascript/ocfilter/ocfilter.js', '2021-07-09 16:26:48'),
(256, 13, 'admin/language/en/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(257, 13, 'admin/language/en-gb/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(258, 13, 'admin/language/en-us/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(259, 13, 'admin/language/english/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(260, 13, 'admin/language/ru/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(261, 13, 'admin/language/ru-ru/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(262, 13, 'admin/language/russian/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(263, 13, 'admin/view/template/extension/module/ocfilter.twig', '2021-07-09 16:26:48'),
(264, 13, 'admin/view/template/extension/module/ocfilter_form.twig', '2021-07-09 16:26:48'),
(265, 13, 'admin/view/template/extension/module/ocfilter_list.twig', '2021-07-09 16:26:48'),
(266, 13, 'admin/view/template/extension/module/ocfilter_page_form.twig', '2021-07-09 16:26:48'),
(267, 13, 'admin/view/template/extension/module/ocfilter_page_list.twig', '2021-07-09 16:26:48'),
(268, 13, 'catalog/language/en/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(269, 13, 'catalog/language/en-gb/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(270, 13, 'catalog/language/en-us/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(271, 13, 'catalog/language/english/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(272, 13, 'catalog/language/ru/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(273, 13, 'catalog/language/ru-ru/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(274, 13, 'catalog/language/russian/extension/module/ocfilter.php', '2021-07-09 16:26:48'),
(275, 13, 'catalog/view/theme/default/image/ocfilter', '2021-07-09 16:26:48'),
(276, 13, 'catalog/view/theme/default/stylesheet/ocfilter', '2021-07-09 16:26:48'),
(277, 13, 'catalog/view/theme/default/image/ocfilter/diagram-bg-repeat.png', '2021-07-09 16:26:48'),
(278, 13, 'catalog/view/theme/default/stylesheet/ocfilter/ocfilter.css', '2021-07-09 16:26:48'),
(279, 13, 'catalog/view/theme/default/template/extension/module/ocfilter', '2021-07-09 16:26:48'),
(280, 13, 'catalog/view/theme/default/template/extension/module/ocfilter/filter_item.twig', '2021-07-09 16:26:48'),
(281, 13, 'catalog/view/theme/default/template/extension/module/ocfilter/filter_list.twig', '2021-07-09 16:26:48'),
(282, 13, 'catalog/view/theme/default/template/extension/module/ocfilter/filter_price.twig', '2021-07-09 16:26:48'),
(283, 13, 'catalog/view/theme/default/template/extension/module/ocfilter/filter_slider_item.twig', '2021-07-09 16:26:48'),
(284, 13, 'catalog/view/theme/default/template/extension/module/ocfilter/module.twig', '2021-07-09 16:26:48'),
(285, 13, 'catalog/view/theme/default/template/extension/module/ocfilter/selected_filter.twig', '2021-07-09 16:26:48'),
(286, 13, 'catalog/view/theme/default/template/extension/module/ocfilter/value_item.twig', '2021-07-09 16:26:48'),
(287, 13, 'catalog/view/theme/default/template/extension/module/ocfilter/value_list.twig', '2021-07-09 16:26:48');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_filter`
--

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(4, 2, 0),
(5, 2, 0),
(6, 2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_filter_description`
--

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(1, 1, 1, 'Крутой бренд'),
(2, 1, 1, 'Менее крутой'),
(3, 1, 1, 'Не крутой'),
(4, 1, 2, 'Первый тип'),
(5, 1, 2, 'Второй тип'),
(6, 1, 2, 'Третий тип');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_filter_group`
--

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 1),
(2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_filter_group_description`
--

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Бренды'),
(2, 1, 'По типам оборудования');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'Зона НДС', 'Облагаемые НДС', '2014-05-21 22:30:20', '2014-09-09 11:48:13');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_category`
--

CREATE TABLE `oc_googleshopping_category` (
  `google_product_category` varchar(10) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_product`
--

CREATE TABLE `oc_googleshopping_product` (
  `product_advertise_google_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `has_issues` tinyint(1) DEFAULT NULL,
  `destination_status` enum('pending','approved','disapproved') NOT NULL DEFAULT 'pending',
  `impressions` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `conversions` int(11) NOT NULL DEFAULT 0,
  `cost` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `conversion_value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `google_product_category` varchar(10) DEFAULT NULL,
  `condition` enum('new','refurbished','used') DEFAULT NULL,
  `adult` tinyint(1) DEFAULT NULL,
  `multipack` int(11) DEFAULT NULL,
  `is_bundle` tinyint(1) DEFAULT NULL,
  `age_group` enum('newborn','infant','toddler','kids','adult') DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `gender` enum('male','female','unisex') DEFAULT NULL,
  `size_type` enum('regular','petite','plus','big and tall','maternity') DEFAULT NULL,
  `size_system` enum('AU','BR','CN','DE','EU','FR','IT','JP','MEX','UK','US') DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `is_modified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_googleshopping_product`
--

INSERT INTO `oc_googleshopping_product` (`product_advertise_google_id`, `product_id`, `store_id`, `has_issues`, `destination_status`, `impressions`, `clicks`, `conversions`, `cost`, `conversion_value`, `google_product_category`, `condition`, `adult`, `multipack`, `is_bundle`, `age_group`, `color`, `gender`, `size_type`, `size_system`, `size`, `is_modified`) VALUES
(2, 51, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 52, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 53, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 54, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_product_status`
--

CREATE TABLE `oc_googleshopping_product_status` (
  `product_id` int(11) NOT NULL DEFAULT 0,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `product_variation_id` varchar(64) NOT NULL DEFAULT '',
  `destination_statuses` text NOT NULL,
  `data_quality_issues` text NOT NULL,
  `item_level_issues` text NOT NULL,
  `google_expiration_date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_product_target`
--

CREATE TABLE `oc_googleshopping_product_target` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_target`
--

CREATE TABLE `oc_googleshopping_target` (
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `campaign_name` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `budget` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `feeds` text NOT NULL,
  `status` enum('paused','active') NOT NULL DEFAULT 'paused',
  `date_added` date DEFAULT NULL,
  `roas` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `viewed` int(5) NOT NULL DEFAULT 0,
  `date_available` datetime NOT NULL DEFAULT '2018-01-01 00:00:00',
  `date_end` datetime NOT NULL DEFAULT '2100-01-01 00:00:00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `image`, `manufacturer_id`, `bottom`, `sort_order`, `status`, `viewed`, `date_available`, `date_end`, `date_added`, `date_modified`) VALUES
(3, NULL, 0, 1, 3, 1, 1, '2018-01-01 00:00:00', '2100-01-01 00:00:00', '2021-06-07 16:41:04', '2021-06-07 16:41:04'),
(4, '', 0, 0, 1, 1, 46, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-07-08 10:56:06'),
(5, '', 0, 1, 4, 1, 1, '2018-01-01 00:00:00', '2100-01-01 00:00:00', '2021-06-07 16:41:04', '2021-06-07 16:48:26'),
(6, '', 0, 1, 2, 1, 1, '2018-01-01 00:00:00', '2100-01-01 00:00:00', '2021-06-07 16:41:04', '2021-06-10 15:15:55'),
(10, NULL, 0, 0, 0, 1, 33, '2018-01-01 00:00:00', '2100-01-01 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_attribute`
--

CREATE TABLE `oc_information_attribute` (
  `information_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `header` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `header`, `short_description`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(5, 1, 'Условия соглашения', '', '', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;', '', 'Условия соглашения', '', ''),
(3, 1, 'Политика Безопасности', '', '', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;', '', 'Политика Безопасности', '', ''),
(6, 1, 'Доставка', '', '', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;', '', 'Доставка', '', ''),
(4, 1, 'О компании', '', '', ' &lt;section class=&quot;aboutMain&quot;&gt;\r\n        &lt;div class=&quot;container option&quot;&gt;\r\n            &lt;div class=&quot;aboutMain__content&quot;&gt;\r\n                &lt;div class=&quot;aboutMain__title&quot;&gt;\r\n                    &lt;p&gt;&lt;img src=&quot;http://medilux/image/catalog/cart.png&quot; style=&quot;width: 16px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus rutrum ligula ac tincidunt dignissim. Pellentesque sit amet magna vestibulum, rhoncus elit sit amet, consectetur libero. &lt;/p&gt;\r\n                    &lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/section&gt;', '', 'О компании', '', '');
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `header`, `short_description`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(10, 1, 'О компании	', '', '', '  &lt;div class=&quot;aboutMain__content&quot;&gt;\r\n                &lt;div class=&quot;aboutMain__title&quot;&gt;\r\n                    &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus rutrum ligula ac tincidunt dignissim. Pellentesque sit amet magna vestibulum, rhoncus elit sit amet, consectetur libero. &lt;/p&gt;\r\n                    &lt;img src=&quot;http://medilux/image/catalog/demo/images/aboutMain1.jpg&quot;&gt;\r\n                  	&lt;img src=&quot;http://medilux/image/catalog/demo/images/aboutMain2.jpg&quot;&gt;\r\n                  &lt;p&gt;Proin non blandit lorem. Nunc sapien lorem, ultricies et tortor ac, posuere pellentesque arcu. Sed commodo sagittis est, quis efficitur turpis fermentum a. Sed id sodales turpis, vitae lacinia massa. Suspendisse mollis diam tortor,\r\n                        quis tincidunt justo rutrum a. In ultrices felis quis sem dictum, sit amet cursus orci placerat.&lt;/p&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=&quot;aboutMain__reason&quot;&gt;\r\n                    &lt;h3&gt;10 причин выбрать именно нас:&lt;/h3&gt;\r\n                    &lt;ul&gt;\r\n                      &lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;path d=&quot;M26.1672 10.7659H7.01178C6.68678 10.7659 6.42334 11.0294 6.42334 11.3544C6.42334 11.6794 6.68678 11.9428 7.01178 11.9428H26.1672C26.4922 11.9428 26.7557 11.6794 26.7557 11.3544C26.7557 11.0294 26.4922 10.7659 26.1672 10.7659Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M7.01178 7.86102H16.5894C16.9144 7.86102 17.1779 7.59758 17.1779 7.27258C17.1779 6.94758 16.9144 6.68414 16.5894 6.68414H7.01178C6.68678 6.68414 6.42334 6.94758 6.42334 7.27258C6.42334 7.59766 6.68678 7.86102 7.01178 7.86102V7.86102Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M26.1672 14.3825H7.01178C6.68678 14.3825 6.42334 14.6459 6.42334 14.9709C6.42334 15.2959 6.68678 15.5594 7.01178 15.5594H26.1672C26.4922 15.5594 26.7557 15.2959 26.7557 14.9709C26.7556 14.6459 26.4922 14.3825 26.1672 14.3825Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M11.3761 35.9116H5.2459C4.23973 35.9116 3.42106 35.093 3.42106 34.0868V3.00164C3.42106 1.99547 4.23973 1.1768 5.2459 1.1768H22.9065C22.9636 1.1768 23.0197 1.18203 23.0753 1.18953V4.85938C23.0753 6.51453 24.4218 7.86102 26.0769 7.86102H29.7467C29.7543 7.91664 29.7594 7.97281 29.7594 8.02984V18.0502C29.7594 18.3752 30.0229 18.6387 30.3479 18.6387C30.6729 18.6387 30.9363 18.3752 30.9363 18.0502V8.02992C30.9363 7.38445 30.6849 6.77758 30.2285 6.32109L24.6152 0.707813C24.1588 0.251406 23.552 0 22.9065 0H5.2459C3.59075 0 2.24426 1.34656 2.24426 3.00164V34.0868C2.24426 35.7419 3.59083 37.0884 5.2459 37.0884H11.3761C11.7011 37.0884 11.9646 36.8249 11.9646 36.4999C11.9646 36.1749 11.7011 35.9116 11.3761 35.9116V35.9116ZM28.9273 6.68422H26.077C25.0708 6.68422 24.2522 5.86555 24.2522 4.85938V2.00906L28.9273 6.68422Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M37.5741 28.8069L32.5883 20.3913C32.2249 19.7777 31.4342 19.5749 30.8203 19.9386L29.6075 20.6571C28.6662 21.2147 28.2683 22.3432 28.5915 23.3433C28.1829 23.4914 27.7349 23.489 27.3224 23.3296C26.3649 23.0283 25.637 22.4223 24.4347 22.7264C22.3933 23.2461 22.4553 23.2201 22.2706 23.2834C21.0753 22.6029 20.3568 22.4004 19.0879 22.8912L17.9568 23.3285C17.4331 23.5308 16.8561 23.4829 16.3722 23.1961L16.0635 23.0142C16.2142 22.1117 15.8139 21.1593 14.9664 20.6572C14.9664 20.6572 14.9664 20.6572 14.9663 20.6572L13.7537 19.9387C13.1415 19.5761 12.3484 19.7791 11.9857 20.3913L6.99978 28.807C6.63642 29.4204 6.83861 30.2115 7.45236 30.575L8.66501 31.2934C9.03197 31.5108 9.43525 31.6142 9.83368 31.6142C10.278 31.6142 10.716 31.4854 11.0906 31.2429L11.3433 31.3921L10.8097 32.1353C10.1738 33.0211 10.3759 34.2528 11.2618 34.8887C11.6715 35.1828 12.1862 35.3171 12.7185 35.2335C12.8029 35.7272 13.0734 36.1892 13.5113 36.5037C13.9227 36.799 14.435 36.9335 14.9682 36.8495C15.0529 37.3428 15.3232 37.8044 15.761 38.1187C16.3492 38.541 17.0806 38.5898 17.6901 38.3295C17.8235 38.6759 18.0552 38.9887 18.3786 39.2209C19.223 39.8269 20.3861 39.6689 21.0422 38.8837L22.4602 39.7237C23.3979 40.2794 24.6078 39.9706 25.1638 39.0318C25.306 38.7918 25.3942 38.5302 25.4265 38.2614L25.4297 38.2633C26.366 38.8179 27.5787 38.5074 28.1334 37.5713C28.294 37.3001 28.382 37.006 28.4035 36.7112C29.2288 36.9187 30.1282 36.5721 30.5837 35.8033C30.7331 35.5511 30.8198 35.2787 30.8483 35.0046C31.7328 35.3517 32.7667 35.0162 33.2662 34.1731C33.5349 33.7196 33.6109 33.1886 33.4802 32.6779C33.4054 32.3858 33.2679 32.1205 33.0792 31.8965L33.8607 31.4399C34.5219 31.7113 35.2764 31.6679 35.9088 31.2933L37.1213 30.5749C37.735 30.2116 37.9378 29.4208 37.5741 28.8069V28.8069ZM9.26486 30.281L8.0522 29.5625C7.99829 29.5305 7.9804 29.4607 8.01228 29.4068L12.9982 20.9909C13.0303 20.9368 13.1004 20.9192 13.154 20.9511L14.3666 21.6694C14.9054 21.9887 15.074 22.6798 14.7606 23.2088L10.8042 29.8869C10.4885 30.42 9.79798 30.5967 9.26486 30.281V30.281ZM11.9481 33.9327C11.5907 33.6761 11.509 33.1791 11.7657 32.8216L12.55 31.7291C12.7999 31.3811 13.2977 31.2858 13.6611 31.5467C14.0177 31.8027 14.0995 32.3011 13.8436 32.6577L13.0592 33.7502C12.8032 34.107 12.3045 34.1886 11.9481 33.9327V33.9327ZM14.1977 35.5478C13.841 35.2917 13.7592 34.7932 14.0152 34.4366L14.7995 33.3442C14.7995 33.3442 14.7995 33.3442 14.7995 33.3441C14.7995 33.3441 14.7995 33.344 14.7996 33.344L15.6652 32.1384C15.7892 31.9657 15.9731 31.8515 16.1829 31.8171C16.2265 31.8099 16.2702 31.8064 16.3135 31.8064C16.4787 31.8064 16.6394 31.8578 16.7763 31.956C16.9489 32.08 17.0631 32.2638 17.0975 32.4736C17.132 32.6836 17.0827 32.8943 16.9586 33.067L15.3087 35.3653C15.0523 35.7227 14.5552 35.8045 14.1977 35.5478V35.5478ZM16.4473 37.1627C16.0908 36.9068 16.0089 36.4086 16.2645 36.0521C16.2645 36.0519 16.2647 36.0518 16.2648 36.0516L17.9147 33.7534C18.1706 33.3968 18.6693 33.315 19.0258 33.5709C19.3824 33.8269 19.4642 34.3254 19.2082 34.682L18.4752 35.7032C18.4752 35.7032 18.4752 35.7032 18.4751 35.7033L17.5583 36.9803C17.3023 37.3369 16.804 37.4189 16.4473 37.1627V37.1627ZM19.0649 38.2649C18.7085 38.009 18.6266 37.5111 18.882 37.1544L19.4311 36.3896C19.687 36.0329 20.1857 35.9513 20.5422 36.2072C20.8988 36.4631 20.9806 36.9616 20.7246 37.3183L20.176 38.0824C19.92 38.4391 19.4214 38.521 19.0649 38.2649V38.2649ZM32.2539 33.5733C32.03 33.9512 31.5406 34.0765 31.1627 33.8527C30.5227 33.4736 26.3942 31.0277 25.9541 30.7669C25.6744 30.6013 25.3135 30.6936 25.1479 30.9732C24.9823 31.2528 25.0745 31.6137 25.3542 31.7793L29.2919 34.1122L29.292 34.1123C29.67 34.3362 29.7961 34.8241 29.5713 35.2036C29.3474 35.5817 28.8578 35.7068 28.4799 35.4831C27.0235 34.6203 25.841 33.9197 24.5401 33.149C24.2603 32.9833 23.8995 33.0756 23.7339 33.3552C23.5683 33.6348 23.6606 33.9958 23.9402 34.1614L26.8416 35.8803L26.8422 35.8807C27.2205 36.1053 27.3453 36.5929 27.121 36.9717C26.897 37.3497 26.4076 37.475 26.0295 37.2511L24.4724 36.3286C24.4723 36.3286 24.472 36.3285 24.4719 36.3283C24.4717 36.3283 24.4716 36.3282 24.4714 36.3281L23.3351 35.6548C23.0554 35.4891 22.6945 35.5814 22.5289 35.8611C22.3633 36.1407 22.4556 36.5016 22.7352 36.6672L23.8717 37.3406C23.8719 37.3407 23.872 37.3408 23.8722 37.3409C24.2503 37.5648 24.3763 38.0526 24.1516 38.4322C23.9276 38.8102 23.4381 38.9354 23.0601 38.7115L21.7342 37.9261C22.3026 37.0491 22.0864 35.8672 21.2285 35.2515C20.9766 35.0707 20.696 34.9581 20.4091 34.9097C20.7135 34.0959 20.451 33.1458 19.712 32.6153C19.2745 32.3011 18.7507 32.1925 18.2563 32.27C18.1684 31.7556 17.887 31.305 17.4626 31.0004C16.6643 30.4275 15.5795 30.5375 14.9094 31.2154C14.7732 30.9763 14.5852 30.7618 14.3474 30.5911C13.6841 30.115 12.8228 30.1105 12.1661 30.5115L11.8965 30.3524L15.5973 24.1056L15.7735 24.2095C16.5516 24.6704 17.5011 24.7665 18.3811 24.4262L19.5122 23.989C20.1595 23.7388 20.5164 23.7225 21.1567 24.0246C20.7377 24.4952 20.4891 25.1131 20.4891 25.779V28.388C20.4891 29.081 21.0524 29.6451 21.7449 29.6456H21.7466C22.4411 29.6456 23.0942 29.3752 23.5856 28.8842C23.872 28.5979 24.0834 28.2567 24.2101 27.8842C24.9699 28.3341 31.247 32.0512 31.9747 32.4824C32.1578 32.5908 32.2876 32.764 32.3403 32.9701C32.3931 33.176 32.3624 33.3903 32.2539 33.5733V33.5733ZM36.5217 29.5625L35.309 30.281C34.7759 30.5966 34.0854 30.4198 33.7698 29.887L31.9154 26.7569C31.7497 26.4773 31.3886 26.385 31.1092 26.5505C30.8296 26.7161 30.7373 27.0771 30.9028 27.3567L32.7572 30.4868C32.7921 30.5458 32.83 30.6018 32.8692 30.6564L32.3537 30.9575C32.2495 31.0193 32.1492 31.0872 32.0534 31.1611L24.0594 26.4271C23.6678 26.1953 23.1712 26.4779 23.1712 26.9333C23.165 26.9685 23.232 27.5733 22.7536 28.0515C22.4845 28.3204 22.1269 28.4685 21.7465 28.4685C21.7462 28.4685 21.7459 28.4685 21.7456 28.4685C21.7016 28.4685 21.6658 28.4322 21.6658 28.3877V25.7787C21.6658 25.0972 22.1347 24.5222 22.7688 24.3616L24.7232 23.867C25.4324 23.6878 25.8332 24.0665 26.895 24.4258C27.6321 24.711 28.4336 24.6934 29.145 24.3896L29.5002 24.9891C29.6659 25.2689 30.0268 25.3611 30.3063 25.1955C30.586 25.0299 30.6783 24.669 30.5128 24.3893L29.8132 23.2086C29.4967 22.6744 29.6731 21.986 30.2072 21.6693L31.4199 20.951C31.4728 20.9195 31.5429 20.9356 31.5757 20.9909L36.5615 29.4066C36.5937 29.4609 36.576 29.5304 36.5217 29.5625V29.5625Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;/svg&gt;Эксклюзивные контракты с корейскими производителями: гарантия справедливой цены и информационная поддержка клиентов.&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;path d=&quot;M37.1998 18.0752L36.164 13.9319C36.4472 13.8717 36.6597 13.6204 36.6597 13.3194V12.6514C36.6597 11.2009 35.4796 10.0209 34.0292 10.0209H29.3111V8.64295C29.3111 7.9292 28.7305 7.34857 28.0167 7.34857H3.96656C3.25281 7.34857 2.67219 7.9292 2.67219 8.64295V20C2.67219 20.3458 2.95258 20.6263 3.29852 20.6263C3.64438 20.6263 3.92484 20.3459 3.92484 20V8.64295C3.92484 8.6199 3.94352 8.60123 3.96656 8.60123H28.0166C28.0397 8.60123 28.0584 8.6199 28.0584 8.64295V20.0001C28.0584 20.346 28.3388 20.6265 28.6847 20.6265C29.0305 20.6265 29.311 20.3461 29.311 20.0001V19.2901H36.6992C36.6998 19.2901 36.7003 19.2903 36.7009 19.2903C36.7015 19.2903 36.702 19.2902 36.7026 19.2902C37.6117 19.2908 38.3837 19.8876 38.6488 20.7098H36.7013C36.3555 20.7098 36.075 20.9902 36.075 21.3361V22.6722C36.075 23.7544 36.9553 24.6347 38.0374 24.6347H38.7473V27.3904H37.1096C36.5716 25.837 35.095 24.7181 33.361 24.7181C31.627 24.7181 30.1503 25.837 29.6124 27.3904H29.3109V22.6722C29.3109 22.3263 29.0305 22.0458 28.6845 22.0458C28.3387 22.0458 28.0582 22.3262 28.0582 22.6722V27.3902H15.0638C14.5259 25.8369 13.0492 24.7179 11.3152 24.7179C9.58125 24.7179 8.10453 25.8369 7.56664 27.3902H3.96656C3.94352 27.3902 3.92484 27.3715 3.92484 27.3485V25.9706H6.63883C6.98469 25.9706 7.26516 25.6902 7.26516 25.3443C7.26516 24.9983 6.98477 24.7179 6.63883 24.7179H0.626328C0.280469 24.7179 0 24.9983 0 25.3443C0 25.6902 0.280391 25.9706 0.626328 25.9706H2.67227V27.3485C2.67227 28.0622 3.25289 28.6429 3.96664 28.6429H7.34977C7.34961 28.6568 7.34867 28.6706 7.34867 28.6846C7.34867 30.8718 9.12813 32.6511 11.3152 32.6511C13.5023 32.6511 15.2818 30.8718 15.2818 28.6846C15.2818 28.6705 15.2809 28.6568 15.2807 28.6429H29.3955C29.3954 28.6568 29.3945 28.6706 29.3945 28.6846C29.3945 30.8718 31.1739 32.6511 33.361 32.6511C35.5481 32.6511 37.3276 30.8718 37.3276 28.6846C37.3276 28.6705 37.3266 28.6568 37.3265 28.6429H39.3736C39.7195 28.6429 39.9999 28.3625 39.9999 28.0165V21.336C40 19.6866 38.783 18.3162 37.1998 18.0752ZM29.3111 11.2735H34.0292C34.789 11.2735 35.4071 11.8916 35.4071 12.6514V12.6931H29.3111V11.2735ZM29.3111 18.0376V13.9457H34.8763L35.8993 18.0376H29.3111ZM11.3152 31.3987C9.81875 31.3987 8.60125 30.1813 8.60125 28.6847C8.60125 27.1882 9.81875 25.9708 11.3152 25.9708C12.8117 25.9708 14.0292 27.1882 14.0292 28.6847C14.0292 30.1813 12.8117 31.3987 11.3152 31.3987ZM33.3612 31.3987C31.8647 31.3987 30.6472 30.1813 30.6472 28.6847C30.6472 27.1882 31.8647 25.9708 33.3612 25.9708C34.8577 25.9708 36.0752 27.1882 36.0752 28.6847C36.0752 30.1813 34.8577 31.3987 33.3612 31.3987ZM38.7474 23.382H38.0376C37.6462 23.382 37.3277 23.0636 37.3277 22.6722V21.9623H38.7473V23.382H38.7474Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M11.3149 27.3904C10.6011 27.3904 10.0205 27.971 10.0205 28.6848C10.0205 29.3985 10.6011 29.9791 11.3149 29.9791C12.0286 29.9791 12.6093 29.3985 12.6093 28.6848C12.6093 27.971 12.0286 27.3904 11.3149 27.3904Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M33.361 27.3904C32.6473 27.3904 32.0667 27.971 32.0667 28.6848C32.0667 29.3985 32.6473 29.9791 33.361 29.9791C34.0748 29.9791 34.6554 29.3985 34.6554 28.6848C34.6554 27.971 34.0748 27.3904 33.361 27.3904Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M26.0126 24.7182H16.6598C16.3139 24.7182 16.0334 24.9986 16.0334 25.3445C16.0334 25.6905 16.3138 25.9709 16.6598 25.9709H26.0126C26.3584 25.9709 26.6389 25.6905 26.6389 25.3445C26.6389 24.9986 26.3585 24.7182 26.0126 24.7182Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M9.97935 22.0459H1.96263C1.61677 22.0459 1.3363 22.3263 1.3363 22.6722C1.3363 23.0182 1.61669 23.2986 1.96263 23.2986H9.97935C10.3252 23.2986 10.6057 23.0182 10.6057 22.6722C10.6057 22.3263 10.3252 22.0459 9.97935 22.0459Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M21.7792 13.5446C21.5346 13.3001 21.138 13.3001 20.8935 13.5447L15.3238 19.1143L12.4263 16.2169C12.1817 15.9723 11.7852 15.9723 11.5406 16.2169C11.296 16.4615 11.296 16.858 11.5406 17.1026L14.8809 20.4429C15.0032 20.5652 15.1635 20.6263 15.3238 20.6263C15.484 20.6263 15.6444 20.5652 15.7666 20.4429L21.7791 14.4304C22.0237 14.1857 22.0237 13.7892 21.7792 13.5446Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;/svg&gt;Прямые поставки из Кореи и собственный склад: поставляем оборудование в короткие сроки.&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;path d=&quot;M32.4096 20.5859H34.1516C34.4242 21.9348 35.6186 22.9535 37.0466 22.9535C38.6751 22.9535 40 21.6286 40 20C40 18.3714 38.6751 17.0465 37.0465 17.0465C35.6185 17.0465 34.4241 18.0652 34.1516 19.4141H32.4095C32.2702 16.4295 31.0734 13.7166 29.1853 11.6433L32.3231 8.50555C32.9408 8.95531 33.7002 9.22164 34.5211 9.22164C36.5848 9.22164 38.2638 7.54266 38.2638 5.47891C38.2638 3.41516 36.5848 1.73625 34.5211 1.73625C32.4573 1.73625 30.7784 3.41523 30.7784 5.47891C30.7784 6.29977 31.0447 7.05922 31.4945 7.67687L28.3567 10.8146C26.2834 8.92664 23.5705 7.72969 20.5859 7.59047V5.84844C21.9348 5.57586 22.9535 4.38148 22.9535 2.95352C22.9535 1.32492 21.6286 0 20 0C18.3714 0 17.0465 1.32492 17.0465 2.95352C17.0465 4.38148 18.0652 5.57586 19.4141 5.84844V7.59039C16.4295 7.72969 13.7166 8.92656 11.6433 10.8145L8.5057 7.67703C8.95555 7.0593 9.22188 6.29977 9.22188 5.47891C9.22188 4.23266 8.60461 3.07211 7.5707 2.37445C7.30227 2.19352 6.93812 2.26414 6.75727 2.53242C6.57625 2.8007 6.64695 3.16484 6.91516 3.34586C7.62578 3.82531 8.04992 4.62273 8.04992 5.47891C8.04992 6.89656 6.89648 8.05 5.47883 8.05C4.06117 8.05 2.90781 6.89656 2.90781 5.47891C2.90781 4.33406 3.67617 3.31648 4.77633 3.00438C5.08766 2.91602 5.26844 2.59203 5.18008 2.2807C5.09172 1.96938 4.76758 1.78883 4.45648 1.87695C2.85461 2.33148 1.73594 3.81266 1.73594 5.47891C1.73594 7.54281 3.415 9.22188 5.47891 9.22188C6.29984 9.22188 7.05937 8.95555 7.67703 8.5057L10.8146 11.6432C8.92656 13.7166 7.72969 16.4294 7.59039 19.414H5.84844C5.57586 18.0652 4.38148 17.0464 2.95352 17.0464C1.32492 17.0465 0 18.3714 0 20C0 21.6286 1.32492 22.9535 2.95352 22.9535C4.38148 22.9535 5.57586 21.9348 5.84844 20.5859H7.59047C7.72977 23.5705 8.92664 26.2834 10.8147 28.3567L7.67687 31.4945C7.05922 31.0447 6.29977 30.7784 5.47891 30.7784C3.41516 30.7784 1.73625 32.4573 1.73625 34.5211C1.73625 36.5848 3.41516 38.2638 5.47891 38.2638C7.54266 38.2638 9.22156 36.5848 9.22156 34.5211C9.22156 33.7002 8.95531 32.9408 8.50547 32.3231L11.6433 29.1854C13.7166 31.0734 16.4295 32.2703 19.4141 32.4095V34.1515C18.0652 34.4241 17.0465 35.6184 17.0465 37.0464C17.0465 38.6751 18.3714 40 20 40C21.6286 40 22.9535 38.6751 22.9535 37.0465C22.9535 35.6185 21.9348 34.4241 20.5859 34.1516V32.4096C23.5705 32.2703 26.2834 31.0734 28.3567 29.1855L31.4943 32.323C31.0445 32.9407 30.7781 33.7002 30.7781 34.5211C30.7781 36.5849 32.4572 38.2641 34.5211 38.2641C36.585 38.2641 38.2641 36.585 38.2641 34.5211C38.2641 34.1159 38.1995 33.717 38.0723 33.335C37.9698 33.028 37.6379 32.8621 37.3312 32.9644C37.0241 33.0667 36.8582 33.3985 36.9605 33.7055C37.0479 33.9677 37.0923 34.2421 37.0923 34.521C37.0923 35.9387 35.9388 37.0921 34.5212 37.0921C33.1035 37.0921 31.9501 35.9387 31.9501 34.521C31.9501 33.1033 33.1035 31.9499 34.5212 31.9499C34.8456 31.9499 35.162 32.0096 35.4616 32.1273C35.7624 32.2457 36.1028 32.0975 36.2212 31.7963C36.3396 31.4952 36.1914 31.1551 35.8902 31.0366C35.4536 30.8651 34.993 30.778 34.5213 30.778C33.7003 30.778 32.9408 31.0444 32.3231 31.4942L29.1855 28.3567C31.0734 26.2834 32.2703 23.5705 32.4096 20.5859V20.5859ZM37.0465 18.2184C38.0289 18.2184 38.8281 19.0176 38.8281 20C38.8281 20.9824 38.0289 21.7816 37.0465 21.7816C36.0641 21.7816 35.2648 20.9824 35.2648 20C35.2648 19.0176 36.0641 18.2184 37.0465 18.2184ZM34.5211 2.90812C35.9387 2.90812 37.0919 4.06141 37.0919 5.47891C37.0919 6.89648 35.9386 8.04977 34.5211 8.04977C33.1036 8.04977 31.9503 6.89648 31.9503 5.47891C31.9503 4.06133 33.1036 2.90812 34.5211 2.90812V2.90812ZM18.2184 2.95352C18.2184 1.97109 19.0177 1.17188 20 1.17188C20.9823 1.17188 21.7816 1.97109 21.7816 2.95352C21.7816 3.93594 20.9823 4.73516 20 4.73516C19.0177 4.73516 18.2184 3.93586 18.2184 2.95352ZM2.95352 21.7816C1.97109 21.7816 1.17188 20.9824 1.17188 20C1.17188 19.0176 1.97109 18.2184 2.95352 18.2184C3.93594 18.2184 4.73508 19.0176 4.73508 20C4.73508 20.9824 3.93586 21.7816 2.95352 21.7816ZM20 8.74812C26.2043 8.74812 31.2519 13.7957 31.2519 20C31.2519 26.2043 26.2043 31.2519 20 31.2519C13.7957 31.2519 8.74812 26.2044 8.74812 20C8.74812 13.7956 13.7957 8.74812 20 8.74812ZM5.47891 37.0919C4.06133 37.0919 2.90812 35.9386 2.90812 34.5211C2.90812 33.1035 4.06141 31.9502 5.47891 31.9502C6.89641 31.9502 8.04969 33.1035 8.04969 34.5211C8.04969 35.9387 6.89641 37.0919 5.47891 37.0919ZM21.7816 37.0465C21.7816 38.0289 20.9823 38.8281 20 38.8281C19.0177 38.8281 18.2184 38.0289 18.2184 37.0465C18.2184 36.0641 19.0177 35.2648 20 35.2648C20.9823 35.2648 21.7816 36.0641 21.7816 37.0465Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M13.3708 27.2149H16.6798C16.6816 27.2149 16.6833 27.2151 16.6851 27.2151C16.6869 27.2151 16.6886 27.2149 16.6904 27.2149H18.6325C18.9562 27.2149 19.2185 26.9525 19.2185 26.6289C19.2185 26.3053 18.9562 26.043 18.6325 26.043H17.271V25.0508C17.271 24.7272 17.0088 24.4649 16.6851 24.4649C16.3614 24.4649 16.0992 24.7272 16.0992 25.0508V26.043H13.9568V23.1571C13.9568 21.7394 15.1098 20.586 16.527 20.586H23.4723C24.8896 20.586 26.0425 21.7394 26.0425 23.1571V26.043H23.9001V25.0508C23.9001 24.7272 23.6378 24.4649 23.3142 24.4649C22.9905 24.4649 22.7282 24.7272 22.7282 25.0508V26.043H21.3669C21.0432 26.043 20.781 26.3053 20.781 26.6289C20.781 26.9525 21.0432 27.2149 21.3669 27.2149H23.309C23.3108 27.2149 23.3125 27.2151 23.3143 27.2151C23.3161 27.2151 23.3178 27.2149 23.3196 27.2149H26.6286C26.9523 27.2149 27.2146 26.9525 27.2146 26.6289V23.1571C27.2146 21.0932 25.5359 19.4141 23.4725 19.4141H23.0375C23.9545 18.5842 24.5317 17.3853 24.5317 16.0541C24.5317 13.5552 22.4987 11.5222 19.9998 11.5222C17.5009 11.5222 15.4679 13.5552 15.4679 16.0541C15.4679 17.3853 16.0451 18.5842 16.9621 19.4141H16.5271C14.4637 19.4141 12.785 21.0932 12.785 23.1571V26.6289C12.7849 26.9525 13.0472 27.2149 13.3708 27.2149V27.2149ZM16.6397 16.0541C16.6397 14.2014 18.147 12.6941 19.9997 12.6941C21.8525 12.6941 23.3597 14.2014 23.3597 16.0541C23.3597 17.9068 21.8525 19.4141 19.9997 19.4141C18.147 19.4141 16.6397 17.9068 16.6397 16.0541V16.0541Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;/svg&gt;Развитая дилерская сеть: более 300 партнеров по всей.&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;path d=&quot;M36.085 20.0281L34.0812 14.0169C33.7528 13.0286 33.1213 12.169 32.2765 11.5601C31.4316 10.9512 30.4164 10.624 29.375 10.625H25V8.125C24.999 7.13074 24.6036 6.17749 23.9006 5.47445C23.1975 4.7714 22.2443 4.37599 21.25 4.375H6.25C5.25574 4.37599 4.30249 4.7714 3.59945 5.47445C2.8964 6.17749 2.50099 7.13074 2.5 8.125V28.125H1.25C1.08424 28.125 0.925268 28.1908 0.808058 28.3081C0.690848 28.4253 0.625 28.5842 0.625 28.75V31.25C0.625 31.4158 0.690848 31.5747 0.808058 31.6919C0.925268 31.8092 1.08424 31.875 1.25 31.875H5.05C5.19944 32.9155 5.719 33.8673 6.5134 34.5558C7.30781 35.2443 8.32378 35.6232 9.375 35.6232C10.4262 35.6232 11.4422 35.2443 12.2366 34.5558C13.031 33.8673 13.5506 32.9155 13.7 31.875H26.3C26.4494 32.9155 26.969 33.8673 27.7634 34.5558C28.5578 35.2443 29.5738 35.6232 30.625 35.6232C31.6762 35.6232 32.6922 35.2443 33.4866 34.5558C34.281 33.8673 34.8006 32.9155 34.95 31.875H38.75C38.9158 31.875 39.0747 31.8092 39.1919 31.6919C39.3092 31.5747 39.375 31.4158 39.375 31.25V23.75C39.3738 22.8354 39.039 21.9527 38.4332 21.2674C37.8275 20.5822 36.9925 20.1415 36.085 20.0281V20.0281ZM38.125 26.25H36.875C36.7092 26.25 36.5503 26.1842 36.4331 26.0669C36.3158 25.9497 36.25 25.7908 36.25 25.625C36.25 25.4592 36.3158 25.3003 36.4331 25.1831C36.5503 25.0658 36.7092 25 36.875 25H38.125V26.25ZM32.0725 18.7181C32.197 18.6767 32.3053 18.5971 32.382 18.4906C32.4588 18.3841 32.5 18.2562 32.5 18.125V17.5H33.9244L34.7575 20H30.625V19.2006L32.0725 18.7181ZM29.375 11.875C30.154 11.8741 30.9135 12.1188 31.5454 12.5744C32.1774 13.03 32.6496 13.6731 32.895 14.4125L33.5075 16.25H31.875C31.7478 16.2505 31.6238 16.2901 31.5198 16.3635C31.4158 16.4368 31.3369 16.5403 31.2937 16.66L30.5713 15.9375L31.0669 15.4419L30.1831 14.5581L28.3081 16.4331L29.1919 17.3169L29.6875 16.8213L30.7181 17.8519L29.8025 18.1569C29.678 18.1983 29.5697 18.2779 29.493 18.3844C29.4162 18.4909 29.375 18.6188 29.375 18.75V20H25V11.875H29.375ZM13.3219 29.375H23.75V30.625H13.7C13.6378 30.1916 13.5103 29.7702 13.3219 29.375V29.375ZM3.75 8.125C3.75 7.46196 4.01339 6.82607 4.48223 6.35723C4.95107 5.88839 5.58696 5.625 6.25 5.625H21.25C21.913 5.625 22.5489 5.88839 23.0178 6.35723C23.4866 6.82607 23.75 7.46196 23.75 8.125V28.125H12.4306C11.6153 27.324 10.518 26.8751 9.375 26.8751C8.232 26.8751 7.13471 27.324 6.31938 28.125H3.75V8.125ZM1.875 29.375H5.42813C5.23969 29.7702 5.11221 30.1916 5.05 30.625H1.875V29.375ZM9.375 34.375C8.75693 34.375 8.15275 34.1917 7.63884 33.8483C7.12494 33.505 6.7244 33.0169 6.48788 32.4459C6.25135 31.8749 6.18947 31.2465 6.31005 30.6403C6.43062 30.0342 6.72825 29.4773 7.16529 29.0403C7.60233 28.6033 8.15915 28.3056 8.76534 28.185C9.37153 28.0645 9.99987 28.1264 10.5709 28.3629C11.1419 28.5994 11.63 28.9999 11.9733 29.5138C12.3167 30.0277 12.5 30.6319 12.5 31.25C12.499 32.0785 12.1694 32.8728 11.5836 33.4586C10.9978 34.0445 10.2035 34.374 9.375 34.375V34.375ZM30.625 34.375C30.0069 34.375 29.4027 34.1917 28.8888 33.8483C28.3749 33.505 27.9744 33.0169 27.7379 32.4459C27.5014 31.8749 27.4395 31.2465 27.56 30.6403C27.6806 30.0342 27.9783 29.4773 28.4153 29.0403C28.8523 28.6033 29.4092 28.3056 30.0153 28.185C30.6215 28.0645 31.2499 28.1264 31.8209 28.3629C32.3919 28.5994 32.88 28.9999 33.2233 29.5138C33.5667 30.0277 33.75 30.6319 33.75 31.25C33.749 32.0785 33.4194 32.8728 32.8336 33.4586C32.2478 34.0445 31.4535 34.374 30.625 34.375ZM34.95 30.625C34.8006 29.5845 34.281 28.6327 33.4866 27.9442C32.6922 27.2558 31.6762 26.8768 30.625 26.8768C29.5738 26.8768 28.5578 27.2558 27.7634 27.9442C26.969 28.6327 26.4494 29.5845 26.3 30.625H25V21.25H35.625C36.288 21.25 36.9239 21.5134 37.3928 21.9822C37.8616 22.4511 38.125 23.087 38.125 23.75H36.875C36.3777 23.75 35.9008 23.9475 35.5492 24.2992C35.1975 24.6508 35 25.1277 35 25.625C35 26.1223 35.1975 26.5992 35.5492 26.9508C35.9008 27.3025 36.3777 27.5 36.875 27.5H38.125V30.625H34.95Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M28.75 22.5H26.25V23.75H28.75V22.5Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M30.625 32.5C31.3154 32.5 31.875 31.9404 31.875 31.25C31.875 30.5596 31.3154 30 30.625 30C29.9346 30 29.375 30.5596 29.375 31.25C29.375 31.9404 29.9346 32.5 30.625 32.5Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M9.375 32.5C10.0654 32.5 10.625 31.9404 10.625 31.25C10.625 30.5596 10.0654 30 9.375 30C8.68464 30 8.125 30.5596 8.125 31.25C8.125 31.9404 8.68464 32.5 9.375 32.5Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M13.75 25.6249C15.4806 25.6249 17.1723 25.1118 18.6112 24.1503C20.0502 23.1888 21.1717 21.8223 21.8339 20.2234C22.4962 18.6246 22.6695 16.8652 22.3319 15.1679C21.9942 13.4706 21.1609 11.9115 19.9372 10.6878C18.7135 9.46405 17.1544 8.63069 15.457 8.29307C13.7597 7.95545 12.0004 8.12873 10.4015 8.791C8.80267 9.45326 7.4361 10.5748 6.47464 12.0137C5.51318 13.4526 5 15.1444 5 16.8749C5.00248 19.1948 5.92515 21.419 7.56556 23.0594C9.20596 24.6998 11.4301 25.6224 13.75 25.6249ZM13.75 9.37494C15.2334 9.37494 16.6834 9.81481 17.9168 10.6389C19.1501 11.463 20.1114 12.6344 20.6791 14.0048C21.2468 15.3753 21.3953 16.8833 21.1059 18.3381C20.8165 19.793 20.1022 21.1293 19.0533 22.1782C18.0044 23.2271 16.668 23.9414 15.2132 24.2308C13.7583 24.5202 12.2503 24.3717 10.8799 23.804C9.50943 23.2364 8.33809 22.2751 7.51398 21.0417C6.68987 19.8083 6.25 18.3583 6.25 16.8749C6.25215 14.8865 7.04302 12.9801 8.44907 11.574C9.85513 10.168 11.7615 9.37709 13.75 9.37494V9.37494Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M13.125 23.1251C14.1193 23.1241 15.0725 22.7287 15.7756 22.0256C16.4786 21.3226 16.874 20.3693 16.875 19.3751C16.8655 19.0719 16.8174 18.7711 16.7319 18.4801C17.1487 18.275 17.5 17.9575 17.7461 17.5635C17.9923 17.1695 18.1235 16.7146 18.125 16.2501C18.125 15.1307 16.5131 11.6663 16.1875 10.9825C16.1369 10.8755 16.0569 10.7851 15.9569 10.7217C15.8569 10.6584 15.7409 10.6248 15.6225 10.6248C15.5041 10.6248 15.3881 10.6584 15.2881 10.7217C15.1881 10.7851 15.1081 10.8755 15.0575 10.9825C14.9181 11.2782 14.5369 12.0944 14.15 13.0157C13.8637 12.5157 13.6694 12.1969 13.6569 12.1757C13.6012 12.0838 13.5227 12.0079 13.4291 11.9552C13.3355 11.9025 13.2299 11.8748 13.1225 11.8748C13.0151 11.8748 12.9095 11.9025 12.8159 11.9552C12.7223 12.0079 12.6438 12.0838 12.5881 12.1757C12.2619 12.7182 9.375 17.5276 9.375 19.3751C9.37599 20.3693 9.7714 21.3226 10.4744 22.0256C11.1775 22.7287 12.1307 23.1241 13.125 23.1251ZM15.625 12.7588C16.1735 13.8711 16.5929 15.0424 16.875 16.2501C16.875 16.5816 16.7433 16.8995 16.5089 17.1339C16.2745 17.3684 15.9565 17.5001 15.625 17.5001C15.2935 17.5001 14.9755 17.3684 14.7411 17.1339C14.5067 16.8995 14.375 16.5816 14.375 16.2501C14.6571 15.0424 15.0765 13.8711 15.625 12.7588V12.7588ZM13.125 13.7338C13.2562 13.9632 13.4075 14.2338 13.5625 14.5182C13.3356 15.0719 13.1883 15.655 13.125 16.2501C13.1274 16.8915 13.3762 17.5075 13.82 17.9706C14.2638 18.4337 14.8686 18.7085 15.5094 18.7382C15.6023 19.0806 15.6209 19.4389 15.5639 19.789C15.5068 20.1392 15.3755 20.4731 15.1787 20.7682C14.9819 21.0634 14.7242 21.3131 14.4229 21.5004C14.1217 21.6877 13.7838 21.8083 13.432 21.8542C13.0802 21.9001 12.7226 21.8701 12.3834 21.7663C12.0441 21.6625 11.731 21.4873 11.4651 21.2525C11.1992 21.0176 10.9867 20.7286 10.8418 20.4047C10.6969 20.0809 10.6229 19.7298 10.625 19.3751C10.625 18.4069 11.9938 15.7038 13.125 13.7338Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;/svg&gt;Сервисный отдел и лицензии на ремонт медтехники: наши инженеры монтируют оборудование и выезжают в максимально короткие сроки в случае необходимости гарантийного и постгарантийного обслуживания.&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;g clip-path=&quot;url(#clip0)&quot;&gt;&lt;path d=&quot;M11.666 15C8.90935 15 6.66602 12.7566 6.66602 9.99996V7.49996C6.66602 7.03996 7.03935 6.66663 7.49935 6.66663H15.8327C16.2927 6.66663 16.666 7.03996 16.666 7.49996V9.99996C16.666 12.7566 14.4227 15 11.666 15ZM8.33268 8.33329V9.99996C8.33268 11.8383 9.82768 13.3333 11.666 13.3333C13.5043 13.3333 14.9993 11.8383 14.9993 9.99996V8.33329H8.33268Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M17.5 8.33329H5.83333C5.37333 8.33329 5 7.95996 5 7.49996C5 7.03996 5.37333 6.66663 5.83333 6.66663H17.5C17.96 6.66663 18.3333 7.03996 18.3333 7.49996C18.3333 7.95996 17.96 8.33329 17.5 8.33329Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M15.8327 8.33329H7.49935C7.03935 8.33329 6.66602 7.95996 6.66602 7.49996V5.83329C6.66602 3.53663 8.53435 1.66663 10.8327 1.66663H12.4993C14.7977 1.66663 16.666 3.53663 16.666 5.83329V7.49996C16.666 7.95996 16.2927 8.33329 15.8327 8.33329ZM8.33268 6.66663H14.9993V5.83329C14.9993 4.45496 13.8777 3.33329 12.4993 3.33329H10.8327C9.45435 3.33329 8.33268 4.45496 8.33268 5.83329V6.66663Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M11.6673 5C11.2073 5 10.834 4.62667 10.834 4.16667V0.833333C10.834 0.373333 11.2073 0 11.6673 0C12.1273 0 12.5007 0.373333 12.5007 0.833333V4.16667C12.5007 4.62667 12.1273 5 11.6673 5Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M17.5 40C17.04 40 16.6667 39.6267 16.6667 39.1667V19.1667C16.6667 18.7067 17.04 18.3334 17.5 18.3334H22.5C24.5117 18.3334 26.1967 16.9 26.5833 15H5.83333C3.535 15 1.66667 16.87 1.66667 19.1667V24.1667C1.66667 26.4634 3.535 28.3334 5.83333 28.3334C6.29333 28.3334 6.66667 28.7067 6.66667 29.1667C6.66667 29.6267 6.29333 30 5.83333 30C2.61667 30 0 27.3834 0 24.1667V19.1667C0 15.95 2.61667 13.3334 5.83333 13.3334H27.5C27.96 13.3334 28.3333 13.7067 28.3333 14.1667C28.3333 17.3834 25.7167 20 22.5 20H18.3333V39.1667C18.3333 39.6267 17.96 40 17.5 40Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M5.83333 40C5.37333 40 5 39.6267 5 39.1667V20.8333C5 20.3733 5.37333 20 5.83333 20C6.29333 20 6.66667 20.3733 6.66667 20.8333V39.1667C6.66667 39.6267 6.29333 40 5.83333 40Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M11.6673 40C11.2073 40 10.834 39.6267 10.834 39.1667V29.1667C10.834 28.7067 11.2073 28.3334 11.6673 28.3334C12.1273 28.3334 12.5007 28.7067 12.5007 29.1667V39.1667C12.5007 39.6267 12.1273 40 11.6673 40Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M39.1667 31.6667H20.8333C20.3733 31.6667 20 31.2934 20 30.8334V22.5C20 22.04 20.3733 21.6667 20.8333 21.6667C21.2933 21.6667 21.6667 22.04 21.6667 22.5V30H38.3333V5.00004H21.6667V10.8334C21.6667 11.2934 21.2933 11.6667 20.8333 11.6667C20.3733 11.6667 20 11.2934 20 10.8334V4.16671C20 3.70671 20.3733 3.33337 20.8333 3.33337H39.1667C39.6267 3.33337 40 3.70671 40 4.16671V30.8334C40 31.2934 39.6267 31.6667 39.1667 31.6667Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M38.3327 21.6667C36.0343 21.6667 34.166 19.7967 34.166 17.5C34.166 15.2034 36.0343 13.3334 38.3327 13.3334C38.6843 13.3334 39.0343 13.3767 39.3743 13.465C39.821 13.5784 40.0893 14.0334 39.9743 14.4784C39.8627 14.925 39.4143 15.1967 38.961 15.0784C37.4177 14.6884 35.8327 15.91 35.8327 17.5C35.8327 18.8784 36.9543 20 38.3327 20C38.546 20 38.756 19.9734 38.9577 19.9217C39.4093 19.8067 39.8577 20.0767 39.9727 20.52C40.086 20.9667 39.8193 21.42 39.3743 21.535C39.036 21.6234 38.686 21.6667 38.3327 21.6667Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M39.1685 28.3333H37.0435C36.1935 28.3333 35.4902 27.6866 35.4085 26.8283L35.2035 24.7066C34.7185 24.485 34.2569 24.2083 33.8219 23.8816L31.9535 24.75C31.1685 25.11 30.2652 24.8133 29.8419 24.0583L28.5502 21.7566C28.1369 21.02 28.3335 20.0866 29.0085 19.585L30.6752 18.3516C30.6435 18.0916 30.6202 17.8016 30.6202 17.4983C30.6202 17.195 30.6452 16.905 30.6752 16.645L29.0085 15.4116C28.3335 14.91 28.1369 13.9783 28.5519 13.24L29.8402 10.9383C30.2652 10.1833 31.1719 9.88496 31.9519 10.2466L33.8219 11.115C34.2569 10.7883 34.7185 10.5116 35.2035 10.29L35.4085 8.16663C35.4902 7.31329 36.1935 6.66663 37.0435 6.66663H39.1668C39.6268 6.66663 40.0002 7.03996 40.0002 7.49996C40.0002 7.95996 39.6268 8.33329 39.1668 8.33329H37.0435L36.8135 10.95C36.7819 11.2666 36.5735 11.5383 36.2769 11.65C35.6319 11.8916 35.0285 12.2533 34.4852 12.7233C34.2385 12.935 33.8852 12.9866 33.5885 12.8483L31.2502 11.7616L30.0052 14.0583L32.0702 15.605C32.3219 15.7916 32.4485 16.105 32.3952 16.415C32.3335 16.7683 32.2869 17.1266 32.2869 17.4983C32.2869 17.87 32.3335 18.2283 32.3952 18.5816C32.4469 18.8916 32.3219 19.205 32.0702 19.3916L30.0002 20.925L31.2935 23.2433L33.5869 22.1516C33.8852 22.0133 34.2369 22.0633 34.4835 22.2766C35.0269 22.7466 35.6302 23.1083 36.2752 23.35C36.5735 23.4616 36.7819 23.7333 36.8119 24.05L37.0652 26.6683L39.1685 26.6666C39.6285 26.6666 40.0018 27.04 40.0018 27.5C40.0018 27.96 39.6285 28.3333 39.1685 28.3333V28.3333Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;/g&gt;&lt;defs&gt;&lt;clipPath id=&quot;clip0&quot;&gt;&lt;rect width=&quot;40&quot; height=&quot;40&quot; fill=&quot;white&quot;&gt;&lt;/rect&gt;&lt;/clipPath&gt;&lt;/defs&gt;&lt;/svg&gt;Ведение предпроектной работы: план размещения оборудования и лицензия на источники ионизирующего излучения.&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;path d=&quot;M38 6.00002H28V4.00002C27.9977 2.15985 26.5068 0.668966 24.6667 0.666687H15.3333C13.4932 0.668966 12.0023 2.15985 12 4.00002V6.00002H2C0.895508 6.00002 0 6.89553 0 8.00002V30.6667C0 31.7712 0.895508 32.6667 2 32.6667H26V36.6667C26 38.1393 27.194 39.3334 28.6667 39.3334C30.1393 39.3334 31.3333 38.1393 31.3333 36.6667V32.6667H38C39.1045 32.6667 40 31.7712 40 30.6667V8.00002C40 6.89553 39.1045 6.00002 38 6.00002ZM13.3333 4.00002C13.3333 2.89553 14.2288 2.00002 15.3333 2.00002H24.6667C25.7712 2.00002 26.6667 2.89553 26.6667 4.00002V6.00002H13.3333V4.00002ZM2 31.3334C1.63184 31.3334 1.33333 31.0349 1.33333 30.6667V27.3867C3.37728 27.6839 4.98275 29.2894 5.27995 31.3334H2ZM26.6667 29.3334C26.2985 29.3334 26 29.6319 26 30V31.3334H6.62728C6.3125 28.5505 4.11621 26.3542 1.33333 26.0394V17.9212C1.96484 18.4046 2.73796 18.6664 3.5332 18.6667H6.66667V22.6667C6.66667 22.8766 6.76563 23.0742 6.93327 23.1999L9.59994 25.1999C9.83691 25.378 10.1631 25.378 10.4001 25.1999L13.0667 23.1999C13.2344 23.0742 13.3333 22.8766 13.3333 22.6667V18.6667H19.3672C19.3512 18.888 19.3333 19.1081 19.3333 19.3334C19.3398 23.7142 22.3887 27.5023 26.6667 28.4453V29.3334ZM8 22.3334V16H12V22.3334L10 23.8334L8 22.3334ZM30 36.6667C30 37.403 29.403 38 28.6667 38C27.9303 38 27.3333 37.403 27.3333 36.6667V30.6667H30V36.6667ZM28 29.3334V28.6328C28.2214 28.6488 28.4414 28.6667 28.6667 28.6667C28.8919 28.6667 29.112 28.6488 29.3333 28.6328V29.3334H28ZM28.6667 27.3334C24.2484 27.3334 20.6667 23.7516 20.6667 19.3334C20.6667 14.9151 24.2484 11.3334 28.6667 11.3334C33.085 11.3334 36.6667 14.9151 36.6667 19.3334C36.6618 23.7497 33.083 27.3285 28.6667 27.3334ZM38.6667 30.6667C38.6667 31.0349 38.3682 31.3334 38 31.3334H34.7201C35.0173 29.2894 36.6227 27.6839 38.6667 27.3867V30.6667ZM38.6667 26.0394C35.8838 26.3542 33.6875 28.5505 33.3727 31.3334H31.3333V30C31.3333 29.6319 31.0348 29.3334 30.6667 29.3334V28.4453C34.9447 27.5023 37.9935 23.7142 38 19.3334C38 19.0072 37.9824 18.6817 37.9479 18.3574C38.2038 18.2429 38.445 18.0987 38.6667 17.9274V26.0394ZM38.6667 15.3334C38.6533 16.0189 38.2835 16.6481 37.6908 16.9925C36.6097 12.8155 32.8037 9.9258 28.4896 10.0069C24.1755 10.0879 20.4808 13.1185 19.5573 17.3334H13.3333V15.3334C13.3333 14.9652 13.0348 14.6667 12.6667 14.6667H7.33333C6.96517 14.6667 6.66667 14.9652 6.66667 15.3334V17.3334H3.5332C2.37467 17.3854 1.3916 16.4919 1.33333 15.3334V8.00002C1.33333 7.63186 1.63184 7.33335 2 7.33335H38C38.3682 7.33335 38.6667 7.63186 38.6667 8.00002V15.3334Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M11.3333 20.6666C11.3333 21.403 10.7363 22 9.99996 22C9.26363 22 8.66663 21.403 8.66663 20.6666C8.66663 19.9303 9.26363 19.3333 9.99996 19.3333C10.7363 19.3333 11.3333 19.9303 11.3333 20.6666Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M22 19.3334C22.0039 23.0137 24.9863 25.9961 28.6667 26V24.6667C25.721 24.6667 23.3333 22.279 23.3333 19.3334C23.3333 16.3877 25.721 14 28.6667 14V12.6667C24.9863 12.6706 22.0039 15.653 22 19.3334Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;/svg&gt;Команда профессионалов, которые всегда готовы проконсультировать по вопросам подбора медицинского оборудования и текущему законодательству РФ.&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;g clip-path=&quot;url(#clip0)&quot;&gt;&lt;path d=&quot;M39.4305 10.5036C39.4304 10.5036 39.4304 10.5036 39.4304 10.5036L39.429 10.5023L36.8472 10.1339C36.4843 10.0822 36.232 9.74612 36.2837 9.38323C36.3085 9.20884 36.4016 9.05154 36.5425 8.94584L38.6293 7.38079C38.9225 7.16084 38.9819 6.74486 38.762 6.45158L36.3726 3.26571C36.1527 2.97243 35.7367 2.91303 35.4434 3.13297L33.3573 4.69802C33.0653 4.91962 32.649 4.86254 32.4274 4.57051C32.3198 4.42872 32.2736 4.2496 32.2993 4.07346L32.6684 1.49159C32.7204 1.1287 32.4684 0.792438 32.1056 0.740336C32.1054 0.740336 32.1051 0.740253 32.1049 0.740253L28.165 0.177418C27.8022 0.125315 27.4658 0.377198 27.4137 0.740087C27.4137 0.74017 27.4137 0.74017 27.4137 0.740253L27.0447 3.32213C26.993 3.68502 26.6569 3.93732 26.294 3.88563C26.1196 3.86082 25.9623 3.76765 25.8566 3.62678L24.2922 1.54004C24.0723 1.24676 23.6563 1.18735 23.363 1.40729L21.3685 2.90398C20.4662 2.80808 19.5562 2.80808 18.6539 2.90398C12.7446 3.5794 8.11059 8.29199 7.53457 14.2118C7.51665 14.3996 7.51001 14.5861 7.50072 14.7727H7.3016C6.98666 14.7732 6.71545 14.9951 6.65248 15.3036L6.19385 17.4846L4.35667 16.2176C4.09301 16.0356 3.73692 16.0681 3.51042 16.2946L1.51926 18.2857C1.2931 18.5121 1.26074 18.8677 1.44227 19.1313L2.70334 20.9652L0.521687 21.4238C0.216541 21.4907 -0.000662204 21.7612 1.51696e-06 22.0736V24.7285C-0.000164413 25.0424 0.219776 25.3135 0.526996 25.3783L2.70865 25.8369L1.44758 27.6708C1.26605 27.9343 1.29841 28.2899 1.52457 28.5163L3.51573 30.5075C3.74223 30.734 4.09832 30.7664 4.36198 30.5845L6.19584 29.3201L6.65447 31.5017C6.71744 31.8103 6.98866 32.0321 7.30359 32.0327H9.95848C10.2724 32.0329 10.5435 31.813 10.6083 31.5057L11.0669 29.3241L12.9008 30.5852C13.1643 30.7667 13.5199 30.7343 13.7463 30.5082L14.7771 29.4741V31.3657C14.7801 32.3099 15.2859 33.181 16.1045 33.6515V37.3392C16.1045 38.8054 17.2932 39.9941 18.7594 39.9941H21.4143C22.8806 39.9941 24.0692 38.8054 24.0692 37.3392V33.6515C24.8878 33.181 25.3937 32.3099 25.3966 31.3657V28.7387C25.4146 27.6333 25.9929 26.6129 26.9318 26.0294C27.4826 25.672 28.005 25.2726 28.4942 24.8347L27.6088 23.8457C27.1712 24.238 26.7036 24.5955 26.2104 24.915C24.8925 25.7421 24.0857 27.1827 24.0692 28.7387V31.3657C24.0692 32.0988 23.4749 32.6931 22.7418 32.6931H17.432C16.6988 32.6931 16.1045 32.0988 16.1045 31.3657V28.6836C16.0892 27.1571 15.2951 25.7443 13.9992 24.9375C8.73864 21.632 7.15367 14.6879 10.4592 9.42737C12.5101 6.16344 16.0894 4.17684 19.9442 4.16306C19.9343 4.18671 19.9256 4.21085 19.9183 4.23541C19.8936 4.40964 19.9393 4.5866 20.0451 4.72723L21.6094 6.8133C21.7744 7.02677 21.7902 7.31997 21.6493 7.55003C21.5135 7.78151 21.2511 7.90778 20.9855 7.86928L18.4037 7.50026C18.0408 7.44824 17.7045 7.7002 17.6524 8.06301C17.6524 8.06326 17.6523 8.06351 17.6523 8.06375L17.0888 12.0056C17.0368 12.3684 17.2888 12.7047 17.6516 12.7568C17.6518 12.7568 17.6521 12.7569 17.6523 12.7569L20.2342 13.126C20.5971 13.1776 20.8494 13.5137 20.7977 13.8766C20.7729 14.051 20.6797 14.2083 20.5389 14.314L18.4528 15.8784C18.1595 16.0984 18.1001 16.5143 18.32 16.8076L20.7094 19.9935C20.9294 20.2868 21.3454 20.3462 21.6386 20.1262L23.7254 18.5618C24.0189 18.3423 24.4349 18.4023 24.6544 18.6959C24.7595 18.8364 24.8047 19.0128 24.78 19.1864L24.4117 21.7683C24.3596 22.1311 24.6115 22.4675 24.9743 22.5196C24.9744 22.5196 24.9744 22.5196 24.9745 22.5196L28.917 23.0831C28.948 23.0871 28.9793 23.0891 29.0106 23.0891C29.3411 23.0895 29.6214 22.8467 29.6683 22.5196L30.0367 19.9377C30.0884 19.5748 30.4245 19.3225 30.7874 19.3742C30.9618 19.399 31.1191 19.4922 31.2248 19.6331L32.7898 21.7192C33.0098 22.0124 33.4258 22.0718 33.719 21.8519L36.9049 19.4625C37.1982 19.2426 37.2576 18.8266 37.0376 18.5333L35.4733 16.4472C35.3091 16.2334 35.2932 15.9407 35.4334 15.7105C35.5663 15.4759 35.8311 15.3488 36.0972 15.3919L38.679 15.7603C39.0418 15.8124 39.3783 15.5604 39.4304 15.1976C39.4304 15.1975 39.4304 15.1975 39.4304 15.1974L39.9932 11.2549C40.0453 10.892 39.7934 10.5557 39.4305 10.5036ZM17.432 34.0206H22.7418V35.348H17.432V34.0206V34.0206ZM17.432 36.6755H22.7418V37.3392C22.7418 38.0723 22.1475 38.6666 21.4143 38.6666H18.7594C18.0263 38.6666 17.432 38.0723 17.432 37.3392V36.6755V36.6755ZM12.1481 25.2296C12.5105 25.5259 12.8891 25.8019 13.2824 26.0559C13.9095 26.4522 14.3816 27.0518 14.6198 27.7544L13.1961 29.1754L11.8176 28.225C11.2139 27.809 10.3873 27.9611 9.97125 28.5648C9.87153 28.7096 9.80151 28.8727 9.76533 29.0447L9.41754 30.702H7.83988L7.49209 29.0473C7.34109 28.3299 6.63713 27.8707 5.91973 28.0217C5.74775 28.0579 5.58464 28.1279 5.43986 28.2276L4.06065 29.1754L2.85135 27.9688L3.80113 26.5909C4.21754 25.9875 4.06588 25.1608 3.46247 24.7444C3.31761 24.6444 3.15434 24.5742 2.9821 24.538L1.32744 24.1895V22.6125L2.9821 22.2641C3.69925 22.112 4.15739 21.4074 4.00531 20.6901C3.96922 20.52 3.90011 20.3586 3.8018 20.2152L2.85135 18.8333L4.06065 17.6267L5.44053 18.5771C6.04443 18.9927 6.87101 18.84 7.28658 18.2361C7.38614 18.0915 7.456 17.9286 7.49209 17.7567L7.60824 17.2045C7.7146 17.9693 7.89074 18.7226 8.13457 19.4552C5.95068 19.7155 4.39135 21.6971 4.65169 23.881C4.91204 26.0649 6.89358 27.6242 9.07747 27.3639C10.3921 27.2071 11.5429 26.4072 12.1481 25.2296ZM11.1173 24.2944C10.6217 25.672 9.10319 26.387 7.72555 25.8915C6.34792 25.3958 5.63292 23.8773 6.12847 22.4997C6.50762 21.4458 7.50827 20.7438 8.6283 20.7461C8.63692 20.7461 8.64489 20.7461 8.65352 20.7461C9.26389 22.0622 10.0974 23.2626 11.1173 24.2944ZM38.2065 14.3505L36.2817 14.0757C35.193 13.9203 34.1845 14.6768 34.029 15.7654C33.9543 16.2882 34.0904 16.8192 34.4073 17.2417L35.5735 18.7968L33.4496 20.3897L32.2827 18.8353C31.623 17.9554 30.375 17.777 29.4952 18.4367C29.0727 18.7535 28.7934 19.2251 28.7186 19.7479L28.4498 21.6754L25.8221 21.2997L26.0969 19.3749C26.2528 18.2863 25.4966 17.2775 24.408 17.1216C23.8849 17.0467 23.3536 17.1828 22.9309 17.4999L21.3758 18.666L19.7829 16.5421L21.3373 15.3753C22.2172 14.7156 22.3956 13.4675 21.7359 12.5878C21.4191 12.1653 20.9475 11.886 20.4247 11.8111L18.4999 11.5363L18.8756 8.90867L20.8004 9.18345C21.889 9.33934 22.8978 8.5832 23.0536 7.49461C23.1285 6.97152 22.9925 6.44021 22.6754 6.0175L21.5052 4.46108L23.6291 2.86814L24.796 4.42324C25.4557 5.30309 26.7038 5.48155 27.5835 4.82181C28.006 4.50505 28.2853 4.03339 28.3602 3.51063L28.6349 1.58583L31.2626 1.96084L30.9878 3.88563C30.8323 4.9743 31.5888 5.98282 32.6775 6.1383C33.2003 6.21297 33.7313 6.07691 34.1538 5.75998L35.7089 4.59382L37.3018 6.71773L35.7467 7.88455C34.8669 8.54429 34.6884 9.79233 35.3481 10.6721C35.6649 11.0946 36.1366 11.3739 36.6593 11.4487L38.5841 11.7235L38.2065 14.3505Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M28.54 6.31952C25.6075 6.31952 23.2302 8.6968 23.2302 11.6293C23.2302 14.5618 25.6075 16.9391 28.54 16.9391C31.4725 16.9391 33.8498 14.5618 33.8498 11.6293C33.8464 8.69813 31.4712 6.32275 28.54 6.31952ZM28.54 15.6116C26.3406 15.6116 24.5577 13.8287 24.5577 11.6293C24.5577 9.42988 26.3406 7.64696 28.54 7.64696C30.7394 7.64696 32.5223 9.42988 32.5223 11.6293C32.5197 13.8276 30.7383 15.609 28.54 15.6116Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M20.7512 29.3746H19.4237V31.3657H20.7512V29.3746Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M17.1833 22.8561C13.0861 21.2556 11.0621 16.6366 12.6628 12.5394C13.283 10.9517 14.3962 9.60496 15.8386 8.69699L15.1291 7.57397C10.787 10.3094 9.48453 16.0469 12.22 20.3889C13.2794 22.0706 14.8501 23.3682 16.7014 24.0913C18.3402 24.7192 19.4223 26.2922 19.4227 28.0471H20.7501C20.7522 25.7447 19.3333 23.6797 17.1833 22.8561Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M37.3443 24.7285H32.6982V26.056H37.3443V24.7285Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M32.4592 28.2005L31.6095 29.2204L35.5921 32.5385L36.4418 31.5186L32.4592 28.2005Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M30.0433 30.0383H28.7158V34.6844H30.0433V30.0383Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M5.98628 10.1462L0.67688 11.4734L0.998624 12.7605L6.30803 11.4333L5.98628 10.1462Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M2.55054 3.61388L1.77942 4.69348L6.4251 8.01174L7.19622 6.93214L2.55054 3.61388Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M8.75233 0.00554316L7.46631 0.334351L8.82379 5.64371L10.1098 5.3149L8.75233 0.00554316Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;/g&gt;&lt;defs&gt;&lt;clipPath id=&quot;clip0&quot;&gt;&lt;rect width=&quot;40&quot; height=&quot;40&quot; fill=&quot;white&quot;&gt;&lt;/rect&gt;&lt;/clipPath&gt;&lt;/defs&gt;&lt;/svg&gt;Грамотный анализ всех тенденций современного рынка здравоохранения для того, чтобы предложить нашим клиентам самые инновационные решения, отвечающие требованиям конкретного медицинского учреждения.&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;path d=&quot;M37.2666 34.7273C37.7384 34.1438 37.997 33.417 38 32.6667V31.3333C38 29.4924 36.5075 28 34.6666 28C32.8257 28 31.3333 29.4924 31.3333 31.3333V32.6667C31.3362 33.417 31.5949 34.1438 32.0666 34.7273C31.2389 34.8812 30.5003 35.3435 30 36.0207C29.4996 35.3435 28.761 34.8812 27.9333 34.7273C28.405 34.1438 28.6637 33.417 28.6666 32.6667V31.3333C28.6666 29.4924 27.1742 28 25.3333 28C23.4924 28 22 29.4924 22 31.3333V32.6667C22.0029 33.417 22.2615 34.1438 22.7333 34.7273C21.9055 34.8812 21.167 35.3435 20.6666 36.0207C20.1663 35.3435 19.4277 34.8812 18.6 34.7273C19.0717 34.1438 19.3304 33.417 19.3333 32.6667V31.3333C19.3333 29.4924 17.8409 28 16 28C14.159 28 12.6666 29.4924 12.6666 31.3333V32.6667C12.6695 33.417 12.9282 34.1438 13.4 34.7273C11.819 35.0166 10.6696 36.3928 10.6666 38V40H12V38C12 36.8954 12.8954 36 14 36H18C19.1045 36 20 36.8954 20 38V40H21.3333V38C21.3333 36.8954 22.2287 36 23.3333 36H27.3333C28.4379 36 29.3333 36.8954 29.3333 38V40H30.6666V38C30.6666 36.8954 31.562 36 32.6666 36H36.6666C37.7712 36 38.6666 36.8954 38.6666 38V40H40V38C39.997 36.3928 38.8475 35.0166 37.2666 34.7273ZM18 32.6667C18 33.7713 17.1045 34.6667 16 34.6667C14.8954 34.6667 14 33.7713 14 32.6667V31.3333C14 30.2288 14.8954 29.3333 16 29.3333C17.1045 29.3333 18 30.2288 18 31.3333V32.6667ZM27.3333 32.6667C27.3333 33.7713 26.4379 34.6667 25.3333 34.6667C24.2287 34.6667 23.3333 33.7713 23.3333 32.6667V31.3333C23.3333 30.2288 24.2287 29.3333 25.3333 29.3333C26.4379 29.3333 27.3333 30.2288 27.3333 31.3333V32.6667ZM36.6666 32.6667C36.6666 33.7713 35.7712 34.6667 34.6666 34.6667C33.562 34.6667 32.6666 33.7713 32.6666 32.6667V31.3333C32.6666 30.2288 33.562 29.3333 34.6666 29.3333C35.7712 29.3333 36.6666 30.2288 36.6666 31.3333V32.6667Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M16.2438 13.3799C16.1662 13.3492 16.0835 13.3334 16 13.3334H13.3333C13.053 13.3333 12.8026 13.5086 12.7067 13.772L12 15.7154L11.9767 15.652C11.4678 14.2622 10.1468 13.3367 8.66667 13.3334H8.64933C9.0905 12.7598 9.33092 12.057 9.33333 11.3334V10C9.33333 8.1591 7.84092 6.66669 6 6.66669C4.15908 6.66669 2.66667 8.1591 2.66667 10V11.3334C2.66908 12.057 2.9095 12.7598 3.35067 13.3334H3.33333C1.49333 13.3355 0.00216667 14.8267 0 16.6667V24.6667C0 25.0349 0.2985 25.3334 0.666667 25.3334H2.66667V31.8L1.44533 33.63C1.241 33.9363 1.32358 34.3503 1.62992 34.5546C1.7395 34.6277 1.86825 34.6667 2 34.6667H10C10.3682 34.6668 10.6668 34.3683 10.6668 34.0001C10.6668 33.8684 10.6278 33.7396 10.5547 33.63L9.33333 31.8V19.4907L9.50133 19.824C10.175 21.1704 11.8125 21.7159 13.1589 21.0422C13.7556 20.7437 14.222 20.2367 14.47 19.6174L15.5527 16.9114L16.6193 14.2447C16.7545 13.9022 16.5863 13.515 16.2438 13.3799ZM4 10C4 8.89544 4.89542 8.00002 6 8.00002C7.10458 8.00002 8 8.89544 8 10V11.3334C8 12.4379 7.10458 13.3334 6 13.3334C4.89542 13.3334 4 12.4379 4 11.3334V10ZM2.66667 24H1.33333V22.6667H2.66667V24ZM6.66667 33.3334V25.3334H5.33333V33.3334H3.246L3.888 32.37C3.96083 32.2604 3.99975 32.1317 4 32V24H8V32C8.00025 32.1317 8.03917 32.2604 8.112 32.37L8.754 33.3334H6.66667ZM13.232 19.1254C12.9458 19.8393 12.1351 20.1861 11.4212 19.8999C11.1051 19.7733 10.8464 19.5352 10.694 19.2307L9.26667 16.3687C9.10625 16.0373 8.7075 15.8987 8.37608 16.0592C8.14358 16.1718 7.99708 16.4084 8 16.6667V22.6667H4V16.6667C4 16.2985 3.7015 16 3.33333 16C2.96517 16 2.66667 16.2985 2.66667 16.6667V21.3334H1.33333V16.6667C1.33333 15.5621 2.22875 14.6667 3.33333 14.6667H5.33333V21.3334H6.66667V14.6667H8.66667C9.58633 14.6685 10.4073 15.2436 10.7233 16.1074L11.3733 17.8947C11.4989 18.2408 11.8813 18.4195 12.2274 18.2939C12.4131 18.2266 12.5593 18.0804 12.6267 17.8947L12.8307 17.3334H13.9487L13.232 19.1254ZM14.482 16H13.3153L13.8 14.6667H15.0153L14.482 16Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M39.3333 4C39.7015 4 40 3.7015 40 3.33333V0.666667C40 0.2985 39.7015 0 39.3333 0H11.3333C10.9651 0 10.6666 0.2985 10.6666 0.666667V3.33333C10.6666 3.7015 10.9651 4 11.3333 4H12V12H13.3333V4H37.3333V18.6667H16V20H24.6666V22.9467L20.3333 25.4213L20.9946 26.5787L24.6666 24.482V26.6667H26V24.482L29.6666 26.5787L30.328 25.4213L26 22.9467V20H40V18.6667H38.6666V4H39.3333ZM12 2.66667V1.33333H38.6666V2.66667H12Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M32.829 7.35331L30.1624 6.68665L29.8384 7.97998L31.087 8.29198L26.027 11.834L23.0837 9.47931C22.8506 9.29314 22.5223 9.28439 22.2797 9.45798L17.613 12.7913L18.3877 13.8753L22.6444 10.8353L25.5837 13.1873C25.815 13.3727 26.141 13.3831 26.3837 13.2126L32.0004 9.28064V10.6666H33.3337V7.99998C33.3337 7.69423 33.1256 7.42764 32.829 7.35331Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;/svg&gt;Шоу-рум – тренинг-центр, в котором можно посмотреть оборудование компании и пройти обучение по продукции.&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;g clip-path=&quot;url(#clip0)&quot;&gt;&lt;path d=&quot;M39.4137 33.1464C39.4135 33.1464 39.4132 33.1464 39.413 33.1464L37.1707 33.149L37.1683 31.2577C37.1679 30.9341 36.9054 30.672 36.5819 30.672C36.5817 30.672 36.5814 30.672 36.5812 30.672C36.2573 30.6724 35.9951 30.9352 35.9955 31.2591L35.998 33.1503L27.2256 33.1605L27.2169 25.6463L33.2881 25.6393C33.598 25.639 33.889 25.518 34.1078 25.2988C34.3266 25.0796 34.4468 24.7882 34.4464 24.4784L34.4394 18.352C34.439 18.0423 34.318 17.7511 34.0988 17.5325C33.8799 17.3141 33.5891 17.1938 33.2798 17.1938C33.2794 17.1938 33.2789 17.1938 33.2784 17.1938L27.207 17.2008L27.2042 14.7759L35.9766 14.7659L35.9923 28.6007C35.9927 28.9244 36.2551 29.1864 36.5787 29.1864H36.5794C36.9033 29.186 37.1655 28.9233 37.1652 28.5994L37.1494 14.7645L38.3036 14.7632C39.1946 14.762 39.9184 14.0363 39.9172 13.1457L39.9156 11.6077C39.9145 10.717 39.1896 9.99325 38.2997 9.99325C38.299 9.99325 38.2981 9.99325 38.2975 9.99325L34.5416 9.99716C34.2177 9.99747 33.9554 10.2603 33.9558 10.5842C33.9561 10.9078 34.2186 11.1699 34.5422 11.1699H34.5428L38.2989 11.166H38.2994C38.5437 11.166 38.7426 11.3647 38.7429 11.6091L38.7445 13.1472C38.7448 13.3912 38.5463 13.5901 38.3021 13.5905L27.2029 13.603L27.2001 11.1786L31.8846 11.173C32.2084 11.1726 32.4706 10.9098 32.4703 10.586C32.4699 10.2624 32.2074 10.0003 31.8839 10.0003C31.8836 10.0003 31.8834 10.0003 31.8832 10.0003L27.1988 10.0058L27.1956 7.25254C27.1951 6.82018 27.0262 6.41386 26.7201 6.10856C26.4145 5.80365 26.0086 5.63586 25.5769 5.63586C25.5763 5.63586 25.5756 5.63586 25.575 5.63586L14.3596 5.64884C13.9272 5.64931 13.5209 5.81819 13.2156 6.12427C12.9103 6.43036 12.7424 6.83699 12.7429 7.26935L12.7461 10.0227L1.64669 10.0356C1.21505 10.0361 0.809431 10.2048 0.504595 10.5107C0.199993 10.8163 0.0325246 11.2223 0.0330719 11.6538L0.034792 13.192C0.0352611 13.6236 0.203824 14.0291 0.509208 14.3338C0.8142 14.6381 1.21935 14.8056 1.65013 14.8056H1.65217L2.81295 14.8042V16.5599C2.81295 16.8838 3.07549 17.1463 3.39933 17.1463C3.72316 17.1463 3.9857 16.8838 3.9857 16.5599V14.8028L12.7515 14.7927L12.7543 17.2175L6.68341 17.2245C6.37357 17.2248 6.0825 17.3458 5.86374 17.565C5.64498 17.7842 5.52474 18.0756 5.52513 18.3854L5.53216 24.5118C5.53256 24.8215 5.6535 25.1127 5.87273 25.3314C6.09164 25.5497 6.38241 25.67 6.6917 25.67H6.69318L12.7642 25.663L12.7729 33.1772L3.98578 33.1874V19.2182C3.98578 18.8944 3.72324 18.6319 3.3994 18.6319C3.07557 18.6319 2.81303 18.8944 2.81303 19.2182V33.1888L0.585749 33.1914C0.261836 33.1918 -0.000390479 33.4546 4.36503e-07 33.7784C0.000391352 34.102 0.262774 34.3641 0.586374 34.3641H0.587078L39.4143 34.3192C39.7382 34.3188 40.0004 34.0559 40 33.7321C39.9996 33.4086 39.7372 33.1464 39.4137 33.1464V33.1464ZM33.2666 18.3666L33.2736 24.4666L27.2155 24.4736L27.2085 18.3736L33.2666 18.3666ZM1.65084 13.6329C1.65068 13.6329 1.65053 13.6329 1.65029 13.6329C1.53216 13.6329 1.42114 13.587 1.33756 13.5037C1.2539 13.4202 1.2077 13.3091 1.20754 13.1907L1.20582 11.6525C1.20566 11.5339 1.25164 11.4225 1.33529 11.3385C1.41879 11.2547 1.52989 11.2085 1.6481 11.2084L12.7475 11.1955L12.7503 13.6201L1.65084 13.6329ZM6.70499 24.4974L6.69795 18.3974L12.7557 18.3904L12.7628 24.4904L6.70499 24.4974ZM13.9156 7.26802C13.9154 7.14894 13.9617 7.03691 14.0458 6.95263C14.13 6.86834 14.2418 6.82182 14.3609 6.82167L25.5764 6.80869H25.5769C25.8225 6.80869 26.0225 7.00837 26.0228 7.25402L26.0527 33.162L24.5873 33.1637L24.5753 22.823C24.5748 22.3286 24.3849 21.8636 24.0409 21.5135C23.6943 21.1608 23.233 20.9666 22.7417 20.9666C22.741 20.9666 22.7402 20.9666 22.7395 20.9666L17.2308 20.9731C16.7387 20.9736 16.277 21.1689 15.9307 21.5229C15.5875 21.8738 15.3987 22.3392 15.3994 22.8337L15.4113 33.1744L13.9455 33.1761L13.9156 7.26802ZM16.5721 22.8321C16.5719 22.6466 16.6418 22.4728 16.769 22.3428C16.8932 22.2159 17.0577 22.1458 17.2322 22.1457L22.7409 22.1392H22.7417C22.9159 22.1392 23.0802 22.2089 23.2045 22.3353C23.332 22.4651 23.4023 22.6387 23.4026 22.8241L23.4145 33.1649L16.5841 33.1728L16.5721 22.8321Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;path d=&quot;M16.1847 15.649H16.1861L18.1414 15.6467L18.1436 17.6019C18.1443 18.2051 18.6353 18.6953 19.2382 18.6953H19.2396L20.7254 18.6936C21.0178 18.6933 21.2926 18.5791 21.4991 18.3721C21.7056 18.1651 21.8192 17.89 21.8188 17.5976L21.8165 15.6424L23.7716 15.6401C24.3752 15.6395 24.8657 15.1479 24.8651 14.5442L24.8634 13.0583C24.8631 12.7659 24.7488 12.4912 24.5418 12.2846C24.3351 12.0784 24.0607 11.9649 23.7687 11.9649C23.7683 11.9649 23.7678 11.9649 23.7673 11.9649L21.8121 11.9672L21.8099 10.012C21.8095 9.71964 21.6954 9.44491 21.4884 9.23835C21.2817 9.0321 21.0072 8.91858 20.7153 8.91858C20.7149 8.91858 20.7144 8.91858 20.7139 8.91858L19.228 8.9203C18.9356 8.92061 18.6609 9.03484 18.4543 9.24187C18.2478 9.44882 18.1343 9.72394 18.1346 10.0163L18.1369 11.9715L16.1818 11.9737C15.8894 11.9741 15.6146 12.0882 15.4081 12.2952C15.2015 12.5023 15.088 12.7773 15.0884 13.0697L15.0901 14.5555C15.0904 14.8479 15.2046 15.1227 15.4116 15.3292C15.6184 15.5355 15.8929 15.649 16.1847 15.649V15.649ZM18.7248 13.1436C19.0487 13.1432 19.3109 12.8804 19.3105 12.5565L19.3076 10.093L20.6373 10.0915L20.6402 12.555C20.6402 12.5753 20.6413 12.5952 20.6433 12.6149C20.6736 12.9104 20.9232 13.1407 21.2265 13.1407H21.2272L23.6907 13.1378L23.6923 14.4675L21.2287 14.4704C20.9049 14.4708 20.6427 14.7336 20.6431 15.0574L20.6459 17.5209L19.3162 17.5225L19.3133 15.0589C19.3129 14.7353 19.0505 14.4733 18.7269 14.4733C18.7268 14.4733 18.7265 14.4733 18.7262 14.4733L16.2628 14.4762L16.2612 13.1465L18.7248 13.1436Z&quot; fill=&quot;#393185&quot;&gt;&lt;/path&gt;&lt;/g&gt;&lt;defs&gt;&lt;clipPath id=&quot;clip0&quot;&gt;&lt;rect width=&quot;40&quot; height=&quot;40&quot; fill=&quot;white&quot;&gt;&lt;/rect&gt;&lt;/clipPath&gt;&lt;/defs&gt;&lt;/svg&gt;Комплексный подход к оснащению клиник.&lt;/li&gt;&lt;li style=&quot;list-style: none; margin-bottom: 15px; max-width: 900px; font-size: 16px; line-height: 1.1; display: flex; place-content: center flex-start; align-items: center; position: relative;&quot;&gt;&lt;svg width=&quot;40&quot; height=&quot;40&quot; viewBox=&quot;0 0 40 40&quot; fill=&quot;none&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;&gt;&lt;/svg&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/div&gt;', '', 'О компании	', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_filter`
--

CREATE TABLE `oc_information_filter` (
  `information_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_image`
--

CREATE TABLE `oc_information_image` (
  `information_image_id` int(11) NOT NULL,
  `information_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_product_related`
--

CREATE TABLE `oc_information_product_related` (
  `information_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `route` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_related`
--

CREATE TABLE `oc_information_related` (
  `information_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `route` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_category`
--

CREATE TABLE `oc_information_to_category` (
  `information_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(3, 0, 0),
(10, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(4, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_user`
--

CREATE TABLE `oc_information_to_user` (
  `information_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_user`
--

INSERT INTO `oc_information_to_user` (`information_id`, `user_id`) VALUES
(3, 1),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'Russian', 'ru-ru', 'ru_RU.UTF-8,ru_RU,russian', 'ru-ru.png', 'russian', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(15, 'Header'),
(16, 'Category Information'),
(17, 'Search Information'),
(18, 'Blog');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(130, 5, 'account', 'column_left', 2),
(69, 10, 'account', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(128, 1, 'html.36', 'content_bottom', 1),
(127, 1, 'carousel.35', 'content_bottom', 0),
(157, 3, 'category', 'column_left', 1),
(126, 1, 'banner.33', 'content_top', 0),
(129, 15, 'html.36', 'content_top', 0),
(158, 3, 'filter', 'content_top', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(128, 3, 0, 'product/category'),
(103, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(121, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(127, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(105, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(104, 15, 0, 'common/header'),
(122, 16, 0, 'extension/information/category'),
(123, 17, 0, 'information/search'),
(124, 18, 0, 'blog/%');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(2, 1, 'Миллиметр', 'мм');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_modification`
--

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(6, 11, '  OptimBlog', 'optimblog', 'Dmitriy Khokhlov | optimlab.com', '3.0.1.5', 'http://optimlab.com', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n  <name>  OptimBlog</name>\n  <code>optimblog</code>\n  <version>3.0.1.5</version>\n  <author>Dmitriy Khokhlov | optimlab.com</author>\n  <link>http://optimlab.com</link>\n\n<!-- optimblog-admin.ocmod -->\n\n  <file path=\"admin/controller/startup/permission.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$extension = array(\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n				\'extension/information\',\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Category -->\n  <file path=\"admin/controller/catalog/category.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$data[\'placeholder\'] = $this->model_tool_image->resize(\'no_image.png\', 100, 100);\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		// Images\n		if (isset($this->request->post[\'category_image\'])) {\n			$category_images = $this->request->post[\'category_image\'];\n		} elseif (isset($this->request->get[\'category_id\'])) {\n			$category_images = $this->model_catalog_category->getCategoryImages($this->request->get[\'category_id\']);\n		} else {\n			$category_images = array();\n		}\n\n		$data[\'category_images\'] = array();\n\n		foreach ($category_images as $category_image) {\n			if (is_file(DIR_IMAGE . $category_image[\'image\'])) {\n				$image = $category_image[\'image\'];\n				$thumb = $category_image[\'image\'];\n			} else {\n				$image = \'\';\n				$thumb = \'no_image.png\';\n			}\n\n			$data[\'category_images\'][] = array(\n				\'image\'      => $image,\n				\'thumb\'      => $this->model_tool_image->resize($thumb, 100, 100),\n				\'sort_order\' => $category_image[\'sort_order\']\n			);\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		if (isset($this->request->post[\'category_seo_url\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (isset($this->request->post[\'information\'])) {\n			$data[\'information\'] = $this->request->post[\'information\'];\n		} elseif (!empty($category_info)) {\n			$data[\'information\'] = $category_info[\'information\'];\n		} else {\n			$data[\'information\'] = isset($this->request->get[\'filter_information\']) ? $this->request->get[\'filter_information\'] : \'\';\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				\'filter_name\' => $this->request->get[\'filter_name\'],\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n				\'filter_information\' => isset($this->request->get[\'filter_information\']) ? $this->request->get[\'filter_information\'] : \'\',\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$url = \'\';\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		if (isset($this->request->get[\'filter_information\'])) {\n			$url .= \'&filter_information=\' . $this->request->get[\'filter_information\'];\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$data[\'sort_sort_order\'] = $this->url->link(\'catalog/category\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&sort=sort_order\' . $url, true);\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n        $data[\'sort_information\'] = $this->url->link(\'catalog/category\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&sort=information\' . $url, true);\n\n		$url = \'\';\n\n		if (isset($this->request->get[\'sort\'])) {\n			$url .= \'&sort=\' . $this->request->get[\'sort\'];\n		}\n\n		if (isset($this->request->get[\'order\'])) {\n			$url .= \'&order=\' . $this->request->get[\'order\'];\n		}\n\n		if (isset($this->request->get[\'page\'])) {\n			$url .= \'&page=\' . $this->request->get[\'page\'];\n		}\n\n		$data[\'type_all\'] = $this->url->link(\'catalog/category\', \'user_token=\' . $this->session->data[\'user_token\'] . $url, true);\n		$data[\'type_product\'] = $this->url->link(\'catalog/category\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&filter_information=0\' . $url, true);\n		$data[\'type_information\'] = $this->url->link(\'catalog/category\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&filter_information=1\' . $url, true);\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$category_total = $this->model_catalog_category->getTotalCategories();\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		$category_total = $this->model_catalog_category->getTotalCategories($filter_data);\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	protected function getList() {\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		if (isset($this->request->get[\'filter_information\'])) {\n			$filter_information = $this->request->get[\'filter_information\'];\n		} else {\n			$filter_information = null;\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			\'order\' => $order,\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n			\'filter_information\' => $filter_information,\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				\'sort_order\'  => $result[\'sort_order\'],\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n				\'information\' => $result[\'information\'],\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$data[\'order\'] = $order;\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		$data[\'filter_information\'] = $filter_information;\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		if (isset($this->request->get[\'category_id\']) && $this->request->post[\'parent_id\']) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if ($this->request->post[\'parent_id\']) {\n			$results = $this->model_catalog_category->getCategoryPath($this->request->post[\'parent_id\']);\n			\n			foreach ($results as $result) {\n				$path_info = $this->model_catalog_category->getCategory($result[\'path_id\']);\n\n				if (($path_info[\'information\'] && !isset($this->request->post[\'information\'])) || (!$path_info[\'information\'] && isset($this->request->post[\'information\']))) {\n					$this->error[\'parent\'] = $this->language->get(\'error_parent\');\n					\n					break;\n				}\n			}\n		}\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/model/catalog/category.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[description = \'\" . $this->db->escape($value[\'description\']) . \"\', ]]></search>\n        <add position=\"replace\"><![CDATA[header = \'\" . $this->db->escape($value[\'header\']) . \"\', short_description = \'\" . $this->db->escape($value[\'short_description\']) . \"\', description = \'\" . $this->db->escape($value[\'description\']) . \"\', ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				\'name\'             => $result[\'name\'],\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n				\'header\'            => $result[\'header\'],\n				\'short_description\' => $result[\'short_description\'],\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[date_modified = NOW()]]></search>\n        <add position=\"replace\"><![CDATA[information = \'\" . (isset($data[\'information\']) ? (int)$data[\'information\'] : 0) . \"\', date_modified = NOW()]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"0\"><![CDATA[\n		foreach ($data[\'category_description\'] as $language_id => $value) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (isset($data[\'category_image\'])) {\n			foreach ($data[\'category_image\'] as $category_image) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"category_image SET category_id = \'\" . (int)$category_id . \"\', image = \'\" . $this->db->escape($category_image[\'image\']) . \"\', sort_order = \'\" . (int)$category_image[\'sort_order\'] . \"\'\");\n			}\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"0\"><![CDATA[\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"category_description WHERE category_id = \'\" . (int)$category_id . \"\'\");\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"category_image WHERE category_id = \'\" . (int)$category_id . \"\'\");\n\n		if (isset($data[\'category_image\'])) {\n			foreach ($data[\'category_image\'] as $category_image) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"category_image SET category_id = \'\" . (int)$category_id . \"\', image = \'\" . $this->db->escape($category_image[\'image\']) . \"\', sort_order = \'\" . (int)$category_image[\'sort_order\'] . \"\'\");\n			}\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"1\"><![CDATA[\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"category_description WHERE category_id = \'\" . (int)$category_id . \"\'\");\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"category_image WHERE category_id = \'\" . (int)$category_id . \"\'\");\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	public function getCategorySeoUrls($category_id) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n	public function getCategoryImages($category_id) {\n		$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"category_image WHERE category_id = \'\" . (int)$category_id . \"\' ORDER BY sort_order ASC\");\n\n		return $query->rows;\n	}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[c1.sort_order]]></search>\n        <add position=\"replace\"><![CDATA[c1.sort_order, c1.information]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$sql .= \" GROUP BY cp.category_id\";\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (isset($data[\'filter_information\']) && ($data[\'filter_information\'] == \'0\' || $data[\'filter_information\'] == \'1\')) {\n			$sql .= \" AND c1.information = \'\" . (int)$data[\'filter_information\'] . \"\' AND c2.information = \'\" . (int)$data[\'filter_information\'] . \"\'\";\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$sort_data = array(\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n			\'information\',\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[getTotalCategories()]]></search>\n        <add position=\"replace\"><![CDATA[getTotalCategories($data = array())]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$query = $this->db->query(\"SELECT COUNT(*) AS total FROM \" . DB_PREFIX . \"category\");\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		$sql = \"SELECT COUNT(*) AS total FROM \" . DB_PREFIX . \"category\";\n\n		$sql .= \" WHERE category_id != \'\'\";\n\n		if (isset($data[\'filter_information\']) && ($data[\'filter_information\'] == \'0\' || $data[\'filter_information\'] == \'1\')) {\n			$sql .= \" AND information = \'\" . (int)$data[\'filter_information\'] . \"\'\";\n		}\n\n		$query = $this->db->query($sql);\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/view/template/catalog/category_form.twig\">\n      <operation error=\"skip\">\n        <search index=\"0\"><![CDATA[\n                  <div class=\"form-group\">\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n                  <div class=\"form-group\">\n                    <label class=\"col-sm-2 control-label\" for=\"input-header{{ language.language_id }}\"><span data-toggle=\"tooltip\" title=\"{{ help_header }}\">{{ entry_header }}</span></label>\n                    <div class=\"col-sm-10\">\n                      <input type=\"text\" name=\"category_description[{{ language.language_id }}][header]\" value=\"{{ category_description[language.language_id] ? category_description[language.language_id].header }}\" placeholder=\"{{ entry_header }}\" id=\"input-header{{ language.language_id }}\" class=\"form-control\" />\n                    </div>\n                  </div>\n                  <div class=\"form-group\">\n                    <label class=\"col-sm-2 control-label\" for=\"input-short-description{{ language.language_id }}\">{{ entry_short_description }}<br /><button type=\"button\" class=\"btn btn-primary btn-xs summernote\" data-toggle=\"button\" aria-pressed=\"false\" autocomplete=\"off\" data-language=\"{{ language.language_id }}\">Summernote</button></label>\n                    <div class=\"col-sm-10\">\n                      <textarea name=\"category_description[{{ language.language_id }}][short_description]\" placeholder=\"{{ entry_short_description }}\" id=\"input-short-description{{ language.language_id }}\" class=\"form-control\">{{ category_description[language.language_id] ? category_description[language.language_id].short_description }}</textarea>\n                    </div>\n                  </div>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n            <li><a href=\"#tab-seo\" data-toggle=\"tab\">{{ tab_seo }}</a></li>\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n            <li><a href=\"#tab-image\" data-toggle=\"tab\">{{ tab_image }}</a></li>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n            <div class=\"tab-pane\" id=\"tab-seo\">\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n            <div class=\"tab-pane\" id=\"tab-image\">\n              <div class=\"table-responsive\">\n                <table id=\"images\" class=\"table table-striped table-bordered table-hover\">\n                  <thead>\n                    <tr>\n                      <td class=\"text-left\">{{ entry_additional_image }}</td>\n                      <td class=\"text-right\">{{ entry_sort_order }}</td>\n                      <td></td>\n                    </tr>\n                  </thead>\n                  <tbody>\n                  {% set image_row = 0 %}\n                  {% for category_image in category_images %}\n                  <tr id=\"image-row{{ image_row }}\">\n                    <td class=\"text-left\"><a href=\"\" id=\"thumb-image{{ image_row }}\" data-toggle=\"image\" class=\"img-thumbnail\"><img src=\"{{ category_image.thumb }}\" alt=\"\" title=\"\" data-placeholder=\"{{ placeholder }}\" /></a>\n                      <input type=\"hidden\" name=\"category_image[{{ image_row }}][image]\" value=\"{{ category_image.image }}\" id=\"input-image{{ image_row }}\" /></td>\n                    <td class=\"text-right\"><input type=\"text\" name=\"category_image[{{ image_row }}][sort_order]\" value=\"{{ category_image.sort_order }}\" placeholder=\"{{ entry_sort_order }}\" class=\"form-control\" /></td>\n                    <td class=\"text-left\"><button type=\"button\" onclick=\"$(\'#image-row{{ image_row }}\').remove();\" data-toggle=\"tooltip\" title=\"{{ button_remove }}\" class=\"btn btn-danger\"><i class=\"fa fa-minus-circle\"></i></button></td>\n                  </tr>\n                  {% set image_row = image_row + 1 %}\n                  {% endfor %}\n                  </tbody>\n                  <tfoot>\n                    <tr>\n                      <td colspan=\"2\"></td>\n                      <td class=\"text-left\"><button type=\"button\" onclick=\"addImage();\" data-toggle=\"tooltip\" title=\"{{ button_image_add }}\" class=\"btn btn-primary\"><i class=\"fa fa-plus-circle\"></i></button></td>\n                    </tr>\n                  </tfoot>\n                </table>\n              </div>\n            </div>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                <label class=\"col-sm-2 control-label\" for=\"input-status\">{{ entry_status }}</label>\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n                <label class=\"col-sm-2 control-label\" for=\"input-information\"><span data-toggle=\"tooltip\" title=\"{{ help_information }}\">{{ entry_information }}</span></label>\n                <div class=\"col-sm-10\">\n                  <div class=\"checkbox\">\n                    <label>\n                      {% if information %}\n                      <input type=\"checkbox\" name=\"information\" value=\"1\" checked=\"checked\" id=\"input-information\" />\n                      {% else %}\n                      <input type=\"checkbox\" name=\"information\" value=\"1\" id=\"input-information\" />\n                      {% endif %}\n                      &nbsp; </label>\n                  </div>\n                </div>\n              </div>\n              <div class=\"form-group\">\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[catalog/category/autocomplete&user_token={{ user_token }}]]></search>\n        <add position=\"replace\"><![CDATA[catalog/category/autocomplete&user_token={{ user_token }}{% if information != \'\' %}&filter_information={{ information }}{% endif %}]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"2\"><![CDATA[\n  <script type=\"text/javascript\"><!--\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n  <script type=\"text/javascript\"><!--\nvar image_row = {{ image_row }};\n\nfunction addImage() {\n	html  = \'<tr id=\"image-row\' + image_row + \'\">\';\n	html += \'  <td class=\"text-left\"><a href=\"\" id=\"thumb-image\' + image_row + \'\"data-toggle=\"image\" class=\"img-thumbnail\"><img src=\"{{ placeholder }}\" alt=\"\" title=\"\" data-placeholder=\"{{ placeholder }}\" /></a><input type=\"hidden\" name=\"category_image[\' + image_row + \'][image]\" value=\"\" id=\"input-image\' + image_row + \'\" /></td>\';\n	html += \'  <td class=\"text-right\"><input type=\"text\" name=\"category_image[\' + image_row + \'][sort_order]\" value=\"\" placeholder=\"{{ entry_sort_order }}\" class=\"form-control\" /></td>\';\n	html += \'  <td class=\"text-left\"><button type=\"button\" onclick=\"$(\\\'#image-row\' + image_row  + \'\\\').remove();\" data-toggle=\"tooltip\" title=\"{{ button_remove }}\" class=\"btn btn-danger\"><i class=\"fa fa-minus-circle\"></i></button></td>\';\n	html += \'</tr>\';\n\n	$(\'#images tbody\').append(html);\n\n	image_row++;\n}\n//--></script> \n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n{{ footer }} \n        ]]></search>\n        <add position=\"before\"><![CDATA[\n  <script type=\"text/javascript\"><!--\n$(\'.summernote\').on(\'click\', function () {\n	if ($(this).hasClass(\'active\')) {\n		$(\'#input-short-description\' + $(this).data(\'language\')).summernote(\'destroy\');\n	} else {\n		$(\'#input-short-description\' + $(this).data(\'language\')).summernote({\n			focus: true,\n			lang: \'{{ summernote }}\'\n		});\n	}\n})\n\n$(document).ready(function() {\n	$(\'[name*=\\\'[short_description]\\\']\').each(function() {\n		if ($(this).val()) {\n            $(this).parent().prev().children(\'.summernote\').trigger(\'click\');\n		}\n	});\n});\n//--></script>\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/view/template/catalog/category_list.twig\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n      <div class=\"pull-right\"><a href=\"{{ add }}\" data-toggle=\"tooltip\" title=\"{{ button_add }}\" class=\"btn btn-primary\"><i class=\"fa fa-plus\"></i></a> <a href=\"{{ repair }}\" data-toggle=\"tooltip\" title=\"{{ button_rebuild }}\" class=\"btn btn-default\"><i class=\"fa fa-refresh\"></i></a>\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n      <div class=\"pull-right\">\n        <div class=\"btn-group\">\n          {% if filter_information is not null %}\n          <span class=\"btn btn-default\" data-toggle=\"tooltip\" title=\"{{ filter_information ? text_type_information : text_type_product }}\">\n          {{ filter_information ? \'<i class=\"fa fa-file-text-o fa-fw\"></i>\' : \'<i class=\"fa fa-shopping-cart fa-fw\"></i>\' }} \n          {% else %}\n          <span class=\"btn btn-default\" data-toggle=\"tooltip\" title=\"{{ text_type_all }}\">\n            <i class=\"fa fa-list fa-fw\"></i>\n          {% endif %}\n          </span>\n          <button type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">{{ button_type_category }} <span class=\"caret\"></span></button>\n          <ul class=\"dropdown-menu dropdown-menu-right\">\n            <li><a href=\"{{ type_all }}\"><i class=\"fa fa-list fa-fw\"></i> {{ text_type_all }}</a></li>\n            <li class=\"divider\"></li>\n            <li><a href=\"{{ type_product }}\"><i class=\"fa fa-shopping-cart fa-fw\"></i> {{ text_type_product }}</a></li>\n            <li><a href=\"{{ type_information }}\"><i class=\"fa fa-file-text-o fa-fw\"></i> {{ text_type_information }}</a></li>\n          </ul>\n        </div>\n        <a href=\"{{ add }}\" data-toggle=\"tooltip\" title=\"{{ button_add }}\" class=\"btn btn-primary\"><i class=\"fa fa-plus\"></i></a>\n        <a href=\"{{ repair }}\" data-toggle=\"tooltip\" title=\"{{ button_rebuild }}\" class=\"btn btn-default\"><i class=\"fa fa-refresh\"></i></a>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                  <td class=\"text-left\">{% if sort %}\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n                  <td class=\"text-left\">{% if sort == \'name\' %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                  <td class=\"text-right\">{% if sort == \'sort_order\' %}\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n                  <td class=\"text-right\">{% if sort == \'information\' %}\n                    <a href=\"{{ sort_information }}\" class=\"{{ order|lower }}\">{{ column_type }}</a>\n                    {% else %}\n                    <a href=\"{{ sort_information }}\">{{ column_type }}</a>\n                    {% endif %}</td>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                  <td class=\"text-right\">{{ category.sort_order }}</td>\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n                  <td class=\"text-right\">{{ category.information ? text_type_information : text_type_product }}</td>\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Information -->\n  <file path=\"admin/controller/catalog/information.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n		if (isset($this->request->post[\'bottom\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (isset($this->request->get[\'information_id\'])) {\n			$data[\'information_id\'] = $this->request->get[\'information_id\'];\n		}\n\n		if (isset($this->request->post[\'date_available\'])) {\n			$data[\'date_available\'] = $this->request->post[\'date_available\'];\n		} elseif (!empty($information_info)) {\n			$data[\'date_available\'] = $information_info[\'date_available\'];\n		} else {\n			$data[\'date_available\'] = date(\'Y-m-d H:i:s\');\n		}\n\n		if (isset($this->request->post[\'date_end\'])) {\n			$data[\'date_end\'] = $this->request->post[\'date_end\'];\n		} elseif (!empty($information_info)) {\n			$data[\'date_end\'] = $information_info[\'date_end\'];\n		} else {\n			$data[\'date_end\'] = \'2100-01-01 00:00:00\';\n		}\n\n		if (isset($this->request->post[\'date_added\'])) {\n			$data[\'date_added\'] = $this->request->post[\'date_added\'];\n		} elseif (!empty($information_info)) {\n			$data[\'date_added\'] = $information_info[\'date_added\'];\n		} else {\n			$data[\'date_added\'] = date(\'Y-m-d H:i:s\');\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		if (isset($this->request->post[\'information_seo_url\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		// User\n		$this->load->model(\'user/user\');\n		$this->load->model(\'user/user_group\');\n\n		$user_groups = $this->model_user_user_group->getUserGroups();\n\n		foreach ($user_groups as $group) {\n			$users = array();\n\n			$users = $this->model_user_user->getUsersByGroup($group[\'user_group_id\']);\n\n			if ($users) {\n				$data[\'user_groups\'][] = array(\n					\'name\'  => $group[\'name\'],\n					\'users\' => $users\n				);\n			}\n		}\n\n		if (isset($this->request->post[\'user_id\'])) {\n			$data[\'user_id\'] = $this->request->post[\'user_id\'];\n		} elseif (!empty($information_info)) {\n			$data[\'user_id\'] = $this->model_catalog_information->getInformationUser($this->request->get[\'information_id\']);\n		} else {\n			$data[\'user_id\'] = $this->user->getId();\n		}\n\n		// Manufacturer\n		$this->load->model(\'catalog/manufacturer\');\n\n		if (isset($this->request->post[\'manufacturer_id\'])) {\n			$data[\'manufacturer_id\'] = $this->request->post[\'manufacturer_id\'];\n		} elseif (!empty($information_info)) {\n			$data[\'manufacturer_id\'] = $information_info[\'manufacturer_id\'];\n		} else {\n			$data[\'manufacturer_id\'] = 0;\n		}\n\n		if (isset($this->request->post[\'manufacturer\'])) {\n			$data[\'manufacturer\'] = $this->request->post[\'manufacturer\'];\n		} elseif (!empty($information_info)) {\n			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($information_info[\'manufacturer_id\']);\n\n			if ($manufacturer_info) {\n				$data[\'manufacturer\'] = $manufacturer_info[\'name\'];\n			} else {\n				$data[\'manufacturer\'] = \'\';\n			}\n		} else {\n			$data[\'manufacturer\'] = \'\';\n		}\n\n		// Categories\n		$this->load->model(\'catalog/category\');\n\n		if (isset($this->request->post[\'information_category\'])) {\n			$categories = $this->request->post[\'information_category\'];\n		} elseif (isset($this->request->get[\'information_id\'])) {\n			$categories = $this->model_catalog_information->getInformationCategories($this->request->get[\'information_id\']);\n		} else {\n			$categories = array();\n		}\n\n		$data[\'information_categories\'] = array();\n\n		foreach ($categories as $category_id) {\n			$category_info = $this->model_catalog_category->getCategory($category_id);\n\n			if ($category_info) {\n				$data[\'information_categories\'][] = array(\n					\'category_id\' => $category_info[\'category_id\'],\n					\'name\'        => ($category_info[\'path\']) ? $category_info[\'path\'] . \' &gt; \' . $category_info[\'name\'] : $category_info[\'name\']\n				);\n			}\n		}\n\n		if (isset($this->request->post[\'main_category\'])) {\n			$data[\'main_category\'] = $this->request->post[\'main_category\'];\n		} elseif (isset($this->request->get[\'information_id\']) && $categories) {\n			$data[\'main_category\'] = $this->model_catalog_information->getMainCategory($this->request->get[\'information_id\']);\n		} else {\n			$data[\'main_category\'] = \'\';\n		}\n\n		// Filters\n		$this->load->model(\'catalog/filter\');\n\n		if (isset($this->request->post[\'information_filter\'])) {\n			$filters = $this->request->post[\'information_filter\'];\n		} elseif (isset($this->request->get[\'information_id\'])) {\n			$filters = $this->model_catalog_information->getInformationFilters($this->request->get[\'information_id\']);\n		} else {\n			$filters = array();\n		}\n\n		$data[\'information_filters\'] = array();\n\n		foreach ($filters as $filter_id) {\n			$filter_info = $this->model_catalog_filter->getFilter($filter_id);\n\n			if ($filter_info) {\n				$data[\'information_filters\'][] = array(\n					\'filter_id\' => $filter_info[\'filter_id\'],\n					\'name\'      => $filter_info[\'group\'] . \' &gt; \' . $filter_info[\'name\']\n				);\n			}\n		}\n\n		// Attributes\n		$this->load->model(\'catalog/attribute\');\n\n		if (isset($this->request->post[\'information_attribute\'])) {\n			$information_attributes = $this->request->post[\'information_attribute\'];\n		} elseif (isset($this->request->get[\'information_id\'])) {\n			$information_attributes = $this->model_catalog_information->getInformationAttributes($this->request->get[\'information_id\']);\n		} else {\n			$information_attributes = array();\n		}\n\n		$data[\'information_attributes\'] = array();\n\n		foreach ($information_attributes as $information_attribute) {\n			$attribute_info = $this->model_catalog_attribute->getAttribute($information_attribute[\'attribute_id\']);\n\n			if ($attribute_info) {\n				$data[\'information_attributes\'][] = array(\n					\'attribute_id\'                  => $information_attribute[\'attribute_id\'],\n					\'name\'                          => $attribute_info[\'name\'],\n					\'information_attribute_description\' => $information_attribute[\'information_attribute_description\']\n				);\n			}\n		}\n\n		// Image\n		if (isset($this->request->post[\'image\'])) {\n			$data[\'image\'] = $this->request->post[\'image\'];\n		} elseif (!empty($information_info)) {\n			$data[\'image\'] = $information_info[\'image\'];\n		} else {\n			$data[\'image\'] = \'\';\n		}\n\n		$this->load->model(\'tool/image\');\n\n		if (isset($this->request->post[\'image\']) && is_file(DIR_IMAGE . $this->request->post[\'image\'])) {\n			$data[\'thumb\'] = $this->model_tool_image->resize($this->request->post[\'image\'], 100, 100);\n		} elseif (!empty($information_info) && is_file(DIR_IMAGE . $information_info[\'image\'])) {\n			$data[\'thumb\'] = $this->model_tool_image->resize($information_info[\'image\'], 100, 100);\n		} else {\n			$data[\'thumb\'] = $this->model_tool_image->resize(\'no_image.png\', 100, 100);\n		}\n\n		$data[\'placeholder\'] = $this->model_tool_image->resize(\'no_image.png\', 100, 100);\n\n		// Images\n		if (isset($this->request->post[\'information_image\'])) {\n			$information_images = $this->request->post[\'information_image\'];\n		} elseif (isset($this->request->get[\'information_id\'])) {\n			$information_images = $this->model_catalog_information->getInformationImages($this->request->get[\'information_id\']);\n		} else {\n			$information_images = array();\n		}\n\n		$data[\'information_images\'] = array();\n\n		foreach ($information_images as $information_image) {\n			if (is_file(DIR_IMAGE . $information_image[\'image\'])) {\n				$image = $information_image[\'image\'];\n				$thumb = $information_image[\'image\'];\n			} else {\n				$image = \'\';\n				$thumb = \'no_image.png\';\n			}\n\n			$data[\'information_images\'][] = array(\n				\'image\'      => $image,\n				\'thumb\'      => $this->model_tool_image->resize($thumb, 100, 100),\n				\'sort_order\' => $information_image[\'sort_order\']\n			);\n		}\n\n		// Information Related\n		if (isset($this->request->post[\'information_related\'])) {\n			$informations = $this->request->post[\'information_related\'];\n		} elseif (isset($this->request->get[\'information_id\'])) {\n			$informations = $this->model_catalog_information->getInformationRelated($this->request->get[\'information_id\']);\n		} else {\n			$informations = array();\n		}\n\n		$data[\'information_relateds\'] = array();\n\n		foreach ($informations as $information_related) {\n			$related_info = $this->model_catalog_information->getInformation($information_related[\'information_id\']);\n\n			if ($related_info) {\n				$data[\'information_relateds\'][] = array(\n					\'information_id\' => $related_info[\'information_id\'],\n					\'title\'          => $related_info[\'title\'],\n                    \'route\'          => $information_related[\'route\']\n				);\n			}\n		}\n        \n		// Product Related\n		if (isset($this->request->post[\'product_related\'])) {\n			$products = $this->request->post[\'product_related\'];\n		} elseif (isset($this->request->get[\'information_id\'])) {\n			$products = $this->model_catalog_information->getProductRelated($this->request->get[\'information_id\']);\n		} else {\n			$products = array();\n		}\n\n		$data[\'product_relateds\'] = array();\n\n        $this->load->model(\'catalog/product\');\n\n		foreach ($products as $product_related) {\n			$related_info = $this->model_catalog_product->getProduct($product_related[\'product_id\']);\n\n			if ($related_info) {\n				$data[\'product_relateds\'][] = array(\n					\'product_id\' => $related_info[\'product_id\'],\n					\'name\'       => $related_info[\'name\'],\n                    \'route\'      => $product_related[\'route\']\n				);\n			}\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	protected function validateForm() {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n	protected function validateCopy() {\n		if (!$this->user->hasPermission(\'modify\', \'catalog/information\')) {\n			$this->error[\'warning\'] = $this->language->get(\'error_permission\');\n		}\n\n		return !$this->error;\n	}\n\n	public function autocomplete() {\n		$json = array();\n\n		if (isset($this->request->get[\'filter_name\'])) {\n			$this->load->model(\'catalog/information\');\n\n			if (isset($this->request->get[\'filter_name\'])) {\n				$filter_name = $this->request->get[\'filter_name\'];\n			} else {\n				$filter_name = \'\';\n			}\n\n			if (isset($this->request->get[\'limit\'])) {\n				$limit = $this->request->get[\'limit\'];\n			} else {\n				$limit = 5;\n			}\n\n			$filter_data = array(\n				\'filter_name\'  => $filter_name,\n				\'start\'        => 0,\n				\'limit\'        => $limit\n			);\n\n			$results = $this->model_catalog_information->getInformations($filter_data);\n\n			foreach ($results as $result) {\n				if (isset($this->request->get[\'information_id\']) && $this->request->get[\'information_id\'] == $result[\'information_id\']) {\n					continue;\n				}\n        \n				$json[] = array(\n					\'information_id\' => $result[\'information_id\'],\n					\'title\'          => strip_tags(html_entity_decode($result[\'title\'], ENT_QUOTES, \'UTF-8\'))\n				);	\n			}\n		}\n\n		$this->response->addHeader(\'Content-Type: application/json\');\n		$this->response->setOutput(json_encode($json));\n	}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	protected function getList() {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n	public function copy() {\n		$this->load->language(\'catalog/information\');\n\n		$this->document->setTitle($this->language->get(\'heading_title\'));\n\n		$this->load->model(\'catalog/information\');\n\n		if (isset($this->request->post[\'selected\']) && $this->validateCopy()) {\n			foreach ($this->request->post[\'selected\'] as $information_id) {\n				$this->model_catalog_information->copyInformation($information_id);\n			}\n\n			$this->session->data[\'success\'] = $this->language->get(\'text_success\');\n\n			$url = \'\';\n\n			if (isset($this->request->get[\'sort\'])) {\n				$url .= \'&sort=\' . $this->request->get[\'sort\'];\n			}\n\n			if (isset($this->request->get[\'order\'])) {\n				$url .= \'&order=\' . $this->request->get[\'order\'];\n			}\n\n			if (isset($this->request->get[\'page\'])) {\n				$url .= \'&page=\' . $this->request->get[\'page\'];\n			}\n\n			$this->response->redirect($this->url->link(\'catalog/information\', \'user_token=\' . $this->session->data[\'user_token\'] . $url, true));\n		}\n\n		$this->getList();\n	}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	protected function getList() {\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		if (isset($this->request->get[\'filter_name\'])) {\n			$filter_name = $this->request->get[\'filter_name\'];\n		} else {\n			$filter_name = \'\';\n		}\n\n		if (isset($this->request->get[\'filter_viewed\'])) {\n			$filter_viewed = $this->request->get[\'filter_viewed\'];\n		} else {\n			$filter_viewed = \'\';\n		}\n\n		if (isset($this->request->get[\'filter_status\'])) {\n			$filter_status = $this->request->get[\'filter_status\'];\n		} else {\n			$filter_status = \'\';\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$url = \'\';\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		if (isset($this->request->get[\'filter_name\'])) {\n			$url .= \'&filter_name=\' . urlencode(html_entity_decode($this->request->get[\'filter_name\'], ENT_QUOTES, \'UTF-8\'));\n		}\n\n		if (isset($this->request->get[\'filter_viewed\'])) {\n			$url .= \'&filter_viewed=\' . urlencode(html_entity_decode($this->request->get[\'filter_viewed\'], ENT_QUOTES, \'UTF-8\'));\n		}\n\n		if (isset($this->request->get[\'filter_status\'])) {\n			$url .= \'&filter_status=\' . $this->request->get[\'filter_status\'];\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$data[\'delete\'] = $this->url->link(\'catalog/information/delete\', \'user_token=\' . $this->session->data[\'user_token\'] . $url, true);\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		$data[\'copy\'] = $this->url->link(\'catalog/information/copy\', \'user_token=\' . $this->session->data[\'user_token\'] . $url, true);\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			\'start\' => ($page - 1) * $this->config->get(\'config_limit_admin\'),\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n			\'filter_name\'	  => $filter_name,\n			\'filter_viewed\'	  => $filter_viewed,\n			\'filter_status\'   => $filter_status,\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$information_total = $this->model_catalog_information->getTotalInformations();\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		$information_total = $this->model_catalog_information->getTotalInformations($filter_data);\n\n		$this->load->model(\'tool/image\');\n\n		$data[\'user_token\'] = $this->session->data[\'user_token\'];\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$data[\'informations\'][] = array(\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n			if (is_file(DIR_IMAGE . $result[\'image\'])) {\n				$image = $this->model_tool_image->resize($result[\'image\'], 40, 40);\n			} else {\n				$image = $this->model_tool_image->resize(\'no_image.png\', 40, 40);\n			}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$data[\'informations\'][] = array(\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n				\'image\'          => $image,\n                \'status\'         => $result[\'status\'] ? $this->language->get(\'text_enabled\') : $this->language->get(\'text_disabled\'),\n				\'viewed\'         => $result[\'viewed\'],\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$data[\'sort_sort_order\'] = $this->url->link(\'catalog/information\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&sort=i.sort_order\' . $url, true);\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		$data[\'sort_viewed\'] = $this->url->link(\'catalog/information\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&sort=i.viewed\' . $url, true);\n		$data[\'sort_status\'] = $this->url->link(\'catalog/information\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&sort=i.status\' . $url, true);\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$data[\'sort\'] = $sort;\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		$data[\'filter_name\'] = $filter_name;\n		$data[\'filter_viewed\'] = $filter_viewed;\n		$data[\'filter_status\'] = $filter_status;\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/model/catalog/information.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[description = \'\" . $this->db->escape($value[\'description\']) . \"\']]></search>\n        <add position=\"replace\"><![CDATA[header = \'\" . $this->db->escape($value[\'header\']) . \"\', short_description = \'\" . $this->db->escape($value[\'short_description\']) . \"\', description = \'\" . $this->db->escape($value[\'description\']) . \"\', tag = \'\" . $this->db->escape($value[\'tag\']) . \"\']]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				\'id.title\',\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n				\'i.viewed\',\n				\'i.status\',\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				\'title\'            => $result[\'title\'],\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n				\'header\'            => $result[\'header\'],\n				\'short_description\' => $result[\'short_description\'],\n				\'tag\'               => $result[\'tag\'],\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"0\"><![CDATA[status = \'\" . (int)$data[\'status\'] . \"\']]></search>\n        <add position=\"replace\"><![CDATA[manufacturer_id = \'\" . (int)$data[\'manufacturer_id\'] . \"\', date_available = \'\" . $this->db->escape($data[\'date_available\']) . \"\', date_end = \'\" . $this->db->escape($data[\'date_end\']) . \"\', date_added = NOW(), date_modified = NOW(), status = \'\" . (int)$data[\'status\'] . \"\']]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"1\"><![CDATA[status = \'\" . (int)$data[\'status\'] . \"\']]></search>\n        <add position=\"replace\"><![CDATA[manufacturer_id = \'\" . (int)$data[\'manufacturer_id\'] . \"\', date_available = \'\" . $this->db->escape($data[\'date_available\']) . \"\', date_end = \'\" . $this->db->escape($data[\'date_end\']) . \"\', date_added = \'\" . $this->db->escape($data[\'date_added\']) . \"\',  date_modified = NOW(), status = \'\" . (int)$data[\'status\'] . \"\']]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		// SEO URL\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (!empty($data[\'user_id\'])) {\n			$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_to_user SET information_id = \'\" . (int)$information_id . \"\', user_id = \'\" . (int)$data[\'user_id\'] . \"\'\");\n		}\n\n		if (isset($data[\'information_attribute\'])) {\n			foreach ($data[\'information_attribute\'] as $information_attribute) {\n				if ($information_attribute[\'attribute_id\']) {\n					// Removes duplicates\n					$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_attribute WHERE information_id = \'\" . (int)$information_id . \"\' AND attribute_id = \'\" . (int)$information_attribute[\'attribute_id\'] . \"\'\");\n\n					foreach ($information_attribute[\'information_attribute_description\'] as $language_id => $information_attribute_description) {\n						$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_attribute WHERE information_id = \'\" . (int)$information_id . \"\' AND attribute_id = \'\" . (int)$information_attribute[\'attribute_id\'] . \"\' AND language_id = \'\" . (int)$language_id . \"\'\");\n\n						$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_attribute SET information_id = \'\" . (int)$information_id . \"\', attribute_id = \'\" . (int)$information_attribute[\'attribute_id\'] . \"\', language_id = \'\" . (int)$language_id . \"\', text = \'\" .  $this->db->escape($information_attribute_description[\'text\']) . \"\'\");\n					}\n				}\n			}\n		}\n\n		if (isset($data[\'image\'])) {\n			$this->db->query(\"UPDATE \" . DB_PREFIX . \"information SET image = \'\" . $this->db->escape($data[\'image\']) . \"\' WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		}\n\n		if (isset($data[\'information_image\'])) {\n			foreach ($data[\'information_image\'] as $information_image) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_image SET information_id = \'\" . (int)$information_id . \"\', image = \'\" . $this->db->escape($information_image[\'image\']) . \"\', sort_order = \'\" . (int)$information_image[\'sort_order\'] . \"\'\");\n			}\n		}\n\n		if (isset($data[\'information_category\'])) {\n			foreach ($data[\'information_category\'] as $category_id) {\n				if (!empty($data[\'main_category\']) && $data[\'main_category\'] == (int)$category_id) {\n					$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_to_category SET information_id = \'\" . (int)$information_id . \"\', category_id = \'\" . (int)$category_id . \"\', main_category = \'1\'\");\n				} else {\n					$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_to_category SET information_id = \'\" . (int)$information_id . \"\', category_id = \'\" . (int)$category_id . \"\'\");\n				}\n			}\n		}\n\n		if (isset($data[\'information_filter\'])) {\n			foreach ($data[\'information_filter\'] as $filter_id) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_filter SET information_id = \'\" . (int)$information_id . \"\', filter_id = \'\" . (int)$filter_id . \"\'\");\n			}\n		}\n\n		if (isset($data[\'information_related\'])) {\n			foreach ($data[\'information_related\'] as $information_related) {\n				$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_related WHERE information_id = \'\" . (int)$information_id . \"\' AND related_id = \'\" . (int)$information_related[\'information_id\'] . \"\'\");\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_related SET information_id = \'\" . (int)$information_id . \"\', related_id = \'\" . (int)$information_related[\'information_id\'] . \"\', route = \'\" . (int)$information_related[\'route\'] . \"\'\");\n				$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_related WHERE information_id = \'\" . (int)$information_related[\'information_id\'] . \"\' AND related_id = \'\" . (int)$information_id . \"\'\");\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_related SET information_id = \'\" . (int)$information_related[\'information_id\'] . \"\', related_id = \'\" . (int)$information_id . \"\', route = \'\" . (int)$information_related[\'route\'] * -1 . \"\'\");\n			}\n		}\n\n		if (isset($data[\'product_related\'])) {\n			$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_product_related WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n			foreach ($data[\'product_related\'] as $product_related) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_product_related SET information_id = \'\" . (int)$information_id . \"\', product_id = \'\" . (int)$product_related[\'product_id\'] . \"\', route = \'\" . (int)$product_related[\'route\'] . \"\'\");\n			}\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"seo_url WHERE query = \'information_id=\" . (int)$information_id . \"\'\");\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_to_user WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		if (!empty($data[\'user_id\'])) {\n			$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_to_user SET information_id = \'\" . (int)$information_id . \"\', user_id = \'\" . (int)$data[\'user_id\'] . \"\'\");\n		}\n\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_attribute WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		if (!empty($data[\'information_attribute\'])) {\n			foreach ($data[\'information_attribute\'] as $information_attribute) {\n				if ($information_attribute[\'attribute_id\']) {\n					// Removes duplicates\n					$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_attribute WHERE information_id = \'\" . (int)$information_id . \"\' AND attribute_id = \'\" . (int)$information_attribute[\'attribute_id\'] . \"\'\");\n\n					foreach ($information_attribute[\'information_attribute_description\'] as $language_id => $information_attribute_description) {\n						$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_attribute SET information_id = \'\" . (int)$information_id . \"\', attribute_id = \'\" . (int)$information_attribute[\'attribute_id\'] . \"\', language_id = \'\" . (int)$language_id . \"\', text = \'\" .  $this->db->escape($information_attribute_description[\'text\']) . \"\'\");\n					}\n				}\n			}\n		}\n\n		if (isset($data[\'image\'])) {\n			$this->db->query(\"UPDATE \" . DB_PREFIX . \"information SET image = \'\" . $this->db->escape($data[\'image\']) . \"\' WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		}\n\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_image WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		if (isset($data[\'information_image\'])) {\n			foreach ($data[\'information_image\'] as $information_image) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_image SET information_id = \'\" . (int)$information_id . \"\', image = \'\" . $this->db->escape($information_image[\'image\']) . \"\', sort_order = \'\" . (int)$information_image[\'sort_order\'] . \"\'\");\n			}\n		}\n\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_to_category WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		if (isset($data[\'information_category\'])) {\n			foreach ($data[\'information_category\'] as $category_id) {\n				if (!empty($data[\'main_category\']) && $data[\'main_category\'] == (int)$category_id) {\n					$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_to_category SET information_id = \'\" . (int)$information_id . \"\', category_id = \'\" . (int)$category_id . \"\', main_category = \'1\'\");\n				} else {\n					$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_to_category SET information_id = \'\" . (int)$information_id . \"\', category_id = \'\" . (int)$category_id . \"\'\");\n				}\n			}\n		}\n\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_filter WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		if (isset($data[\'information_filter\'])) {\n			foreach ($data[\'information_filter\'] as $filter_id) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_filter SET information_id = \'\" . (int)$information_id . \"\', filter_id = \'\" . (int)$filter_id . \"\'\");\n			}\n		}\n\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_related WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_related WHERE related_id = \'\" . (int)$information_id . \"\'\");\n\n		if (isset($data[\'information_related\'])) {\n			foreach ($data[\'information_related\'] as $information_related) {\n				$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_related WHERE information_id = \'\" . (int)$information_id . \"\' AND related_id = \'\" . (int)$information_related[\'information_id\'] . \"\'\");\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_related SET information_id = \'\" . (int)$information_id . \"\', related_id = \'\" . (int)$information_related[\'information_id\'] . \"\', route = \'\" . (int)$information_related[\'route\'] . \"\'\");\n				$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_related WHERE information_id = \'\" . (int)$information_related[\'information_id\'] . \"\' AND related_id = \'\" . (int)$information_id . \"\'\");\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_related SET information_id = \'\" . (int)$information_related[\'information_id\'] . \"\', related_id = \'\" . (int)$information_id . \"\', route = \'\" . (int)$information_related[\'route\'] * -1 . \"\'\");\n			}\n		}\n\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_product_related WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		if (isset($data[\'product_related\'])) {\n			foreach ($data[\'product_related\'] as $product_related) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_product_related SET information_id = \'\" . (int)$information_id . \"\', product_id = \'\" . (int)$product_related[\'product_id\'] . \"\', route = \'\" . (int)$product_related[\'route\'] . \"\'\");\n			}\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\" . DB_PREFIX . \"information WHERE information_id = \'\" . (int)$information_id . \"\']]></search>\n        <add position=\"replace\"><![CDATA[\" . DB_PREFIX . \"information i LEFT JOIN \" . DB_PREFIX . \"information_description id ON (i.information_id = id.information_id) WHERE i.information_id = \'\" . (int)$information_id . \"\' AND id.language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\']]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	public function deleteInformation($information_id) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n	public function copyInformation($information_id) {\n		$query = $this->db->query(\"SELECT DISTINCT * FROM \" . DB_PREFIX . \"information WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		if ($query->num_rows) {\n			$data = $query->row;\n\n			$data[\'viewed\'] = \'0\';\n			$data[\'keyword\'] = \'\';\n			$data[\'status\'] = \'0\';\n\n			$data[\'information_attribute\'] = $this->getInformationAttributes($information_id);\n			$data[\'information_description\'] = $this->getInformationDescriptions($information_id);\n			$data[\'information_filter\'] = $this->getInformationFilters($information_id);\n			$data[\'information_image\'] = $this->getInformationImages($information_id);\n			$data[\'information_related\'] = $this->getInformationRelated($information_id);\n			$data[\'product_related\'] = $this->getProductRelated($information_id);\n			$data[\'information_category\'] = $this->getInformationCategories($information_id);\n			$data[\'main_category\'] = $this->getMainCategory($information_id);\n			$data[\'information_layout\'] = $this->getInformationLayouts($information_id);\n			$data[\'information_store\'] = $this->getInformationStores($information_id);\n			$data[\'user_id\'] = $this->getInformationUser($information_id);\n\n			$this->addInformation($data);\n		}\n	}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"seo_url` WHERE query = \'information_id=\" . (int)$information_id . \"\'\");\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"information_attribute` WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"information_filter` WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"information_image` WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"information_related` WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"information_related` WHERE related_id = \'\" . (int)$information_id . \"\'\");\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"information_product_related` WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"information_to_category` WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"information_to_user` WHERE information_id = \'\" . (int)$information_id . \"\'\");\n		$this->db->query(\"DELETE FROM `\" . DB_PREFIX . \"review` WHERE information_id = \'\" . (int)$information_id . \"\'\");\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	public function getTotalInformations() {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n	public function getInformationUser($information_id) {\n		$query = $this->db->query(\"SELECT user_id FROM \" . DB_PREFIX . \"information_to_user WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		return $query->row[\'user_id\'];\n	}\n\n	public function getInformationsByCategoryId($category_id) {\n		$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"information i LEFT JOIN \" . DB_PREFIX . \"information_description id ON (i.information_id = id.information_id) LEFT JOIN \" . DB_PREFIX . \"information_to_category i2c ON (i.information_id = i2c.information_id) WHERE id.language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\' AND i2c.category_id = \'\" . (int)$category_id . \"\' ORDER BY id.title ASC\");\n\n		return $query->rows;\n	}\n\n	public function getInformationCategories($information_id) {\n		$information_category_data = array();\n\n		$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"information_to_category WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		foreach ($query->rows as $result) {\n			$information_category_data[] = $result[\'category_id\'];\n		}\n\n		return $information_category_data;\n	}\n\n	public function getMainCategory($information_id) {\n		$query = $this->db->query(\"SELECT category_id FROM \" . DB_PREFIX . \"information_to_category WHERE information_id = \'\" . (int)$information_id . \"\' AND main_category = \'1\'\");\n\n		if ($query->row) {\n			return $query->row[\'category_id\'];\n		} else {\n			return \'\';\n		}\n	}\n\n	public function getInformationFilters($information_id) {\n		$information_filter_data = array();\n\n		$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"information_filter WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		foreach ($query->rows as $result) {\n			$information_filter_data[] = $result[\'filter_id\'];\n		}\n\n		return $information_filter_data;\n	}\n\n	public function getInformationAttributes($information_id) {\n		$information_attribute_data = array();\n\n		$information_attribute_query = $this->db->query(\"SELECT attribute_id FROM \" . DB_PREFIX . \"information_attribute WHERE information_id = \'\" . (int)$information_id . \"\' GROUP BY attribute_id\");\n\n		foreach ($information_attribute_query->rows as $information_attribute) {\n			$information_attribute_description_data = array();\n\n			$information_attribute_description_query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"information_attribute WHERE information_id = \'\" . (int)$information_id . \"\' AND attribute_id = \'\" . (int)$information_attribute[\'attribute_id\'] . \"\'\");\n\n			foreach ($information_attribute_description_query->rows as $information_attribute_description) {\n				$information_attribute_description_data[$information_attribute_description[\'language_id\']] = array(\'text\' => $information_attribute_description[\'text\']);\n			}\n\n			$information_attribute_data[] = array(\n				\'attribute_id\'                  => $information_attribute[\'attribute_id\'],\n				\'information_attribute_description\' => $information_attribute_description_data\n			);\n		}\n\n		return $information_attribute_data;\n	}\n\n	public function getInformationImages($information_id) {\n		$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"information_image WHERE information_id = \'\" . (int)$information_id . \"\' ORDER BY sort_order ASC\");\n\n		return $query->rows;\n	}\n	\n	public function getInformationRelated($information_id) {\n		$information_related_data = array();\n\n		$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"information_related WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		foreach ($query->rows as $result) {\n			$information_related_data[] = array(\n				\'information_id\' => $result[\'related_id\'],\n				\'route\'          => $result[\'route\']\n            );\n		}\n\n		return $information_related_data;\n	}\n\n	public function getProductRelated($information_id) {\n		$product_related_data = array();\n\n		$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"information_product_related WHERE information_id = \'\" . (int)$information_id . \"\'\");\n\n		foreach ($query->rows as $result) {\n			$product_related_data[] = array(\n				\'product_id\' => $result[\'product_id\'],\n				\'route\'      => $result[\'route\']\n            );\n		}\n\n		return $product_related_data;\n	}\n\n	public function getTotalInformationsByManufacturerId($manufacturer_id) {\n		$query = $this->db->query(\"SELECT COUNT(*) AS total FROM \" . DB_PREFIX . \"information WHERE manufacturer_id = \'\" . (int)$manufacturer_id . \"\'\");\n\n		return $query->row[\'total\'];\n	}\n\n	public function getTotalInformationsByAttributeId($attribute_id) {\n		$query = $this->db->query(\"SELECT COUNT(*) AS total FROM \" . DB_PREFIX . \"information_attribute WHERE attribute_id = \'\" . (int)$attribute_id . \"\'\");\n\n		return $query->row[\'total\'];\n	}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$sort_data = array(\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (!empty($data[\'filter_name\'])) {\n			$sql .= \" AND id.title LIKE \'\" . $this->db->escape($data[\'filter_name\']) . \"%\'\";\n		}\n\n		if (!empty($data[\'filter_viewed\'])) {\n			$sql .= \" AND i.viewed LIKE \'\" . $this->db->escape($data[\'filter_viewed\']) . \"%\'\";\n		}\n\n		if (isset($data[\'filter_status\']) && $data[\'filter_status\'] !== \'\') {\n			$sql .= \" AND i.status = \'\" . (int)$data[\'filter_status\'] . \"\'\";\n		}\n\n		$sql .= \" GROUP BY i.information_id\";\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	public function getTotalInformations() {\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n	public function getTotalInformations($data = array()) {\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$query = $this->db->query(\"SELECT COUNT(*) AS total FROM \" . DB_PREFIX . \"information\");\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		$sql = \"SELECT COUNT(DISTINCT i.information_id) AS total FROM \" . DB_PREFIX . \"information i LEFT JOIN \" . DB_PREFIX . \"information_description id ON (i.information_id = id.information_id)\";\n\n		$sql .= \" WHERE id.language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\'\";\n\n		if (!empty($data[\'filter_name\'])) {\n			$sql .= \" AND id.title LIKE \'\" . $this->db->escape($data[\'filter_name\']) . \"%\'\";\n		}\n\n		if (isset($data[\'filter_viewed\']) && $data[\'filter_viewed\'] !== \'\') {\n			$sql .= \" AND i.viewed = \'\" . (int)$data[\'filter_viewed\'] . \"\'\";\n		}\n\n		if (isset($data[\'filter_status\']) && $data[\'filter_status\'] !== \'\') {\n			$sql .= \" AND i.status = \'\" . (int)$data[\'filter_status\'] . \"\'\";\n		}\n\n		$query = $this->db->query($sql);\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/view/template/catalog/information_form.twig\">\n      <operation error=\"skip\">\n        <search index=\"1\"><![CDATA[\n                  <div class=\"form-group required\">\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n                  <div class=\"form-group\">\n                    <label class=\"col-sm-2 control-label\" for=\"input-header{{ language.language_id }}\"><span data-toggle=\"tooltip\" title=\"{{ help_header }}\">{{ entry_header }}</span></label>\n                    <div class=\"col-sm-10\">\n                      <input type=\"text\" name=\"information_description[{{ language.language_id }}][header]\" value=\"{{ information_description[language.language_id] ? information_description[language.language_id].header }}\" placeholder=\"{{ entry_header }}\" id=\"input-header{{ language.language_id }}\" class=\"form-control\" />\n                    </div>\n                  </div>\n                  <div class=\"form-group\">\n                    <label class=\"col-sm-2 control-label\" for=\"input-short-description{{ language.language_id }}\">{{ entry_short_description }}<br /><button type=\"button\" class=\"btn btn-primary btn-xs summernote\" data-toggle=\"button\" aria-pressed=\"false\" autocomplete=\"off\" data-language=\"{{ language.language_id }}\">Summernote</button></label>\n                    <div class=\"col-sm-10\">\n                      <textarea name=\"information_description[{{ language.language_id }}][short_description]\" placeholder=\"{{ entry_short_description }}\" id=\"input-short-description{{ language.language_id }}\" class=\"form-control\">{{ information_description[language.language_id] ? information_description[language.language_id].short_description }}</textarea>\n                     </div>\n                  </div>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                      <textarea name=\"information_description[{{ language.language_id }}][meta_keyword]\" rows=\"5\" placeholder=\"{{ entry_meta_keyword }}\" id=\"input-meta-keyword{{ language.language_id }}\" class=\"form-control\">{{ information_description[language.language_id] ? information_description[language.language_id].meta_keyword }}</textarea>\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n                    </div>\n                  </div>\n                  <div class=\"form-group\">\n                    <label class=\"col-sm-2 control-label\" for=\"input-tag{{ language.language_id }}\"><span data-toggle=\"tooltip\" title=\"{{ help_tag }}\">{{ entry_tag }}</span></label>\n                    <div class=\"col-sm-10\">\n                      <input type=\"text\" name=\"information_description[{{ language.language_id }}][tag]\" value=\"{{ information_description[language.language_id] ? information_description[language.language_id].tag }}\" placeholder=\"{{ entry_tag }}\" id=\"input-tag{{ language.language_id }}\" class=\"form-control\" />\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n            <div class=\"tab-pane\" id=\"tab-data\">\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-date-added\">{{ entry_date_added }}</label>\n                <div class=\"col-sm-3\">\n                  <div class=\"input-group datetime\">\n                    <input type=\"text\" name=\"date_added\" value=\"{{ date_added }}\" placeholder=\"{{ entry_date_added }}\" data-date-format=\"YYYY-MM-DD HH:mm:ss\" id=\"input-date-added\" class=\"form-control\" />\n                    <span class=\"input-group-btn\">\n                    <button class=\"btn btn-default\" type=\"button\"><i class=\"fa fa-calendar\"></i></button>\n                    </span></div>\n                </div>\n              </div>\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-date-available\">{{ entry_date_available }}</label>\n                <div class=\"col-sm-3\">\n                  <div class=\"input-group datetime\">\n                    <input type=\"text\" name=\"date_available\" value=\"{{ date_available }}\" placeholder=\"{{ entry_date_available }}\" data-date-format=\"YYYY-MM-DD HH:mm:ss\" id=\"input-date-available\" class=\"form-control\" />\n                    <span class=\"input-group-btn\">\n                    <button class=\"btn btn-default\" type=\"button\"><i class=\"fa fa-calendar\"></i></button>\n                    </span></div>\n                </div>\n              </div>\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-date-end\">{{ entry_date_end }}</label>\n                <div class=\"col-sm-3\">\n                  <div class=\"input-group datetime\">\n                    <input type=\"text\" name=\"date_end\" value=\"{{ date_end }}\" placeholder=\"{{ entry_date_end }}\" data-date-format=\"YYYY-MM-DD HH:mm:ss\" id=\"input-date-end\" class=\"form-control\" />\n                    <span class=\"input-group-btn\">\n                    <button class=\"btn btn-default\" type=\"button\"><i class=\"fa fa-calendar\"></i></button>\n                    </span></div>\n                </div>\n              </div>\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-user\">{{ entry_user }}</label>\n                <div class=\"col-sm-10\">\n                  <select name=\"user_id\" id=\"input-user\" class=\"form-control\">\n                    {% for user_group in user_groups %}\n                    <optgroup label=\"{{ user_group.name }}\">\n                    {% for user in user_group.users %}\n                    {% if user.user_id == user_id %}\n                    <option value=\"{{ user.user_id }}\" selected=\"selected\">{{ user.username }}</option>\n                    {% else %}\n                    <option value=\"{{ user.user_id }}\">{{ user.username }}</option>\n                    {% endif %}\n                    {% endfor %}\n                    </optgroup>\n                    {% endfor %}\n                  </select>\n                </div>\n              </div>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n  <script type=\"text/javascript\" src=\"view/javascript/summernote/opencart.js\"></script> \n        ]]></search>\n        <add position=\"after\"><![CDATA[\n  <script type=\"text/javascript\"><!--\n// Manufacturer\n$(\'input[name=\\\'manufacturer\\\']\').autocomplete({\n	\'source\': function(request, response) {\n		$.ajax({\n			url: \'index.php?route=catalog/manufacturer/autocomplete&user_token={{ user_token }}&filter_name=\' +  encodeURIComponent(request),\n			dataType: \'json\',\n			success: function(json) {\n				json.unshift({\n					manufacturer_id: 0,\n					name: \'{{ text_none }}\'\n				});\n\n				response($.map(json, function(item) {\n					return {\n						label: item[\'name\'],\n						value: item[\'manufacturer_id\']\n					}\n				}));\n			}\n		});\n	},\n	\'select\': function(item) {\n		$(\'input[name=\\\'manufacturer\\\']\').val(item[\'label\']);\n		$(\'input[name=\\\'manufacturer_id\\\']\').val(item[\'value\']);\n	}\n});\n\n// Category\n$(\'input[name=\\\'category\\\']\').autocomplete({\n	\'source\': function(request, response) {\n		$.ajax({\n			url: \'index.php?route=catalog/category/autocomplete&user_token={{ user_token }}&filter_information=1&filter_name=\' +  encodeURIComponent(request),\n			dataType: \'json\',\n			success: function(json) {\n				response($.map(json, function(item) {\n					return {\n						label: item[\'name\'],\n						value: item[\'category_id\']\n					}\n				}));\n			}\n		});\n	},\n	\'select\': function(item) {\n		$(\'input[name=\\\'category\\\']\').val(\'\');\n\n		$(\'#information-category\' + item[\'value\']).remove();\n\n		$(\'#information-category\').append(\'<div id=\"information-category\' + item[\'value\'] + \'\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-circle-o\" data-toggle=\"tooltip\" title=\"{{ help_main_category_add }}\"></i> \' + item[\'label\'] + \'<input type=\"hidden\" name=\"information_category[]\" value=\"\' + item[\'value\'] + \'\" /></div>\');\n	}\n});\n\n$(\'#information-category\').delegate(\'.fa-minus-circle\', \'click\', function() {\n	$(this).parent().remove();\n});\n\n$(\'#information-category\').delegate(\'.fa-circle-o\', \'click\', function() {\n	$(\'#information-category div\').children(\'.fa-dot-circle-o\').toggleClass(\'fa-circle-o fa-dot-circle-o\');\n    $(\'#information-category div\').removeClass(\'text-success\');\n    $(this).toggleClass(\'fa-circle-o fa-dot-circle-o\');\n    $(this).parent().addClass(\'text-success\');\n    $(\'input[name=\\\'main_category\\\']\').remove();\n    $(this).parent().append(\'<input type=\"hidden\" name=\"main_category\" value=\"\' + $(this).parent().find(\'input[name=\\\'information_category[]\\\']\').val() + \'\" />\');\n	$(\'#information-category div\').children(\'.fa-circle-o\').attr({\'title\':\'{{ help_main_category_add }}\', \'data-original-title\':\'{{ help_main_category_add }}\'});\n    $(this).attr({\'title\':\'{{ help_main_category }}\', \'data-original-title\':\'{{ help_main_category }}\'});\n});\n$(\'#information-category\').delegate(\'.fa-dot-circle-o\', \'click\', function() {\n    $(this).toggleClass(\'fa-circle-o fa-dot-circle-o\');\n    $(\'input[name=\\\'main_category\\\']\').remove();\n    $(this).parent().removeClass(\'text-success\');\n    $(this).attr({\'title\':\'{{ help_main_category_add }}\', \'data-original-title\':\'{{ help_main_category_add }}\'});\n});\n\n// Filter\n$(\'input[name=\\\'filter\\\']\').autocomplete({\n	\'source\': function(request, response) {\n		$.ajax({\n			url: \'index.php?route=catalog/filter/autocomplete&user_token={{ user_token }}&filter_name=\' +  encodeURIComponent(request),\n			dataType: \'json\',\n			success: function(json) {\n				response($.map(json, function(item) {\n					return {\n						label: item[\'name\'],\n						value: item[\'filter_id\']\n					}\n				}));\n			}\n		});\n	},\n	\'select\': function(item) {\n		$(\'input[name=\\\'filter\\\']\').val(\'\');\n\n		$(\'#information-filter\' + item[\'value\']).remove();\n\n		$(\'#information-filter\').append(\'<div id=\"information-filter\' + item[\'value\'] + \'\"><i class=\"fa fa-minus-circle\"></i> \' + item[\'label\'] + \'<input type=\"hidden\" name=\"information_filter[]\" value=\"\' + item[\'value\'] + \'\" /></div>\');\n	}\n});\n\n$(\'#information-filter\').delegate(\'.fa-minus-circle\', \'click\', function() {\n	$(this).parent().remove();\n});\n\n// Related Information\n$(\'input[name=\\\'related_information\\\']\').autocomplete({\n	\'source\': function(request, response) {\n		$.ajax({\n			url: \'index.php?route=catalog/information/autocomplete&user_token={{ user_token }}{% if information_id %}&information_id={{ information_id }}{% endif %}&filter_name=\' +  encodeURIComponent(request),\n			dataType: \'json\',\n			success: function(json) {\n				response($.map(json, function(item) {\n					return {\n						label: item[\'title\'],\n						value: item[\'information_id\']\n					}\n				}));\n			}\n		});\n	},\n	\'select\': function(item) {\n		$(\'input[name=\\\'related_information\\\']\').val(\'\');\n\n		$(\'#information-related\' + item[\'value\']).remove();\n\n		$(\'#information-related\').append(\'<div id=\"information-related\' + item[\'value\'] + \'\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-exchange\"></i> \' + item[\'label\'] + \'<input type=\"hidden\" name=\"information_related[\' + item[\'value\'] + \'][information_id]\" value=\"\' + item[\'value\'] + \'\" /><input type=\"hidden\" name=\"information_related[\' + item[\'value\'] + \'][route]\" value=\"0\" /></div>\');\n	}\n});\n\n$(\'#information-related\').delegate(\'.fa-minus-circle\', \'click\', function() {\n	$(this).parent().remove();\n});\n\n$(\'#information-related\').delegate(\'.fa-exchange\', \'click\', function() {\n    $(this).toggleClass(\'fa-exchange fa-long-arrow-right\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'1\');\n});\n$(\'#information-related\').delegate(\'.fa-long-arrow-right\', \'click\', function() {\n    $(this).toggleClass(\'fa-long-arrow-right fa-long-arrow-left\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'-1\');\n});\n$(\'#information-related\').delegate(\'.fa-long-arrow-left\', \'click\', function() {\n    $(this).toggleClass(\'fa-long-arrow-left fa-exchange\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'0\');\n});\n\n// Related Product\n$(\'input[name=\\\'related_product\\\']\').autocomplete({\n	\'source\': function(request, response) {\n		$.ajax({\n			url: \'index.php?route=catalog/product/autocomplete&user_token={{ user_token }}&filter_name=\' +  encodeURIComponent(request),\n			dataType: \'json\',\n			success: function(json) {\n				response($.map(json, function(item) {\n					return {\n						label: item[\'name\'],\n						value: item[\'product_id\']\n					}\n				}));\n			}\n		});\n	},\n	\'select\': function(item) {\n		$(\'input[name=\\\'related_product\\\']\').val(\'\');\n\n		$(\'#product-related\' + item[\'value\']).remove();\n\n		$(\'#product-related\').append(\'<div id=\"product-related\' + item[\'value\'] + \'\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-exchange\"></i> \' + item[\'label\'] + \'<input type=\"hidden\" name=\"product_related[\' + item[\'value\'] + \'][product_id]\" value=\"\' + item[\'value\'] + \'\" /><input type=\"hidden\" name=\"product_related[\' + item[\'value\'] + \'][route]\" value=\"0\" /></div>\');\n	}\n});\n\n$(\'#product-related\').delegate(\'.fa-minus-circle\', \'click\', function() {\n	$(this).parent().remove();\n});\n\n$(\'#product-related\').delegate(\'.fa-exchange\', \'click\', function() {\n    $(this).toggleClass(\'fa-exchange fa-long-arrow-right\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'1\');\n});\n$(\'#product-related\').delegate(\'.fa-long-arrow-right\', \'click\', function() {\n    $(this).toggleClass(\'fa-long-arrow-right fa-long-arrow-left\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'-1\');\n});\n$(\'#product-related\').delegate(\'.fa-long-arrow-left\', \'click\', function() {\n    $(this).toggleClass(\'fa-long-arrow-left fa-exchange\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'0\');\n});\n//--></script> \n  <script type=\"text/javascript\"><!--\nvar attribute_row = {{ attribute_row }};\n\nfunction addAttribute() {\n    html  = \'<tr id=\"attribute-row\' + attribute_row + \'\">\';\n	html += \'  <td class=\"text-left\" style=\"width: 20%;\"><input type=\"text\" name=\"information_attribute[\' + attribute_row + \'][name]\" value=\"\" placeholder=\"{{ entry_attribute }}\" class=\"form-control\" /><input type=\"hidden\" name=\"information_attribute[\' + attribute_row + \'][attribute_id]\" value=\"\" /></td>\';\n	html += \'  <td class=\"text-left\">\';\n	{% for language in languages %}\n	html += \'<div class=\"input-group\"><span class=\"input-group-addon\"><img src=\"language/{{ language.code }}/{{ language.code }}.png\" title=\"{{ language.name }}\" /></span><textarea name=\"information_attribute[\' + attribute_row + \'][information_attribute_description][{{ language.language_id }}][text]\" rows=\"5\" placeholder=\"{{ entry_text }}\" class=\"form-control\"></textarea></div>\';\n    {% endfor %}\n	html += \'  </td>\';\n	html += \'  <td class=\"text-right\"><button type=\"button\" onclick=\"$(\\\'#attribute-row\' + attribute_row + \'\\\').remove();\" data-toggle=\"tooltip\" title=\"{{ button_remove }}\" class=\"btn btn-danger\"><i class=\"fa fa-minus-circle\"></i></button></td>\';\n    html += \'</tr>\';\n\n	$(\'#attribute tbody\').append(html);\n\n	attributeautocomplete(attribute_row);\n\n	attribute_row++;\n}\n\nfunction attributeautocomplete(attribute_row) {\n	$(\'input[name=\\\'information_attribute[\' + attribute_row + \'][name]\\\']\').autocomplete({\n		\'source\': function(request, response) {\n			$.ajax({\n				url: \'index.php?route=catalog/attribute/autocomplete&user_token={{ user_token }}&filter_name=\' +  encodeURIComponent(request),\n				dataType: \'json\',\n				success: function(json) {\n					response($.map(json, function(item) {\n						return {\n							category: item.attribute_group,\n							label: item.name,\n							value: item.attribute_id\n						}\n					}));\n				}\n			});\n		},\n		\'select\': function(item) {\n			$(\'input[name=\\\'information_attribute[\' + attribute_row + \'][name]\\\']\').val(item[\'label\']);\n			$(\'input[name=\\\'information_attribute[\' + attribute_row + \'][attribute_id]\\\']\').val(item[\'value\']);\n		}\n	});\n}\n\n$(\'#attribute tbody tr\').each(function(index, element) {\n	attributeautocomplete(index);\n});\n//--></script> \n  <script type=\"text/javascript\"><!--\nvar image_row = {{ image_row }};\n\nfunction addImage() {\n	html  = \'<tr id=\"image-row\' + image_row + \'\">\';\n	html += \'  <td class=\"text-left\"><a href=\"\" id=\"thumb-image\' + image_row + \'\"data-toggle=\"image\" class=\"img-thumbnail\"><img src=\"{{ placeholder }}\" alt=\"\" title=\"\" data-placeholder=\"{{ placeholder }}\" /></a><input type=\"hidden\" name=\"information_image[\' + image_row + \'][image]\" value=\"\" id=\"input-image\' + image_row + \'\" /></td>\';\n	html += \'  <td class=\"text-right\"><input type=\"text\" name=\"information_image[\' + image_row + \'][sort_order]\" value=\"\" placeholder=\"{{ entry_sort_order }}\" class=\"form-control\" /></td>\';\n	html += \'  <td class=\"text-left\"><button type=\"button\" onclick=\"$(\\\'#image-row\' + image_row  + \'\\\').remove();\" data-toggle=\"tooltip\" title=\"{{ button_remove }}\" class=\"btn btn-danger\"><i class=\"fa fa-minus-circle\"></i></button></td>\';\n	html += \'</tr>\';\n\n	$(\'#images tbody\').append(html);\n\n	image_row++;\n}\n//--></script> \n  <script type=\"text/javascript\"><!--\n$(\'.date\').datetimepicker({\n	language: \'{{ datepicker }}\',\n	pickTime: false\n});\n\n$(\'.time\').datetimepicker({\n	language: \'{{ datepicker }}\',\n	pickDate: false\n});\n\n$(\'.datetime\').datetimepicker({\n	language: \'{{ datepicker }}\',\n	pickDate: true,\n	pickTime: true\n});\n//--></script> \n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n            <li><a href=\"#tab-seo\" data-toggle=\"tab\">{{ tab_seo }}</a></li>\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n            <li><a href=\"#tab-links\" data-toggle=\"tab\">{{ tab_links }}</a></li>\n            <li><a href=\"#tab-attribute\" data-toggle=\"tab\">{{ tab_attribute }}</a></li>\n            <li><a href=\"#tab-image\" data-toggle=\"tab\">{{ tab_image }}</a></li>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n{{ footer }} \n        ]]></search>\n        <add position=\"before\"><![CDATA[\n  <style type=\"text/css\"><!--\n#information-category .fa-circle-o {\n    display: none;\n}\n#information-category div:hover .fa-circle-o {\n    display: inline;\n}\n--></style>\n  <script type=\"text/javascript\"><!--\n$(\'.summernote\').on(\'click\', function () {\n	if ($(this).hasClass(\'active\')) {\n		$(\'#input-short-description\' + $(this).data(\'language\')).summernote(\'destroy\');\n	} else {\n		$(\'#input-short-description\' + $(this).data(\'language\')).summernote({\n			focus: true,\n			lang: \'{{ summernote }}\'\n		});\n	}\n})\n\n$(document).ready(function() {\n	$(\'[name*=\\\'[short_description]\\\']\').each(function() {\n		if ($(this).val()) {\n            $(this).parent().prev().children(\'.summernote\').trigger(\'click\');\n		}\n	});\n});\n//--></script>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n            <div class=\"tab-pane\" id=\"tab-seo\">\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n            <div class=\"tab-pane\" id=\"tab-links\">\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-manufacturer\"><span data-toggle=\"tooltip\" title=\"{{ help_manufacturer }}\">{{ entry_manufacturer }}</span></label>\n                <div class=\"col-sm-10\">\n                  <input type=\"text\" name=\"manufacturer\" value=\"{{ manufacturer }}\" placeholder=\"{{ entry_manufacturer }}\" id=\"input-manufacturer\" class=\"form-control\" />\n                  <input type=\"hidden\" name=\"manufacturer_id\" value=\"{{ manufacturer_id }}\" />\n                </div>\n              </div>\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-category\"><span data-toggle=\"tooltip\" title=\"{{ help_category }}\">{{ entry_category }}</span></label>\n                <div class=\"col-sm-10\">\n                  <input type=\"text\" name=\"category\" value=\"\" placeholder=\"{{ entry_category }}\" id=\"input-category\" class=\"form-control\" />\n                  <div id=\"information-category\" class=\"well well-sm\" style=\"height: 150px; overflow: auto;\"> {% for information_category in information_categories %}\n                    {% if main_category and main_category == information_category.category_id %}\n                    <div id=\"information-category{{ information_category.category_id }}\" class=\"text-success\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-dot-circle-o\" data-toggle=\"tooltip\" title=\"{{ help_main_category }}\"></i> {{ information_category.name }}\n                      <input type=\"hidden\" name=\"information_category[]\" value=\"{{ information_category.category_id }}\" />\n                      <input type=\"hidden\" name=\"main_category\" value=\"{{ information_category.category_id }}\" />\n                    </div>\n                    {% else %}\n                    <div id=\"information-category{{ information_category.category_id }}\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-circle-o\" data-toggle=\"tooltip\" title=\"{{ help_main_category_add }}\"></i> {{ information_category.name }}\n                      <input type=\"hidden\" name=\"information_category[]\" value=\"{{ information_category.category_id }}\" />\n                    </div>\n                    {% endif %}\n                    {% endfor %}</div>\n                </div>\n              </div>\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-filter\"><span data-toggle=\"tooltip\" title=\"{{ help_filter }}\">{{ entry_filter }}</span></label>\n                <div class=\"col-sm-10\">\n                  <input type=\"text\" name=\"filter\" value=\"\" placeholder=\"{{ entry_filter }}\" id=\"input-filter\" class=\"form-control\" />\n                  <div id=\"information-filter\" class=\"well well-sm\" style=\"height: 150px; overflow: auto;\"> {% for information_filter in information_filters %}\n                    <div id=\"information-filter{{ information_filter.filter_id }}\"><i class=\"fa fa-minus-circle\"></i> {{ information_filter.name }}\n                      <input type=\"hidden\" name=\"information_filter[]\" value=\"{{ information_filter.filter_id }}\" />\n                    </div>\n                    {% endfor %}</div>\n                </div>\n              </div>\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-related-product\"><span data-toggle=\"tooltip\" title=\"{{ help_related }}\">{{ entry_related_product }}</span></label>\n                <div class=\"col-sm-10\">\n                  <input type=\"text\" name=\"related_product\" value=\"\" placeholder=\"{{ entry_related_product }}\" id=\"input-related-product\" class=\"form-control\" />\n                  <div id=\"product-related\" class=\"well well-sm\" style=\"height: 150px; overflow: auto;\"> {% for product_related in product_relateds %}\n                    <div id=\"product-related{{ product_related.product_id }}\"><i class=\"fa fa-minus-circle\"></i> \n                      {% if product_related.route and product_related.route > 0 %}\n                      <i class=\"fa fa-long-arrow-right\"></i> \n                      {% elseif product_related.route and product_related.route < 0 %}\n                      <i class=\"fa fa-long-arrow-left\"></i> \n                      {% else %}\n                      <i class=\"fa fa-exchange\"></i> \n                      {% endif %}\n                      {{ product_related.name }}\n                      <input type=\"hidden\" name=\"product_related[{{ product_related.product_id }}][product_id]\" value=\"{{ product_related.product_id }}\" />\n                      <input type=\"hidden\" name=\"product_related[{{ product_related.product_id }}][route]\" value=\"{{ product_related.route }}\" />\n                    </div>\n                    {% endfor %}</div>\n                </div>\n              </div>\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-related-information\"><span data-toggle=\"tooltip\" title=\"{{ help_related }}\">{{ entry_related_information }}</span></label>\n                <div class=\"col-sm-10\">\n                  <input type=\"text\" name=\"related_information\" value=\"\" placeholder=\"{{ entry_related_information }}\" id=\"input-related-information\" class=\"form-control\" />\n                  <div id=\"information-related\" class=\"well well-sm\" style=\"height: 150px; overflow: auto;\"> {% for information_related in information_relateds %}\n                    <div id=\"information-related{{ information_related.information_id }}\"><i class=\"fa fa-minus-circle\"></i> \n                      {% if information_related.route and information_related.route > 0 %}\n                      <i class=\"fa fa-long-arrow-right\"></i> \n                      {% elseif information_related.route and information_related.route < 0 %}\n                      <i class=\"fa fa-long-arrow-left\"></i> \n                      {% else %}\n                      <i class=\"fa fa-exchange\"></i> \n                      {% endif %}\n                      {{ information_related.title }}\n                      <input type=\"hidden\" name=\"information_related[{{ information_related.information_id }}][information_id]\" value=\"{{ information_related.information_id }}\" />\n                      <input type=\"hidden\" name=\"information_related[{{ information_related.information_id }}][route]\" value=\"{{ information_related.route }}\" />\n                    </div>\n                    {% endfor %}</div>\n                </div>\n              </div>\n            </div>\n            <div class=\"tab-pane\" id=\"tab-attribute\">\n              <div class=\"table-responsive\">\n                <table id=\"attribute\" class=\"table table-striped table-bordered table-hover\">\n                  <thead>\n                    <tr>\n                      <td class=\"text-left\">{{ entry_attribute }}</td>\n                      <td class=\"text-left\">{{ entry_text }}</td>\n                      <td></td>\n                    </tr>\n                  </thead>\n                  <tbody>\n                    {% set attribute_row = 0 %}\n                    {% for information_attribute in information_attributes %}\n                    <tr id=\"attribute-row{{ attribute_row }}\">\n                      <td class=\"text-left\" style=\"width: 40%;\"><input type=\"text\" name=\"information_attribute[{{ attribute_row }}][name]\" value=\"{{ information_attribute.name }}\" placeholder=\"{{ entry_attribute }}\" class=\"form-control\" />\n                      <input type=\"hidden\" name=\"information_attribute[{{ attribute_row }}][attribute_id]\" value=\"{{ information_attribute.attribute_id }}\" /></td>\n                      <td class=\"text-left\">{% for language in languages %}\n                        <div class=\"input-group\"><span class=\"input-group-addon\"><img src=\"language/{{ language.code }}/{{ language.code }}.png\" title=\"{{ language.name }}\" /></span>\n                          <textarea name=\"information_attribute[{{ attribute_row }}][information_attribute_description][{{ language.language_id }}][text]\" rows=\"5\" placeholder=\"{{ entry_text }}\" class=\"form-control\">{{ information_attribute.information_attribute_description[language.language_id] ? information_attribute.information_attribute_description[language.language_id].text }}</textarea>\n                        </div>\n                        {% endfor %}</td>\n                      <td class=\"text-right\"><button type=\"button\" onclick=\"$(\'#attribute-row{{ attribute_row }}\').remove();\" data-toggle=\"tooltip\" title=\"{{ button_remove }}\" class=\"btn btn-danger\"><i class=\"fa fa-minus-circle\"></i></button></td>\n                    </tr>\n                    {% set attribute_row = attribute_row + 1 %}\n                    {% endfor %}\n                  </tbody>\n                  <tfoot>\n                    <tr>\n                      <td colspan=\"2\"></td>\n                      <td class=\"text-right\"><button type=\"button\" onclick=\"addAttribute();\" data-toggle=\"tooltip\" title=\"{{ button_attribute_add }}\" class=\"btn btn-primary\"><i class=\"fa fa-plus-circle\"></i></button></td>\n                    </tr>\n                  </tfoot>\n                </table>\n              </div>\n            </div>\n            <div class=\"tab-pane\" id=\"tab-image\">\n              <div class=\"table-responsive\">\n                <table class=\"table table-striped table-bordered table-hover\">\n                  <thead>\n                    <tr>\n                      <td class=\"text-left\">{{ entry_image }}</td>\n                    </tr>\n                  </thead>\n                  <tbody>\n                    <tr>\n                      <td class=\"text-left\"><a href=\"\" id=\"thumb-image\" data-toggle=\"image\" class=\"img-thumbnail\"><img src=\"{{ thumb }}\" alt=\"\" title=\"\" data-placeholder=\"{{ placeholder }}\" /></a>\n                        <input type=\"hidden\" name=\"image\" value=\"{{ image }}\" id=\"input-image\" /></td>\n                    </tr>\n                  </tbody>\n                </table>\n              </div>\n              <div class=\"table-responsive\">\n                <table id=\"images\" class=\"table table-striped table-bordered table-hover\">\n                  <thead>\n                    <tr>\n                      <td class=\"text-left\">{{ entry_additional_image }}</td>\n                      <td class=\"text-right\">{{ entry_sort_order }}</td>\n                      <td></td>\n                    </tr>\n                  </thead>\n                  <tbody>\n                    {% set image_row = 0 %}\n                    {% for information_image in information_images %}\n                    <tr id=\"image-row{{ image_row }}\">\n                      <td class=\"text-left\"><a href=\"\" id=\"thumb-image{{ image_row }}\" data-toggle=\"image\" class=\"img-thumbnail\"><img src=\"{{ information_image.thumb }}\" alt=\"\" title=\"\" data-placeholder=\"{{ placeholder }}\" /></a>\n                        <input type=\"hidden\" name=\"information_image[{{ image_row }}][image]\" value=\"{{ information_image.image }}\" id=\"input-image{{ image_row }}\" /></td>\n                      <td class=\"text-right\"><input type=\"text\" name=\"information_image[{{ image_row }}][sort_order]\" value=\"{{ information_image.sort_order }}\" placeholder=\"{{ entry_sort_order }}\" class=\"form-control\" /></td>\n                      <td class=\"text-left\"><button type=\"button\" onclick=\"$(\'#image-row{{ image_row }}\').remove();\" data-toggle=\"tooltip\" title=\"{{ button_remove }}\" class=\"btn btn-danger\"><i class=\"fa fa-minus-circle\"></i></button></td>\n                    </tr>\n                    {% set image_row = image_row + 1 %}\n                    {% endfor %}\n                  </tbody>\n                  <tfoot>\n                    <tr>\n                      <td colspan=\"2\"></td>\n                      <td class=\"text-left\"><button type=\"button\" onclick=\"addImage();\" data-toggle=\"tooltip\" title=\"{{ button_image_add }}\" class=\"btn btn-primary\"><i class=\"fa fa-plus-circle\"></i></button></td>\n                    </tr>\n                  </tfoot>\n                </table>\n              </div>\n            </div>\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/view/template/catalog/information_list.twig\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n      <div class=\"pull-right\"><a href=\"{{ add }}\" data-toggle=\"tooltip\" title=\"{{ button_add }}\" class=\"btn btn-primary\"><i class=\"fa fa-plus\"></i></a>\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n      <div class=\"pull-right\">\n        <button type=\"button\" data-toggle=\"tooltip\" title=\"{{ button_filter }}\" onclick=\"$(\'#filter-information\').toggleClass(\'hidden-sm hidden-xs\');\" class=\"btn btn-default hidden-md hidden-lg\"><i class=\"fa fa-filter\"></i></button>\n        <a href=\"{{ add }}\" data-toggle=\"tooltip\" title=\"{{ button_add }}\" class=\"btn btn-primary\"><i class=\"fa fa-plus\"></i></a>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n        <button type=\"button\" data-toggle=\"tooltip\" title=\"{{ button_delete }}\" class=\"btn btn-danger\" onclick=\"confirm(\'{{ text_confirm }}\') ? $(\'#form-information\').submit() : false;\"><i class=\"fa fa-trash-o\"></i></button>\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n        <button type=\"submit\" form=\"form-information\" formaction=\"{{ copy }}\" data-toggle=\"tooltip\" title=\"{{ button_copy }}\" class=\"btn btn-default\"><i class=\"fa fa-copy\"></i></button>\n        <button type=\"button\" form=\"form-information\" formaction=\"{{ delete }}\" data-toggle=\"tooltip\" title=\"{{ button_delete }}\" class=\"btn btn-danger\" onclick=\"confirm(\'{{ text_confirm }}\') ? $(\'#form-information\').submit() : false;\"><i class=\"fa fa-trash-o\"></i></button>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n    <div class=\"panel panel-default\">\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n    <div class=\"row\">\n      <div id=\"filter-information\" class=\"col-md-3 col-md-push-9 col-sm-12 hidden-sm hidden-xs\">\n        <div class=\"panel panel-default\">\n          <div class=\"panel-heading\">\n            <h3 class=\"panel-title\"><i class=\"fa fa-filter\"></i> {{ text_filter }}</h3>\n          </div>\n          <div class=\"panel-body\">\n            <div class=\"form-group\">\n              <label class=\"control-label\" for=\"input-title\">{{ entry_title }}</label>\n              <input type=\"text\" name=\"filter_name\" value=\"{{ filter_name }}\" placeholder=\"{{ entry_title }}\" id=\"input-title\" class=\"form-control\" />\n            </div>\n            <div class=\"form-group\">\n              <label class=\"control-label\" for=\"input-viewed\">{{ entry_viewed }}</label>\n              <input type=\"text\" name=\"filter_viewed\" value=\"{{ filter_viewed }}\" placeholder=\"{{ entry_viewed }}\" id=\"input-viewed\" class=\"form-control\" />\n            </div>\n            <div class=\"form-group\">\n              <label class=\"control-label\" for=\"input-status\">{{ entry_status }}</label>\n              <select name=\"filter_status\" id=\"input-status\" class=\"form-control\">\n                <option value=\"\"></option>\n                  {% if filter_status == \'1\' %}\n                <option value=\"1\" selected=\"selected\">{{ text_enabled }}</option>\n                  {% else %}\n                <option value=\"1\">{{ text_enabled }}</option>\n                  {% endif %}\n                  {% if filter_status == \'0\' %}\n                <option value=\"0\" selected=\"selected\">{{ text_disabled }}</option>\n                  {% else %}\n                <option value=\"0\">{{ text_disabled }}</option>\n                  {% endif %}\n              </select>\n            </div>\n            <div class=\"form-group text-right\">\n              <button type=\"button\" id=\"button-filter\" class=\"btn btn-default\"><i class=\"fa fa-filter\"></i> {{ button_filter }}</button>\n            </div>\n          </div>\n        </div>\n      </div>\n      <div class=\"col-md-9 col-md-pull-3 col-sm-12\">\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n{{ footer }} \n        ]]></search>\n        <add position=\"before\"><![CDATA[\n  </div>\n  <script type=\"text/javascript\"><!--\n$(\'#button-filter\').on(\'click\', function() {\n	var url = \'\';\n\n	var filter_name = $(\'input[name=\\\'filter_name\\\']\').val();\n\n	if (filter_name) {\n		url += \'&filter_name=\' + encodeURIComponent(filter_name);\n	}\n\n	var filter_viewed = $(\'input[name=\\\'filter_viewed\\\']\').val();\n\n	if (filter_viewed) {\n		url += \'&filter_viewed=\' + encodeURIComponent(filter_viewed);\n	}\n\n	var filter_status = $(\'select[name=\\\'filter_status\\\']\').val();\n\n	if (filter_status != \'\') {\n		url += \'&filter_status=\' + encodeURIComponent(filter_status);\n	}\n\n	location = \'index.php?route=catalog/information&user_token={{ user_token }}\' + url;\n});\n//--></script> \n  <script type=\"text/javascript\"><!--\n// IE and Edge fix!\n$(\'button[form=\\\'form-information\\\']\').on(\'click\', function(e) {\n	$(\'#form-information\').attr(\'action\', $(this).attr(\'formaction\'));\n});\n  \n$(\'input[name=\\\'filter_name\\\']\').autocomplete({\n	\'source\': function(request, response) {\n		$.ajax({\n			url: \'index.php?route=catalog/information/autocomplete&user_token={{ user_token }}&filter_name=\' +  encodeURIComponent(request),\n			dataType: \'json\',\n			success: function(json) {\n				response($.map(json, function(item) {\n					return {\n						label: item[\'title\'],\n						value: item[\'information_id\']\n					}\n				}));\n			}\n		});\n	},\n	\'select\': function(item) {\n		$(\'input[name=\\\'filter_name\\\']\').val(item[\'label\']);\n	}\n});\n//--></script></div>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                  <td style=\"width: 1px;\" class=\"text-center\"><input type=\"checkbox\" onclick=\"$(\'input[name*=\\\'selected\\\']\').prop(\'checked\', this.checked);\" /></td>\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n                  <td class=\"text-center\">{{ column_image }}</td>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                  <td class=\"text-left\">{{ information.title }}</td>\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n                    <td class=\"text-center\">{% if information.image %} <img src=\"{{ information.image }}\" alt=\"{{ information.title }}\" class=\"img-thumbnail\" /> {% else %} <span class=\"img-thumbnail list\"><i class=\"fa fa-camera fa-2x\"></i></span> {% endif %}</td>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                  <td class=\"text-right\">{% if sort == \'i.sort_order\' %}\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n                  <td class=\"text-right\">{% if sort == \'i.viewed\' %}\n                    <a href=\"{{ sort_viewed }}\" class=\"{{ order|lower }}\">{{ column_viewed }}</a>\n                    {% else %}\n                    <a href=\"{{ sort_viewed }}\">{{ column_viewed }}</a>\n                    {% endif %}</td>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                  <td class=\"text-right\">{{ column_action }}</td>\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n                  <td class=\"text-left\">{% if sort == \'i.status\' %}\n                    <a href=\"{{ sort_status }}\" class=\"{{ order|lower }}\">{{ column_status }}</a>\n                    {% else %}\n                    <a href=\"{{ sort_status }}\">{{ column_status }}</a>\n                    {% endif %}</td>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                  <td class=\"text-right\">{{ information.sort_order }}</td>\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n                  <td class=\"text-right\">{{ information.viewed }}</td>\n                  <td class=\"text-right\">{{ information.sort_order }}</td>\n                  <td class=\"text-left\">{{ information.status }}</td>\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Product -->\n  <file path=\"admin/controller/catalog/product.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n		if (isset($this->request->post[\'points\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		// Information Related\n		if (isset($this->request->post[\'information_related\'])) {\n			$informations = $this->request->post[\'information_related\'];\n		} elseif (isset($this->request->get[\'product_id\'])) {\n			$informations = $this->model_catalog_product->getInformationRelated($this->request->get[\'product_id\']);\n		} else {\n			$informations = array();\n		}\n\n		$data[\'information_relateds\'] = array();\n\n        $this->load->model(\'catalog/information\');\n\n		foreach ($informations as $information_related) {\n			$related_info = $this->model_catalog_information->getInformation($information_related[\'information_id\']);\n\n			if ($related_info) {\n				$data[\'information_relateds\'][] = array(\n					\'information_id\' => $related_info[\'information_id\'],\n					\'title\'          => $related_info[\'title\'],\n                    \'route\'          => $information_related[\'route\']\n				);\n			}\n		}\n\n		if (isset($this->request->post[\'main_category\'])) {\n			$data[\'main_category\'] = $this->request->post[\'main_category\'];\n		} elseif (isset($this->request->get[\'product_id\']) && $categories) {\n			$data[\'main_category\'] = $this->model_catalog_product->getMainCategory($this->request->get[\'product_id\']);\n		} else {\n			$data[\'main_category\'] = \'\';\n		}\n\n		if (isset($this->request->get[\'product_id\'])) {\n			$data[\'product_id\'] = $this->request->get[\'product_id\'];\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		foreach ($products as $product_id) {\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		foreach ($products as $product) {\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$related_info = $this->model_catalog_product->getProduct($product_id);\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n			$related_info = $this->model_catalog_product->getProduct($product[\'product_id\']);\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n					\'product_id\' => $related_info[\'product_id\'],\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n                    \'route\'      => $product[\'route\'],\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				$option_data = array();\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n				if (isset($this->request->get[\'product_id\']) && $this->request->get[\'product_id\'] == $result[\'product_id\']) {\n					continue;\n				}\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/model/catalog/product.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[description = \'\" . $this->db->escape($value[\'description\']) . \"\']]></search>\n        <add position=\"replace\"><![CDATA[header = \'\" . $this->db->escape($value[\'header\']) . \"\', short_description = \'\" . $this->db->escape($value[\'short_description\']) . \"\', description = \'\" . $this->db->escape($value[\'description\']) . \"\']]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				\'description\'      => $result[\'description\'],\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n				\'header\'            => $result[\'header\'],\n				\'short_description\' => $result[\'short_description\'],\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	public function getProductRelated($product_id) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n	public function getMainCategory($product_id) {\n		$query = $this->db->query(\"SELECT category_id FROM \" . DB_PREFIX . \"product_to_category WHERE product_id = \'\" . (int)$product_id . \"\' AND main_category = \'1\'\");\n\n		if ($query->row) {\n			return $query->row[\'category_id\'];\n		} else {\n			return \'\';\n		}\n	}\n\n	public function getInformationRelated($product_id) {\n		$information_related_data = array();\n\n		$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"information_product_related WHERE product_id = \'\" . (int)$product_id . \"\'\");\n\n		foreach ($query->rows as $result) {\n			$information_related_data[] = array(\n				\'information_id\' => $result[\'information_id\'],\n				\'route\'          => $result[\'route\']\n            );\n		}\n\n		return $information_related_data;\n	}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_to_category SET product_id = \'\" . (int)$product_id . \"\', category_id = \'\" . (int)$category_id . \"\'\");\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n				if (!empty($data[\'main_category\']) && $data[\'main_category\'] == (int)$category_id) {\n					$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_to_category SET product_id = \'\" . (int)$product_id . \"\', category_id = \'\" . (int)$category_id . \"\', main_category = \'1\'\");\n				} else {\n					$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_to_category SET product_id = \'\" . (int)$product_id . \"\', category_id = \'\" . (int)$category_id . \"\'\");\n				}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$product_related_data[] = $result[\'related_id\'];\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n			$product_related_data[] = array(\n				\'product_id\' => $result[\'related_id\'],\n				\'route\'      => $result[\'route\']\n            );\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			foreach ($data[\'product_related\'] as $related_id) {\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n			foreach ($data[\'product_related\'] as $product_related) {\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"product_related WHERE product_id = \'\" . (int)$product_id . \"\' AND related_id = \'\" . (int)$related_id . \"\'\");\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n				$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"product_related WHERE product_id = \'\" . (int)$product_id . \"\' AND related_id = \'\" . (int)$product_related[\'product_id\'] . \"\'\");\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_related SET product_id = \'\" . (int)$product_id . \"\', related_id = \'\" . (int)$related_id . \"\'\");\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_related SET product_id = \'\" . (int)$product_id . \"\', related_id = \'\" . (int)$product_related[\'product_id\'] . \"\', route = \'\" . (int)$product_related[\'route\'] . \"\'\");\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"product_related WHERE product_id = \'\" . (int)$related_id . \"\' AND related_id = \'\" . (int)$product_id . \"\'\");\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n				$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"product_related WHERE product_id = \'\" . (int)$product_related[\'product_id\'] . \"\' AND related_id = \'\" . (int)$product_id . \"\'\");\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_related SET product_id = \'\" . (int)$related_id . \"\', related_id = \'\" . (int)$product_id . \"\'\");\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_related SET product_id = \'\" . (int)$product_related[\'product_id\'] . \"\', related_id = \'\" . (int)$product_id . \"\', route = \'\" . (int)$product_related[\'route\'] * -1 . \"\'\");\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"0\"><![CDATA[\n		if (isset($data[\'product_reward\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (isset($data[\'information_related\'])) {\n			$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_product_related WHERE product_id = \'\" . (int)$product_id . \"\'\");\n\n			foreach ($data[\'information_related\'] as $information_related) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_product_related SET product_id = \'\" . (int)$product_id . \"\', information_id = \'\" . (int)$information_related[\'information_id\'] . \"\', route = \'\" . (int)$information_related[\'route\'] . \"\'\");\n			}\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"1\"><![CDATA[\n		if (isset($data[\'product_reward\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_product_related WHERE product_id = \'\" . (int)$product_id . \"\'\");\n\n		if (isset($data[\'information_related\'])) {\n			foreach ($data[\'information_related\'] as $information_related) {\n				$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"information_product_related SET product_id = \'\" . (int)$product_id . \"\', information_id = \'\" . (int)$information_related[\'information_id\'] . \"\', route = \'\" . (int)$information_related[\'route\'] . \"\'\");\n			}\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$data[\'product_related\'] = $this->getProductRelated($product_id);\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n			$data[\'information_related\'] = $this->getInformationRelated($product_id);\n			$data[\'main_category\'] = $this->getMainCategory($product_id);\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"product_related WHERE related_id = \'\" . (int)$product_id . \"\'\");\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"information_product_related WHERE product_id = \'\" . (int)$product_id . \"\'\");\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/view/template/catalog/product_form.twig\">\n      <operation error=\"skip\">\n        <search index=\"0\"><![CDATA[\n                  <div class=\"form-group\">\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n                  <div class=\"form-group\">\n                    <label class=\"col-sm-2 control-label\" for=\"input-header{{ language.language_id }}\"><span data-toggle=\"tooltip\" title=\"{{ help_header }}\">{{ entry_header }}</span></label>\n                    <div class=\"col-sm-10\">\n                      <input type=\"text\" name=\"product_description[{{ language.language_id }}][header]\" value=\"{{ product_description[language.language_id] ? product_description[language.language_id].header }}\" placeholder=\"{{ entry_header }}\" id=\"input-header{{ language.language_id }}\" class=\"form-control\" />\n                    </div>\n                  </div>\n                  <div class=\"form-group\">\n                    <label class=\"col-sm-2 control-label\" for=\"input-short-description{{ language.language_id }}\">{{ entry_short_description }}<br /><button type=\"button\" class=\"btn btn-primary btn-xs summernote\" data-toggle=\"button\" aria-pressed=\"false\" autocomplete=\"off\" data-language=\"{{ language.language_id }}\">Summernote</button></label>\n                    <div class=\"col-sm-10\">\n                      <textarea name=\"product_description[{{ language.language_id }}][short_description]\" placeholder=\"{{ entry_short_description }}\" id=\"input-short-description{{ language.language_id }}\" class=\"form-control\">{{ product_description[language.language_id] ? product_description[language.language_id].short_description }}</textarea>\n                     </div>\n                  </div>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                    <div id=\"product-category{{ product_category.category_id }}\"><i class=\"fa fa-minus-circle\"></i> {{ product_category.name }}\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n                    {% if main_category and main_category == product_category.category_id %}\n                    <div id=\"product-category{{ product_category.category_id }}\" class=\"text-success\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-dot-circle-o\" data-toggle=\"tooltip\" title=\"{{ help_main_category }}\"></i> {{ product_category.name }}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                      <input type=\"hidden\" name=\"product_category[]\" value=\"{{ product_category.category_id }}\"\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n                      <input type=\"hidden\" name=\"main_category\" value=\"{{ product_category.category_id }}\" />\n                    </div>\n                    {% else %}\n                    <div id=\"product-category{{ product_category.category_id }}\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-circle-o\" data-toggle=\"tooltip\" title=\"{{ help_main_category_add }}\"></i> {{ product_category.name }}\n                      <input type=\"hidden\" name=\"product_category[]\" value=\"{{ product_category.category_id }}\" />\n                    </div>\n                    {% endif %}\n                    <div class=\"hidden\">\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[catalog/category/autocomplete&user_token={{ user_token }}]]></search>\n        <add position=\"replace\"><![CDATA[catalog/category/autocomplete&user_token={{ user_token }}&filter_information=0]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$(\'#product-category\').append(\'<div id=\"product-category\' + item[\'value\'] + \'\"><i class=\"fa fa-minus-circle\"></i> \' + item[\'label\'] + \'<input type=\"hidden\" name=\"product_category[]\" value=\"\' + item[\'value\'] + \'\" /></div>\');\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n        $(\'#product-category\').append(\'<div id=\"product-category\' + item[\'value\'] + \'\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-circle-o\" data-toggle=\"tooltip\" title=\"{{ help_main_category_add }}\"></i> \' + item[\'label\'] + \'<input type=\"hidden\" name=\"product_category[]\" value=\"\' + item[\'value\'] + \'\" /></div>\');\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n// Filter\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n$(\'#product-category\').delegate(\'.fa-circle-o\', \'click\', function() {\n	$(\'#product-category div\').children(\'.fa-dot-circle-o\').toggleClass(\'fa-circle-o fa-dot-circle-o\');\n    $(\'#product-category div\').removeClass(\'text-success\');\n    $(this).toggleClass(\'fa-circle-o fa-dot-circle-o\');\n    $(this).parent().addClass(\'text-success\');\n    $(\'input[name=\\\'main_category\\\']\').remove();\n    $(this).parent().append(\'<input type=\"hidden\" name=\"main_category\" value=\"\' + $(this).parent().find(\'input[name=\\\'product_category[]\\\']\').val() + \'\" />\');\n	$(\'#product-category div\').children(\'.fa-circle-o\').attr({\'title\':\'{{ help_main_category_add }}\', \'data-original-title\':\'{{ help_main_category_add }}\'});\n    $(this).attr({\'title\':\'{{ help_main_category }}\', \'data-original-title\':\'{{ help_main_category }}\'});\n});\n$(\'#product-category\').delegate(\'.fa-dot-circle-o\', \'click\', function() {\n    $(this).toggleClass(\'fa-circle-o fa-dot-circle-o\');\n    $(\'input[name=\\\'main_category\\\']\').remove();\n    $(this).parent().removeClass(\'text-success\');\n    $(this).attr({\'title\':\'{{ help_main_category_add }}\', \'data-original-title\':\'{{ help_main_category_add }}\'});\n});\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                    <div id=\"product-related{{ product_related.product_id }}\"><i class=\"fa fa-minus-circle\"></i> {{ product_related.name }}\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n                    <div id=\"product-related{{ product_related.product_id }}\"><i class=\"fa fa-minus-circle\"></i> \n                      {% if product_related.route and product_related.route > 0 %}\n                      <i class=\"fa fa-long-arrow-right\"></i> \n                      {% elseif product_related.route and product_related.route < 0 %}\n                      <i class=\"fa fa-long-arrow-left\"></i> \n                      {% else %}\n                      <i class=\"fa fa-exchange\"></i> \n                      {% endif %}\n                      {{ product_related.name }}\n                      <input type=\"hidden\" name=\"product_related[{{ product_related.product_id }}][product_id]\" value=\"{{ product_related.product_id }}\" />\n                      <input type=\"hidden\" name=\"product_related[{{ product_related.product_id }}][route]\" value=\"{{ product_related.route }}\" />\n                    </div>\n                    {% endfor %}</div>\n                </div>\n              </div>\n              <div class=\"form-group\">\n                <label class=\"col-sm-2 control-label\" for=\"input-related-information\"><span data-toggle=\"tooltip\" title=\"{{ help_related }}\">{{ entry_related_information }}</span></label>\n                <div class=\"col-sm-10\">\n                  <input type=\"text\" name=\"related_information\" value=\"\" placeholder=\"{{ entry_related_information }}\" id=\"input-related-information\" class=\"form-control\" />\n                  <div id=\"information-related\" class=\"well well-sm\" style=\"height: 150px; overflow: auto;\"> {% for information_related in information_relateds %}\n                    <div id=\"information-related{{ information_related.information_id }}\"><i class=\"fa fa-minus-circle\"></i> \n                      {% if information_related.route and information_related.route > 0 %}\n                      <i class=\"fa fa-long-arrow-right\"></i> \n                      {% elseif information_related.route and information_related.route < 0 %}\n                      <i class=\"fa fa-long-arrow-left\"></i> \n                      {% else %}\n                      <i class=\"fa fa-exchange\"></i> \n                      {% endif %}\n                      {{ information_related.title }}\n                      <input type=\"hidden\" name=\"information_related[{{ information_related.information_id }}][information_id]\" value=\"{{ information_related.information_id }}\" />\n                      <input type=\"hidden\" name=\"information_related[{{ information_related.information_id }}][route]\" value=\"{{ information_related.route }}\" />\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		  <input type=\"hidden\" name=\"product_related[]\" value=\"{{ product_related.product_id }}\" />\n        ]]></search>\n        <add position=\"replace\"><![CDATA[]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		  <input type=\"hidden\" name=\"product_related[]\" value=\"{{ product_related.product_id }}\"/>\n        ]]></search>\n        <add position=\"replace\"><![CDATA[]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[index.php?route=catalog/product/autocomplete&user_token={{ user_token }}]]></search>\n        <add position=\"replace\"><![CDATA[index.php?route=catalog/product/autocomplete&user_token={{ user_token }}{% if product_id %}&product_id={{ product_id }}{% endif %}]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$(\'#product-related\').append(\'<div id=\"product-related\' + item[\'value\'] + \'\"><i class=\"fa fa-minus-circle\"></i> \' + item[\'label\'] + \'<input type=\"hidden\" name=\"product_related[]\" value=\"\' + item[\'value\'] + \'\" /></div>\');\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		$(\'#product-related\').append(\'<div id=\"product-related\' + item[\'value\'] + \'\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-exchange\"></i> \' + item[\'label\'] + \'<input type=\"hidden\" name=\"product_related[\' + item[\'value\'] + \'][product_id]\" value=\"\' + item[\'value\'] + \'\" /><input type=\"hidden\" name=\"product_related[\' + item[\'value\'] + \'][route]\" value=\"0\" /></div>\');\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n$(\'#product-related\').delegate(\'.fa-minus-circle\', \'click\', function() {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n$(\'#product-related\').delegate(\'.fa-exchange\', \'click\', function() {\n    $(this).toggleClass(\'fa-exchange fa-long-arrow-right\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'1\');\n});\n$(\'#product-related\').delegate(\'.fa-long-arrow-right\', \'click\', function() {\n    $(this).toggleClass(\'fa-long-arrow-right fa-long-arrow-left\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'-1\');\n});\n$(\'#product-related\').delegate(\'.fa-long-arrow-left\', \'click\', function() {\n    $(this).toggleClass(\'fa-long-arrow-left fa-exchange\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'0\');\n});\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n$(\'#product-related\').delegate(\'.fa-minus-circle\', \'click\', function() {\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n	$(this).parent().remove();\n});\n\n// Related Information\n$(\'input[name=\\\'related_information\\\']\').autocomplete({\n	\'source\': function(request, response) {\n		$.ajax({\n			url: \'index.php?route=catalog/information/autocomplete&user_token={{ user_token }}&filter_name=\' +  encodeURIComponent(request),\n			dataType: \'json\',\n			success: function(json) {\n				response($.map(json, function(item) {\n					return {\n						label: item[\'title\'],\n						value: item[\'information_id\']\n					}\n				}));\n			}\n		});\n	},\n	\'select\': function(item) {\n		$(\'input[name=\\\'related_information\\\']\').val(\'\');\n\n		$(\'#information-related\' + item[\'value\']).remove();\n\n		$(\'#information-related\').append(\'<div id=\"information-related\' + item[\'value\'] + \'\"><i class=\"fa fa-minus-circle\"></i> <i class=\"fa fa-exchange\"></i> \' + item[\'label\'] + \'<input type=\"hidden\" name=\"information_related[\' + item[\'value\'] + \'][information_id]\" value=\"\' + item[\'value\'] + \'\" /><input type=\"hidden\" name=\"information_related[\' + item[\'value\'] + \'][route]\" value=\"0\" /></div>\');\n	}\n});\n\n$(\'#information-related\').delegate(\'.fa-minus-circle\', \'click\', function() {\n	$(this).parent().remove();\n});\n\n$(\'#information-related\').delegate(\'.fa-exchange\', \'click\', function() {\n    $(this).toggleClass(\'fa-exchange fa-long-arrow-right\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'1\');\n});\n$(\'#information-related\').delegate(\'.fa-long-arrow-right\', \'click\', function() {\n    $(this).toggleClass(\'fa-long-arrow-right fa-long-arrow-left\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'-1\');\n});\n$(\'#information-related\').delegate(\'.fa-long-arrow-left\', \'click\', function() {\n    $(this).toggleClass(\'fa-long-arrow-left fa-exchange\');\n	$(this).parent().find(\'input[name$=\\\'[route]\\\']\').val(\'0\');\n});\n\n$(\'#information-related\').delegate(\'.fa-minus-circle\', \'click\', function() {\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n{{ footer }} \n        ]]></search>\n        <add position=\"before\"><![CDATA[\n  <style type=\"text/css\"><!--\n#product-category .fa-circle-o {\n    display: none;\n}\n#product-category div:hover .fa-circle-o {\n    display: inline;\n}\n--></style>\n  <script type=\"text/javascript\"><!--\n$(\'.summernote\').on(\'click\', function () {\n	if ($(this).hasClass(\'active\')) {\n		$(\'#input-short-description\' + $(this).data(\'language\')).summernote(\'destroy\');\n	} else {\n		$(\'#input-short-description\' + $(this).data(\'language\')).summernote({\n			focus: true,\n			lang: \'{{ summernote }}\'\n		});\n	}\n})\n\n$(document).ready(function() {\n	$(\'[name*=\\\'[short_description]\\\']\').each(function() {\n		if ($(this).val()) {\n            $(this).parent().prev().children(\'.summernote\').trigger(\'click\');\n		}\n	});\n});\n//--></script>\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- User -->\n  <file path=\"admin/model/user/user.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n	public function getTotalUsers() {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n	public function getUsersByGroup($user_group_id) {\n		$query = $this->db->query(\"SELECT * FROM `\" . DB_PREFIX . \"user` WHERE user_group_id = \'\" . (int)$user_group_id . \"\' ORDER BY username\");\n\n		return $query->rows;\n	}\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Review -->\n  <file path=\"admin/controller/catalog/review.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n		if (isset($this->request->post[\'rating\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (isset($this->request->post[\'reply\'])) {\n			$data[\'reply\'] = $this->request->post[\'reply\'];\n		} elseif (!empty($review_info)) {\n			$data[\'reply\'] = $review_info[\'reply\'];\n		} else {\n			$data[\'reply\'] = \'\';\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$url = \'\';\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		if (isset($this->request->get[\'information\'])) {\n			$url .= \'&information=\' . $this->request->get[\'information\'];\n		}\n        \n		if (isset($this->request->get[\'filter_information\'])) {\n			$url .= \'&filter_information=\' . urlencode(html_entity_decode($this->request->get[\'filter_information\'], ENT_QUOTES, \'UTF-8\'));\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	protected function getList() {\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		if (isset($this->request->get[\'filter_information\'])) {\n			$filter_information = $this->request->get[\'filter_information\'];\n		} else {\n			$filter_information = \'\';\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$filter_data = array(\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n			\'information\'        => isset($this->request->get[\'information\']) ? $this->request->get[\'information\'] : \'\',\n			\'filter_information\' => $filter_information,\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n				\'name\'       => $result[\'name\'],\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n				\'name\'       => isset($result[\'name\']) ? $result[\'name\'] : \'\',\n				\'title\'      => isset($result[\'title\']) ? $result[\'title\'] : \'\',\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$data[\'sort_product\'] = $this->url->link(\'catalog/review\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&sort=pd.name\' . $url, true);\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		$data[\'sort_information\'] = $this->url->link(\'catalog/review\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&sort=id.title\' . $url, true);\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$data[\'filter_product\'] = $filter_product;\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		$url = \'\';\n\n		if (isset($this->request->get[\'sort\'])) {\n			$url .= \'&sort=\' . $this->request->get[\'sort\'];\n		}\n\n		if (isset($this->request->get[\'order\'])) {\n			$url .= \'&order=\' . $this->request->get[\'order\'];\n		}\n\n		if (isset($this->request->get[\'information\'])) {\n			$data[\'information\'] = true;\n			$data[\'type_url\'] = $this->url->link(\'catalog/review\', \'user_token=\' . $this->session->data[\'user_token\'] . $url, true);\n		} else {\n			$data[\'information\'] = false;\n			$data[\'type_url\'] = $this->url->link(\'catalog/review\', \'user_token=\' . $this->session->data[\'user_token\'] . \'&information=1\' . $url, true);\n		}\n		\n		$data[\'filter_information\'] = $filter_information;\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		if (isset($this->error[\'author\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (isset($this->error[\'information\'])) {\n			$data[\'error_information\'] = $this->error[\'information\'];\n		} else {\n			$data[\'error_information\'] = \'\';\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		if (isset($this->request->post[\'author\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (isset($this->request->post[\'information_id\'])) {\n			$data[\'information_id\'] = $this->request->post[\'information_id\'];\n		} elseif (!empty($review_info)) {\n			$data[\'information_id\'] = $review_info[\'information_id\'];\n		} else {\n			$data[\'information_id\'] = \'\';\n		}\n\n		if (isset($this->request->post[\'information\'])) {\n			$data[\'information\'] = $this->request->post[\'information\'];\n		} elseif (!empty($review_info)) {\n			$data[\'information\'] = $review_info[\'information\'];\n		} else {\n			$data[\'information\'] = \'\';\n		}\n\n		if (isset($this->request->get[\'information\'])) {\n			$data[\'information_type\'] = 1;\n		} else {\n			$data[\'information_type\'] = 0;\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		if (!$this->request->post[\'product_id\']) {\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		if (isset($this->request->post[\'product_id\']) && empty($this->request->post[\'product_id\'])) {\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n			$this->error[\'product\'] = $this->language->get(\'error_product\');\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		} elseif (isset($this->request->post[\'information_id\']) && empty($this->request->post[\'information_id\'])) {\n			$this->error[\'information\'] = $this->language->get(\'error_information\');\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/model/catalog/review.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[product_id = \'\" . (int)$data[\'product_id\'] . \"\']]></search>\n        <add position=\"replace\"><![CDATA[product_id = \'\" . (isset($data[\'product_id\']) ? (int)$data[\'product_id\'] : \'\') . \"\', information_id = \'\" . (isset($data[\'information_id\']) ? (int)$data[\'information_id\'] : \'\') . \"\']]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[text = \'\" . $this->db->escape(strip_tags($data[\'text\'])) . \"\']]></search>\n        <add position=\"replace\"><![CDATA[text = \'\" . $this->db->escape(strip_tags($data[\'text\'])) . \"\', reply = \'\" . $this->db->escape(strip_tags($data[\'reply\'])) . \"\']]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[AS product]]></search>\n        <add position=\"replace\"><![CDATA[AS product, (SELECT id.title FROM \" . DB_PREFIX . \"information_description id WHERE id.information_id = r.information_id AND id.language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\') AS information]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"0\"><![CDATA[\n		if (!empty($data[\'filter_author\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (!empty($data[\'information\'])) {\n			$sql = \"SELECT r.review_id, id.title, r.author, r.rating, r.status, r.date_added FROM \" . DB_PREFIX . \"review r LEFT JOIN \" . DB_PREFIX . \"information_description id ON (r.information_id = id.information_id) WHERE id.language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\'\";\n\n			if (!empty($data[\'filter_information\'])) {\n				$sql .= \" AND id.title LIKE \'\" . $this->db->escape($data[\'filter_information\']) . \"%\'\";\n			}\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"1\"><![CDATA[\n		if (!empty($data[\'filter_author\'])) {\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n		if (!empty($data[\'information\'])) {\n			$sql = \"SELECT COUNT(*) AS total FROM \" . DB_PREFIX . \"review r LEFT JOIN \" . DB_PREFIX . \"information_description id ON (r.information_id = id.information_id) WHERE id.language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\'\";\n\n			if (!empty($data[\'filter_information\'])) {\n				$sql .= \" AND id.title LIKE \'\" . $this->db->escape($data[\'filter_information\']) . \"%\'\";\n			}\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$sort_data = array(\n        ]]></search>\n        <add position=\"after\"><![CDATA[			\'id.title\',]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"0\"><![CDATA[\n		$this->cache->delete(\'product\');\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		if (isset($data[\'product_id\'])) {\n			$this->cache->delete(\'product\');\n		}\n\n		if (isset($data[\'information_id\'])) {\n			$this->cache->delete(\'information\');\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"1\"><![CDATA[\n		$this->cache->delete(\'product\');\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		if (isset($data[\'product_id\'])) {\n			$this->cache->delete(\'product\');\n		}\n\n		if (isset($data[\'information_id\'])) {\n			$this->cache->delete(\'information\');\n		}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"2\"><![CDATA[\n		$this->cache->delete(\'product\');\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n		$this->cache->delete(\'product\');\n		$this->cache->delete(\'information\');\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/view/template/catalog/review_form.twig\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n            <label class=\"col-sm-2 control-label\" for=\"input-product\"><span data-toggle=\"tooltip\" title=\"{{ help_product }}\">{{ entry_product }}</span></label>\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n            {% if information_type %}\n            <label class=\"col-sm-2 control-label\" for=\"input-information\"><span data-toggle=\"tooltip\" title=\"{{ help_information }}\">{{ entry_information }}</span></label>\n            <div class=\"col-sm-10\">\n              <input type=\"text\" name=\"information\" value=\"{{ information }}\" placeholder=\"{{ entry_information }}\" id=\"input-information\" class=\"form-control\" />\n              <input type=\"hidden\" name=\"information_id\" value=\"{{ information_id }}\" />\n              {% if error_information %}\n              <div class=\"text-danger\">{{ error_information }}</div>\n              {% endif %} </div>\n            {% else %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n              <div class=\"text-danger\">{{ error_product }}</div>\n        ]]></search>\n        <add position=\"after\" offset=\"1\"><![CDATA[\n            {% endif %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"3\"><![CDATA[\n          <div class=\"form-group required\">\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n          <div class=\"form-group\">\n            <label class=\"col-sm-2 control-label\" for=\"input-reply\">{{ entry_reply }}</label>\n            <div class=\"col-sm-10\">\n              <textarea name=\"reply\" cols=\"60\" rows=\"8\" placeholder=\"{{ entry_reply }}\" id=\"input-reply\" data-toggle=\"summernote\" data-lang=\"{{ summernote }}\" class=\"form-control\">{{ reply }}</textarea>\n            </div>\n          </div>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n$(\'input[name=\\\'product\\\']\').autocomplete({\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n$(\'input[name=\\\'information\\\']\').autocomplete({\n	\'source\': function(request, response) {\n		$.ajax({\n			url: \'index.php?route=catalog/information/autocomplete&user_token={{ user_token }}&filter_name=\' +  encodeURIComponent(request),\n			dataType: \'json\',			\n			success: function(json) {\n				response($.map(json, function(item) {\n					return {\n						label: item[\'title\'],\n						value: item[\'information_id\']\n					}\n				}));\n			}\n		});\n	},\n	\'select\': function(item) {\n		$(\'input[name=\\\'information\\\']\').val(item[\'label\']);\n		$(\'input[name=\\\'information_id\\\']\').val(item[\'value\']);		\n	}	\n});\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search index=\"0\"><![CDATA[\n  <script type=\"text/javascript\"><!--\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n  <link href=\"view/javascript/codemirror/lib/codemirror.css\" rel=\"stylesheet\" />\n  <link href=\"view/javascript/codemirror/theme/monokai.css\" rel=\"stylesheet\" />\n  <script type=\"text/javascript\" src=\"view/javascript/codemirror/lib/codemirror.js\"></script> \n  <script type=\"text/javascript\" src=\"view/javascript/codemirror/lib/xml.js\"></script> \n  <script type=\"text/javascript\" src=\"view/javascript/codemirror/lib/formatting.js\"></script> \n  <script type=\"text/javascript\" src=\"view/javascript/summernote/summernote.js\"></script>\n  <link href=\"view/javascript/summernote/summernote.css\" rel=\"stylesheet\" />\n  <script type=\"text/javascript\" src=\"view/javascript/summernote/summernote-image-attributes.js\"></script> \n  <script type=\"text/javascript\" src=\"view/javascript/summernote/opencart.js\"></script> \n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/view/template/catalog/review_list.twig\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n      <div class=\"pull-right\">\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n        <div class=\"btn-group\">\n          {% if information %}\n          <span class=\"btn btn-default\" data-toggle=\"tooltip\" title=\"{{ entry_review_information }}\"><i class=\"fa fa-file-text-o fa-fw\"></i></span>\n          <button type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">{{ entry_review_information }} <span class=\"caret\"></span></button>\n          <ul class=\"dropdown-menu dropdown-menu-right\"><li><a href=\"{{ type_url }}\"><i class=\"fa fa-shopping-cart fa-fw\"></i> {{ entry_review_product }}</a></li></ul>\n          {% else %}\n          <span class=\"btn btn-default\" data-toggle=\"tooltip\" title=\"{{ entry_review_product }}\"><i class=\"fa fa-shopping-cart fa-fw\"></i></span>\n          <button type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">{{ entry_review_product }} <span class=\"caret\"></span></button>\n          <ul class=\"dropdown-menu dropdown-menu-right\"><li><a href=\"{{ type_url }}\"><i class=\"fa fa-file-text-o fa-fw\"></i> {{ entry_review_information }}</a></li></ul>\n          {% endif %}\n        </div>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n              <label class=\"control-label\" for=\"input-product\">{{ entry_product }}</label>\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n              {% if information %}\n              <label class=\"control-label\" for=\"input-information\">{{ entry_information }}</label>\n              <input type=\"text\" name=\"filter_information\" value=\"{{ filter_information }}\" placeholder=\"{{ entry_information }}\" id=\"input-product\" class=\"form-control\" />\n              {% else %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n              <input type=\"text\" name=\"filter_product\" value=\"{{ filter_product }}\" placeholder=\"{{ entry_product }}\" id=\"input-product\" class=\"form-control\" />\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n              {% endif %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                      <td style=\"width: 1px;\" class=\"text-center\"><input type=\"checkbox\" onclick=\"$(\'input[name*=\\\'selected\\\']\').prop(\'checked\', this.checked);\" /></td>\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n                      {% if information %}\n                      <td class=\"text-left\">{% if sort == \'id.title\' %} <a href=\"{{ sort_information }}\" class=\"{{ order|lower }}\">{{ column_information }}</a> {% else %} <a href=\"{{ sort_information }}\">{{ column_information }}</a> {% endif %}</td>\n                      {% else %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                      <td class=\"text-left\">{% if sort == \'pd.name\' %} <a href=\"{{ sort_product }}\" class=\"{{ order|lower }}\">{{ column_product }}</a> {% else %} <a href=\"{{ sort_product }}\">{{ column_product }}</a> {% endif %}</td>\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n                      {% endif %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n                    <td class=\"text-left\">{{ review.name }}</td>\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n                    {% if information %}\n                    <td class=\"text-left\">{{ review.title }}</td>\n                    {% else %}\n                    <td class=\"text-left\">{{ review.name }}</td>\n                    {% endif %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	var filter_product = $(\'input[name=\\\'filter_product\\\']\').val();\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n    {% if information %}\n	url += \'&information=1\';\n\n	var filter_information = $(\'input[name=\\\'filter_information\\\']\').val();\n	\n	if (filter_information) {\n		url += \'&filter_information=\' + encodeURIComponent(filter_information);\n	}\n    {% else %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n	var filter_author = $(\'input[name=\\\'filter_author\\\']\').val();\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n    {% endif %}\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Report -->\n  <file path=\"admin/controller/extension/report/customer_search.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n				\'products\'    => $result[\'products\'],\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n				\'informations\' => $result[\'informations\'],\n        ]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/model/extension/report/customer.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[cs.products,]]></search>\n        <add position=\"replace\"><![CDATA[cs.products, cs.informations,]]></add>\n      </operation>\n  </file>\n\n  <file path=\"admin/view/template/extension/report/customer_search_info.twig\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n                <td class=\"text-left\">{{ column_products }}</td>\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n                <td class=\"text-left\">{{ column_informations }}</td>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n              <td class=\"text-left\">{{ search.products }}</td>\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n              <td class=\"text-left\">{{ search.informations }}</td>\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[colspan=\"6\"]]></search>\n        <add position=\"replace\"><![CDATA[colspan=\"7\"]]></add>\n      </operation>\n  </file>\n\n<!-- optimblog-category.ocmod -->\n\n  <!-- Category -->\n  <file path=\"catalog/controller/product/category.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[utf8_substr(trim(strip_tags(html_entity_decode($result[\'description\']]]></search>\n        <add position=\"replace\"><![CDATA[!empty($result[\'short_description\']) ? trim(html_entity_decode($result[\'short_description\'], ENT_QUOTES, \'UTF-8\')) : utf8_substr(trim(strip_tags(html_entity_decode($result[\'description\']]]></add>\n      </operation>\n  </file>\n\n  <!-- Product -->\n  <file path=\"catalog/controller/product/product.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n				\'text\'       => nl2br($result[\'text\']),\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n				\'reply\'      => html_entity_decode($result[\'reply\'], ENT_QUOTES, \'UTF-8\'),\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Common Menu -->\n  <file path=\"catalog/controller/common/menu.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$this->load->model(\'catalog/product\');\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		$this->load->model(\'extension/information/optimblog_information\');\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[($this->config->get(\'config_product_count\') ? \' (\' . $this->model_catalog_product->getTotalProducts($filter_data) . \')\' : \'\')]]></search>\n        <add position=\"replace\"><![CDATA[($category[\'information\'] ? ($category[\'information\'] && $this->config->get(\'information_optimblog_information_count\') ? \' (\' . $this->model_extension_information_optimblog_information->getTotalInformations($filter_data) . \')\' : \'\') : ($this->config->get(\'config_product_count\') ? \' (\' . $this->model_catalog_product->getTotalProducts($filter_data) . \')\' : \'\'))]]></add>\n      </operation>\n  </file>\n\n  <!-- Information Sitemap -->\n  <file path=\"catalog/controller/information/sitemap.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n		foreach ($categories_1 as $category_1) {\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n			if ($category_1[\'information\']) {\n				$level_2_data = array();\n\n				$categories_2 = $this->model_catalog_category->getCategories($category_1[\'category_id\']);\n\n				foreach ($categories_2 as $category_2) {\n					$level_3_data = array();\n\n					$categories_3 = $this->model_catalog_category->getCategories($category_2[\'category_id\']);\n\n					foreach ($categories_3 as $category_3) {\n					$level_3_data[] = array(\n							\'name\' => $category_3[\'name\'],\n							\'href\' => $this->url->link(\'product/category\', \'path=\' . $category_1[\'category_id\'] . \'_\' . $category_2[\'category_id\'] . \'_\' . $category_3[\'category_id\'])\n						);\n					}\n\n					$level_2_data[] = array(\n						\'name\'     => $category_2[\'name\'],\n						\'children\' => $level_3_data,\n						\'href\'     => $this->url->link(\'product/category\', \'path=\' . $category_1[\'category_id\'] . \'_\' . $category_2[\'category_id\'])\n					);\n				}\n\n				$data[\'information_categories\'][] = array(\n					\'name\'     => $category_1[\'name\'],\n					\'children\' => $level_2_data,\n					\'href\'     => $this->url->link(\'product/category\', \'path=\' . $category_1[\'category_id\'])\n				);\n\n				continue;\n			}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		$this->load->model(\'catalog/information\');\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n		$this->load->model(\'extension/information/optimblog_information\');\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n		foreach ($this->model_catalog_information->getInformations() as $result) {\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n			if ($this->model_extension_information_optimblog_information->getMainCategory($result[\'information_id\'])) {\n				continue;\n			}\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Product Search -->\n  <file path=\"catalog/controller/product/search.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n		foreach ($categories_1 as $category_1) {\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n			if ($category_1[\'information\']) {\n				continue;\n			}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n					\'products\'      => $product_total,\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n					\'informations\'  => 0,\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Account Search -->\n  <file path=\"catalog/model/account/search.php\">\n  	  <operation error=\"skip\">\n        <search><![CDATA[`products` = \'\" . (int)$data[\'products\'] . \"\',]]></search>\n        <add position=\"replace\"><![CDATA[`products` = \'\" . (int)$data[\'products\'] . \"\', `informations` = \'\" . (int)$data[\'informations\'] . \"\',]]></add>\n      </operation>\n  </file>\n\n  <!-- Module Category -->\n  <file path=\"catalog/controller/extension/module/category.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n		foreach ($categories as $category) {\n        ]]></search>\n        <add position=\"after\"><![CDATA[\n			if ($category[\'information\']) {\n				continue;\n			}\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Seo Url -->\n  <file path=\"catalog/controller/startup/seo_url.php\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n				} elseif (isset($this->request->get[\'path\'])) {\n        ]]></search>\n        <add position=\"replace\"><![CDATA[\n				} elseif (isset($this->request->get[\'path\']) && !isset($this->request->get[\'information_id\'])) {\n        ]]></add>\n      </operation>\n  </file>\n\n\n<!-- optimblog-category-theme-default.ocmod -->\n\n  <!-- Information -->\n  <file path=\"catalog/view/theme/default/template/information/information.twig\">\n      <operation error=\"skip\">\n        <search><![CDATA[{{ description }}]]></search>\n        <add position=\"replace\"><![CDATA[\n      {% if not information_exclusion %}\n      <ul class=\"list-inline text-muted\">\n        {% if show_date %}\n        <li><i class=\"fa fa-calendar-o\" aria-hidden=\"true\"></i> {{ date_added }}</li>\n        {% endif %}\n        {% if show_author %}\n        <li><i class=\"fa fa-user-o\" aria-hidden=\"true\"></i> {{ author }}</li>\n        {% endif %}\n        {% if manufacturer and show_manufacturer %}\n        <li>{{ text_manufacturer }} <a href=\"{{ manufacturers }}\">{{ manufacturer }}</a></li>\n        {% endif %}\n        {% if show_review %}\n        <li><a href=\"\" onclick=\"$(\'html, body\').animate({ scrollTop: $(\'#review\').offset().top }, \'slow\'); return false;\"><i class=\"fa fa-comment-o\" aria-hidden=\"true\"></i> {{ reviews }}</a></li>\n        <li class=\"rating\">{% for i in 1..5 %}\n          {% if rating < i %}<span class=\"fa fa-stack\"><i class=\"fa fa-star-o fa-stack-1x\"></i></span>{% else %}<span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-1x\"></i><i class=\"fa fa-star-o fa-stack-1x\"></i></span>{% endif %}\n          {% endfor %}</li>\n        {% endif %}\n      </ul>\n      {% endif %}\n      {% if thumb and not images %}\n      <div class=\"images\">\n        <a class=\"thumbnail\" href=\"{{ popup }}\" title=\"{{ heading_title }}\"><img src=\"{{ thumb }}\" title=\"{{ heading_title }}\" alt=\"{{ heading_title }}\" class=\"img-responsive\" /></a>\n      </div>\n      {% elseif not thumb and images|length == 1 %}\n      <div class=\"images\">\n      {% for image in images %}\n        <a class=\"thumbnail\" href=\"{{ image.popup }}\" title=\"{{ heading_title }}\"> <img src=\"{{ image.thumb }}\" title=\"{{ heading_title }}\" alt=\"{{ heading_title }}\" /></a>\n      {% endfor %}\n      </div>\n      {% elseif images|length > 1 %}\n      <div class=\"swiper-viewport\">\n        <div id=\"slideshow-information\" class=\"swiper-container\">\n          <div class=\"swiper-wrapper images\">\n            {% if thumb %}\n            <div class=\"swiper-slide text-center\">\n              <a href=\"{{ popup }}\" title=\"{{ heading_title }}\"><img src=\"{{ thumb }}\" title=\"{{ heading_title }}\" alt=\"{{ heading_title }}\" class=\"img-responsive\" /></a>\n            </div>\n            {% endif %}\n            {% for image in images %}\n            <div class=\"swiper-slide text-center\">\n              <a href=\"{{ image.popup }}\" title=\"{{ heading_title }}\"><img src=\"{{ image.thumb }}\" title=\"{{ heading_title }}\" alt=\"{{ heading_title }}\" class=\"img-responsive\" /></a>\n            </div>\n            {% endfor %}\n          </div>\n        </div>\n        <div class=\"swiper-pagination slideshow-information\"></div>\n        <div class=\"swiper-pager\">\n          <div class=\"swiper-button-next\"></div>\n          <div class=\"swiper-button-prev\"></div>\n        </div>\n      </div>\n      <script type=\"text/javascript\"><!--\n      $(\'#slideshow-information\').swiper({\n      	mode: \'horizontal\',\n      	slidesPerView: 1,\n      	pagination: \'.slideshow-information\',\n      	paginationClickable: true,\n      	nextButton: \'.swiper-button-next\',\n      	prevButton: \'.swiper-button-prev\',\n      	spaceBetween: 30,\n      	autoplay: 5000,\n      	autoplayDisableOnInteraction: true\n      });\n      --></script>\n      {% endif %}\n	  {{ description }}\n      {% if attribute_groups %}\n      <div id=\"specification\">\n        <h3>{{ text_attribute }}</h3>\n        <table class=\"table table-bordered\">\n          {% for attribute_group in attribute_groups %}\n          <thead>\n            <tr>\n              <td colspan=\"2\"><strong>{{ attribute_group.name }}</strong></td>\n            </tr>\n          </thead>\n          <tbody>\n            {% for attribute in attribute_group.attribute %}\n            <tr>\n              <td>{{ attribute.name }}</td>\n              <td>{{ attribute.text }}</td>\n            </tr>\n            {% endfor %}\n          </tbody>\n          {% endfor %}\n        </table>\n      </div>\n      {% endif %}\n      {% if show_review and not information_exclusion %}\n      <h3>{{ text_review }}</h3>\n      <div id=\"review\"></div>\n      {% endif %}\n      {% if review_status and not information_exclusion %}\n      <form class=\"form-horizontal\" id=\"form-review\">\n        <h4>{{ text_write }}</h4>\n        {% if review_guest %}\n        <div class=\"form-group required\">\n          <div class=\"col-sm-12\">\n            <label class=\"control-label\" for=\"input-name\">{{ entry_name }}</label>\n            <input type=\"text\" name=\"name\" value=\"{{ customer_name }}\" id=\"input-name\" class=\"form-control\" />\n          </div>\n        </div>\n        <div class=\"form-group required\">\n          <div class=\"col-sm-12\">\n            <label class=\"control-label\" for=\"input-review\">{{ entry_review }}</label>\n            <textarea name=\"text\" rows=\"5\" id=\"input-review\" class=\"form-control\"></textarea>\n            <div class=\"help-block\">{{ text_note }}</div>\n          </div>\n        </div>\n        <div class=\"form-group required\">\n          <div class=\"col-sm-12\">\n            <label class=\"control-label\">{{ entry_rating }}</label>\n            &nbsp;&nbsp;&nbsp; {{ entry_bad }}&nbsp;\n            <input type=\"radio\" name=\"rating\" value=\"1\" />\n            &nbsp;\n            <input type=\"radio\" name=\"rating\" value=\"2\" />\n            &nbsp;\n            <input type=\"radio\" name=\"rating\" value=\"3\" />\n            &nbsp;\n            <input type=\"radio\" name=\"rating\" value=\"4\" />\n            &nbsp;\n            <input type=\"radio\" name=\"rating\" value=\"5\" />\n            &nbsp;{{ entry_good }}</div>\n        </div>\n        {{ captcha }}\n        <div class=\"buttons clearfix\">\n          <div class=\"pull-right\">\n            <button type=\"button\" id=\"button-review\" data-loading-text=\"{{ text_loading }}\" class=\"btn btn-primary\">{{ button_continue }}</button>\n          </div>\n        </div>\n        {% else %}\n        {{ text_login }}\n        {% endif %}\n      </form>\n      {% endif %}\n      {% if tags %}\n      <p>{{ text_tags }}\n      {% for i in 0..tags|length %}\n      {% if i < (tags|length - 1) %} <a href=\"{{ tags[i].href }}\">{{ tags[i].tag }}</a>,\n      {% else %} <a href=\"{{ tags[i].href }}\">{{ tags[i].tag }}</a> {% endif %}\n      {% endfor %} </p>\n      {% endif %}\n      <hr>\n      {{ share }}\n\n      {% if informations %}\n      <h3>{{ text_related }}</h3>\n      <div class=\"row\"> {% set i = 0 %}\n        {% for information in informations %}\n        {% if column_left and column_right %}\n        {% set class = \'col-xs-8 col-sm-6\' %}\n        {% elseif column_left or column_right %}\n        {% set class = \'col-xs-6 col-md-4\' %}\n        {% else %}\n        {% set class = \'col-xs-6 col-sm-3\' %}\n        {% endif %}\n        <div class=\"{{ class }}\">\n          <div class=\"thumbnail\">\n            <div class=\"image\"><a href=\"{{ information.href }}\"><img src=\"{{ information.thumb }}\" alt=\"{{ information.name }}\" title=\"{{ information.name }}\" class=\"img-responsive\" /></a></div>\n            <div class=\"caption\">\n              <h4><a href=\"{{ information.href }}\">{{ information.title }}</a></h4>\n              {% if show_related_author or show_related_date or show_related_review %}\n              <ul class=\"list-inline text-muted small\">\n                {% if show_related_date %}\n                <li><i class=\"fa fa-calendar-o\" aria-hidden=\"true\"></i> {{ information.date_added }}</li>\n                {% endif %}\n                {% if show_related_author %}\n                <li><i class=\"fa fa-user-o\" aria-hidden=\"true\"></i> {{ information.author }}</li>\n                {% endif %}\n                {% if show_related_review %}\n                <li><i class=\"fa fa-comment-o\" aria-hidden=\"true\"></i> {{ information.reviews }}</li>\n                {% endif %}\n                {% if information.rating %}\n                <li class=\"rating\"> {% for j in 1..5 %}\n                  {% if information.rating < j %} <span class=\"fa fa-stack\"><i class=\"fa fa-star-o fa-stack-1x\"></i></span> {% else %} <span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-1x\"></i><i class=\"fa fa-star-o fa-stack-1x\"></i></span> {% endif %}\n                  {% endfor %}</li>\n                {% endif %}\n              </ul>\n              {% endif %}\n              <p>{{ information.description }}</p>\n              <a href=\"{{ information.href }}\" class=\"btn btn-primary btn-xs\" role=\"button\">{{ text_read }}</a>\n            </div>\n          </div>\n        </div>\n        {% if column_left and column_right and (i + 1) % 2 == 0 %}\n        <div class=\"clearfix visible-md visible-sm\"></div>\n        {% elseif column_left or column_right and (i + 1) % 3 == 0 %}\n        <div class=\"clearfix visible-md\"></div>\n        {% elseif (i + 1) % 4 == 0 %}\n        <div class=\"clearfix visible-md\"></div>\n        {% endif %}\n        {% set i = i + 1 %}\n        {% endfor %} </div>\n        {% endif %}\n      {% if products %}\n      <h3>{{ text_related_product }}</h3>\n      <div class=\"row\"> {% set i = 0 %}\n        {% for product in products %}\n        {% if column_left and column_right %}\n        {% set class = \'col-xs-8 col-sm-6\' %}\n        {% elseif column_left or column_right %}\n        {% set class = \'col-xs-6 col-md-4\' %}\n        {% else %}\n        {% set class = \'col-xs-6 col-sm-3\' %}\n        {% endif %}\n        <div class=\"{{ class }}\">\n          <div class=\"product-thumb transition\">\n            <div class=\"image\"><a href=\"{{ product.href }}\"><img src=\"{{ product.thumb }}\" alt=\"{{ product.name }}\" title=\"{{ product.name }}\" class=\"img-responsive\" /></a></div>\n            <div class=\"caption\">\n              <h4><a href=\"{{ product.href }}\">{{ product.name }}</a></h4>\n              <p>{{ product.description }}</p>\n              {% if product.rating %}\n              <div class=\"rating\"> {% for j in 1..5 %}\n                {% if product.rating < j %} <span class=\"fa fa-stack\"><i class=\"fa fa-star-o fa-stack-1x\"></i></span> {% else %} <span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-1x\"></i><i class=\"fa fa-star-o fa-stack-1x\"></i></span> {% endif %}\n                {% endfor %} </div>\n              {% endif %}\n              {% if product.price %}\n              <p class=\"price\"> {% if not product.special %}\n                {{ product.price }}\n                {% else %} <span class=\"price-new\">{{ product.special }}</span> <span class=\"price-old\">{{ product.price }}</span> {% endif %}\n                {% if product.tax %} <span class=\"price-tax\">{{ text_tax }} {{ product.tax }}</span> {% endif %} </p>\n              {% endif %} </div>\n            <div class=\"button-group\">\n              <button type=\"button\" onclick=\"cart.add(\'{{ product.product_id }}\', \'{{ product.minimum }}\');\"><span class=\"hidden-xs hidden-sm hidden-md\">{{ button_cart }}</span> <i class=\"fa fa-shopping-cart\"></i></button>\n              <button type=\"button\" data-toggle=\"tooltip\" title=\"{{ button_wishlist }}\" onclick=\"wishlist.add(\'{{ product.product_id }}\');\"><i class=\"fa fa-heart\"></i></button>\n              <button type=\"button\" data-toggle=\"tooltip\" title=\"{{ button_compare }}\" onclick=\"compare.add(\'{{ product.product_id }}\');\"><i class=\"fa fa-exchange\"></i></button>\n            </div>\n          </div>\n        </div>\n        {% if column_left and column_right and (i + 1) % 2 == 0 %}\n        <div class=\"clearfix visible-md visible-sm\"></div>\n        {% elseif column_left or column_right and (i + 1) % 3 == 0 %}\n        <div class=\"clearfix visible-md\"></div>\n        {% elseif (i + 1) % 4 == 0 %}\n        <div class=\"clearfix visible-md\"></div>\n        {% endif %}\n        {% set i = i + 1 %}\n        {% endfor %} </div>\n        {% endif %}\n        ]]></add>\n      </operation>\n      <operation error=\"skip\">\n        <search><![CDATA[\n{{ footer }}\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n<script type=\"text/javascript\"><!--\n$(\'#review\').delegate(\'.pagination a\', \'click\', function(e) {\n    e.preventDefault();\n\n    $(\'#review\').fadeOut(\'slow\');\n\n    $(\'#review\').load(this.href);\n\n    $(\'#review\').fadeIn(\'slow\');\n});\n\n$(\'#review\').load(\'index.php?route=information/information/review&information_id={{ information_id }}\');\n\n$(\'#button-review\').on(\'click\', function() {\n	$.ajax({\n		url: \'index.php?route=information/information/write&information_id={{ information_id }}\',\n		type: \'post\',\n		dataType: \'json\',\n		data: $(\"#form-review\").serialize(),\n		beforeSend: function() {\n			$(\'#button-review\').button(\'loading\');\n		},\n		complete: function() {\n			$(\'#button-review\').button(\'reset\');\n		},\n		success: function(json) {\n			$(\'.alert-dismissible\').remove();\n\n			if (json[\'error\']) {\n				$(\'#review\').after(\'<div class=\"alert alert-danger alert-dismissible\"><i class=\"fa fa-exclamation-circle\"></i> \' + json[\'error\'] + \'</div>\');\n			}\n\n			if (json[\'success\']) {\n				$(\'#review\').after(\'<div class=\"alert alert-success alert-dismissible\"><i class=\"fa fa-check-circle\"></i> \' + json[\'success\'] + \'</div>\');\n\n				$(\'input[name=\\\'name\\\']\').val(\'\');\n				$(\'textarea[name=\\\'text\\\']\').val(\'\');\n				$(\'input[name=\\\'rating\\\']:checked\').prop(\'checked\', false);\n			}\n		}\n	});\n});\n\n$(document).ready(function() {\n	$(\'.images\').magnificPopup({\n		type:\'image\',\n		delegate: \'a\',\n		gallery: {\n			enabled: true\n		}\n	});\n});\n//--></script> \n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Product -->\n  <file path=\"catalog/view/theme/default/template/product/product.twig\">\n      <operation error=\"skip\">\n        <search><![CDATA[\n        {% if tags %}\n        ]]></search>\n        <add position=\"before\"><![CDATA[\n      {% if informations %}\n      <h3>{{ text_related_information }}</h3>\n      <div class=\"row\"> {% set i = 0 %}\n        {% for information in informations %}\n        {% if column_left and column_right %}\n        {% set class = \'col-xs-8 col-sm-6\' %}\n        {% elseif column_left or column_right %}\n        {% set class = \'col-xs-6 col-md-4\' %}\n        {% else %}\n        {% set class = \'col-xs-6 col-sm-3\' %}\n        {% endif %}\n        <div class=\"{{ class }}\">\n          <div class=\"thumbnail\">\n            <div class=\"image\"><a href=\"{{ information.href }}\"><img src=\"{{ information.thumb }}\" alt=\"{{ information.name }}\" title=\"{{ information.name }}\" class=\"img-responsive\" /></a></div>\n            <div class=\"caption\">\n              <h4><a href=\"{{ information.href }}\">{{ information.title }}</a></h4>\n              {% if show_related_author or show_related_date or show_related_review %}\n              <ul class=\"list-inline text-muted small\">\n                {% if show_related_date %}\n                <li><i class=\"fa fa-calendar-o\" aria-hidden=\"true\"></i> {{ information.date_added }}</li>\n                {% endif %}\n                {% if show_related_author %}\n                <li><i class=\"fa fa-user-o\" aria-hidden=\"true\"></i> {{ information.author }}</li>\n                {% endif %}\n                {% if show_related_review %}\n                <li><i class=\"fa fa-comment-o\" aria-hidden=\"true\"></i> {{ information.reviews }}</li>\n                {% endif %}\n                {% if information.rating %}\n                <li class=\"rating\"> {% for j in 1..5 %}\n                  {% if information.rating < j %} <span class=\"fa fa-stack\"><i class=\"fa fa-star-o fa-stack-1x\"></i></span> {% else %} <span class=\"fa fa-stack\"><i class=\"fa fa-star fa-stack-1x\"></i><i class=\"fa fa-star-o fa-stack-1x\"></i></span> {% endif %}\n                  {% endfor %}</li>\n                {% endif %}\n              </ul>\n              {% endif %}\n              <p>{{ information.description }}</p>\n              <a href=\"{{ information.href }}\" class=\"btn btn-primary btn-xs\" role=\"button\">{{ text_read }}</a>\n            </div>\n          </div>\n        </div>\n        {% if column_left and column_right and (i + 1) % 2 == 0 %}\n        <div class=\"clearfix visible-md visible-sm\"></div>\n        {% elseif column_left or column_right and (i + 1) % 3 == 0 %}\n        <div class=\"clearfix visible-md\"></div>\n        {% elseif (i + 1) % 4 == 0 %}\n        <div class=\"clearfix visible-md\"></div>\n        {% endif %}\n        {% set i = i + 1 %}\n        {% endfor %} </div>\n        {% endif %}\n        ]]></add>\n      </operation>\n  </file>\n\n  <!-- Review -->\n  <file path=\"catalog/view/theme/default/template/product/review.twig\">\n      <operation error=\"skip\">\n        <search><![CDATA[{% endfor %}</td>]]></search>\n        <add position=\"replace\"><![CDATA[{% endfor %}\n      {% if review.reply %}\n      <div class=\"well well-sm\">{{ review.reply }}</div>\n      {% endif %}\n    </td>]]></add>\n      </operation>\n  </file>\n\n  <!-- Information Sitemap -->\n  <file path=\"catalog/view/theme/default/template/information/sitemap.twig\">\n      <operation error=\"skip\">\n        <search index=\"6\"><![CDATA[</ul>]]></search>\n        <add position=\"before\"><![CDATA[\n            {% for category_1 in information_categories %}\n            <li><a href=\"{{ category_1.href }}\">{{ category_1.name }}</a>\n              {% if category_1.children %}\n              <ul>\n                {% for category_2 in category_1.children %}\n                <li><a href=\"{{ category_2.href }}\">{{ category_2.name }}</a>\n                  {% if category_2.children %}\n                  <ul>\n                    {% for category_3 in category_2.children %}\n                    <li><a href=\"{{ category_3.href }}\">{{ category_3.name }}</a></li>\n                    {% endfor %}\n                  </ul>\n                  {% endif %}\n                </li>\n                {% endfor %}\n              </ul>\n              {% endif %}\n            </li>\n            {% endfor %}\n        ]]></add>\n      </operation>\n  </file>\n</modification>', 1, '2021-07-07 10:31:09');
INSERT INTO `oc_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(3, 6, 'Localcopy OCMOD Install Fix', 'localcopy-oc3', 'opencart3x.ru', '1.0', 'https://opencart3x.ru', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n  <name>Localcopy OCMOD Install Fix</name>\n  <code>localcopy-oc3</code>\n  <version>1.0</version>\n  <author>opencart3x.ru</author>\n  <link>https://opencart3x.ru</link>\n\n  <file path=\"admin/controller/marketplace/install.php\">\n	<operation>\n      <search>\n        <![CDATA[if ($safe) {]]>\n      </search>\n      <add position=\"before\">\n        <![CDATA[		\n		    $safe = true;\n		    ]]>\n      </add>\n    </operation>\n    <operation>\n      <search>\n        <![CDATA[if (is_dir($file) && !is_dir($path)) {]]>\n      </search>\n      <add position=\"before\">\n        <![CDATA[		\n			  if ($path == \'\') {\n  				$app_root = explode(\'/\',DIR_APPLICATION);\n  				unset($app_root[count($app_root)-2]);\n  				$app_root = implode(\'/\',$app_root);\n  				$path = $app_root . $destination;\n			  }\n		    ]]>\n      </add>\n    </operation>\n  </file> \n</modification>\n', 1, '2021-06-10 15:46:12'),
(4, 8, 'Newsletter Subscription', 'NewsletterSubscription', 'opencart3x.ru', '3.0', 'https://opencart3x.ru/', '<modification>\n    <name>Newsletter Subscription</name>\n    <code>NewsletterSubscription</code>\n    <version>3.0</version>\n    <author>opencart3x.ru</author>\n    <link>https://opencart3x.ru/</link>\n\n    <file path=\"admin/controller/common/column_left.php\">\n        <operation>\n            <search><![CDATA[\n               if ($this->user->hasPermission(\'access\', \'marketing/contact\')) {\n            ]]></search>\n            <add position=\"before\"><![CDATA[\n                if ($this->user->hasPermission(\'access\', \'common/newsletter\')) {       \n                    $marketing[] = array(\n                        \'name\'     => \'Подписчики\',\n                        \'href\'     => $this->url->link(\'common/newsletter\', \'user_token=\' . $this->session->data[\'user_token\'], true),\n                        \'children\' => array()       \n                    );                  \n                }   \n            ]]></add>\n        </operation>\n    </file>\n\n    <file path=\"admin/view/template/marketing/contact.twig\">\n            <operation>\n                <search><![CDATA[<option value=\"product\">{{ text_product }}</option>]]></search>\n                <add position=\"after\">\n                <![CDATA[\n                    <option value=\"only_newsletter\">{{ text_only_newsletter }}</option>\n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/language/en-gb/marketing/contact.php\">\n            <operation>\n                <search><![CDATA[$_[\'text_product\']]]></search>\n                <add position=\"before\">\n                <![CDATA[\n                    $_[\'text_only_newsletter\']      = \'Subscribers from module\';\n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/language/ru-ru/marketing/contact.php\">\n            <operation>\n                <search><![CDATA[$_[\'text_product\']]]></search>\n                <add position=\"before\">\n                <![CDATA[\n                    $_[\'text_only_newsletter\']      = \'Подписчики из модуля\';\n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/controller/marketing/contact.php\">\n            <operation>\n                <search><![CDATA[$email_total = $this->model_customer_customer->getTotalCustomers($customer_data);]]></search>\n                <add position=\"replace\">\n                <![CDATA[\n                    $email_total = $this->model_customer_customer->getTotalCustomersEmail($customer_data);\n                    \n                    $results_emails = $this->model_customer_customer->getCustomersEmail($customer_data);\n                                                \n                    foreach ($results_emails as $result) {\n            $emails[] = $result[\'email\'];\n                    }\n                    \n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/controller/marketing/contact.php\">\n            <operation>\n                <search><![CDATA[case \'product\':]]></search>\n                <add position=\"before\">\n                <![CDATA[\n                    case \'only_newsletter\':\n                            $customer_data = array(\n                \'start\' => ($page - 1) * 10,\n                \'limit\' => 10\n                            );\n                                                    \n                            $email_total = $this->model_customer_customer->getTotalCustomersEmail($customer_data);\n                    \n                            $results_emails = $this->model_customer_customer->getCustomersEmail($customer_data);\n\n                            foreach ($results_emails as $result) {\n                                $emails[] = $result[\'email\'];\n                            }\n            \n            break;\n                    \n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/model/customer/customer.php\">\n            <operation>\n                <search><![CDATA[public function getTotalCustomers($data = array()) {]]></search>\n                <add position=\"before\">\n                <![CDATA[\n                    public function getTotalCustomersEmail($data = array()) {\n                        $sql = \"SELECT COUNT(*) AS total FROM \" . DB_PREFIX . \"customer\";\n\n                        $implode = array();\n\n                        if (!empty($data[\'filter_name\'])) {\n                                $implode[] = \"CONCAT(firstname, \' \', lastname) LIKE \'%\" . $this->db->escape($data[\'filter_name\']) . \"%\'\";\n                        }\n\n                        if (!empty($data[\'filter_email\'])) {\n                                $implode[] = \"email LIKE \'\" . $this->db->escape($data[\'filter_email\']) . \"%\'\";\n                        }\n\n                        if (isset($data[\'filter_newsletter\']) && !is_null($data[\'filter_newsletter\'])) {\n                                $implode[] = \"newsletter = \'\" . (int)$data[\'filter_newsletter\'] . \"\'\";\n                        }\n\n                        if (!empty($data[\'filter_customer_group_id\'])) {\n                                $implode[] = \"customer_group_id = \'\" . (int)$data[\'filter_customer_group_id\'] . \"\'\";\n                        }\n\n                        if (!empty($data[\'filter_ip\'])) {\n                                $implode[] = \"customer_id IN (SELECT customer_id FROM \" . DB_PREFIX . \"customer_ip WHERE ip = \'\" . $this->db->escape($data[\'filter_ip\']) . \"\')\";\n                        }\n\n                        if (isset($data[\'filter_status\']) && !is_null($data[\'filter_status\'])) {\n                                $implode[] = \"status = \'\" . (int)$data[\'filter_status\'] . \"\'\";\n                        }\n\n                        if (isset($data[\'filter_approved\']) && !is_null($data[\'filter_approved\'])) {\n                                $implode[] = \"approved = \'\" . (int)$data[\'filter_approved\'] . \"\'\";\n                        }\n\n                        if (!empty($data[\'filter_date_added\'])) {\n                                $implode[] = \"DATE(date_added) = DATE(\'\" . $this->db->escape($data[\'filter_date_added\']) . \"\')\";\n                        }\n\n                        if ($implode) {\n                                $sql .= \" WHERE \" . implode(\" AND \", $implode);\n                        }\n\n                        $query = $this->db->query($sql);\n\n                        $registerd_total = $query->row[\'total\'];\n\n                        $sql_email = \"SELECT COUNT(email) AS total FROM \" . DB_PREFIX . \"newsletter\";\n\n                        $query_email = $this->db->query($sql_email);\n\n                        $subcribe_total = $query_email->row[\'total\'];\n\n                        $final_count = $registerd_total + $subcribe_total;\n\n                        return $final_count;\n                    }\n                    \n                    public function getCustomersEmail($data = array()) {\n        \n                        $sql = \"SELECT email FROM \" . DB_PREFIX . \"newsletter \";\n\n                        if (isset($data[\'start\']) || isset($data[\'limit\'])) {\n                                if ($data[\'start\'] < 0) {\n                                        $data[\'start\'] = 0;\n                                }\n\n                                if ($data[\'limit\'] < 1) {\n                                        $data[\'limit\'] = 20;\n                                }\n\n                                $sql .= \" LIMIT \" . (int)$data[\'start\'] . \",\" . (int)$data[\'limit\'];\n                        }\n\n                        $query = $this->db->query($sql);\n\n                        return $query->rows;\n                    }\n\n                ]]>\n                </add>\n            </operation>\n        </file>\n</modification>', 1, '2021-06-10 15:46:55'),
(5, 10, 'Auto-complete meta tags Title', 'auto_complete_meta_tags_title', 'oc3x.ru', '3.0', 'https://oc3x.ru', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n    <name>Auto-complete meta tags Title</name>\r\n    <code>auto_complete_meta_tags_title</code>\r\n    <version>3.0</version>\r\n    <author>oc3x.ru</author>\r\n    <link>https://oc3x.ru</link>\r\n	\r\n    <file path=\"admin/view/template/catalog/product_form.twig\">\r\n    	<operation>\r\n    		<search><![CDATA[{% if error_meta_title[language.language_id] %}]]></search>\r\n    		<add position=\"before\"><![CDATA[                \r\n                <script type=\"text/javascript\">\r\n                    $(function() {\r\n                        $(\"input[name=\'product_description[{{ language.language_id }}][name]\']\").keyup(function() {\r\n                            $(\"input[name=\'product_description[{{ language.language_id }}][meta_title]\']\").val($(this).val());\r\n                        });\r\n                    });\r\n              </script>\r\n            ]]></add>\r\n    	</operation>\r\n	</file>\r\n\r\n    <file path=\"admin/view/template/catalog/category_form.twig\">\r\n        <operation>\r\n            <search><![CDATA[{% if error_meta_title[language.language_id] %}]]></search>\r\n            <add position=\"before\"><![CDATA[                \r\n                <script type=\"text/javascript\">\r\n                    $(function() {\r\n                        $(\"input[name=\'category_description[{{ language.language_id }}][name]\']\").keyup(function() {\r\n                            $(\"input[name=\'category_description[{{ language.language_id }}][meta_title]\']\").val($(this).val());\r\n                        });\r\n                    });\r\n              </script>\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"admin/view/template/catalog/information_form.twig\">\r\n        <operation>\r\n            <search><![CDATA[{% if error_meta_title[language.language_id] %}]]></search>\r\n            <add position=\"before\"><![CDATA[                \r\n                <script type=\"text/javascript\">\r\n                    $(function() {\r\n                        $(\"input[name=\'information_description[{{ language.language_id }}][title]\']\").keyup(function() {\r\n                            $(\"input[name=\'information_description[{{ language.language_id }}][meta_title]\']\").val($(this).val());\r\n                        });\r\n                    });\r\n              </script>\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n</modification>\r\n', 1, '2021-07-02 15:05:56'),
(7, 12, 'Blog', 'blog', 'prowebber.ru', '3.0', 'https://prowebber.ru', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n	<name>Blog</name>\r\n	<code>blog</code>\r\n	<version>3.0</version>\r\n	<author>prowebber.ru</author>\r\n	<link>https://prowebber.ru</link>\r\n	<file path=\"admin/controller/common/column_left.php\">\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[\r\n			$marketplace = array();\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n			// Blog start\r\n			$blog = array();\r\n			$this->load->language(\'blog/blog\');\r\n            if ($this->user->hasPermission(\'access\', \'blog/blog\')) {\r\n                $blog[] = array(\r\n                    \'name\'     => $this->language->get(\'text_blog_post\'),\r\n                    \'href\'     => $this->url->link(\'blog/blog\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()   \r\n                );\r\n            }\r\n            if ($this->user->hasPermission(\'access\', \'blog/blog_category\')) {\r\n                $blog[] = array(\r\n                    \'name\'     => $this->language->get(\'text_blog_category\'),\r\n                    \'href\'     => $this->url->link(\'blog/blog_category\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()   \r\n                );\r\n            }\r\n            if ($this->user->hasPermission(\'access\', \'blog/blog_comment\')) {\r\n                $blog[] = array(\r\n                    \'name\'     => $this->language->get(\'text_blog_comment\'),\r\n                    \'href\'     => $this->url->link(\'blog/blog_comment\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()   \r\n                );\r\n            }\r\n            if ($this->user->hasPermission(\'access\', \'blog/blog_setting\')) {\r\n                $blog[] = array(\r\n                    \'name\'     => $this->language->get(\'text_blog_setting\'),\r\n                    \'href\'     => $this->url->link(\'blog/blog_setting\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n                    \'children\' => array()   \r\n                );\r\n            }\r\n            if (!empty($blog)) {\r\n				$data[\'menus\'][] = array(\r\n					\'id\'       => \'menu-blog\',\r\n					\'icon\'	   => \'fa-th-list\', \r\n					\'name\'	   => $this->language->get(\'text_blog\'),\r\n					\'href\'     => \'\',\r\n					\'children\' => $blog\r\n				);		\r\n			}\r\n			// Blog ends\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/startup/seo_url.php\">\r\n		<operation error=\"log\">\r\n			<search><![CDATA[\r\n			if ($query->row[\'query\'] && $url[0]\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n			if ($url[0] == \'blog_id\') {$this->request->get[\'blog_id\'] = $url[1]; }\r\n			if ($url[0] == \'blog_category_id\') {\r\n			if (!isset($this->request->get[\'blogpath\'])) {\r\n			$this->request->get[\'blogpath\'] = $url[1];\r\n				} else {\r\n			$this->request->get[\'blogpath\'] .= \'_\' . $url[1];\r\n			}}\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"log\">\r\n			<search><![CDATA[\r\n			!= \'category_id\' && $url[0]\r\n			]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n			!= \'category_id\' && $url[0] != \'blog_category_id\' && $url[0] != \'blog_id\' && $url[0] \r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"log\">\r\n			<search><![CDATA[\r\n			$this->request->get[\'route\'] = \'product/product\';\r\n			]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			} elseif (isset($this->request->get[\'blog_id\'])&&isset($this->request->get[\'page\'])) {\r\n			$this->request->get[\'route\'] = \'blog/blog/comment\';\r\n			} elseif (isset($this->request->get[\'blog_id\'])) {\r\n			$this->request->get[\'route\'] = \'blog/blog\';\r\n			} elseif ($this->request->get[\'_route_\'] ==  \'blog_home\') { \r\n			$this->request->get[\'route\'] = \'blog/home\';\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"log\">\r\n			<search><![CDATA[\r\n			$this->request->get[\'route\'] = \'product/category\';\r\n			]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			} elseif (isset($this->request->get[\'blogpath\'])) {\r\n			$this->request->get[\'route\'] = \'blog/category\';\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"log\">\r\n			<search><![CDATA[\r\n			($data[\'route\'] == \'information/information\' && $key == \'information_id\'))\r\n			]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n			($data[\'route\'] == \'information/information\' && $key == \'information_id\') || ($data[\'route\'] == \'blog/blog\' && $key == \'blog_id\'))\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"log\">\r\n			<search><![CDATA[\r\n			} elseif ($key == \'path\') {\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n			} elseif ($key == \'blogpath\') {\r\n			$blog_categories = explode(\'_\', $value);\r\n			foreach ($blog_categories as $category) {\r\n			$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"seo_url WHERE `query` = \'blog_category_id=\" . (int)$category . \"\' AND `language_id` = \'\" . (int)$this->config->get(\'config_language_id\') . \"\' AND `store_id` = \'\" . (int)$this->config->get(\'config_store_id\') . \"\'\");\r\n			if ($query->num_rows) {\r\n			$url .= \'/\' . $query->row[\'keyword\'];\r\n			} else {\r\n			$url = \'\';\r\n			break;\r\n			}}\r\n			unset($data[$key]);\r\n			} elseif (isset($data[\'route\']) && $data[\'route\'] ==   \'blog/home\') {\r\n			$blog_home = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"seo_url WHERE `query` = \'blog/home\' AND `language_id` = \'\" . (int)$this->config->get(\'config_language_id\') . \"\' AND `store_id` = \'\" . (int)$this->config->get(\'config_store_id\') . \"\'\");\r\n			if ($blog_home->num_rows) {\r\n			$url .= \'/\' . $blog_home->row[\'keyword\'];\r\n			} else {\r\n			$url = \'\';\r\n			}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n		<file path=\"catalog/controller/{common,startup,extension}/seo_pro.php\" error=\"skip\">\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[\r\n			$this->request->get[\'route\'] = \'information/information\';\r\n			]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			} elseif (isset($this->request->get[\'blog_id\'])&&isset($this->request->get[\'page\'])) {\r\n				$this->request->get[\'route\'] = \'blog/blog/comment\';\r\n			} elseif (isset($this->request->get[\'blog_id\'])) {\r\n				$this->request->get[\'route\'] = \'blog/blog\';\r\n			} elseif (isset($this->request->get[\'blog_category_id\'])) {\r\n				$this->request->get[\'route\'] = \'blog/category\';\r\n				$this->request->get[\'blogpath\'] = $this->request->get[\'blog_category_id\'];\r\n				unset($this->request->get[\'blog_category_id\']);\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[\r\n			case \'product/product\':\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n			case \'blog/blog\':\r\n				if (isset($data[\'blog_id\'])) {\r\n					// Whitelist GET parameters\r\n					$tmp = $data;\r\n					$data = array();\r\n					if ($this->config->get(\'config_seo_url_include_path\')) {\r\n						$data[\'blog_category_id\'] = $this->getPathByBlog($tmp[\'blog_id\']);\r\n						if (!$data[\'blog_category_id\']) return $link;\r\n					}\r\n\r\n					$allowed_parameters = array(\r\n						\'blog_id\', \'tracking\',\r\n						// Compatibility with \"OCJ Merchandising Reports\" module.\r\n						// Save and pass-thru module specific GET parameters.\r\n						\'uri\', \'list_type\',\r\n						// Compatibility with Google Analytics\r\n						\'gclid\', \'utm_source\', \'utm_medium\', \'utm_campaign\', \'utm_term\', \'utm_content\',\r\n						\'type\', \'source\', \'block\', \'position\', \'keyword\',\r\n						// Compatibility with Yandex Metrics, Yandex Market\r\n						\'yclid\', \'ymclid\', \'openstat\', \'frommarket\',\r\n						\'openstat_service\', \'openstat_campaign\', \'openstat_ad\', \'openstat_source\',\r\n						// Compatibility with Themeforest Rgen templates (popup with product preview)\r\n						\'urltype\'\r\n						);\r\n					foreach($allowed_parameters as $ap) {\r\n						if (isset($tmp[$ap])) {\r\n							$data[$ap] = $tmp[$ap];\r\n						}\r\n					}\r\n				}\r\n				break;\r\n\r\n			case \'blog/category\':\r\n				if (isset($data[\'blog_category_id\'])) {\r\n					$category = explode(\'_\', $data[\'blog_category_id\']);\r\n					$category = end($category);\r\n					$data[\'blog_category_id\'] = $this->getPathByBlogCategory($category);\r\n					if (!$data[\'blog_category_id\']) return $link;\r\n\r\n					$allowed_parameters = array(\r\n						\'blogpath\', \'blog_category_id\', \'tracking\',\r\n						// Compatibility with \"OCJ Merchandising Reports\" module.\r\n						// Save and pass-thru module specific GET parameters.\r\n						\'uri\', \'list_type\',\r\n						// Compatibility with Google Analytics\r\n						\'gclid\', \'utm_source\', \'utm_medium\', \'utm_campaign\', \'utm_term\', \'utm_content\',\r\n						\'type\', \'source\', \'block\', \'position\', \'keyword\',\r\n						// Compatibility with Yandex Metrics, Yandex Market\r\n						\'yclid\', \'ymclid\', \'openstat\', \'frommarket\',\r\n						\'openstat_service\', \'openstat_campaign\', \'openstat_ad\', \'openstat_source\',\r\n						// Compatibility with Themeforest Rgen templates (popup with product preview)\r\n						\'urltype\'\r\n						);\r\n					foreach($allowed_parameters as $ap) {\r\n						if (isset($tmp[$ap])) {\r\n							$data[$ap] = $tmp[$ap];\r\n						}\r\n					}\r\n				}\r\n				break;\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[\r\n			case \'product/product/review\':\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				case \'blog/blog/comment\':\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[\r\n			case \'order_id\':\r\n			]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				case \'blog_id\':\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[\r\n			case \'path\':\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				case \'blog_category_id\':\r\n				case \'blogpath\':\r\n					$category_path = explode(\'_\', $value);\r\n					$category_id = end($category_path);\r\n					$categories = $this->getPathByBlogCategory($category_id);\r\n					$categories = explode(\'_\', $categories);\r\n					foreach ($categories as $category) {\r\n						$queries[] = \'blog_category_id=\' . $category;\r\n					}\r\n					unset($data[$key]);\r\n					break;\r\n			]]></add>\r\n		</operation>\r\n		<operation error=\"skip\">\r\n			<search><![CDATA[\r\n			private function getPathByProduct($product_id) {\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n			private function getPathByBlog($blog_id) {\r\n				$blog_id = (int)$blog_id;\r\n				if ($blog_id < 1) return false;\r\n\r\n				static $path = null;\r\n				if (!is_array($path)) {\r\n					$path = $this->cache->get(\'blog.seopath\');\r\n					if (!is_array($path)) $path = array();\r\n				}\r\n\r\n				if (!isset($path[$blog_id])) {\r\n					$query = $this->db->query(\"SELECT blog_category_id FROM \" . DB_PREFIX . \"blog_to_category WHERE blog_id = \'\" . $blog_id . \"\' LIMIT 1\");\r\n\r\n					$path[$blog_id] = $this->getPathByBlogCategory($query->num_rows ? (int)$query->row[\'blog_category_id\'] : 0);\r\n\r\n					$this->cache->set(\'blog.seopath\', $path);\r\n				}\r\n\r\n				return $path[$blog_id];\r\n			}\r\n\r\n			private function getPathByBlogCategory($category_id) {\r\n				$category_id = (int)$category_id;\r\n				if ($category_id < 1) return false;\r\n\r\n				static $path = null;\r\n				if (!is_array($path)) {\r\n					$path = $this->cache->get(\'blog_category.seopath\');\r\n					if (!is_array($path)) $path = array();\r\n				}\r\n\r\n				if (!isset($path[$category_id])) {\r\n					$max_level = 10;\r\n\r\n					$sql = \"SELECT CONCAT_WS(\'_\'\";\r\n					for ($i = $max_level-1; $i >= 0; --$i) {\r\n						$sql .= \",t$i.blog_category_id\";\r\n					}\r\n					$sql .= \") AS blogpath FROM \" . DB_PREFIX . \"blog_category t0\";\r\n					for ($i = 1; $i < $max_level; ++$i) {\r\n						$sql .= \" LEFT JOIN \" . DB_PREFIX . \"blog_category t$i ON (t$i.blog_category_id = t\" . ($i-1) . \".parent_id)\";\r\n					}\r\n					$sql .= \" WHERE t0.blog_category_id = \'\" . $category_id . \"\'\";\r\n\r\n					$query = $this->db->query($sql);\r\n\r\n					$path[$category_id] = $query->num_rows ? $query->row[\'blogpath\'] : false;\r\n\r\n					$this->cache->set(\'blog_category.seopath\', $path);\r\n				}\r\n\r\n				return $path[$category_id];\r\n			}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/extension/feed/{google_sitemap,yandex_sitemap}.php\">\r\n		<operation>\r\n			<search><![CDATA[\r\n			$output .= \'</urlset>\';\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n			$this->load->model(\'blog/blog_category\');\r\n			$categories_1 = $this->model_blog_blog_category->getBlogCategories(0);\r\n			foreach ($categories_1 as $category_1) {\r\n				// First level\r\n				$output .= \'<url>\';\r\n				$output .= \'<loc>\' . $this->url->link(\'blog/category\', \'blogpath=\' . $category_1[\'blog_category_id\']) . \'</loc>\';\r\n				$output .= \'<changefreq>weekly</changefreq>\';\r\n				$output .= \'<priority>0.7</priority>\';\r\n				$output .= \'</url>\';\r\n				$categories_2 = $this->model_blog_blog_category->getBlogCategories($category_1[\'blog_category_id\']);\r\n				foreach ($categories_2 as $category_2) {\r\n					// Second level\r\n					$categories_2 = $this->model_blog_blog_category->getBlogCategories(0);\r\n					$output .= \'<url>\';\r\n					$output .= \'<loc>\' . $this->url->link(\'blog/category\', \'blogpath=\' . $category_1[\'blog_category_id\'] . \'_\' . $category_2[\'blog_category_id\']) . \'</loc>\';\r\n					$output .= \'<changefreq>weekly</changefreq>\';\r\n					$output .= \'<priority>0.7</priority>\';\r\n					$output .= \'</url>\';				\r\n				}\r\n			}\r\n\r\n			$this->load->model(\'blog/blog\');\r\n			$blogs = $this->model_blog_blog->getBlogs(array(\'filter_tag\'=>\'\'));\r\n	    	foreach ($blogs as $blog) {\r\n	    		$output .= \'<url>\';\r\n				$output .= \'<loc>\' . $this->url->link(\'blog/blog\', \'blog_id=\' . $blog[\'blog_id\']) . \'</loc>\';\r\n				$output .= \'<changefreq>weekly</changefreq>\';\r\n				$output .= \'<priority>0.5</priority>\';\r\n				$output .= \'</url>\';\r\n			}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/information/sitemap.php\">\r\n		<operation>\r\n			<search><![CDATA[\r\n			$this->load->model(\'catalog/information\');\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n			$this->load->model(\'blog/blog\');\r\n			$data[\'blogs\'] = array();\r\n			$results = $this->model_blog_blog->getBlogs(array(\'filter_tag\'  => \'\'));\r\n	    	foreach ($results as $result) {		\r\n				$data[\'blogs\'][] = array(\r\n				\'title\'      => $result[\'title\'],\r\n				\'href\' => $this->url->link(\'blog/blog\', \'blog_id=\' . $result[\'blog_id\'])\r\n				);\r\n			}\r\n\r\n			$this->load->model(\'blog/blog_category\');\r\n			$categories_1 = $this->model_blog_blog_category->getBlogCategories(0);\r\n			$data[\'categories_1\'] = array();\r\n			foreach ($categories_1 as $category_1) {\r\n				$level_2_data = array();\r\n				$categories_2 = $this->model_blog_blog_category->getBlogCategories($category_1[\'blog_category_id\']);\r\n				foreach ($categories_2 as $category_2) {\r\n					$level_3_data = array();\r\n					// Second level\r\n					$categories_2 = $this->model_blog_blog_category->getBlogCategories(0);		\r\n					$level_2_data[] = array(\r\n						\'name\'    	=> $category_2[\'name\'],\r\n						\'children\'	=> $level_3_data,\r\n						\'href\'    	=> $this->url->link(\'blog/category\', \'blogpath=\' . $category_1[\'blog_category_id\'] . \'_\' . $category_2[\'blog_category_id\'])\r\n						);					\r\n					}\r\n				// First level\r\n				$data[\'blog_categories\'][] = array(\r\n					\'name\'     => $category_1[\'name\'],				\r\n					\'children\' => $level_2_data,\r\n					\'href\'     => $this->url->link(\'blog/category\', \'blogpath=\' . $category_1[\'blog_category_id\'])\r\n				);\r\n			}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/view/theme/*/template/information/sitemap.twig\">\r\n		<operation>\r\n			<search><![CDATA[\r\n			{{ content_bottom }}\r\n			]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n			<hr>\r\n		    <div class=\"row\">\r\n		        <div class=\"col-sm-6\">\r\n		          {% if blog_categories %}\r\n		          <ul class=\"list-unstyled\">\r\n		          	{% for category_1 in blog_categories %}\r\n		              <li><a href=\"{{ category_1.href }}\" >{{ category_1.name }}</a> \r\n		                {% if category_1.children %}\r\n		                <ul>\r\n		                {% for category_2 in category_1.children %}\r\n		                  <li><a href=\"{{ category_2.href }}\">{{ category_2.name }}</a></li>\r\n		                {% endfor %}\r\n		                </ul>\r\n		                {% endif %}\r\n		              </li>\r\n					{% endfor %}\r\n		          </ul>\r\n				{% endif %}\r\n		        </div>\r\n		        <div class=\"col-sm-6\">\r\n		        {% if blogs %}\r\n		          <ul class=\"list-unstyled\">\r\n		            {% for blog in blogs %}\r\n		              <li><a href=\"{{ blog.href }}\" >{{ blog.title }}</a></li>\r\n		            {% endfor %}\r\n		          </ul>\r\n				{% endif %}\r\n		        </div>\r\n		    </div>\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/common/content_top.php\">\r\n		<operation>\r\n			<search><![CDATA[\r\n			$layout_id = 0;\r\n			]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			if ($route == \'blog/blog\' && isset($this->request->get[\'blog_id\'])) { $this->load->model(\'blog/blog\');\r\n			$layout_id = $this->model_blog_blog->getBlogLayoutId($this->request->get[\'blog_id\']);}\r\n			if ($route == \'blog/category\' && isset($this->request->get[\'blogpath\'])) { $this->load->model(\'blog/blog_category\');\r\n			$layout_id = $this->model_blog_blog_category->getBlogCategoryLayoutId($this->request->get[\'blogpath\']);}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/common/content_bottom.php\">\r\n		<operation>\r\n			<search><![CDATA[\r\n			$layout_id = 0;\r\n			]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			if ($route == \'blog/blog\' && isset($this->request->get[\'blog_id\'])) { $this->load->model(\'blog/blog\');\r\n			$layout_id = $this->model_blog_blog->getBlogLayoutId($this->request->get[\'blog_id\']);}\r\n			if ($route == \'blog/category\' && isset($this->request->get[\'blogpath\'])) { $this->load->model(\'blog/blog_category\');\r\n			$layout_id = $this->model_blog_blog_category->getBlogCategoryLayoutId($this->request->get[\'blogpath\']);}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/common/column_left.php\">\r\n		<operation>\r\n			<search><![CDATA[\r\n			$layout_id = 0;\r\n			]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			if ($route == \'blog/blog\' && isset($this->request->get[\'blog_id\'])) { $this->load->model(\'blog/blog\');\r\n			$layout_id = $this->model_blog_blog->getBlogLayoutId($this->request->get[\'blog_id\']);}\r\n			if ($route == \'blog/category\' && isset($this->request->get[\'blogpath\'])) { $this->load->model(\'blog/blog_category\');\r\n			$layout_id = $this->model_blog_blog_category->getBlogCategoryLayoutId($this->request->get[\'blogpath\']);}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/common/column_right.php\">\r\n		<operation>\r\n			<search><![CDATA[\r\n			$layout_id = 0;\r\n			]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n			if ($route == \'blog/blog\' && isset($this->request->get[\'blog_id\'])) { $this->load->model(\'blog/blog\');\r\n			$layout_id = $this->model_blog_blog->getBlogLayoutId($this->request->get[\'blog_id\']);}\r\n			if ($route == \'blog/category\' && isset($this->request->get[\'blogpath\'])) { $this->load->model(\'blog/blog_category\');\r\n			$layout_id = $this->model_blog_blog_category->getBlogCategoryLayoutId($this->request->get[\'blogpath\']);}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/common/menu.php\">\r\n        <operation>\r\n            <search><![CDATA[return $this->load->view(\'common/menu\', $data);]]></search>\r\n            <add position=\"before\">\r\n                <![CDATA[\r\n                $blog_title = $this->config->get(\'blogsetting_home_title\');\r\n				if (!empty($blog_title[$this->config->get(\'config_language_id\')])) {\r\n                    $data[\'categories\'][] = array(\r\n                        \'name\'     => $blog_title[$this->config->get(\'config_language_id\')],\r\n                        \'children\' => \'\',\r\n                        \'column\'   => 1,\r\n                        \'href\'     => $this->url->link(\'blog/home\', \'\', true)\r\n                    );\r\n                }\r\n                ]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n</modification>', 1, '2021-07-07 11:36:54');
INSERT INTO `oc_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(8, 13, 'DEV-OPENCART.COM — OcFilter (v4.7.5)', 'dev_opencart_com_ocfilter-475', 'DEV-OPENCART.COM', '1', 'https://dev-opencart.com', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n  <name>DEV-OPENCART.COM — OcFilter (v4.7.5)</name>\r\n  <version>1</version>\r\n  <link>https://dev-opencart.com</link>\r\n  <author>DEV-OPENCART.COM</author>\r\n  <code>dev_opencart_com_ocfilter-475</code>\r\n\r\n  <!-- CONTROLLER -->\r\n	<file path=\"admin/controller/catalog/product.php\">\r\n    <operation>\r\n      <search><![CDATA[function getForm() {]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n    // OCFilter start\r\n    $this->document->addStyle(\'view/stylesheet/ocfilter/ocfilter.css\');\r\n    $this->document->addScript(\'view/javascript/ocfilter/ocfilter.js\');\r\n    // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n    <operation>\r\n      <search><![CDATA[if (isset($this->error[\'warning\']))]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n    // OCFilter start\r\n    $data[\'tab_ocfilter\'] = $this->language->get(\'tab_ocfilter\');\r\n    $data[\'entry_values\'] = $this->language->get(\'entry_values\');\r\n    $data[\'ocfilter_select_category\'] = $this->language->get(\'ocfilter_select_category\');\r\n    // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"admin/controller/common/column_left.php\">\r\n    <operation>\r\n      <search><![CDATA[if ($this->user->hasPermission(\'access\', \'catalog/filter\')) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      // OCFilter start\r\n			$ocfilter = array();\r\n\r\n			if ($this->user->hasPermission(\'access\', \'extension/module/ocfilter\')) {\r\n				$ocfilter[] = array(\r\n					\'name\'     => $this->language->get(\'text_ocfilter_option\'),\r\n					\'href\'     => $this->url->link(\'extension/module/ocfilter/filter\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n					\'children\' => array()\r\n				);\r\n\r\n				$ocfilter[] = array(\r\n					\'name\'	   => $this->language->get(\'text_ocfilter_page\'),\r\n					\'href\'     => $this->url->link(\'extension/module/ocfilter/page\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n					\'children\' => array()\r\n				);\r\n\r\n				$ocfilter[] = array(\r\n					\'name\'	   => $this->language->get(\'text_ocfilter_setting\'),\r\n					\'href\'     => $this->url->link(\'extension/module/ocfilter\', \'user_token=\' . $this->session->data[\'user_token\'], true),\r\n					\'children\' => array()\r\n				);\r\n			}\r\n\r\n			if ($ocfilter) {\r\n				$catalog[] = array(\r\n					\'name\'	   => $this->language->get(\'text_ocfilter\'),\r\n					\'href\'     => \'\',\r\n					\'children\' => $ocfilter\r\n				);\r\n			}\r\n		  // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file><!-- /admin/controller/common/column_left.php -->\r\n  <!-- /CONTROLLER -->\r\n\r\n  <!-- LANGUAGE -->\r\n	<file path=\"admin/language/{en}*/catalog/product.php\">\r\n    <operation>\r\n      <search><![CDATA[$_[\'text_success\']]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n// OCFilter start\r\n$_[\'entry_values\']          		= \'Add the values ​​for this option.\';\r\n$_[\'tab_ocfilter\']          		= \'OCFilter Options\';\r\n$_[\'ocfilter_select_category\'] 	= \'To start, select a category for this product.\';\r\n// OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"admin/language/{ru}*/catalog/product.php\">\r\n    <operation>\r\n      <search><![CDATA[$_[\'text_success\']]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n// OCFilter start\r\n$_[\'entry_values\']          		= \'Добавьте значения для этой опции.\';\r\n$_[\'tab_ocfilter\']          		= \'Опции фильтра\';\r\n$_[\'ocfilter_select_category\'] 	= \'Для начала, выберите категории для этого товара.\';\r\n// OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"admin/language/{en}*/common/column_left.php\">\r\n    <operation>\r\n      <search><![CDATA[$_[\'text_option\']]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n// OCFilter start\r\n$_[\'text_ocfilter\']                    = \'OCFilter\';\r\n$_[\'text_ocfilter_option\']             = \'Filters\';\r\n$_[\'text_ocfilter_page\']               = \'SEO Pages\';\r\n$_[\'text_ocfilter_setting\']            = \'Settings\';\r\n// OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"admin/language/{ru}*/common/column_left.php\">\r\n    <operation>\r\n      <search><![CDATA[$_[\'text_option\']]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n// OCFilter start\r\n$_[\'text_ocfilter\']                    = \'OCFilter\';\r\n$_[\'text_ocfilter_option\']             = \'Фильтры\';\r\n$_[\'text_ocfilter_page\']               = \'Страницы\';\r\n$_[\'text_ocfilter_setting\']            = \'Настройки\';\r\n// OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n  <!-- /LANGUAGE -->\r\n\r\n  <!-- MODEL -->\r\n	<file path=\"admin/model/catalog/product.php\">\r\n    <operation>\r\n      <search><![CDATA[if (isset($data[\'product_layout\'])) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n    // OCFilter start\r\n    $this->db->query(\"DELETE FROM \" . DB_PREFIX . \"ocfilter_option_value_to_product WHERE product_id = \'\" . (int)$product_id . \"\'\");\r\n\r\n		if (isset($data[\'ocfilter_product_option\'])) {\r\n			foreach ($data[\'ocfilter_product_option\'] as $option_id => $values) {\r\n				foreach ($values[\'values\'] as $value_id => $value) {\r\n					if (isset($value[\'selected\'])) {\r\n						$this->db->query(\"INSERT INTO \" . DB_PREFIX . \"ocfilter_option_value_to_product SET product_id = \'\" . (int)$product_id . \"\', option_id = \'\" . (int)$option_id . \"\', value_id = \'\" . (string)$value_id . \"\', slide_value_min = \'\" . (isset($value[\'slide_value_min\']) ? (float)$value[\'slide_value_min\'] : 0) . \"\', slide_value_max = \'\" . (isset($value[\'slide_value_max\']) ? (float)$value[\'slide_value_max\'] : 0) . \"\'\");\r\n					}\r\n				}\r\n			}\r\n		}\r\n		// OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n    <operation>\r\n      <search><![CDATA[$data[\'product_attribute\'] = $this->getProductAttributes($product_id);]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n 		// OCFilter start\r\n		$this->load->model(\'extension/ocfilter\');\r\n\r\n		$data[\'ocfilter_product_option\'] = $this->model_extension_ocfilter->getProductOCFilterValues($product_id);\r\n		// OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n    <operation>\r\n      <search><![CDATA[$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"product WHERE product_id = \'\" . (int)$product_id . \"\'\");]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n		// OCFilter start\r\n		$this->db->query(\"DELETE FROM \" . DB_PREFIX . \"ocfilter_option_value_to_product WHERE product_id = \'\" . (int)$product_id . \"\'\");\r\n		// OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file><!-- /admin/model/catalog/product.php -->\r\n\r\n  <!-- /MODEL -->\r\n\r\n  <!-- VIEW -->\r\n	<file path=\"admin/view/template/catalog/product_form.twig\">\r\n    <operation>\r\n      <search index=\"0\"><![CDATA[<script type=\"text/javascript\">]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n  <!-- OCFilter start -->\r\n  <script>\r\n      ocfilter.php = {\r\n      	text_select: \'{{ text_select }}\',\r\n      	ocfilter_select_category: \'{{ ocfilter_select_category }}\',\r\n      	entry_values: \'{{ entry_values }}\',\r\n      	tab_ocfilter: \'{{ tab_ocfilter }}\'\r\n      };\r\n\r\n      ocfilter.php.languages = [];\r\n\r\n      {% for language in languages %}\r\n      ocfilter.php.languages.push({\r\n      	\'language_id\': {{ language.language_id }},\r\n      	\'name\': \'{{ language.name }}\',\r\n        \'image\': \'{{ language.image }}\'\r\n      });\r\n      {% endfor %}\r\n  </script>\r\n  <!-- OCFilter end -->\r\n      ]]></add>\r\n    </operation>\r\n  </file><!-- /admin/view/template/catalog/product_form.twig -->\r\n  <!-- /VIEW -->\r\n\r\n  <!-- CATALOG -->\r\n\r\n  <file path=\"catalog/controller/startup/startup.php\">\r\n    <operation>\r\n      <search><![CDATA[Cart($this->registry));]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n		// OCFilter\r\n		$this->registry->set(\'ocfilter\', new OCFilter($this->registry));\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"catalog/controller/startup/seo_url.php\">\r\n    <operation>\r\n      <search><![CDATA[$this->url->addRewrite($this);]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n      // OCFilter start\r\n      if ($this->registry->has(\'ocfilter\')) {\r\n  			$this->url->addRewrite($this->ocfilter);\r\n  		}\r\n      // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"catalog/controller/{common,startup}/seo_pro.php\">\r\n    <operation>\r\n      <search><![CDATA[$this->url->addRewrite($this);]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n      // OCFilter start\r\n      if ($this->registry->has(\'ocfilter\')) {\r\n  			$this->url->addRewrite($this->ocfilter);\r\n  		}\r\n      // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"catalog/controller/{common,startup}/seo_pro.php\">\r\n    <operation>\r\n      <search><![CDATA[$this->url->addRewrite($this, $lang_data);]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n      // OCFilter start\r\n      if ($this->registry->has(\'ocfilter\')) {\r\n  			$this->url->addRewrite($this->ocfilter);\r\n  		}\r\n      // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"catalog/model/catalog/product.php\">\r\n    <operation>\r\n      <search><![CDATA[$sql .= \" LEFT JOIN \" . DB_PREFIX . \"product_description]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n		// OCFilter start\r\n		if (!empty($data[\'filter_ocfilter\'])) {\r\n    	$this->load->model(\'extension/module/ocfilter\');\r\n\r\n      $ocfilter_product_sql = $this->model_extension_module_ocfilter->getSearchSQL($data[\'filter_ocfilter\']);\r\n		} else {\r\n      $ocfilter_product_sql = false;\r\n    }\r\n\r\n    if ($ocfilter_product_sql && $ocfilter_product_sql->join) {\r\n    	$sql .= $ocfilter_product_sql->join;\r\n    }\r\n    // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n\r\n    <operation>\r\n      <search><![CDATA[if (!empty($data[\'filter_manufacturer_id]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n    // OCFilter start\r\n    if (!empty($ocfilter_product_sql) && $ocfilter_product_sql->where) {\r\n    	$sql .= $ocfilter_product_sql->where;\r\n    }\r\n    // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"catalog/controller/product/category.php\">\r\n    <operation>\r\n      <search index=\"0\"><![CDATA[$data[\'breadcrumbs\'] = array();]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n		// OCFilter start\r\n    if (isset($this->request->get[\'filter_ocfilter\'])) {\r\n      $filter_ocfilter = $this->request->get[\'filter_ocfilter\'];\r\n    } else {\r\n      $filter_ocfilter = \'\';\r\n    }\r\n		// OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n\r\n    <!-- Filter params to product model -->\r\n\r\n    <operation>\r\n      <search><![CDATA[$product_total =]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n  		// OCFilter start\r\n  		$filter_data[\'filter_ocfilter\'] = $filter_ocfilter;\r\n\r\n      if ($this->config->get(\'module_ocfilter_sub_category\')) {\r\n        if (empty($filter_data[\'filter_sub_category\'])) {\r\n          $filter_data[\'filter_sub_category\'] = true;\r\n        }\r\n\r\n        if (isset($this->request->get[\'filter_ocfilter\'])) {\r\n          $data[\'categories\'] = array();\r\n        }\r\n      }\r\n  		// OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n\r\n    <!-- Add url -->\r\n\r\n    <operation>\r\n      <search index=\"2\"><![CDATA[if (isset($this->request->get[\'filter\'])) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      // OCFilter start\r\n			if (isset($this->request->get[\'filter_ocfilter\'])) {\r\n				$url .= \'&filter_ocfilter=\' . $this->request->get[\'filter_ocfilter\'];\r\n			}\r\n      // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n\r\n    <operation>\r\n      <search index=\"3\"><![CDATA[if (isset($this->request->get[\'filter\'])) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      // OCFilter start\r\n			if (isset($this->request->get[\'filter_ocfilter\'])) {\r\n				$url .= \'&filter_ocfilter=\' . $this->request->get[\'filter_ocfilter\'];\r\n			}\r\n      // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n\r\n    <operation>\r\n      <search index=\"4\"><![CDATA[if (isset($this->request->get[\'filter\'])) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n      // OCFilter start\r\n			if (isset($this->request->get[\'filter_ocfilter\'])) {\r\n				$url .= \'&filter_ocfilter=\' . $this->request->get[\'filter_ocfilter\'];\r\n			}\r\n      // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n\r\n    <operation>\r\n      <search limit=\"1\"><![CDATA[$data[\'limit\'] = $limit;]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n      // OCFilter Start\r\n      if ($this->ocfilter->getParams()) {\r\n        if (isset($product_total) && !$product_total) {\r\n      	  $this->response->redirect($this->url->link(\'product/category\', \'path=\' . $this->request->get[\'path\']));\r\n        }\r\n\r\n        if (isset($data[\'description_bottom\'])) {\r\n          $data[\'description_bottom\'] = \'\';\r\n        }\r\n\r\n        if (isset($data[\'description_2\'])) {\r\n          $data[\'description_2\'] = \'\';\r\n        }\r\n\r\n        if (isset($data[\'description\'])) {\r\n          $data[\'description\'] = \'\';\r\n        }\r\n\r\n        if (isset($data[\'ext_description\'])) {\r\n          $data[\'ext_description\'] = \'\';\r\n        }\r\n\r\n        $this->document->setTitle($this->ocfilter->getPageMetaTitle($this->document->getTitle()));\r\n			  $this->document->setDescription($this->ocfilter->getPageMetaDescription($this->document->getDescription()));\r\n        $this->document->setKeywords($this->ocfilter->getPageMetaKeywords($this->document->getKeywords()));\r\n\r\n        $data[\'heading_title\'] = $data[\'seo_h1\'] = $this->ocfilter->getPageHeadingTitle($data[\'heading_title\']);\r\n\r\n        if (isset($data[\'description_bottom\'])) {\r\n          $data[\'description_bottom\'] = $this->ocfilter->getPageDescription();\r\n        } else if (isset($data[\'description_2\'])) {\r\n          $data[\'description_2\'] = $this->ocfilter->getPageDescription();\r\n        } else if (isset($data[\'description\'])) {\r\n          $data[\'description\'] = $this->ocfilter->getPageDescription();\r\n        } else if (isset($data[\'ext_description\'])) {\r\n          $data[\'ext_description\'] = $this->ocfilter->getPageDescription();\r\n        }\r\n\r\n        if (!trim(strip_tags(html_entity_decode($data[\'description\'], ENT_QUOTES, \'UTF-8\')))) {\r\n        	$data[\'thumb\'] = \'\';\r\n        }\r\n\r\n        $breadcrumb = $this->ocfilter->getPageBreadCrumb();\r\n\r\n        if ($breadcrumb) {\r\n  			  $data[\'breadcrumbs\'][] = $breadcrumb;\r\n        }\r\n\r\n        $this->document->deleteLink(\'canonical\');\r\n        $this->document->deleteLink(\'prev\');\r\n        $this->document->deleteLink(\'next\');\r\n\r\n        if ($page > 1) {\r\n          $this->document->addLink($this->url->link(\'product/category\', \'path=\' . $category_info[\'category_id\'] . \'&filter_ocfilter=\' . $this->request->get[\'filter_ocfilter\'], true), \'canonical\');\r\n        }\r\n\r\n  			if ($page == 2) {\r\n  			  $this->document->addLink($this->url->link(\'product/category\', \'path=\' . $category_info[\'category_id\'] . \'&filter_ocfilter=\' . $this->request->get[\'filter_ocfilter\'], true), \'prev\');\r\n  			} else if ($page > 2) {\r\n  			  $this->document->addLink($this->url->link(\'product/category\', \'path=\' . $category_info[\'category_id\'] . \'&filter_ocfilter=\' . $this->request->get[\'filter_ocfilter\'] . \'&page=\' . ($page - 1), true), \'prev\');\r\n  			}\r\n\r\n  			if ($limit && ceil($product_total / $limit) > $page) {\r\n  			  $this->document->addLink($this->url->link(\'product/category\', \'path=\' . $category_info[\'category_id\'] . \'&filter_ocfilter=\' . $this->request->get[\'filter_ocfilter\'] . \'&page=\' . ($page + 1), true), \'next\');\r\n  			}\r\n      }\r\n      // OCFilter End\r\n      ]]></add>\r\n    </operation>\r\n  </file><!-- /catalog/controller/product/category.php -->\r\n\r\n  <!-- Document Noindex & Canonical -->\r\n\r\n	<file path=\"system/library/document.php\">\r\n    <operation>\r\n      <search index=\"0\"><![CDATA[public function getLinks]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n  // OCFilter canonical fix start\r\n	public function deleteLink($rel) {\r\n    foreach ($this->links as $href => $link) {\r\n      if ($link[\'rel\'] == $rel) {\r\n      	unset($this->links[$href]);\r\n      }\r\n    }\r\n	}\r\n  // OCFilter canonical fix end\r\n      ]]></add>\r\n    </operation>\r\n\r\n    <operation>\r\n      <search><![CDATA[private $keywords;]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n  // OCFilter start\r\n  private $noindex = false;\r\n  // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n\r\n    <operation>\r\n      <search><![CDATA[public function setTitle($title) {]]></search>\r\n      <add position=\"before\"><![CDATA[\r\n  // OCFilter start\r\n  public function setNoindex($state = false) {\r\n  	$this->noindex = $state;\r\n  }\r\n\r\n	public function isNoindex() {\r\n		return $this->noindex;\r\n	}\r\n  // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n  <!-- Seo Pro Fix -->\r\n\r\n	<file path=\"system/library/seopro.php\">\r\n    <operation>\r\n      <search index=\"0\"><![CDATA[validate() {]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n    $this->detectAjax();\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n	<file path=\"catalog/controller/common/header.php\">\r\n    <operation>\r\n      <search><![CDATA[getTitle();]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n    // OCFilter start\r\n    $data[\'noindex\'] = $this->document->isNoindex();\r\n    // OCFilter end\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n\r\n  <file path=\"catalog/view/theme/*/template/common/header.twig\">\r\n    <operation>\r\n      <search><![CDATA[</title>]]></search>\r\n      <add position=\"after\"><![CDATA[\r\n{% if noindex %}\r\n<!-- OCFilter Start -->\r\n<meta name=\"robots\" content=\"noindex,nofollow\" />\r\n<!-- OCFilter End -->\r\n{% endif %}\r\n      ]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/language/*/common/footer.php\">\r\n    <operation>\r\n      <search ><![CDATA[http://opencart.pro/]]></search>\r\n      <add position=\"replace\"><![CDATA[https://dev-opencart.com/]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/language/*/common/footer.php\">\r\n    <operation>\r\n      <search ><![CDATA[http://myopencart.com/]]></search>\r\n      <add position=\"replace\"><![CDATA[https://dev-opencart.com/]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/language/*/common/footer.php\">\r\n    <operation>\r\n      <search ><![CDATA[http://www.opencart.com]]></search>\r\n      <add position=\"replace\"><![CDATA[https://dev-opencart.com/]]></add>\r\n    </operation>\r\n  </file>\r\n  <file path=\"catalog/language/*/common/footer.php\">\r\n    <operation>\r\n      <search ><![CDATA[http://lowenet.biz/]]></search>\r\n      <add position=\"replace\"><![CDATA[https://dev-opencart.com/]]></add>\r\n    </operation>\r\n  </file>\r\n</modification>', 0, '2021-07-09 16:26:49');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(36, 'О компании', 'html', '{\"name\":\"\\u041e \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;section class=&quot;about&quot;&gt;\\r\\n        &lt;div class=&quot;container option&quot;&gt;\\r\\n            &lt;div class=&quot;about-right&quot;&gt;\\r\\n                &lt;div class=&quot;about-right-content&quot;&gt;\\r\\n                    &lt;div class=&quot;about-right-content-center&quot;&gt;\\r\\n                        &lt;div class=&quot;title&quot;&gt;\\u041e \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438\\r\\n                        &lt;\\/div&gt;\\r\\n                        &lt;p&gt;\\r\\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus rutrum ligula ac tincidunt dignissim. Pellentesque sit amet magna vestibulum, rhoncus elit sit amet, consectetur libero.\\r\\n                        &lt;\\/p&gt;\\r\\n                        &lt;p&gt;\\r\\n                            Proin non blandit lorem. Nunc sapien lorem, ultricies et tortor ac, posuere pellentesque arcu. Sed commodo sagittis est, quis efficitur turpis.\\r\\n                        &lt;\\/p&gt;\\r\\n                        &lt;a href=&quot;http:\\/\\/\\/about_us&quot;&gt;\\u041f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u0435\\u0435                                                                \\u043e \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n                    &lt;div class=&quot;about-right-content__img&quot;&gt;\\r\\n                      &lt;img src=&quot;http:\\/\\/medilux\\/image\\/catalog\\/demo\\/images\\/about2.jpg&quot; style=&quot;width: 681px;&quot;&gt;\\r\\n                    &lt;\\/div&gt;\\r\\n                &lt;\\/div&gt;\\r\\n            &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n    &lt;\\/section&gt;\"}},\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"100%\",\"height\":\"100%\",\"status\":\"1\"}'),
(35, 'Brands', 'carousel', '{\"name\":\"Brands\",\"banner_id\":\"8\",\"width\":\"230\",\"height\":\"230\",\"status\":\"1\"}'),
(33, 'banners', 'banner', '{\"name\":\"banners\",\"banner_id\":\"7\",\"width\":\"1000px\",\"height\":\"1000px\",\"status\":\"1\"}'),
(37, 'Рассылка', 'newsletter', '{\"name\":\"\\u0420\\u0430\\u0441\\u0441\\u044b\\u043b\\u043a\\u0430\",\"module_description\":{\"1\":{\"success_message\":\"\\u0421\\u043f\\u0430\\u0441\\u0438\\u0431\\u043e!\",\"title\":\"\\u0425\\u043e\\u0442\\u0438\\u0442\\u0435 \\u0431\\u044b\\u0442\\u044c \\u0432 \\u043a\\u0443\\u0440\\u0441\\u0435 \\u0432\\u0441\\u0435\\u0445 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0439 \\u043e\\u0442 \\u041c\\u0415\\u0414\\u0418\\u041b\\u042e\\u041a\\u0421\",\"description\":\"\\u043f\\u043e\\u0434\\u043f\\u0438\\u0448\\u0438\\u0442\\u0435\\u0441\\u044c \\u043d\\u0430 \\u043d\\u0430\\u0448\\u0443 &lt;br&gt; e-mail \\u0440\\u0430\\u0441\\u0441\\u044b\\u043b\\u043a\\u0443\"}},\"type\":\"module\",\"image\":\"\",\"delay\":\"0\",\"only_once\":\"0\",\"unsubscribe\":\"0\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsletter`
--

CREATE TABLE `oc_newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(96) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(96) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `oc_newsletter`
--

INSERT INTO `oc_newsletter` (`id`, `email`, `name`) VALUES
(15, 'dasd@inbox.ru', ''),
(16, 'mohovilya2000@gmail.com', ''),
(14, 'fsdf@dsa.d', ''),
(13, 'asd@dsa.rr', ''),
(12, 'info@total-web.com.ua', ''),
(17, 'dasd@inbox.ru', 'Headersdf'),
(18, 'info@total-web.com.ua', 'Изоспан В fix'),
(19, 'dasd@inbox.ru', 'Илья'),
(20, 'dasd@inbox.ru', ' wgarrowdown.png'),
(21, 'info@total-web.com.ua', 'Header');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT 0,
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `order_status_id` int(11) NOT NULL DEFAULT 0,
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT 1.00000000,
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring`
--

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring_transaction`
--

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_shipment`
--

CREATE TABLE `oc_order_shipment` (
  `order_shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Ожидание'),
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(7, 1, 'Отменено'),
(5, 1, 'Сделка завершена'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(13, 1, 'Полный возврат'),
(16, 1, 'Аннулированный'),
(15, 1, 'Обработанный'),
(14, 1, 'Просроченный');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `points` int(8) NOT NULL DEFAULT 0,
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `weight_class_id` int(11) NOT NULL DEFAULT 0,
  `length` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `width` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `height` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `length_class_id` int(11) NOT NULL DEFAULT 0,
  `subtract` tinyint(1) NOT NULL DEFAULT 1,
  `minimum` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `product_offer` tinyint(1) NOT NULL,
  `product_discond` tinyint(1) NOT NULL,
  `image_producer` varchar(96) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`, `product_offer`, `product_discond`, `image_producer`) VALUES
(52, 'CHS-PU34', '', '', '', '', '', '', '', 1, 7, 'catalog/demo/images/items/specialOffers1.png', 0, 1, '0.0000', 0, 0, '2021-06-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-06-10 15:20:07', '2021-07-06 13:09:50', 1, 0, NULL),
(53, 'Bionet FC 700', '', '', '', '', '', '', '', 1, 7, 'catalog/demo/images/items/item1.png', 0, 1, '0.0000', 0, 0, '2021-06-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2021-06-10 15:20:43', '2021-07-09 16:09:00', 1, 0, NULL),
(54, 'SONOST-3000', '', '', '', '', '', '', '', 1, 7, 'catalog/demo/images/items/specialOffers2.png', 8, 1, '0.0000', 0, 0, '2021-06-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 27, '2021-06-10 15:21:35', '2021-07-12 17:46:04', 1, 1, ''),
(51, 'фывфы', '', '', '', '', '', '', '', 1, 7, '', 0, 1, '0.0000', 0, 0, '2021-07-12', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 77, '2021-06-10 15:19:30', '2021-07-12 16:36:28', 0, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `header` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `performance_capability` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `header`, `short_description`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `performance_capability`) VALUES
(52, 1, 'Установка фототерапевтическая CHS-PU34', '', '', '', '', 'Установка фототерапевтическая CHS-PU34', '', '', ''),
(53, 1, 'Фетальный монитор Bionet FC 700', '', '', '', '', 'Фетальный монитор Bionet FC 700', '', '', ''),
(54, 1, 'Ультразвуковый денситометр SONOST-3000', '', '&lt;p&gt;&lt;span style=&quot;color: rgb(79, 79, 79); font-family: Montserrat, sans-serif; font-size: 14px; background-color: rgb(250, 250, 250);&quot;&gt;Инкубатор для новорожденных CHS — i1000 предназначен для выхаживания и интенсивной терапии новорожденных, в том числе недоношенных с низкой массой тела, а также в случае возникновения состояний, характеризуются нарушением адаптации к внеутробной жизни и нарушении терморегуляции.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '&lt;p style=&quot;margin-bottom: 15px; font-size: 14px; line-height: 1.55; color: rgb(79, 79, 79); font-family: Montserrat, sans-serif;&quot;&gt;Код вида медицинского изделия по РУ — 157920, совпадает с кодом вида номенклатурной классификации медицинских изделий в приказе. Номер пункта приказа- 13.&lt;/p&gt;&lt;h4 style=&quot;margin-bottom: 0.5rem; line-height: 1.28; font-size: 14px; color: rgb(0, 0, 0); font-family: Montserrat, sans-serif;&quot;&gt;Инкубатор для новорожденных CHS — i1000&lt;/h4&gt;&lt;p style=&quot;margin-bottom: 15px; font-size: 14px; line-height: 1.55; color: rgb(79, 79, 79); font-family: Montserrat, sans-serif;&quot;&gt;предназначен для выхаживания и интенсивной терапии новорожденных, в том числе недоношенных с низкой массой тела, а также в случае возникновения состояний, характеризуются нарушением адаптации к внеутробной жизни и нарушении терморегуляции.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 15px; font-size: 14px; line-height: 1.55; color: rgb(79, 79, 79); font-family: Montserrat, sans-serif;&quot;&gt;Данное высокотехнологичное оборудование обеспечивает качественный уход за младенцем, создавая для новорожденного условия, максимально приближенные к внутриутробным: поддерживает комфортную температуру, влажность воздуха, возможность защиты от яркого света.&lt;/p&gt;&lt;h5 style=&quot;margin-bottom: 15px; line-height: 1.28; font-size: 14px; color: rgb(0, 0, 0); font-family: Montserrat, sans-serif;&quot;&gt;Основные преимущества:&lt;/h5&gt;&lt;ul style=&quot;padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 20px; color: rgb(33, 37, 41); font-family: Montserrat, sans-serif; font-size: 16px;&quot;&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Непрерывный мониторинг температуры воздуха под колпаком инкубатора;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Циркуляция воздуха и двойные стенки создают так называемую тепловую завесу для минимизации тепловых потерь при проведении манипуляций;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Двойные стенки легко устанавливаются, удаляются, легко очищаются и проходят санитарную обработку;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Интеллектуальный контроль температуры воздуха под куполом инкубатора;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Регулирование влажности воздуха под колпаком инкубатора на уровне от 30 до 90%;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Регулирование концентрации кислорода под колпаком инкубатора от 0 до 99%;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;SpО2 контроль (контроль за пульсом и насыщением крови пациента кислородом);&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Встроенные весы, позволяющие с высокой точностью измерить вес новорожденного;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Встроенный лоток для рентген-кассет позволяет проводить диагностические мероприятия, непосредственно в инкубаторе;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Регулируемый по высоте кабинет обеспечивает плавное опускание и подъем детского модуля до необходимой комфортной высоты простым нажатием на педали регулировки;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Плавная регулировка наклона ложа пациента до 12°;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Предусмотрена защита от перегревания выхаживаемого ребенка с функцией автоматического отклонения подачи тепла при превышении установленных температурных параметров;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;До 10 типов звуковой и визуальной сигнализации, чтоб быстро и легко определять возникшую проблему;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Защитный фильтр для предотвращения попадания загрязненного воздуха из внешней среды под колпак инкубатора;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Уровень шума в инкубаторе соответствует требованиям самых современных стандартов;&lt;/li&gt;&lt;li style=&quot;font-size: 14px; line-height: 1.28; margin-bottom: 10px; color: rgb(79, 79, 79);&quot;&gt;Оборудование легко и безопасно перемещается в пределах лечебного учреждения. Имеет 4 колеса с блокировкой и противоударные силиконовые вставки по периметру.&lt;/li&gt;&lt;/ul&gt;', '', 'Ультразвуковый денситометр SONOST-3000', '', '', '&lt;p&gt;&lt;span style=&quot;color: rgb(79, 79, 79); font-family: Montserrat, sans-serif; font-size: 14px;&quot;&gt;Morbi ac mi cursus, auctor libero vitae, eleifend urna. Phasellus ultrices, erat ut maximus pretium, velit risus elementum eros, ut consectetur neque felis vitae magna. Aliquam porta sapien est, ac lacinia libero interdum ornare. Aliquam at sapien laoreet, molestie odio quis, lacinia tortor. Quisque viverra congue libero eget elementum. Cras vehicula semper fermentum. Nullam finibus leo vel dui commodo dictum. Nullam ac libero sed leo ornare consequat. Phasellus mollis turpis ut tellus sagittis, sed dignissim sem volutpat. Fusce gravida, lectus sit amet ultricies aliquam, elit orci sodales dolor, quis auctor turpis nulla in felis. Quisque sit amet ligula dolor. Proin aliquam enim eu lectus feugiat ultrices.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(499, 54, 1, 0, 0, '55.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_filter`
--

INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES
(51, 2),
(51, 5),
(53, 3),
(54, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2474, 54, 'catalog/demo/images/items/specialOffers4.png', 0),
(2472, 54, 'catalog/demo/images/items/item4.png', 0),
(2467, 51, 'catalog/demo/images/items/item1.png', 0),
(2473, 54, 'catalog/demo/images/items/item1.png', 0),
(2468, 51, 'catalog/demo/images/items/item2.png', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_recurring`
--

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  `route` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `points` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(51, 77, 0),
(54, 77, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(52, 0, 0),
(51, 0, 0),
(53, 0, 0),
(54, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(51, 0),
(52, 0),
(53, 0),
(54, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring`
--

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring_description`
--

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Возвращены средства'),
(2, 1, 'Выдан в кредит'),
(3, 1, 'Отправлен другой товар для замены');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Получен/доставлен неисправным (сломан)'),
(2, 1, 'Получен не тот (ошибочный) товар'),
(3, 1, 'Ошибочный заказ'),
(4, 1, 'Ошибка, пожалуйста укажите/приложите подробности'),
(5, 1, 'Другое (другая причина), пожалуйста укажите/приложите подробности');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Рассматриваемый'),
(3, 1, 'Готов (к отправке)'),
(2, 1, 'Заказ в ожидании');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `information_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `reply` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_seo_url`
--

CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_seo_url`
--

INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(1048, 0, 1, 'category_id=71', 'videosistemy'),
(730, 0, 1, 'manufacturer_id=8', 'apple'),
(1038, 0, 1, 'information_id=10', 'about_us'),
(1057, 0, 1, 'category_id=72', 'hirurgiya-i-reanimaciya'),
(919, 0, 1, 'category_id=64', 'mammografy'),
(1056, 0, 1, 'category_id=65', 'uzi-apparaty'),
(1049, 0, 1, 'category_id=66', 'zhestkaya-endoskopiya'),
(1051, 0, 1, 'category_id=67', 'lor-oborudovanie'),
(924, 0, 1, 'category_id=68', 'lor-kombajny'),
(925, 0, 1, 'category_id=69', 'lor-kresla'),
(926, 0, 1, 'category_id=70', 'infuzionnye-pompy'),
(918, 0, 1, 'category_id=63', 'densitometry'),
(1054, 0, 1, 'category_id=61', 'rentgen-oborudovanie'),
(917, 0, 1, 'category_id=62', 'cifrovye-rentgeny'),
(937, 0, 1, 'category_id=80', 'ginekologicheskie-svetilniki'),
(936, 0, 1, 'category_id=79', 'ginekologicheskie-kresla'),
(935, 0, 1, 'category_id=78', 'kolposkopy'),
(1063, 0, 1, 'category_id=77', 'akusherstvo-i-ginekologiya'),
(933, 0, 1, 'category_id=76', 'funkcionalnaya-diagnostika'),
(929, 0, 1, 'category_id=73', 'ehvch'),
(944, 0, 1, 'category_id=74', 'monitory-pacienta'),
(931, 0, 1, 'category_id=75', 'ivl'),
(938, 0, 1, 'category_id=81', 'fetalnye-monitory'),
(1100, 0, 1, 'product_id=51', 'ultrazvukovyj-densitometr-sonost-3000'),
(1115, 0, 1, 'product_id=54', 'ultrazvukovyj-densitometr-sonost-3000-2'),
(1061, 0, 1, 'product_id=53', 'fetalnyj-monitor-bionet-fc-700'),
(1020, 0, 1, 'product_id=52', 'ustanovka-fototerapevticheskaya-chs-pu34'),
(828, 0, 1, 'manufacturer_id=9', 'canon'),
(829, 0, 1, 'manufacturer_id=5', 'htc'),
(830, 0, 1, 'manufacturer_id=7', 'hewlett-packard'),
(831, 0, 1, 'manufacturer_id=6', 'palm'),
(832, 0, 1, 'manufacturer_id=10', 'sony'),
(949, 0, 1, 'information_id=3', 'privacy'),
(950, 0, 1, 'information_id=5', 'terms'),
(845, 0, 1, 'common/home', ''),
(846, 0, 1, 'information/contact', 'contact'),
(847, 0, 1, 'information/sitemap', 'sitemap'),
(848, 0, 1, 'product/special', 'specials'),
(849, 0, 1, 'product/manufacturer', 'brands'),
(850, 0, 1, 'product/compare', 'compare-products'),
(851, 0, 1, 'product/search', 'search'),
(852, 0, 1, 'checkout/cart', 'cart'),
(853, 0, 1, 'checkout/checkout', 'checkout'),
(854, 0, 1, 'account/login', 'login'),
(855, 0, 1, 'account/logout', 'logout'),
(856, 0, 1, 'account/voucher', 'vouchers'),
(857, 0, 1, 'account/wishlist', 'wishlist'),
(858, 0, 1, 'account/account', 'my-account'),
(859, 0, 1, 'account/order', 'order-history'),
(860, 0, 1, 'account/newsletter', 'newsletter'),
(861, 0, 1, 'account/return/add', 'return-add'),
(862, 0, 1, 'account/forgotten', 'forgot-password'),
(863, 0, 1, 'account/download', 'downloads'),
(864, 0, 1, 'account/return', 'returns'),
(865, 0, 1, 'account/transaction', 'transactions'),
(866, 0, 1, 'account/register', 'create-account'),
(867, 0, 1, 'account/recurring', 'recurring'),
(868, 0, 1, 'account/address', 'address-book'),
(869, 0, 1, 'account/reward', 'reward-points'),
(870, 0, 1, 'account/edit', 'edit-account'),
(871, 0, 1, 'account/password', 'change-password'),
(880, 0, 1, 'affiliate/forgotten', 'affiliate-forgot-password'),
(881, 0, 1, 'affiliate/register', 'create-affiliate-account'),
(882, 0, 1, 'affiliate/login', 'affiliate-login'),
(883, 0, 1, 'affiliate/payment', 'affiliate-payment'),
(884, 0, 1, 'affiliate/tracking', 'affiliate-tracking'),
(885, 0, 1, 'affiliate/transaction', 'affiliate-transaction'),
(886, 0, 1, 'affiliate/account', 'affiliates'),
(892, 0, 1, 'category_id=59', 'catalogs'),
(908, 0, 1, 'information/search', 'search-information'),
(1041, 0, 1, 'blog/home', 'news'),
(939, 0, 1, 'category_id=82', 'vesy-i-rostomery'),
(1052, 0, 1, 'category_id=83', 'neonatologiya'),
(1050, 0, 1, 'category_id=84', 'laboratornaya-diagnostika'),
(1055, 0, 1, 'category_id=85', 'sterilizaciya-i-dezinfekciya'),
(1053, 0, 1, 'category_id=86', 'prochie-medicinskie-tovary');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_session`
--

CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_session`
--

INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('00a0db16cbe557e701eeaf0e03', '{\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2021-07-06 07:39:28'),
('0595e1d94dc234a4cdca19459e', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"MohGrGjli0ioPjLxQvaIwJp33NdIIEYu\",\"directory_file_manager\":\"demo\\/images\",\"page_file_manager\":\"2\"}', '2021-06-04 14:44:28'),
('0c2f33e45e071c05e7395591c7', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"0N22JJrJfdpzOZYk8DnuBursoMatroxh\",\"directory_file_manager\":\"demo\\/images\\/catalog\",\"page_file_manager\":null,\"install\":\"8QOuHUx6Q2\"}', '2021-07-09 14:55:56'),
('143c69df721eb9bf0bf3e51249', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"kZOABmHUdEckatTinbuZAgSTchJGcGnw\"}', '2021-06-17 13:15:03'),
('148f9f5ef42cda63b3f2f91238', '{\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2021-05-31 10:10:21'),
('2303f63833cb4b2ba67f0c92ec', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"Q11rS5qa8wHtKlPZM1pAvksqutmWywRm\"}', '2021-06-29 08:44:58'),
('231cfe46ecd38b9e170fab6d1d', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"DxXPFQQxK2KjPGtMcrF0wxpgpNBKenvT\",\"directory_file_manager\":\"demo\\/images\\/items\",\"page_file_manager\":null}', '2021-07-06 12:48:26'),
('39db07a3e4ce989125e8560387', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"psPxZ1MsCg7iVk7tB3FWjqHff7Z0uhWq\"}', '2021-07-12 15:53:44'),
('48f4a288049c3a44aea6d8c137', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"lo60iByUcTjF799LA47cTxK3eAJ0C78A\",\"directory_file_manager\":\"demo\\/images\",\"page_file_manager\":null}', '2021-07-08 15:56:33'),
('5670462ceec5eb09e72e6cd0f9', '{\"api_id\":\"1\"}', '2021-05-31 09:33:43'),
('6847d6ef108572878868dd3a11', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"lfzAgwnYpsTrPwSt9Cd5quQPzdHw0TnP\",\"directory_file_manager\":\"demo\\/images\\/items\",\"page_file_manager\":null,\"install\":\"3Dzb1rcGNm\"}', '2021-07-02 13:08:12'),
('7c172ba73f0756193a84c94beb', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"aQThATx00EJjPImHDtveiaANlJAO2Xkb\",\"install\":\"aGgPkL3rkQ\",\"directory_file_manager\":\"demo\\/images\\/catalog\",\"page_file_manager\":null}', '2021-07-07 15:45:31'),
('7d7a1d7466716b1c5343af1bde', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"UGe68tFx2rELUb5N2W9BGinVKJaM5G2o\",\"directory_file_manager\":\"demo\",\"page_file_manager\":null}', '2021-06-01 15:53:46'),
('90d1e8a30db73b5f0a0be25ae8', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"NEU05Hwhl8EkCz061PvZfR5NF6q4CwmO\",\"wishlist\":[\"28\"]}', '2021-05-31 14:21:30'),
('9ea7fa2ce675b723603690b576', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"04UFBQPggZZyylJxwa3KLSgCP1xjAcDj\"}', '2021-07-13 07:50:54'),
('aacccae6d2f77aee4d11952a59', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"OuP4riXhaTKpl1isNFHrVPJ3ocDTElus\",\"install\":\"O568dBsu2I\",\"compare\":[]}', '2021-06-08 15:47:53'),
('bb945517f4825e5d7b4c5770ed', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"waevue1rSdzGV0KKE0nn71qZGKSGEk5j\"}', '2021-06-02 15:53:32'),
('bc6632cf5db0fc5db4802f9ddf', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"YJh3xCd9IdNt6cZL8woKuHbRq9YfBQo7\",\"wishlist\":[\"42\"]}', '2021-05-28 14:02:50'),
('bcd4c7a1f43f78d6a8746a9b4a', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"9RTRpfAoyjkSxUplm0kgnSFSAGjjE2Vs\",\"install\":\"4uef3VSQup\"}', '2021-07-07 09:17:37'),
('bfe8364dd3409a9a2591284e4a', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"dkFkAK83r4kg5Y3T89hsSmxyF8nEnyzh\",\"directory_file_manager\":\"demo\\/images\",\"page_file_manager\":\"3\",\"compare\":[\"33\"],\"install\":\"Anv1SXMuL2\",\"wishlist\":[\"33\"]}', '2021-06-07 15:05:05'),
('c0e947615f12ef6072756f139f', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"WXnJw64TYzukX8QNOxyLVJf5fWhirXcr\",\"directory_file_manager\":\"demo\\/images\",\"page_file_manager\":\"2\"}', '2021-06-03 15:39:11'),
('d994eda411b92ca1fd31edbf4f', '{\"user_id\":\"1\",\"user_token\":\"SjUMIXhTIdXj1nbUYVo3MxQdRrppyG0v\"}', '2021-06-01 11:17:02'),
('db2e904d5004aff2c82ce1812b', '{\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2021-05-31 10:10:06'),
('eb5d0f2417d8668c6c1eaf1e6a', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"iYRvcuQK5638vc5DNjCmwxuIYTsLurse\"}', '2021-07-06 15:42:21'),
('f572dc6d2dbf53b23353ec94ac', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"iwiifb6liF4GduaQdR69z9EAfeZotc9C\"}', '2021-05-31 15:51:32'),
('fbf69b90b0f7c6a6d589d816b2', '{\"language\":\"ru-ru\",\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"E3m6RPOjPgVGcLjPgwpIyPvGJ6u7hsBE\",\"directory_file_manager\":\"demo\\/images\",\"page_file_manager\":\"2\",\"install\":\"HrkxUReWqp\",\"success\":\"Deleted\"}', '2021-06-10 15:54:21'),
('fc3b9a80d7e39a3134edf637f6', '{\"language\":\"ru-ru\",\"currency\":\"RUB\"}', '2021-05-31 10:09:10');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(2294, 0, 'information_optimblog', 'information_optimblog_image_related_width', '200', 0),
(2295, 0, 'information_optimblog', 'information_optimblog_image_related_height', '200', 0),
(2296, 0, 'information_optimblog', 'information_optimblog_image_category_popup_width', '500', 0),
(2297, 0, 'information_optimblog', 'information_optimblog_image_category_popup_height', '500', 0),
(2293, 0, 'information_optimblog', 'information_optimblog_image_additional_height', '240', 0),
(2292, 0, 'information_optimblog', 'information_optimblog_image_additional_width', '840', 0),
(2476, 0, 'config', 'config_file_max_size', '300000', 0),
(2477, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(2478, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(2474, 0, 'config', 'config_shared', '0', 0),
(2475, 0, 'config', 'config_encryption', 'uSP5ZsYQy0sa9DNfvOXnsdZ2SC7BYKqCxh5vCvuKTQbTyCTN2UQ8M7Bz7HAVoNIRb6tnn9veYG6qN4bzPuXJXMp4gYWUnRUubJ4Tg6x3H0kyoy7MOcKC53bnVx6lWaiCELbbBNswHCjGGL3mLsk0AxUzPoUVvvlyAcLJ6inRTUjlHnFIVDRda1e5kOZxvn54lfdq0rdRjUaRVgJOxeocq5S6TSXqqVjxsShI33cgid4B5MaVGZrBOslLBDYT1ixYmYC62G0fwTQOGwrQQvvMyJnVwbJ1zG7sbOL6LfJEsXNwmmkmydk4GFGdUUdwOj5Fy8VHBlAzBh7ilGEpRh2UkEGPdpHvR63KZmisBTVZhWkaK1DBaCagSUhb5ajIWJEq7PHHEE5Ul7iDJX7lHqkoxlOGGrz5l7J2emP6vdQPL7WeScu8vVYO9NO4MlULEWIyYidUWGqdkwdel78QHSTW31CCHOBOqBG8Dn07vHlLhnICMX10i3DU9ZRSLyxhsooehXOGJmwygb1llzgtI9S8rPhn6qfOHSJDkCHup3BVfiqQBemyGkRUWrO5k0bSfGYzRj885rlIPtazVmNKjZs39aAdIajF5mIJwOY7GYLVnGYB6oAocUW2oTWfmOoKqbJe40qugF7NWxlfWst7J3EqHGXuHzGe11GdpyeiYW6gzq8P2Kmd3Q8X1E0NKCqvsqPBJZsOiPeQo78muAenZ3iUPO4v6UP50o1m05MkTsQ63Kdsk2wZ50p6XLKuncVsGBBvZfF1WhixcPonsil3bYdgjbVH5tUO4PG9wRA6fCtZdel6hWlQzKuHrlGaMEDu5TVmtVO5ENwqnzppgDpjQUIrIIrVFIDNQ339Qqtz3QyxrjPs5ukAPt7q0tfLdZqL4ZK6pyx5F5YABl1CSNXgcWY0Xfp5tHPQQKCGSq1r8VScm9lvJMHxC6YjPEHqlHNP6hIseMWjLJFZeGDmykxwkaedIwGh7t726AzemT80nFa1xNA0aNU4b4BXlLX3rz1y69cC', 0),
(2473, 0, 'config', 'config_password', '1', 0),
(2471, 0, 'config', 'config_compression', '0', 0),
(2472, 0, 'config', 'config_secure', '1', 0),
(4, 0, 'total_voucher', 'total_voucher_sort_order', '8', 0),
(5, 0, 'total_voucher', 'total_voucher_status', '1', 0),
(2457, 0, 'config', 'config_footerLogo', 'catalog/demo/images/логофутер.png', 0),
(2458, 0, 'config', 'config_icon', 'catalog/demo/images/favicon.jpg', 0),
(2459, 0, 'config', 'config_mail_engine', 'mail', 0),
(2460, 0, 'config', 'config_mail_parameter', 'mohovilya2000@gmail.com', 0),
(2461, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(2462, 0, 'config', 'config_mail_smtp_username', '', 0),
(2463, 0, 'config', 'config_mail_smtp_password', '', 0),
(2464, 0, 'config', 'config_mail_smtp_port', '25', 0),
(2465, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(2466, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(2467, 0, 'config', 'config_mail_alert_email', '', 0),
(2468, 0, 'config', 'config_maintenance', '1', 0),
(2469, 0, 'config', 'config_seo_url', '1', 0),
(2470, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(2456, 0, 'config', 'config_logo', 'catalog/demo/images/лого.png', 0),
(2455, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(2454, 0, 'config', 'config_captcha', '', 0),
(2453, 0, 'config', 'config_return_status_id', '2', 0),
(2452, 0, 'config', 'config_return_id', '0', 0),
(2451, 0, 'config', 'config_affiliate_id', '4', 0),
(2447, 0, 'config', 'config_affiliate_group_id', '1', 0),
(2449, 0, 'config', 'config_affiliate_auto', '0', 0),
(2450, 0, 'config', 'config_affiliate_commission', '5', 0),
(2448, 0, 'config', 'config_affiliate_approval', '0', 0),
(2446, 0, 'config', 'config_stock_checkout', '0', 0),
(2445, 0, 'config', 'config_stock_warning', '0', 0),
(2444, 0, 'config', 'config_stock_display', '0', 0),
(2443, 0, 'config', 'config_api_id', '1', 0),
(2442, 0, 'config', 'config_fraud_status_id', '16', 0),
(2441, 0, 'config', 'config_complete_status', '[\"3\",\"5\"]', 1),
(95, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(96, 0, 'payment_free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(98, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(99, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(100, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(101, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(102, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(103, 0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(104, 0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(105, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(106, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '9', 0),
(107, 0, 'shipping_flat', 'shipping_flat_cost', '5.00', 0),
(108, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(109, 0, 'total_sub_total', 'sub_total_sort_order', '1', 0),
(110, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(111, 0, 'total_tax', 'total_tax_status', '0', 0),
(112, 0, 'total_total', 'total_total_sort_order', '9', 0),
(113, 0, 'total_total', 'total_total_status', '1', 0),
(114, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(115, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(116, 0, 'total_credit', 'total_credit_status', '1', 0),
(117, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(118, 0, 'total_reward', 'total_reward_status', '1', 0),
(119, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(120, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(121, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(122, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(123, 0, 'module_category', 'module_category_status', '1', 0),
(124, 0, 'module_account', 'module_account_status', '1', 0),
(224, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(223, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(222, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(221, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(220, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(219, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(218, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(217, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(216, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(215, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(214, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(213, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(212, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(211, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(210, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(209, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(208, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(207, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(206, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(205, 0, 'theme_default', 'theme_default_status', '1', 0),
(204, 0, 'theme_default', 'theme_default_directory', 'medilux', 0),
(149, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(150, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(151, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(153, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(155, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(157, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(158, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(159, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(160, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(161, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(162, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(164, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(165, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(166, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(167, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(168, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(169, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(171, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(172, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(173, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(174, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(175, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(176, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(177, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(178, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(179, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(180, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(181, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(182, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(183, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(184, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(185, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(186, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(187, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(188, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(189, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(190, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(191, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(192, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(193, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(194, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(195, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(196, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(197, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(198, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(431, 0, 'developer', 'developer_sass', '0', 0),
(2440, 0, 'config', 'config_processing_status', '[\"2\",\"3\",\"1\",\"12\",\"5\"]', 1),
(2439, 0, 'config', 'config_order_status_id', '1', 0),
(2438, 0, 'config', 'config_checkout_id', '5', 0),
(2437, 0, 'config', 'config_checkout_guest', '1', 0),
(2436, 0, 'config', 'config_cart_weight', '1', 0),
(2434, 0, 'config', 'config_account_id', '3', 0),
(2435, 0, 'config', 'config_invoice_prefix', 'INV-2021-00', 0),
(2433, 0, 'config', 'config_login_attempts', '5', 0),
(2432, 0, 'config', 'config_customer_price', '0', 0),
(2431, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(2426, 0, 'config', 'config_tax_customer', 'shipping', 0),
(2427, 0, 'config', 'config_customer_online', '1', 0),
(2428, 0, 'config', 'config_customer_activity', '1', 0),
(2430, 0, 'config', 'config_customer_group_id', '1', 0),
(2429, 0, 'config', 'config_customer_search', '1', 0),
(225, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(226, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(227, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(430, 0, 'developer', 'developer_theme', '0', 0),
(2424, 0, 'config', 'config_tax', '0', 0),
(2425, 0, 'config', 'config_tax_default', 'shipping', 0),
(2423, 0, 'config', 'config_voucher_max', '1000', 0),
(2422, 0, 'config', 'config_voucher_min', '1', 0),
(2421, 0, 'config', 'config_review_guest', '1', 0),
(2420, 0, 'config', 'config_review_status', '1', 0),
(2419, 0, 'config', 'config_limit_admin', '20', 0),
(2417, 0, 'config', 'config_weight_class_id', '1', 0),
(2418, 0, 'config', 'config_product_count', '1', 0),
(2416, 0, 'config', 'config_length_class_id', '1', 0),
(2415, 0, 'config', 'config_currency_auto', '1', 0),
(2414, 0, 'config', 'config_currency', 'RUB', 0),
(2413, 0, 'config', 'config_admin_language', 'ru-ru', 0),
(2412, 0, 'config', 'config_language', 'ru-ru', 0),
(2411, 0, 'config', 'config_zone_id', '', 0),
(2410, 0, 'config', 'config_country_id', '176', 0),
(2409, 0, 'config', 'config_comment', '', 0),
(2408, 0, 'config', 'config_open', '', 0),
(2407, 0, 'config', 'config_image', '', 0),
(2406, 0, 'config', 'config_fax', '', 0),
(2405, 0, 'config', 'config_vk', 'aa', 0),
(2404, 0, 'config', 'config_faceebook', 'ss', 0),
(2403, 0, 'config', 'config_inst', 'ddd', 0),
(2402, 0, 'config', 'config_telephone', '+7 (988) 000-77-05', 0),
(2401, 0, 'config', 'config_email', 'new.poshta@mail.ru', 0),
(2400, 0, 'config', 'config_geocode', '', 0),
(451, 0, 'theme_medilux', 'theme_medilux_image_wishlist_height', '47', 0),
(450, 0, 'theme_medilux', 'theme_medilux_image_wishlist_width', '47', 0),
(449, 0, 'theme_medilux', 'theme_medilux_image_compare_height', '90', 0),
(448, 0, 'theme_medilux', 'theme_medilux_image_compare_width', '90', 0),
(447, 0, 'theme_medilux', 'theme_medilux_image_related_height', '80', 0),
(446, 0, 'theme_medilux', 'theme_medilux_image_related_width', '80', 0),
(445, 0, 'theme_medilux', 'theme_medilux_image_additional_height', '74', 0),
(444, 0, 'theme_medilux', 'theme_medilux_image_additional_width', '74', 0),
(443, 0, 'theme_medilux', 'theme_medilux_image_product_height', '228', 0),
(442, 0, 'theme_medilux', 'theme_medilux_image_product_width', '228', 0),
(441, 0, 'theme_medilux', 'theme_medilux_image_popup_height', '500', 0),
(440, 0, 'theme_medilux', 'theme_medilux_image_popup_width', '500', 0),
(439, 0, 'theme_medilux', 'theme_medilux_image_thumb_height', '228', 0),
(438, 0, 'theme_medilux', 'theme_medilux_image_thumb_width', '228', 0),
(437, 0, 'theme_medilux', 'theme_medilux_image_category_height', '80', 0),
(436, 0, 'theme_medilux', 'theme_medilux_image_category_width', '80', 0),
(435, 0, 'theme_medilux', 'theme_medilux_product_description_length', '100', 0),
(434, 0, 'theme_medilux', 'theme_medilux_product_limit', '15', 0),
(433, 0, 'theme_medilux', 'theme_medilux_status', '1', 0),
(432, 0, 'theme_medilux', 'theme_medilux_directory', 'medilux', 0),
(452, 0, 'theme_medilux', 'theme_medilux_image_cart_width', '47', 0),
(453, 0, 'theme_medilux', 'theme_medilux_image_cart_height', '47', 0),
(454, 0, 'theme_medilux', 'theme_medilux_image_location_width', '268', 0),
(455, 0, 'theme_medilux', 'theme_medilux_image_location_height', '50', 0),
(2399, 0, 'config', 'config_DesContacts', 'Компания «Медилюкс» не просто специализируется на реализации оборудования. Мы считаем себя причастными к развитию частных медицинских центров и к модернизации медицинской отрасли России.', 0),
(2398, 0, 'config', 'config_address', 'г. Москва, ул. Ленина 10 оф. 32', 0),
(2396, 0, 'config', 'config_name', 'Интернет магазин Opencart', 0),
(2397, 0, 'config', 'config_owner', 'Иванов Иван', 0),
(2395, 0, 'config', 'config_layout_id', '4', 0),
(2394, 0, 'config', 'config_theme', 'medilux', 0),
(2298, 0, 'information_optimblog', 'information_optimblog_image_category_additional_width', '74', 0),
(2291, 0, 'information_optimblog', 'information_optimblog_image_information_height', '228', 0),
(2290, 0, 'information_optimblog', 'information_optimblog_image_information_width', '228', 0),
(2289, 0, 'information_optimblog', 'information_optimblog_image_popup_height', '480', 0),
(2288, 0, 'information_optimblog', 'information_optimblog_image_popup_width', '1680', 0),
(2286, 0, 'information_optimblog', 'information_optimblog_image_thumb_width', '840', 0),
(2287, 0, 'information_optimblog', 'information_optimblog_image_thumb_height', '240', 0),
(2285, 0, 'information_optimblog', 'information_optimblog_image_category_height', '80', 0),
(2284, 0, 'information_optimblog', 'information_optimblog_image_category_width', '80', 0),
(2283, 0, 'information_optimblog', 'information_optimblog_category_limit_show', '0', 0),
(2281, 0, 'information_optimblog', 'information_optimblog_category_sort_show', '0', 0),
(2282, 0, 'information_optimblog', 'information_optimblog_information_limit', '15', 0),
(2280, 0, 'information_optimblog', 'information_optimblog_category_sort', 'i.sort_order-ASC', 0),
(2278, 0, 'information_optimblog', 'information_optimblog_category_view', 'list', 0),
(2279, 0, 'information_optimblog', 'information_optimblog_category_view_show', '0', 0),
(2273, 0, 'information_optimblog', 'information_optimblog_exclusion_categories_author', '', 0),
(2274, 0, 'information_optimblog', 'information_optimblog_category_date', '1', 0),
(2275, 0, 'information_optimblog', 'information_optimblog_exclusion_categories_date', '', 0),
(2276, 0, 'information_optimblog', 'information_optimblog_category_review', '0', 0),
(2277, 0, 'information_optimblog', 'information_optimblog_exclusion_categories_review', '', 0),
(2270, 0, 'information_optimblog', 'information_optimblog_information_description_length', '100', 0),
(2271, 0, 'information_optimblog', 'information_optimblog_information_count', '0', 0),
(2272, 0, 'information_optimblog', 'information_optimblog_category_author', '0', 0),
(2269, 0, 'information_optimblog', 'information_optimblog_information_show', '1', 0),
(2268, 0, 'information_optimblog', 'information_optimblog_information_script', '{\"header\":[\"catalog\\/view\\/javascript\\/jquery\\/magnific\\/jquery.magnific-popup.min.js\",\"catalog\\/view\\/javascript\\/jquery\\/swiper\\/js\\/swiper.jquery.js\"]}', 1),
(2267, 0, 'information_optimblog', 'information_optimblog_information_style', '[\"catalog\\/view\\/javascript\\/jquery\\/magnific\\/magnific-popup.css\",\"catalog\\/view\\/javascript\\/jquery\\/swiper\\/css\\/swiper.min.css\",\"catalog\\/view\\/javascript\\/jquery\\/swiper\\/css\\/opencart.css\"]', 1),
(2266, 0, 'information_optimblog', 'information_optimblog_information_thumb', '1', 0),
(2265, 0, 'information_optimblog', 'information_optimblog_share', '', 0),
(2264, 0, 'information_optimblog', 'information_optimblog_exclusion_informations_review', '', 0),
(2263, 0, 'information_optimblog', 'information_optimblog_exclusion_categories_review_information', '', 0),
(2261, 0, 'information_optimblog', 'information_optimblog_captcha', '', 0),
(2262, 0, 'information_optimblog', 'information_optimblog_information_review', '0', 0),
(2260, 0, 'information_optimblog', 'information_optimblog_review_guest', '0', 0),
(2259, 0, 'information_optimblog', 'information_optimblog_review_status', '0', 0),
(2258, 0, 'information_optimblog', 'information_optimblog_exclusion_informations_manufacturer', '', 0),
(2257, 0, 'information_optimblog', 'information_optimblog_exclusion_categories_manufacturer_information', '', 0),
(2255, 0, 'information_optimblog', 'information_optimblog_exclusion_informations_date', '', 0),
(2256, 0, 'information_optimblog', 'information_optimblog_information_manufacturer', '1', 0),
(2254, 0, 'information_optimblog', 'information_optimblog_exclusion_categories_date_information', '', 0),
(2252, 0, 'information_optimblog', 'information_optimblog_exclusion_informations_author', '', 0),
(2253, 0, 'information_optimblog', 'information_optimblog_information_date', '1', 0),
(2251, 0, 'information_optimblog', 'information_optimblog_exclusion_categories_author_information', '', 0),
(2250, 0, 'information_optimblog', 'information_optimblog_information_author', '0', 0),
(2249, 0, 'information_optimblog', 'information_optimblog_exclusion_informations', '', 0),
(2248, 0, 'information_optimblog', 'information_optimblog_breadcrumbs_information', '1', 0),
(2247, 0, 'information_optimblog', 'information_optimblog_breadcrumbs_product', '1', 0),
(2246, 0, 'information_optimblog', 'information_optimblog_breadcrumbs_category_information', '1', 0),
(2245, 0, 'information_optimblog', 'information_optimblog_breadcrumbs_category_product', '1', 0),
(2244, 0, 'information_optimblog', 'information_optimblog_canonical_information', '1', 0),
(2243, 0, 'information_optimblog', 'information_optimblog_canonical_category_information', '1', 0),
(2242, 0, 'information_optimblog', 'information_optimblog_canonical_category_product', '1', 0),
(2241, 0, 'information_optimblog', 'information_optimblog_status', '1', 0),
(2240, 0, 'information_optimblog', 'information_optimblog_version', '3.0.1.5', 0),
(2391, 0, 'config', 'config_meta_title', 'Интернет магазин Opencart', 0),
(2392, 0, 'config', 'config_meta_description', 'Мой магазин', 0),
(2393, 0, 'config', 'config_meta_keyword', '', 0),
(2299, 0, 'information_optimblog', 'information_optimblog_image_category_additional_height', '74', 0),
(2479, 0, 'config', 'config_error_display', '1', 0),
(2480, 0, 'config', 'config_error_log', '1', 0),
(2481, 0, 'config', 'config_error_filename', 'error.log', 0),
(2536, 0, 'blogsetting', 'blogsetting_rel_blog_per_row', '2', 0),
(2535, 0, 'blogsetting', 'blogsetting_post_thumbs_h', '424', 0),
(2534, 0, 'blogsetting', 'blogsetting_post_thumbs_w', '848', 0),
(2533, 0, 'blogsetting', 'blogsetting_post_thumb', '1', 0),
(2532, 0, 'blogsetting', 'blogsetting_share', '0', 0),
(2531, 0, 'blogsetting', 'blogsetting_post_author', '0', 0),
(2530, 0, 'blogsetting', 'blogsetting_post_page_view', '0', 0),
(2529, 0, 'blogsetting', 'blogsetting_post_comments_count', '0', 0),
(2528, 0, 'blogsetting', 'blogsetting_post_date_added', '1', 0),
(2527, 0, 'blogsetting', 'blogsetting_author', '0', 0),
(2526, 0, 'blogsetting', 'blogsetting_page_view', '0', 0),
(2525, 0, 'blogsetting', 'blogsetting_comments_count', '0', 0),
(2524, 0, 'blogsetting', 'blogsetting_date_added', '1', 0),
(2523, 0, 'blogsetting', 'blogsetting_thumbs_h', '424', 0),
(2522, 0, 'blogsetting', 'blogsetting_thumbs_w', '848', 0),
(2521, 0, 'blogsetting', 'blogsetting_layout', '1', 0),
(2520, 0, 'blogsetting', 'blogsetting_blogs_per_page', '9', 0),
(2519, 0, 'blogsetting', 'blogsetting_home_meta_keyword', '{\"1\":\"\"}', 1),
(2518, 0, 'blogsetting', 'blogsetting_home_meta_description', '{\"1\":\"\"}', 1),
(2517, 0, 'blogsetting', 'blogsetting_home_description', '{\"1\":\"\"}', 1),
(2516, 0, 'blogsetting', 'blogsetting_home_page_title', '{\"1\":\"\"}', 1),
(2515, 0, 'blogsetting', 'blogsetting_home_title', '{\"1\":\"\"}', 1),
(2537, 0, 'blogsetting', 'blogsetting_rel_thumb', '0', 0),
(2538, 0, 'blogsetting', 'blogsetting_rel_thumbs_w', '408', 0),
(2539, 0, 'blogsetting', 'blogsetting_rel_thumbs_h', '204', 0),
(2540, 0, 'blogsetting', 'blogsetting_rel_characters', '100', 0),
(2541, 0, 'blogsetting', 'blogsetting_rel_prod_per_row', '2', 0),
(2542, 0, 'blogsetting', 'blogsetting_rel_prod_width', '266', 0),
(2543, 0, 'blogsetting', 'blogsetting_rel_prod_height', '266', 0),
(2544, 0, 'blogsetting', 'blogsetting_comment_per_page', '5', 0),
(2545, 0, 'blogsetting', 'blogsetting_comment_approve', '0', 0),
(2546, 0, 'blogsetting', 'blogsetting_comment_notification', '0', 0),
(2547, 0, 'blogsetting', 'blogsetting_author_change', '0', 0),
(2548, 0, 'module_filter', 'module_filter_status', '1', 0),
(2598, 0, 'module_ocfilter', 'module_ocfilter_hide_empty_values', '1', 0),
(2596, 0, 'module_ocfilter', 'module_ocfilter_show_options_limit', '0', 0),
(2597, 0, 'module_ocfilter', 'module_ocfilter_show_values_limit', '0', 0),
(2595, 0, 'module_ocfilter', 'module_ocfilter_consider_option', '0', 0),
(2594, 0, 'module_ocfilter', 'module_ocfilter_consider_special', '0', 0),
(2593, 0, 'module_ocfilter', 'module_ocfilter_consider_discount', '0', 0),
(2592, 0, 'module_ocfilter', 'module_ocfilter_manual_price', '0', 0),
(2591, 0, 'module_ocfilter', 'module_ocfilter_stock_out_value', '0', 0),
(2590, 0, 'module_ocfilter', 'module_ocfilter_stock_status_type', 'checkbox', 0),
(2589, 0, 'module_ocfilter', 'module_ocfilter_stock_status_method', 'quantity', 0),
(2588, 0, 'module_ocfilter', 'module_ocfilter_stock_status', '0', 0),
(2587, 0, 'module_ocfilter', 'module_ocfilter_manufacturer_type', 'checkbox', 0),
(2586, 0, 'module_ocfilter', 'module_ocfilter_manufacturer', '1', 0),
(2585, 0, 'module_ocfilter', 'module_ocfilter_show_counter', '1', 0),
(2584, 0, 'module_ocfilter', 'module_ocfilter_show_price', '1', 0),
(2583, 0, 'module_ocfilter', 'module_ocfilter_show_selected', '1', 0),
(2582, 0, 'module_ocfilter', 'module_ocfilter_search_button', '1', 0),
(2581, 0, 'module_ocfilter', 'module_ocfilter_sitemap_link', 'http://medilux/index.php?route=extension/feed/ocfilter_sitemap', 0),
(2580, 0, 'module_ocfilter', 'module_ocfilter_sitemap_status', '1', 0),
(2579, 0, 'module_ocfilter', 'module_ocfilter_sub_category', '0', 0),
(2578, 0, 'module_ocfilter', 'module_ocfilter_status', '1', 0),
(2599, 0, 'module_ocfilter', 'module_ocfilter_copy_type', 'checkbox', 0),
(2600, 0, 'module_ocfilter', 'module_ocfilter_copy_status', '-1', 0),
(2601, 0, 'module_ocfilter', 'module_ocfilter_copy_attribute', '1', 0),
(2602, 0, 'module_ocfilter', 'module_ocfilter_attribute_separator', '', 0),
(2603, 0, 'module_ocfilter', 'module_ocfilter_copy_filter', '0', 0),
(2604, 0, 'module_ocfilter', 'module_ocfilter_copy_option', '0', 0),
(2605, 0, 'module_ocfilter', 'module_ocfilter_copy_truncate', '0', 0),
(2606, 0, 'module_ocfilter', 'module_ocfilter_copy_category', '1', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_shipping_courier`
--

CREATE TABLE `oc_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_shipping_courier`
--

INSERT INTO `oc_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
(1, 'dhl', 'DHL'),
(2, 'fedex', 'Fedex'),
(3, 'ups', 'UPS'),
(4, 'royal-mail', 'Royal Mail'),
(5, 'usps', 'United States Postal Service'),
(6, 'auspost', 'Australia Post');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_statistics`
--

CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_statistics`
--

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', '0.0000'),
(2, 'order_processing', '0.0000'),
(3, 'order_complete', '0.0000'),
(4, 'order_other', '0.0000'),
(5, 'returns', '0.0000'),
(6, 'product', '0.0000'),
(7, 'review', '0.0000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'В наличии'),
(8, 1, 'Предзаказ'),
(5, 1, 'Нет в наличии'),
(6, 1, 'Ожидание 2-3 дня');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Налоги', 'Облагаемые налогом', '2018-06-06 23:00:00', '2018-09-09 11:50:31');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(87, 3, 'НДС', '18.0000', 'F', '2018-09-21 21:49:23', '2018-09-09 11:49:32');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_theme`
--

CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_translation`
--

CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '209b76ec26aa464b5a525d3e9db5f7cc5e37972e', 'VkRk9A8H8', 'John', 'Doe', 'gg@mail.ru', '', '', '127.0.0.1', 1, '2021-05-28 11:38:33');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"blog\\/blog\",\"blog\\/blog_category\",\"blog\\/blog_comment\",\"blog\\/blog_setting\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/news\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/newsletter\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/information\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/fraud\\/ip\",\"extension\\/information\\/optimblog\",\"extension\\/module\\/account\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/ocfilter\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/sms_alert\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_standard\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/theme\\/medilux\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"extension\\/wfmmenu\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"blog\\/blog\",\"blog\\/blog_category\",\"blog\\/blog_comment\",\"blog\\/blog_setting\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/news\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/newsletter\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/information\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/fraud\\/ip\",\"extension\\/information\\/optimblog\",\"extension\\/module\\/account\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/ocfilter\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/sms_alert\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_standard\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/theme\\/medilux\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"extension\\/wfmmenu\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}'),
(10, 'Demonstration', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/news\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/newsletter\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/information\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/fraud\\/ip\",\"extension\\/information\\/optimblog\",\"extension\\/module\\/account\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/sms_alert\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_standard\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/theme\\/medilux\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"extension\\/wfmmenu\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/news\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/newsletter\",\"common\\/profile\",\"common\\/security\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/advertise\\/google\",\"extension\\/analytics\\/google\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/information\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/promotion\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/fraud\\/ip\",\"extension\\/information\\/optimblog\",\"extension\\/module\\/account\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/latest\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/sms_alert\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_standard\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/weight\",\"extension\\/theme\\/default\",\"extension\\/theme\\/medilux\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"extension\\/wfmmenu\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Новый год'),
(7, 1, 'День рождения'),
(8, 1, 'Другое');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT 0.00000000
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Килограмм', 'кг'),
(2, 1, 'Грамм', 'г');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_wfmmenu`
--

CREATE TABLE `oc_wfmmenu` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 20, 'Брест', 'BR', 1),
(2, 20, 'Гомель', 'HO', 1),
(3, 20, 'Минск', 'HM', 1),
(4, 20, 'Гродно', 'HR', 1),
(5, 20, 'Могилев', 'MA', 1),
(6, 20, 'Минская область', 'MI', 1),
(7, 20, 'Витебск', 'VI', 1),
(8, 80, 'Abkhazia', 'AB', 1),
(9, 80, 'Ajaria', 'AJ', 1),
(10, 80, 'Tbilisi', 'TB', 1),
(11, 80, 'Guria', 'GU', 1),
(12, 80, 'Imereti', 'IM', 1),
(13, 80, 'Kakheti', 'KA', 1),
(14, 80, 'Kvemo Kartli', 'KK', 1),
(15, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(16, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(17, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(18, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(19, 80, 'Shida Kartli', 'SK', 1),
(20, 109, 'Алматинская область', 'AL', 1),
(21, 109, 'Алматы - город республ-го значения', 'AC', 1),
(22, 109, 'Акмолинская область', 'AM', 1),
(23, 109, 'Актюбинская область', 'AQ', 1),
(24, 109, 'Астана - город республ-го значения', 'AS', 1),
(25, 109, 'Атырауская область', 'AT', 1),
(26, 109, 'Западно-Казахстанская область', 'BA', 1),
(27, 109, 'Байконур - город республ-го значения', 'BY', 1),
(28, 109, 'Мангистауская область', 'MA', 1),
(29, 109, 'Южно-Казахстанская область', 'ON', 1),
(30, 109, 'Павлодарская область', 'PA', 1),
(31, 109, 'Карагандинская область', 'QA', 1),
(32, 109, 'Костанайская область', 'QO', 1),
(33, 109, 'Кызылординская область', 'QY', 1),
(34, 109, 'Восточно-Казахстанская область', 'SH', 1),
(35, 109, 'Северо-Казахстанская область', 'SO', 1),
(36, 109, 'Жамбылская область', 'ZH', 1),
(37, 115, 'Bishkek', 'GB', 1),
(38, 115, 'Batken', 'B', 1),
(39, 115, 'Chu', 'C', 1),
(40, 115, 'Jalal-Abad', 'J', 1),
(41, 115, 'Naryn', 'N', 1),
(42, 115, 'Osh', 'O', 1),
(43, 115, 'Talas', 'T', 1),
(44, 115, 'Ysyk-Kol', 'Y', 1),
(45, 176, 'Республика Хакасия', 'KK', 1),
(46, 176, 'Московская область', 'MOS', 1),
(47, 176, 'Чукотский АО', 'CHU', 1),
(48, 176, 'Архангельская область', 'ARK', 1),
(49, 176, 'Астраханская область', 'AST', 1),
(50, 176, 'Алтайский край', 'ALT', 1),
(51, 176, 'Белгородская область', 'BEL', 1),
(52, 176, 'Еврейская АО', 'YEV', 1),
(53, 176, 'Амурская область', 'AMU', 1),
(54, 176, 'Брянская область', 'BRY', 1),
(55, 176, 'Чувашская Республика', 'CU', 1),
(56, 176, 'Челябинская область', 'CHE', 1),
(57, 176, 'Карачаево-Черкесия', 'KC', 1),
(58, 176, 'Забайкальский край', 'ZAB', 1),
(59, 176, 'Ленинградская область', 'LEN', 1),
(60, 176, 'Республика Калмыкия', 'KL', 1),
(61, 176, 'Сахалинская область', 'SAK', 1),
(62, 176, 'Республика Алтай', 'AL', 1),
(63, 176, 'Чеченская Республика', 'CE', 1),
(64, 176, 'Иркутская область', 'IRK', 1),
(65, 176, 'Ивановская область', 'IVA', 1),
(66, 176, 'Удмуртская Республика', 'UD', 1),
(67, 176, 'Калининградская область', 'KGD', 1),
(68, 176, 'Калужская область', 'KLU', 1),
(69, 176, 'Республика Татарстан', 'TA', 1),
(70, 176, 'Кемеровская область', 'KEM', 1),
(71, 176, 'Хабаровский край', 'KHA', 1),
(72, 176, 'Ханты-Мансийский АО - Югра', 'KHM', 1),
(73, 176, 'Костромская область', 'KOS', 1),
(74, 176, 'Краснодарский край', 'KDA', 1),
(75, 176, 'Красноярский край', 'KYA', 1),
(76, 176, 'Курганская область', 'KGN', 1),
(77, 176, 'Курская область', 'KRS', 1),
(78, 176, 'Республика Тыва', 'TY', 1),
(79, 176, 'Липецкая область', 'LIP', 1),
(80, 176, 'Магаданская область', 'MAG', 1),
(81, 176, 'Республика Дагестан', 'DA', 1),
(82, 176, 'Республика Адыгея', 'AD', 1),
(83, 176, 'Москва', 'MOW', 1),
(84, 176, 'Мурманская область', 'MUR', 1),
(85, 176, 'Республика Кабардино-Балкария', 'KB', 1),
(86, 176, 'Ненецкий АО', 'NEN', 1),
(87, 176, 'Республика Ингушетия', 'IN', 1),
(88, 176, 'Нижегородская область', 'NIZ', 1),
(89, 176, 'Новгородская область', 'NGR', 1),
(90, 176, 'Новосибирская область', 'NVS', 1),
(91, 176, 'Омская область', 'OMS', 1),
(92, 176, 'Орловская область', 'ORL', 1),
(93, 176, 'Оренбургская область', 'ORE', 1),
(94, 176, 'Пензенская область', 'PNZ', 1),
(95, 176, 'Пермский край', 'PER', 1),
(96, 176, 'Камчатский край', 'KAM', 1),
(97, 176, 'Республика Карелия', 'KR', 1),
(98, 176, 'Псковская область', 'PSK', 1),
(99, 176, 'Ростовская область', 'ROS', 1),
(100, 176, 'Рязанская область', 'RYA', 1),
(101, 176, 'Ямало-Ненецкий АО', 'YAN', 1),
(102, 176, 'Самарская область', 'SAM', 1),
(103, 176, 'Республика Мордовия', 'MO', 1),
(104, 176, 'Саратовская область', 'SAR', 1),
(105, 176, 'Смоленская область', 'SMO', 1),
(106, 176, 'Санкт-Петербург', 'SPE', 1),
(107, 176, 'Ставропольский край', 'STA', 1),
(108, 176, 'Республика Коми', 'KO', 1),
(109, 176, 'Тамбовская область', 'TAM', 1),
(110, 176, 'Томская область', 'TOM', 1),
(111, 176, 'Тульская область', 'TUL', 1),
(112, 176, 'Тверская область', 'TVE', 1),
(113, 176, 'Тюменская область', 'TYU', 1),
(114, 176, 'Республика Башкортостан', 'BA', 1),
(115, 176, 'Ульяновская область', 'ULY', 1),
(116, 176, 'Республика Бурятия', 'BU', 1),
(117, 176, 'Республика Северная Осетия', 'SE', 1),
(118, 176, 'Владимирская область', 'VLA', 1),
(119, 176, 'Приморский край', 'PRI', 1),
(120, 176, 'Волгоградская область', 'VGG', 1),
(121, 176, 'Вологодская область', 'VLG', 1),
(122, 176, 'Воронежская область', 'VOR', 1),
(123, 176, 'Кировская область', 'KIR', 1),
(124, 176, 'Республика Саха', 'SA', 1),
(125, 176, 'Ярославская область', 'YAR', 1),
(126, 176, 'Свердловская область', 'SVE', 1),
(127, 176, 'Республика Марий Эл', 'ME', 1),
(128, 176, 'Республика Крым', 'CR', 1),
(129, 220, 'Черкассы', 'CK', 1),
(130, 220, 'Чернигов', 'CH', 1),
(131, 220, 'Черновцы', 'CV', 1),
(132, 220, 'Днепропетровск', 'DN', 1),
(133, 220, 'Донецк', 'DO', 1),
(134, 220, 'Ивано-Франковск', 'IV', 1),
(135, 220, 'Харьков', 'KH', 1),
(136, 220, 'Хмельницкий', 'KM', 1),
(137, 220, 'Кировоград', 'KR', 1),
(138, 220, 'Киевская область', 'KV', 1),
(139, 220, 'Киев', 'KY', 1),
(140, 220, 'Луганск', 'LU', 1),
(141, 220, 'Львов', 'LV', 1),
(142, 220, 'Николаев', 'MY', 1),
(143, 220, 'Одесса', 'OD', 1),
(144, 220, 'Полтава', 'PO', 1),
(145, 220, 'Ровно', 'RI', 1),
(146, 176, 'Севастополь', 'SEV', 1),
(147, 220, 'Сумы', 'SU', 1),
(148, 220, 'Тернополь', 'TE', 1),
(149, 220, 'Винница', 'VI', 1),
(150, 220, 'Луцк', 'VO', 1),
(151, 220, 'Ужгород', 'ZK', 1),
(152, 220, 'Запорожье', 'ZA', 1),
(153, 220, 'Житомир', 'ZH', 1),
(154, 220, 'Херсон', 'KE', 1),
(155, 226, 'Andijon', 'AN', 1),
(156, 226, 'Buxoro', 'BU', 1),
(157, 226, 'Farg\'ona', 'FA', 1),
(158, 226, 'Jizzax', 'JI', 1),
(159, 226, 'Namangan', 'NG', 1),
(160, 226, 'Navoiy', 'NW', 1),
(161, 226, 'Qashqadaryo', 'QA', 1),
(162, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(163, 226, 'Samarqand', 'SA', 1),
(164, 226, 'Sirdaryo', 'SI', 1),
(165, 226, 'Surxondaryo', 'SU', 1),
(166, 226, 'Toshkent City', 'TK', 1),
(167, 226, 'Toshkent Region', 'TO', 1),
(168, 226, 'Xorazm', 'XO', 1),
(169, 176, 'Байконур - город республ-го значения', 'BY', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 176, 0, 3, '2018-09-09 11:48:13', '0000-00-00 00:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Индексы таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Индексы таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Индексы таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Индексы таблицы `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Индексы таблицы `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Индексы таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Индексы таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Индексы таблицы `oc_blog`
--
ALTER TABLE `oc_blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Индексы таблицы `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Индексы таблицы `oc_blog_category_description`
--
ALTER TABLE `oc_blog_category_description`
  ADD PRIMARY KEY (`blog_category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_blog_category_to_layout`
--
ALTER TABLE `oc_blog_category_to_layout`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Индексы таблицы `oc_blog_category_to_store`
--
ALTER TABLE `oc_blog_category_to_store`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Индексы таблицы `oc_blog_comment`
--
ALTER TABLE `oc_blog_comment`
  ADD PRIMARY KEY (`blog_comment_id`);

--
-- Индексы таблицы `oc_blog_related_products`
--
ALTER TABLE `oc_blog_related_products`
  ADD PRIMARY KEY (`blog_id`,`related_id`);

--
-- Индексы таблицы `oc_blog_to_category`
--
ALTER TABLE `oc_blog_to_category`
  ADD PRIMARY KEY (`blog_id`,`blog_category_id`);

--
-- Индексы таблицы `oc_blog_to_layout`
--
ALTER TABLE `oc_blog_to_layout`
  ADD PRIMARY KEY (`blog_id`,`store_id`);

--
-- Индексы таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Индексы таблицы `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Индексы таблицы `oc_category_image`
--
ALTER TABLE `oc_category_image`
  ADD PRIMARY KEY (`category_image_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Индексы таблицы `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Индексы таблицы `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Индексы таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Индексы таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Индексы таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Индексы таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Индексы таблицы `oc_customer_affiliate`
--
ALTER TABLE `oc_customer_affiliate`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  ADD PRIMARY KEY (`customer_approval_id`);

--
-- Индексы таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Индексы таблицы `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Индексы таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Индексы таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Индексы таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Индексы таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Индексы таблицы `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Индексы таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Индексы таблицы `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Индексы таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Индексы таблицы `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Индексы таблицы `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Индексы таблицы `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Индексы таблицы `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Индексы таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Индексы таблицы `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Индексы таблицы `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  ADD PRIMARY KEY (`extension_path_id`);

--
-- Индексы таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Индексы таблицы `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Индексы таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Индексы таблицы `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Индексы таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Индексы таблицы `oc_googleshopping_category`
--
ALTER TABLE `oc_googleshopping_category`
  ADD PRIMARY KEY (`google_product_category`,`store_id`),
  ADD KEY `category_id_store_id` (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_googleshopping_product`
--
ALTER TABLE `oc_googleshopping_product`
  ADD PRIMARY KEY (`product_advertise_google_id`),
  ADD UNIQUE KEY `product_id_store_id` (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_googleshopping_product_status`
--
ALTER TABLE `oc_googleshopping_product_status`
  ADD PRIMARY KEY (`product_id`,`store_id`,`product_variation_id`);

--
-- Индексы таблицы `oc_googleshopping_product_target`
--
ALTER TABLE `oc_googleshopping_product_target`
  ADD PRIMARY KEY (`product_id`,`advertise_google_target_id`);

--
-- Индексы таблицы `oc_googleshopping_target`
--
ALTER TABLE `oc_googleshopping_target`
  ADD PRIMARY KEY (`advertise_google_target_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Индексы таблицы `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Индексы таблицы `oc_information_attribute`
--
ALTER TABLE `oc_information_attribute`
  ADD PRIMARY KEY (`information_id`,`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Индексы таблицы `oc_information_filter`
--
ALTER TABLE `oc_information_filter`
  ADD PRIMARY KEY (`information_id`,`filter_id`);

--
-- Индексы таблицы `oc_information_image`
--
ALTER TABLE `oc_information_image`
  ADD PRIMARY KEY (`information_image_id`),
  ADD KEY `information_id` (`information_id`);

--
-- Индексы таблицы `oc_information_product_related`
--
ALTER TABLE `oc_information_product_related`
  ADD PRIMARY KEY (`information_id`,`product_id`);

--
-- Индексы таблицы `oc_information_related`
--
ALTER TABLE `oc_information_related`
  ADD PRIMARY KEY (`information_id`,`related_id`);

--
-- Индексы таблицы `oc_information_to_category`
--
ALTER TABLE `oc_information_to_category`
  ADD PRIMARY KEY (`information_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_information_to_user`
--
ALTER TABLE `oc_information_to_user`
  ADD PRIMARY KEY (`information_id`);

--
-- Индексы таблицы `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Индексы таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Индексы таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Индексы таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Индексы таблицы `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Индексы таблицы `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Индексы таблицы `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Индексы таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Индексы таблицы `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Индексы таблицы `oc_newsletter`
--
ALTER TABLE `oc_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Индексы таблицы `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Индексы таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Индексы таблицы `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Индексы таблицы `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Индексы таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Индексы таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Индексы таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Индексы таблицы `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  ADD PRIMARY KEY (`order_shipment_id`);

--
-- Индексы таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Индексы таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Индексы таблицы `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Индексы таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Индексы таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Индексы таблицы `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Индексы таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Индексы таблицы `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Индексы таблицы `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Индексы таблицы `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Индексы таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Индексы таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Индексы таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Индексы таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Индексы таблицы `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `information_id` (`information_id`);

--
-- Индексы таблицы `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  ADD PRIMARY KEY (`seo_url_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Индексы таблицы `oc_session`
--
ALTER TABLE `oc_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Индексы таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `oc_shipping_courier`
--
ALTER TABLE `oc_shipping_courier`
  ADD PRIMARY KEY (`shipping_courier_id`);

--
-- Индексы таблицы `oc_statistics`
--
ALTER TABLE `oc_statistics`
  ADD PRIMARY KEY (`statistics_id`);

--
-- Индексы таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Индексы таблицы `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Индексы таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Индексы таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Индексы таблицы `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Индексы таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Индексы таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Индексы таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Индексы таблицы `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Индексы таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Индексы таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Индексы таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Индексы таблицы `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Индексы таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Индексы таблицы `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Индексы таблицы `oc_wfmmenu`
--
ALTER TABLE `oc_wfmmenu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Индексы таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT для таблицы `oc_blog`
--
ALTER TABLE `oc_blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  MODIFY `blog_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_blog_comment`
--
ALTER TABLE `oc_blog_comment`
  MODIFY `blog_comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `oc_category_image`
--
ALTER TABLE `oc_category_image`
  MODIFY `category_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT для таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  MODIFY `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  MODIFY `extension_install_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  MODIFY `extension_path_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT для таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_googleshopping_product`
--
ALTER TABLE `oc_googleshopping_product`
  MODIFY `product_advertise_google_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_information_image`
--
ALTER TABLE `oc_information_image`
  MODIFY `information_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT для таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT для таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `oc_newsletter`
--
ALTER TABLE `oc_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  MODIFY `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT для таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT для таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2475;

--
-- AUTO_INCREMENT для таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT для таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- AUTO_INCREMENT для таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT для таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  MODIFY `seo_url_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1116;

--
-- AUTO_INCREMENT для таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2607;

--
-- AUTO_INCREMENT для таблицы `oc_statistics`
--
ALTER TABLE `oc_statistics`
  MODIFY `statistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT для таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_wfmmenu`
--
ALTER TABLE `oc_wfmmenu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT для таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
