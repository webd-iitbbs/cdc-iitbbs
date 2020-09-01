-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2020 at 05:27 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Demo 1', '2020-02-08 19:12:04', '2020-02-08 19:12:04'),
(2, 'Demo2', '2020-02-09 03:00:13', '2020-02-09 03:00:13'),
(3, 'Demo 3', '2020-02-11 07:59:40', '2020-02-11 07:59:40');

-- --------------------------------------------------------

--
-- Table structure for table `chatter_categories`
--

CREATE TABLE `chatter_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatter_categories`
--

INSERT INTO `chatter_categories` (`id`, `parent_id`, `order`, `name`, `color`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Placement Queries', '#3498DB', 'placement', NULL, NULL),
(2, NULL, 2, 'Internship Queries', '#2ECC71', 'internship', NULL, NULL),
(3, NULL, 3, 'Experiences', '#9B59B6', 'experiences', NULL, NULL),
(4, NULL, 4, 'Random', '#E67E22', 'random', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chatter_discussion`
--

CREATE TABLE `chatter_discussion` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_category_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `answered` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#232629',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatter_discussion`
--

INSERT INTO `chatter_discussion` (`id`, `chatter_category_id`, `title`, `user_id`, `sticky`, `views`, `answered`, `created_at`, `updated_at`, `slug`, `color`, `deleted_at`, `last_reply_at`) VALUES
(3, 1, 'Hello Everyone, This is my Introduction', 1, 0, 0, 0, '2016-08-18 08:57:56', '2016-08-18 08:57:56', 'hello-everyone-this-is-my-introduction', '#239900', NULL, '2020-04-04 15:53:20'),
(6, 2, 'Login Information for Chatter', 1, 0, 0, 0, '2016-08-18 09:09:36', '2016-08-18 09:09:36', 'login-information-for-chatter', '#1a1067', NULL, '2020-04-04 15:53:20'),
(7, 3, 'Leaving Feedback', 1, 0, 0, 0, '2016-08-18 09:12:29', '2016-08-18 09:12:29', 'leaving-feedback', '#8e1869', NULL, '2020-04-04 15:53:20'),
(8, 4, 'Just a random post', 1, 0, 0, 0, '2016-08-18 09:16:38', '2020-08-10 11:07:50', 'just-a-random-post', '', NULL, '2020-08-10 11:07:50'),
(9, 2, 'Welcome to the Chatter Laravel Forum Package', 1, 0, 0, 0, '2016-08-18 09:29:37', '2020-04-04 12:05:27', 'welcome-to-the-chatter-laravel-forum-package', '', NULL, '2020-04-04 12:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `chatter_post`
--

CREATE TABLE `chatter_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_discussion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `markdown` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatter_post`
--

INSERT INTO `chatter_post` (`id`, `chatter_discussion_id`, `user_id`, `body`, `created_at`, `updated_at`, `markdown`, `locked`, `deleted_at`) VALUES
(1, 3, 1, '<p>My name is Tony and I\'m a developer at <a href=\"https://devdojo.com\" target=\"_blank\">https://devdojo.com</a> and I also work with an awesome company in PB called The Control Group: <a href=\"http://www.thecontrolgroup.com\" target=\"_blank\">http://www.thecontrolgroup.com</a></p>\n        <p>You can check me out on twitter at <a href=\"http://www.twitter.com/tnylea\" target=\"_blank\">http://www.twitter.com/tnylea</a></p>\n        <p>or you can subscribe to me on YouTube at <a href=\"http://www.youtube.com/devdojo\" target=\"_blank\">http://www.youtube.com/devdojo</a></p>', '2016-08-18 08:57:56', '2016-08-18 08:57:56', 0, 0, NULL),
(5, 6, 1, '<p>Hey!</p>\n        <p>Thanks again for checking out chatter. If you want to login with the default user you can login with the following credentials:</p>\n        <p><strong>email address</strong>: tony@hello.com</p>\n        <p><strong>password</strong>: password</p>\n        <p>You\'ll probably want to delete this user, but if for some reason you want to keep it... Go ahead :)</p>', '2016-08-18 09:09:36', '2016-08-18 09:09:36', 0, 0, NULL),
(6, 7, 1, '<p>If you would like to leave some feedback or have any issues be sure to visit the github page here: <a href=\"https://github.com/thedevdojo/chatter\" target=\"_blank\">https://github.com/thedevdojo/chatter</a>&nbsp;and I\'m sure I can help out.</p>\n        <p>Let\'s make this package the go to Laravel Forum package. Feel free to contribute and share your ideas :)</p>', '2016-08-18 09:12:29', '2016-08-18 09:12:29', 0, 0, NULL),
(7, 8, 1, '<p>This is just a random post to show you some of the formatting that you can do in the WYSIWYG editor. You can make your text <strong>bold</strong>, <em>italic</em>, or <span style=\"text-decoration: underline;\">underlined</span>.</p>\n        <p style=\"text-align: center;\">Additionally, you can center align text.</p>\n        <p style=\"text-align: right;\">You can align the text to the right!</p>\n        <p>Or by default it will be aligned to the left.</p>\n        <ul>\n        <li>We can also</li>\n        <li>add a bulleted</li>\n        <li>list</li>\n        </ul>\n        <ol>\n        <li><span style=\"line-height: 1.6;\">or we can</span></li>\n        <li><span style=\"line-height: 1.6;\">add a numbered list</span></li>\n        </ol>\n        <p style=\"padding-left: 30px;\"><span style=\"line-height: 1.6;\">We can choose to indent our text</span></p>\n        <p><span style=\"line-height: 1.6;\">Post links: <a href=\"https://devdojo.com\" target=\"_blank\">https://devdojo.com</a></span></p>\n        <p><span style=\"line-height: 1.6;\">and add images:</span></p>\n        <p><span style=\"line-height: 1.6;\"><img src=\"https://media.giphy.com/media/o0vwzuFwCGAFO/giphy.gif\" alt=\"\" width=\"300\" height=\"300\" /></span></p>', '2016-08-18 09:16:38', '2016-08-18 09:16:38', 0, 0, NULL),
(8, 8, 1, '<p>Haha :) Cats!</p>\n        <p><img src=\"https://media.giphy.com/media/5Vy3WpDbXXMze/giphy.gif\" alt=\"\" width=\"250\" height=\"141\" /></p>\n        <p><img src=\"https://media.giphy.com/media/XNdoIMwndQfqE/200.gif\" alt=\"\" width=\"200\" height=\"200\" /></p>', '2016-08-18 09:25:42', '2016-08-18 10:15:13', 0, 0, NULL),
(9, 9, 1, '<p>Hey There!</p>\n        <p>My name is Tony and I\'m the creator of this package that you\'ve just installed. Thanks for checking out it out and if you have any questions or want to contribute be sure to checkout the repo here: <a href=\"https://github.com/thedevdojo/chatter\" target=\"_blank\">https://github.com/thedevdojo/chatter</a></p>\n        <p>Happy programming!</p>', '2016-08-18 09:29:37', '2016-08-18 09:29:37', 0, 0, NULL),
(10, 9, 1, '<p>Hell yeah Bro Sauce!</p>\n        <p><img src=\"https://media.giphy.com/media/j5QcmXoFWl4Q0/giphy.gif\" alt=\"\" width=\"366\" height=\"229\" /></p>', '2016-08-18 09:31:25', '2016-08-18 09:31:25', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chatter_user_discussion`
--

CREATE TABLE `chatter_user_discussion` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactforms`
--

CREATE TABLE `contactforms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contactforms`
--

INSERT INTO `contactforms` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Sudheer Bulusu', 'bds15@iitbbs.ac.in', 'Test message', 'Hi, My name is Sudheer.\r\nThis is a test email, Thank You\r\n', NULL, NULL),
(2, 'sudheer', 'bds15@iitbbs.ac.in', 'test mail', 'this is a test message', NULL, NULL),
(3, 'Sudheer', 'bds15@iitbbs.ac.in', 'Final test', 'This is final test Thanks', NULL, NULL),
(4, 'sudheer', 'bds15@iitbbs.ac.in', 'test one last', 'this is last test please', NULL, NULL),
(5, 'sudheer', 'bds15@iitbbs.ac.in', 'test one last', 'this is last test please', NULL, NULL),
(6, 'sudheer', 'bds15@iitbbs.ac.in', 'test one last', 'this is last test please', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 0, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(46, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(47, 9, 'message', 'text', 'Message', 0, 1, 1, 1, 1, 1, '{}', 2),
(50, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(51, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(52, 1, 'provider', 'text', 'Provider', 0, 1, 1, 1, 1, 1, '{}', 6),
(53, 1, 'provider_id', 'text', 'Provider Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(54, 1, 'roll', 'text', 'Roll', 0, 1, 1, 1, 1, 1, '{}', 8),
(55, 1, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 9),
(56, 1, 'cgpa', 'text', 'Cgpa', 0, 1, 1, 1, 1, 1, '{}', 10),
(57, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 11),
(137, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(138, 15, 'company_name', 'text', 'Company Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(139, 15, 'profile', 'text', 'Profile', 1, 1, 1, 1, 1, 1, '{}', 3),
(140, 15, 'logoimage', 'text', 'Logoimage', 0, 1, 1, 1, 1, 1, '{}', 4),
(141, 15, 'TenthScore', 'text', 'TenthScore', 0, 1, 1, 1, 1, 1, '{}', 5),
(142, 15, 'TwelfthScore', 'text', 'TwelfthScore', 0, 1, 1, 1, 1, 1, '{}', 6),
(143, 15, 'cgpa', 'text', 'Cgpa', 0, 1, 1, 1, 1, 1, '{}', 7),
(144, 15, 'course', 'select_multiple', 'Course', 0, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"BTech\",\"2\":\"BTech + MTech Dual Degree\",\"6\":\"MTech\"}}', 8),
(145, 15, 'department', 'select_multiple', 'Department', 0, 1, 1, 1, 1, 1, '{\"default\":\"CS\",\"options\":{\"CS\":\"Computer Science\",\"EC\":\"Electronics and Communication\",\"EE\":\"Electrical\",\"ME\":\"Mechanical\",\"CE\":\"Civil\",\"MM\":\"Metallurgy\"}}', 9),
(146, 15, 'activebacklog', 'text', 'Activebacklog', 0, 1, 1, 1, 1, 1, '{}', 10),
(147, 15, 'totalbacklog', 'text', 'Totalbacklog', 0, 1, 1, 1, 1, 1, '{}', 11),
(148, 15, 'examdate', 'date', 'Examdate', 0, 1, 1, 1, 1, 1, '{}', 12),
(149, 15, 'interviewdate', 'date', 'Interviewdate', 0, 1, 1, 1, 1, 1, '{}', 13),
(150, 15, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 14),
(151, 15, 'deadline', 'date', 'Deadline', 0, 1, 1, 1, 1, 1, '{}', 15),
(152, 15, 'CTC', 'text', 'CTC', 0, 1, 1, 1, 1, 1, '{}', 16),
(153, 15, 'TakeHome', 'text', 'TakeHome', 0, 1, 1, 1, 1, 1, '{}', 17),
(154, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 18),
(155, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19),
(156, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(157, 19, 'company_name', 'text', 'Company Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(158, 19, 'profile', 'text', 'Profile', 0, 1, 1, 1, 1, 1, '{}', 3),
(159, 19, 'logoimage', 'text', 'Logoimage', 0, 1, 1, 1, 1, 1, '{}', 4),
(160, 19, 'TenthScore', 'text', 'TenthScore', 0, 1, 1, 1, 1, 1, '{}', 5),
(161, 19, 'TwelfthScore', 'text', 'TwelfthScore', 0, 1, 1, 1, 1, 1, '{}', 6),
(162, 19, 'cgpa', 'text', 'Cgpa', 0, 1, 1, 1, 1, 1, '{}', 7),
(163, 19, 'course', 'select_multiple', 'Course', 0, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"BTech\",\"2\":\"BTech + MTech Dual Degree\",\"6\":\"MTech\"}}', 8),
(164, 19, 'department', 'select_multiple', 'Department', 0, 1, 1, 1, 1, 1, '{\"default\":\"CS\",\"options\":{\"CS\":\"Computer Science\",\"EC\":\"Electronics and Communication\",\"EE\":\"Electrical\",\"ME\":\"Mechanical\",\"CE\":\"Civil\",\"MM\":\"Metallurgy\"}}', 9),
(165, 19, 'activebacklog', 'text', 'Activebacklog', 0, 1, 1, 1, 1, 1, '{}', 10),
(166, 19, 'totalbacklog', 'text', 'Totalbacklog', 0, 1, 1, 1, 1, 1, '{}', 11),
(167, 19, 'examdate', 'date', 'Examdate', 0, 1, 1, 1, 1, 1, '{}', 12),
(168, 19, 'interviewdate', 'date', 'Interviewdate', 0, 1, 1, 1, 1, 1, '{}', 13),
(169, 19, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 14),
(170, 19, 'deadline', 'date', 'Deadline', 0, 1, 1, 1, 1, 1, '{}', 15),
(171, 19, 'CTC', 'text', 'CTC', 0, 1, 1, 1, 1, 1, '{}', 16),
(172, 19, 'TakeHome', 'text', 'TakeHome', 0, 1, 1, 1, 1, 1, '{}', 17),
(173, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 18),
(174, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-12-03 01:18:25', '2020-04-04 08:08:25'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-12-03 01:18:25', '2020-04-04 08:07:56'),
(9, 'announcements', 'announcements', 'Announcement', 'Announcements', 'voyager-bell', 'App\\Announcement', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-12-04 03:21:54', '2020-04-04 08:07:44'),
(15, 'placements', 'placements', 'Placement', 'Placements', 'voyager-company', 'App\\Placement', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-08-13 03:16:32', '2020-08-13 03:16:32'),
(19, 'internships', 'internships', 'Internship', 'Internships', 'voyager-milestone', 'App\\Internship', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-08-13 03:20:15', '2020-08-13 03:20:15'),
(21, 'contactform', 'contactform', 'Contactform', 'Contactforms', 'voyager-people', 'App\\Contactform', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-09-01 08:52:10', '2020-09-01 08:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `fourthyear`
--

CREATE TABLE `fourthyear` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `roll` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `Directi` varchar(191) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fourthyear`
--

INSERT INTO `fourthyear` (`id`, `name`, `email`, `roll`, `phone`, `Directi`) VALUES
(1, 'Secretary Web & Design Students\' Gymkhana', 'secyweb.sg@iitbbs.ac.in', '17ME01017', '7675974963', '1');

-- --------------------------------------------------------

--
-- Table structure for table `internships`
--

CREATE TABLE `internships` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logoimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TenthScore` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TwelfthScore` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cgpa` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activebacklog` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalbacklog` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `examdate` date DEFAULT NULL,
  `interviewdate` date DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `CTC` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TakeHome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `internships`
--

INSERT INTO `internships` (`id`, `company_name`, `profile`, `logoimage`, `TenthScore`, `TwelfthScore`, `cgpa`, `course`, `department`, `activebacklog`, `totalbacklog`, `examdate`, `interviewdate`, `status`, `deadline`, `CTC`, `TakeHome`, `created_at`, `updated_at`) VALUES
(10, 'Directi', 'Backend Engineer', 'https://lever-client-logos.s3.amazonaws.com/bbf01a3f-555b-4cbd-a070-79ec7e7182b9-1535447434895.png', '80', '80', '7', '[\"1\"]', '[\"CS\",\"EC\",\"EE\",\"ME\"]', 'NO', 'NO', '2020-08-22', '2020-08-24', NULL, '2020-08-20', '18LPA', '12LPA', '2020-08-13 07:31:31', '2020-08-13 07:31:31'),
(11, 'Microsoft', 'Software Development Engineer', 'https://1000logos.net/wp-content/uploads/2017/04/Microsoft-Logo.png', '9', '9', '8', '[\"1\"]', '[\"CS\",\"EC\",\"EE\",\"ME\"]', 'NO', 'NO', '2020-09-01', '2020-09-03', NULL, '2020-08-31', '23LPA', '18LPA', '2020-09-01 04:29:00', '2020-09-01 04:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(3, 'normal', '2019-12-06 03:44:14', '2020-04-04 07:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-12-03 01:18:25', '2019-12-03 01:18:25', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2019-12-03 01:18:25', '2020-08-12 07:35:57', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 2, '2019-12-03 01:18:25', '2020-08-11 05:24:33', 'voyager.users.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2019-12-03 01:18:25', '2020-09-01 08:52:39', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-12-03 01:18:25', '2020-08-13 03:21:06', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-12-03 01:18:25', '2020-08-13 03:21:06', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-12-03 01:18:25', '2020-08-13 03:21:07', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-12-03 01:18:25', '2020-08-13 03:21:07', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2019-12-03 01:18:25', '2020-09-01 08:52:39', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-12-03 01:18:25', '2020-08-13 03:21:07', 'voyager.hooks', NULL),
(20, 1, 'Announcements', '', '_self', 'voyager-bell', NULL, NULL, 3, '2019-12-04 03:21:54', '2020-08-11 05:24:45', 'voyager.announcements.index', NULL),
(22, 3, 'Forum', '/forums', '_self', 'voyager-people', '#000000', NULL, 1, '2019-12-06 03:45:22', '2020-04-04 12:39:43', NULL, ''),
(23, 3, 'Home', '/home', '_self', 'voyager-home', '#000000', NULL, 2, '2019-12-06 03:45:45', '2020-04-04 12:39:53', NULL, ''),
(24, 3, 'Internship', '/internship', '_self', 'voyager-milestone', '#000000', NULL, 3, '2019-12-06 04:38:26', '2019-12-06 05:03:42', NULL, ''),
(25, 3, 'Placement', '/placement', '_self', 'voyager-milestone', '#000000', NULL, 4, '2019-12-06 05:03:37', '2020-04-04 12:40:01', NULL, ''),
(30, 1, 'Placements', '', '_self', 'voyager-company', NULL, NULL, 5, '2020-08-13 03:16:33', '2020-08-13 03:21:04', 'voyager.placements.index', NULL),
(31, 1, 'Internships', '', '_self', 'voyager-milestone', NULL, NULL, 6, '2020-08-13 03:20:15', '2020-08-13 03:21:06', 'voyager.internships.index', NULL),
(32, 1, 'Contactforms', '', '_self', 'voyager-people', NULL, NULL, 7, '2020-09-01 08:52:11', '2020-09-01 08:52:39', 'voyager.contactform.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_07_29_171118_create_chatter_categories_table', 1),
(4, '2016_07_29_171118_create_chatter_discussion_table', 1),
(5, '2016_07_29_171118_create_chatter_post_table', 1),
(6, '2016_07_29_171128_create_foreign_keys', 1),
(7, '2016_08_02_183143_add_slug_field_for_discussions', 1),
(8, '2016_08_03_121747_add_color_row_to_chatter_discussions', 1),
(9, '2017_01_16_121747_add_markdown_and_lock_to_chatter_posts', 1),
(10, '2017_01_16_121747_create_chatter_user_discussion_pivot_table', 1),
(11, '2017_08_07_165345_add_chatter_soft_deletes', 1),
(12, '2017_10_10_221227_add_chatter_last_reply_at_discussion', 1),
(13, '2016_01_01_000000_add_voyager_user_fields', 2),
(14, '2016_01_01_000000_create_data_types_table', 2),
(15, '2016_05_19_173453_create_menu_table', 2),
(16, '2016_10_21_190000_create_roles_table', 2),
(17, '2016_10_21_190000_create_settings_table', 2),
(18, '2016_11_30_135954_create_permission_table', 2),
(19, '2016_11_30_141208_create_permission_role_table', 2),
(20, '2016_12_26_201236_data_types__add__server_side', 2),
(21, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(22, '2017_01_14_005015_create_translations_table', 2),
(23, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(24, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(25, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(26, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(27, '2017_08_05_000000_add_group_to_settings_table', 2),
(28, '2017_11_26_013050_add_user_role_relationship', 2),
(29, '2017_11_26_015000_create_user_roles_table', 2),
(30, '2018_03_11_000000_add_user_settings', 2),
(31, '2018_03_14_000000_add_details_to_data_types_table', 2),
(32, '2018_03_16_000000_make_settings_value_nullable', 2),
(33, '2019_12_04_094511_create_announcements_table', 0),
(34, '2019_12_04_094511_create_chatter_categories_table', 0),
(35, '2019_12_04_094511_create_chatter_discussion_table', 0),
(36, '2019_12_04_094511_create_chatter_post_table', 0),
(37, '2019_12_04_094511_create_chatter_user_discussion_table', 0),
(38, '2019_12_04_094511_create_data_rows_table', 0),
(39, '2019_12_04_094511_create_data_types_table', 0),
(40, '2019_12_04_094511_create_internships_table', 0),
(41, '2019_12_04_094511_create_menu_items_table', 0),
(42, '2019_12_04_094511_create_menus_table', 0),
(43, '2019_12_04_094511_create_password_resets_table', 0),
(44, '2019_12_04_094511_create_permission_role_table', 0),
(45, '2019_12_04_094511_create_permissions_table', 0),
(46, '2019_12_04_094511_create_placements_table', 0),
(47, '2019_12_04_094511_create_roles_table', 0),
(48, '2019_12_04_094511_create_settings_table', 0),
(49, '2019_12_04_094511_create_translations_table', 0),
(50, '2019_12_04_094511_create_user_roles_table', 0),
(51, '2019_12_04_094511_create_users_table', 0),
(52, '2019_12_04_094512_add_foreign_keys_to_chatter_discussion_table', 0),
(53, '2019_12_04_094512_add_foreign_keys_to_chatter_post_table', 0),
(54, '2019_12_04_094512_add_foreign_keys_to_chatter_user_discussion_table', 0),
(55, '2019_12_04_094512_add_foreign_keys_to_data_rows_table', 0),
(56, '2019_12_04_094512_add_foreign_keys_to_menu_items_table', 0),
(57, '2019_12_04_094512_add_foreign_keys_to_permission_role_table', 0),
(58, '2019_12_04_094512_add_foreign_keys_to_user_roles_table', 0),
(59, '2019_12_04_094512_add_foreign_keys_to_users_table', 0),
(60, '2019_12_04_103743_create_announcements_table', 0),
(61, '2019_12_04_103743_create_chatter_categories_table', 0),
(62, '2019_12_04_103743_create_chatter_discussion_table', 0),
(63, '2019_12_04_103743_create_chatter_post_table', 0),
(64, '2019_12_04_103743_create_chatter_user_discussion_table', 0),
(65, '2019_12_04_103743_create_data_rows_table', 0),
(66, '2019_12_04_103743_create_data_types_table', 0),
(67, '2019_12_04_103743_create_internships_table', 0),
(68, '2019_12_04_103743_create_menu_items_table', 0),
(69, '2019_12_04_103743_create_menus_table', 0),
(70, '2019_12_04_103743_create_password_resets_table', 0),
(71, '2019_12_04_103743_create_permission_role_table', 0),
(72, '2019_12_04_103743_create_permissions_table', 0),
(73, '2019_12_04_103743_create_placements_table', 0),
(74, '2019_12_04_103743_create_roles_table', 0),
(75, '2019_12_04_103743_create_settings_table', 0),
(76, '2019_12_04_103743_create_translations_table', 0),
(77, '2019_12_04_103743_create_user_roles_table', 0),
(78, '2019_12_04_103743_create_users_table', 0),
(79, '2019_12_04_103744_add_foreign_keys_to_chatter_discussion_table', 0),
(80, '2019_12_04_103744_add_foreign_keys_to_chatter_post_table', 0),
(81, '2019_12_04_103744_add_foreign_keys_to_chatter_user_discussion_table', 0),
(82, '2019_12_04_103744_add_foreign_keys_to_data_rows_table', 0),
(83, '2019_12_04_103744_add_foreign_keys_to_menu_items_table', 0),
(84, '2019_12_04_103744_add_foreign_keys_to_permission_role_table', 0),
(85, '2019_12_04_103744_add_foreign_keys_to_user_roles_table', 0),
(86, '2019_12_04_103744_add_foreign_keys_to_users_table', 0),
(87, '2019_08_19_000000_create_failed_jobs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('bhaskar@gmail.com', '$2y$10$rySq51UaQjbYVjIhNRPFM.VT4VaaVmDBLW5/xRG64ZiTK8NXFZRL2', '2019-12-04 03:07:06'),
('bhaskar@gmail.com', '$2y$10$rySq51UaQjbYVjIhNRPFM.VT4VaaVmDBLW5/xRG64ZiTK8NXFZRL2', '2019-12-04 03:07:06'),
('bds15@iitbbs.ac.in', '$2y$10$6wiQwtW1VvO6LuUJyvTFUeqJsga5dMeBQn8VOxK6tS49xMxZGHEh2', '2020-04-02 11:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(2, 'browse_bread', NULL, '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(3, 'browse_database', NULL, '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(4, 'browse_media', NULL, '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(5, 'browse_compass', NULL, '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(6, 'browse_menus', 'menus', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(7, 'read_menus', 'menus', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(8, 'edit_menus', 'menus', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(9, 'add_menus', 'menus', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(10, 'delete_menus', 'menus', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(16, 'browse_users', 'users', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(17, 'read_users', 'users', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(18, 'edit_users', 'users', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(19, 'add_users', 'users', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(20, 'delete_users', 'users', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(21, 'browse_settings', 'settings', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(22, 'read_settings', 'settings', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(23, 'edit_settings', 'settings', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(24, 'add_settings', 'settings', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(25, 'delete_settings', 'settings', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(26, 'browse_hooks', NULL, '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(47, 'browse_announcements', 'announcements', '2019-12-04 03:21:54', '2019-12-04 03:21:54'),
(48, 'read_announcements', 'announcements', '2019-12-04 03:21:54', '2019-12-04 03:21:54'),
(49, 'edit_announcements', 'announcements', '2019-12-04 03:21:54', '2019-12-04 03:21:54'),
(50, 'add_announcements', 'announcements', '2019-12-04 03:21:54', '2019-12-04 03:21:54'),
(51, 'delete_announcements', 'announcements', '2019-12-04 03:21:54', '2019-12-04 03:21:54'),
(72, 'browse_placements', 'placements', '2020-08-13 03:16:33', '2020-08-13 03:16:33'),
(73, 'read_placements', 'placements', '2020-08-13 03:16:33', '2020-08-13 03:16:33'),
(74, 'edit_placements', 'placements', '2020-08-13 03:16:33', '2020-08-13 03:16:33'),
(75, 'add_placements', 'placements', '2020-08-13 03:16:33', '2020-08-13 03:16:33'),
(76, 'delete_placements', 'placements', '2020-08-13 03:16:33', '2020-08-13 03:16:33'),
(77, 'browse_internships', 'internships', '2020-08-13 03:20:15', '2020-08-13 03:20:15'),
(78, 'read_internships', 'internships', '2020-08-13 03:20:15', '2020-08-13 03:20:15'),
(79, 'edit_internships', 'internships', '2020-08-13 03:20:15', '2020-08-13 03:20:15'),
(80, 'add_internships', 'internships', '2020-08-13 03:20:15', '2020-08-13 03:20:15'),
(81, 'delete_internships', 'internships', '2020-08-13 03:20:15', '2020-08-13 03:20:15'),
(82, 'browse_contactform', 'contactform', '2020-09-01 08:52:10', '2020-09-01 08:52:10'),
(83, 'read_contactform', 'contactform', '2020-09-01 08:52:10', '2020-09-01 08:52:10'),
(84, 'edit_contactform', 'contactform', '2020-09-01 08:52:10', '2020-09-01 08:52:10'),
(85, 'add_contactform', 'contactform', '2020-09-01 08:52:10', '2020-09-01 08:52:10'),
(86, 'delete_contactform', 'contactform', '2020-09-01 08:52:10', '2020-09-01 08:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(50, 1),
(51, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1);

-- --------------------------------------------------------

--
-- Table structure for table `placements`
--

CREATE TABLE `placements` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logoimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TenthScore` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TwelfthScore` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cgpa` char(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course` char(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activebacklog` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalbacklog` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `examdate` date DEFAULT NULL,
  `interviewdate` date DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `CTC` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TakeHome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `placements`
--

INSERT INTO `placements` (`id`, `company_name`, `profile`, `logoimage`, `TenthScore`, `TwelfthScore`, `cgpa`, `course`, `department`, `activebacklog`, `totalbacklog`, `examdate`, `interviewdate`, `status`, `deadline`, `CTC`, `TakeHome`, `created_at`, `updated_at`) VALUES
(6, 'Directi', 'Software Development Engineer', 'https://lever-client-logos.s3.amazonaws.com/bbf01a3f-555b-4cbd-a070-79ec7e7182b9-1535447434895.png', '80', '80', '7', '[\"1\",\"2\"]', '[\"CS\",\"EC\",\"EE\",\"ME\"]', 'NO', 'NO', '2020-08-20', '2020-08-22', NULL, '2020-08-24', '24LPA', '20LPA', '2020-08-13 03:34:53', '2020-08-13 03:34:53');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-12-03 01:18:25', '2019-12-03 01:18:25'),
(2, 'normal', 'student', '2019-12-03 01:18:25', '2020-04-04 07:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Admin', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'CDC', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `thirdyear`
--

CREATE TABLE `thirdyear` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `roll` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `Directi` varchar(191) NOT NULL DEFAULT '0',
  `Microsoft` varchar(191) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thirdyear`
--

INSERT INTO `thirdyear` (`id`, `name`, `email`, `roll`, `phone`, `Directi`, `Microsoft`) VALUES
(1, 'BULUSU SRI DATTA SUDHEER', 'bds15@iitbbs.ac.in', '18ME01017', '7675974963', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT 2,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users/default.png',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roll` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cgpa` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TenthScore` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TwelfthScore` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `provider`, `provider_id`, `roll`, `phone`, `cgpa`, `TenthScore`, `TwelfthScore`, `password`, `email_verified_at`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'tpo', 'tpo@iitbbs.ac.in', 'users/April2020/admin.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$H/MQx9WEuU/P14n3g7t4Je7/EwN01AdkhKWEdLqpWIqfwljlDN1um', NULL, NULL, '{\"locale\":\"en\"}', NULL, '2020-08-09 02:46:13'),
(24, 2, 'Secretary Web & Design Students\' Gymkhana', 'secyweb.sg@iitbbs.ac.in', 'users/default.png', 'google', '115490865416941716327', '17ME01017', '7675974963', '8.3', '80', '80', NULL, NULL, NULL, NULL, '2020-08-09 02:19:41', '2020-08-09 02:19:41'),
(28, 2, 'BULUSU SRI DATTA SUDHEER', 'bds15@iitbbs.ac.in', 'users/default.png', 'google', '103993430126946438437', '18ME01017', '7675974963', '8.3', '9.7', '97', NULL, NULL, NULL, NULL, '2020-08-12 07:20:11', '2020-08-12 07:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatter_categories`
--
ALTER TABLE `chatter_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chatter_discussion_slug_unique` (`slug`),
  ADD KEY `chatter_discussion_chatter_category_id_foreign` (`chatter_category_id`),
  ADD KEY `chatter_discussion_user_id_foreign` (`user_id`);

--
-- Indexes for table `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatter_post_chatter_discussion_id_foreign` (`chatter_discussion_id`),
  ADD KEY `chatter_post_user_id_foreign` (`user_id`);

--
-- Indexes for table `chatter_user_discussion`
--
ALTER TABLE `chatter_user_discussion`
  ADD PRIMARY KEY (`user_id`,`discussion_id`),
  ADD KEY `chatter_user_discussion_user_id_index` (`user_id`),
  ADD KEY `chatter_user_discussion_discussion_id_index` (`discussion_id`);

--
-- Indexes for table `contactforms`
--
ALTER TABLE `contactforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `fourthyear`
--
ALTER TABLE `fourthyear`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `roll` (`roll`);

--
-- Indexes for table `internships`
--
ALTER TABLE `internships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `placements`
--
ALTER TABLE `placements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `thirdyear`
--
ALTER TABLE `thirdyear`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `roll` (`roll`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chatter_categories`
--
ALTER TABLE `chatter_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `chatter_post`
--
ALTER TABLE `chatter_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `contactforms`
--
ALTER TABLE `contactforms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `fourthyear`
--
ALTER TABLE `fourthyear`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `internships`
--
ALTER TABLE `internships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `placements`
--
ALTER TABLE `placements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `thirdyear`
--
ALTER TABLE `thirdyear`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD CONSTRAINT `chatter_discussion_chatter_category_id_foreign` FOREIGN KEY (`chatter_category_id`) REFERENCES `chatter_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD CONSTRAINT `chatter_post_chatter_discussion_id_foreign` FOREIGN KEY (`chatter_discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatter_user_discussion`
--
ALTER TABLE `chatter_user_discussion`
  ADD CONSTRAINT `chatter_user_discussion_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chatter_user_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
