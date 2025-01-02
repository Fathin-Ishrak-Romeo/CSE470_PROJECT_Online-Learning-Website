-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2024 at 03:54 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cse470`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `category_name`, `category_slug`, `created_at`, `updated_at`) VALUES
(2, 'Category11', 'category11', NULL, '2024-12-17 02:03:42'),
(3, 'Category3', 'category3', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blogcat_id` int(11) NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_slug` varchar(255) DEFAULT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `long_descp` text DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `blogcat_id`, `post_title`, `post_slug`, `post_image`, `long_descp`, `post_tags`, `created_at`, `updated_at`) VALUES
(1, 3, 'Lorem Ipsum 3', 'lorem-ipsum-3', 'upload/post/1818683601671129.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'CSE470,SoftwareEngineering', '2024-12-10 04:38:04', '2024-12-17 04:38:04'),
(2, 2, 'Lorem Ipsum 2', 'lorem-ipsum-2', 'upload/post/1818683587494409.png', 'perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 'CSE470,loremipsum', '2024-12-17 04:37:07', '2024-12-17 04:37:07'),
(3, 2, 'Lorem Ipsum', 'lorem-ipsum', 'upload/post/1818683565887176.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', 'CSE470,laravel ,js,dbms', '2024-12-17 04:36:46', '2024-12-17 04:36:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `image`, `created_at`, `updated_at`) VALUES
(4, 'Developement', 'developement', 'upload/category/1815818685310322.png', '2024-11-15 13:40:43', '2024-11-15 13:40:43'),
(6, 'Business101', 'business101', 'upload/category/1817514912484309.png', '2024-11-29 07:02:24', '2024-12-04 07:01:31'),
(7, 'Business', 'business', 'upload/category/1817320888325690.png', '2024-11-29 07:32:41', '2024-12-02 03:37:36'),
(11, 'Mathematics', 'mathematics', 'upload/category/1817983808729617.png', '2024-12-09 11:14:26', '2024-12-09 11:14:26');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_discount` varchar(255) NOT NULL,
  `coupon_validity` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `instructor_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_name`, `coupon_discount`, `coupon_validity`, `status`, `instructor_id`, `course_id`, `created_at`, `updated_at`) VALUES
(4, 'XMAS', '25', '2024-12-26', 1, NULL, NULL, '2024-12-11 07:24:07', NULL),
(8, 'BUXBRAC', '20', '2024-12-31', 1, 10, 11, '2024-12-13 08:28:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `course_image` varchar(255) DEFAULT NULL,
  `course_title` text DEFAULT NULL,
  `course_name` text DEFAULT NULL,
  `course_name_slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `resources` varchar(255) DEFAULT NULL,
  `certificate` varchar(255) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `prerequisites` text DEFAULT NULL,
  `bestseller` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `highestrated` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `category_id`, `subcategory_id`, `instructor_id`, `course_image`, `course_title`, `course_name`, `course_name_slug`, `description`, `video`, `label`, `duration`, `resources`, `certificate`, `selling_price`, `discount_price`, `prerequisites`, `bestseller`, `featured`, `highestrated`, `status`, `created_at`, `updated_at`) VALUES
(8, 4, 4, 10, 'upload/course/thumbnail/1817704132244315.png', 'CSE-110', 'Introduction to Programming', '-ntroduction-to-rogramming', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', 'upload/course/video/1733497745.mp4', 'Begginer', '30', '5', 'Yes', 300, 40, NULL, '1', '1', NULL, 1, '2024-12-06 09:09:05', NULL),
(9, 4, 4, 10, 'upload/course/thumbnail/1818073404181519.png', 'CSE 111', 'Programming Language II', 'programming-language-ii', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', 'upload/course/video/1733762743.mp4', 'Middle', '50', '15', 'Yes', 1000, 20, 'CSE-110', NULL, '1', '1', 1, '2024-12-09 08:41:36', '2024-12-10 10:58:30'),
(11, 6, 3, 10, 'upload/course/thumbnail/1818256257530086.png', 'ACT101', 'Introduction to Accounting', '-ntroduction-to-ccounting', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen', 'upload/course/video/1734024293.mp4', 'Begginer', '60', '7', 'Yes', 600, 250, NULL, NULL, '1', NULL, 1, '2024-12-12 11:24:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_goals`
--

CREATE TABLE `course_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `goal_name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_goals`
--

INSERT INTO `course_goals` (`id`, `course_id`, `goal_name`, `created_at`, `updated_at`) VALUES
(1, 1, '808089080', '2024-12-06 06:45:06', '2024-12-06 06:45:06'),
(2, 2, 't has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing', '2024-12-06 06:49:50', '2024-12-06 06:49:50'),
(3, 2, 'm Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content her', '2024-12-06 06:49:50', '2024-12-06 06:49:50'),
(4, 3, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use', '2024-12-06 07:23:26', '2024-12-06 07:23:26'),
(5, 4, NULL, '2024-12-06 08:33:35', '2024-12-06 08:33:35'),
(9, 7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', '2024-12-06 09:07:17', '2024-12-06 09:07:17'),
(10, 7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', '2024-12-06 09:07:17', '2024-12-06 09:07:17'),
(11, 7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', '2024-12-06 09:07:17', '2024-12-06 09:07:17'),
(12, 7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', '2024-12-06 09:07:17', '2024-12-06 09:07:17'),
(13, 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', '2024-12-06 09:09:05', '2024-12-06 09:09:05'),
(14, 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', '2024-12-06 09:09:05', '2024-12-06 09:09:05'),
(15, 8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', '2024-12-06 09:09:05', '2024-12-06 09:09:05'),
(19, 9, 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish.', '2024-12-09 10:58:58', '2024-12-09 10:58:58'),
(27, 11, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '2024-12-12 11:24:53', '2024-12-12 11:24:53'),
(28, 11, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '2024-12-12 11:24:53', '2024-12-12 11:24:53'),
(29, 11, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '2024-12-12 11:24:53', '2024-12-12 11:24:53'),
(30, 11, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '2024-12-12 11:24:53', '2024-12-12 11:24:53'),
(31, 11, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', '2024-12-12 11:24:53', '2024-12-12 11:24:53');

-- --------------------------------------------------------

--
-- Table structure for table `course_lectures`
--

CREATE TABLE `course_lectures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_title` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_lectures`
--

INSERT INTO `course_lectures` (`id`, `course_id`, `section_id`, `lecture_title`, `video`, `url`, `content`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 'Where does it come from?', NULL, 'https://www.youtube.com/watch?v=PH1gcruqy0E', 'Lorem Ipsum is simply dummy text of the printing', '2024-12-11 00:24:06', '2024-12-11 00:57:06'),
(4, 10, 1, 'Lorem Ipsum', NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', '2024-12-11 00:38:43', '2024-12-11 00:38:43'),
(6, 10, 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', NULL, 'https://youtu.be/SkT8tDy45fU?si=deBVZoZ9meQpcY4w', NULL, '2024-12-11 00:40:37', '2024-12-11 01:03:39'),
(7, 10, 5, 'Lorem Ipsum is not simply random text', NULL, 'https://youtu.be/SkT8tDy45fU?si=deBVZoZ9meQpcY4w', 'https://youtu.be/SkT8tDy45fU?si=w89-mYPjsXcY-j0X', '2024-12-11 01:01:56', '2024-12-11 01:02:29'),
(9, 6, 7, 'Lorem Ipsum', NULL, 'https://www.youtube.com/embed/Fs0t6SdODd8?si=aeOKQBhlxaIxImB0', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing', '2024-12-12 07:22:15', '2024-12-12 07:31:58'),
(10, 6, 7, 'What is Lorem Ipsum?', NULL, 'https://www.youtube.com/embed/Fs0t6SdODd8?si=aeOKQBhlxaIxImB0', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2024-12-12 07:22:42', '2024-12-12 07:32:07'),
(11, 6, 11, 'What is Lorem Ipsum?', NULL, 'https://www.youtube.com/embed/NB9K4CoYSIM?si=f1fSVSHg1R7IHjAE', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry', '2024-12-12 07:23:38', '2024-12-12 07:39:14'),
(12, 6, 9, 'Lorem Ipsum', NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing', '2024-12-12 07:32:37', '2024-12-12 07:32:37'),
(13, 6, 12, 'Lorem Ipsum', NULL, NULL, NULL, '2024-12-12 10:20:33', '2024-12-12 10:20:33'),
(14, 9, 15, 'Introduction to Programming Languages', NULL, 'https://www.youtube.com/embed/NB9K4CoYSIM?si=f1fSVSHg1R7IHjAE', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen', '2024-12-12 10:30:07', '2024-12-12 10:30:07'),
(15, 9, 16, 'Python', NULL, 'https://www.youtube.com/embed/lHWLmUH_GAs?si=Y3mH2RhVcJXBA2-D\"', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen', '2024-12-12 10:32:51', '2024-12-12 10:32:51'),
(16, 9, 16, 'SML', NULL, 'https://www.youtube.com/embed/W7ppd_RY-UE?si=-kr3nNpbF5HrY2le', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen', '2024-12-12 10:33:31', '2024-12-12 10:33:31'),
(17, 9, 16, 'Programming language syntax', NULL, 'https://www.youtube.com/embed/W7ppd_RY-UE?si=-kr3nNpbF5HrY2le', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen', '2024-12-12 10:34:11', '2024-12-12 10:34:11'),
(18, 9, 17, 'Names, Scopes, and Bindings', NULL, 'https://www.youtube.com/embed/W7ppd_RY-UE?si=-kr3nNpbF5HrY2le\"', NULL, '2024-12-12 10:34:52', '2024-12-12 10:34:52'),
(19, 9, 17, 'Control Flow', NULL, 'https://www.youtube.com/embed/W7ppd_RY-UE?si=-kr3nNpbF5HrY2le', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen', '2024-12-12 10:35:20', '2024-12-12 10:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `course_sections`
--

CREATE TABLE `course_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `section_title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_sections`
--

INSERT INTO `course_sections` (`id`, `course_id`, `section_title`, `created_at`, `updated_at`) VALUES
(1, 10, 'Section 1 - Introduction', NULL, NULL),
(3, 10, 'Section 3 - Taylor’s Series Formula', NULL, NULL),
(4, 10, 'Section 4 - Lorem Ipsum', NULL, NULL),
(5, 10, 'Section 5 - Lorem Ipsum', NULL, NULL),
(7, 6, 'Section 1 - Lorem Ipsum', NULL, NULL),
(9, 6, 'Section 2 - Lorem Ipsum', NULL, NULL),
(10, 6, 'Section 3 - Lorem Ipsum', NULL, NULL),
(11, 6, 'Section 4 - Lorem Ipsum', NULL, NULL),
(12, 6, 'Section 5 - Lorem Ipsum', NULL, NULL),
(15, 9, 'WEEK 1', NULL, NULL),
(16, 9, 'WEEK 2', NULL, NULL),
(17, 9, 'WEEK 3', NULL, NULL),
(18, 11, 'wrfwerfwerwqr', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_11_15_121218_create_categories_table', 2),
(6, '2024_11_29_114105_create_sub_categories_table', 3),
(7, '2024_11_29_121125_create_sub_categories_table', 4),
(8, '2024_11_30_090150_create_courses_table', 5),
(9, '2024_11_30_091409_create_course_goals_table', 5),
(10, '2024_12_05_073311_create_wishlists_table', 6),
(11, '2024_12_10_161647_create_course_sections_table', 7),
(12, '2024_12_10_161724_create_course_lectures_table', 7),
(13, '2024_12_11_124128_create_coupons_table', 8),
(14, '2024_12_11_170016_create_payments_table', 9),
(15, '2024_12_11_170057_create_orders_table', 9),
(16, '2024_12_12_050340_create_smtp_settings_table', 10),
(17, '2024_12_12_142201_create_questions_table', 11),
(18, '2024_12_13_155743_create_reviews_table', 12),
(19, '2024_12_17_073352_create_blog_categories_table', 13),
(20, '2024_12_17_080840_create_blog_posts_table', 14),
(21, '2024_12_17_130807_create_notifications_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('475a71c7-f33e-4ff8-b86f-8075c21fc951', 'App\\Notifications\\OrderComplete', 'App\\Models\\User', 2, '{\"message\":\"New Cod Enrollment In Course\"}', NULL, '2024-12-17 08:50:05', '2024-12-17 08:50:05'),
('9c5ccef8-81af-485f-947d-34fd98bbd0e8', 'App\\Notifications\\OrderComplete', 'App\\Models\\User', 10, '{\"message\":\"New Cod Enrollment In Course\"}', '2024-12-17 08:26:21', '2024-12-17 08:25:23', '2024-12-17 08:26:21'),
('c2460fe6-72f5-4d7b-83b9-39d41d1ed214', 'App\\Notifications\\OrderComplete', 'App\\Models\\User', 14, '{\"message\":\"New Cod Enrollment In Course\"}', NULL, '2024-12-17 08:25:23', '2024-12-17 08:25:23'),
('d647d4a5-a275-4c01-bbaa-7fee23dffd5c', 'App\\Notifications\\OrderComplete', 'App\\Models\\User', 10, '{\"message\":\"New Cod Enrollment In Course\"}', NULL, '2024-12-17 08:50:05', '2024-12-17 08:50:05'),
('df5ae34f-c5e9-4cd5-852f-eec31c768104', 'App\\Notifications\\OrderComplete', 'App\\Models\\User', 2, '{\"message\":\"New Cod Enrollment In Course\"}', NULL, '2024-12-17 08:25:23', '2024-12-17 08:25:23'),
('eadd2663-96d3-4c2f-ba04-8dbc5f75b81e', 'App\\Notifications\\OrderComplete', 'App\\Models\\User', 14, '{\"message\":\"New Cod Enrollment In Course\"}', NULL, '2024-12-17 08:50:05', '2024-12-17 08:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `course_title` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `payment_id`, `user_id`, `course_id`, `instructor_id`, `image`, `course_title`, `price`, `created_at`, `updated_at`) VALUES
(26, 27, 15, 8, 10, NULL, NULL, 40, NULL, NULL),
(27, 28, 15, 9, 10, NULL, 'Programming Language II', 20, '2024-12-17 08:50:01', '2024-12-17 08:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cash_delivery` varchar(255) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `order_month` varchar(255) DEFAULT NULL,
  `order_year` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `email`, `phone`, `address`, `cash_delivery`, `total_amount`, `payment_type`, `invoice_no`, `order_date`, `order_month`, `order_year`, `status`, `created_at`, `updated_at`) VALUES
(27, 'Ali Akbar', 'ali@ymail.com', '01890369682', 'UDD-5,UDDIPON,MAINUL ROAD, DHAKA CANTONMENT, 3rd Floor', NULL, '30', 'Stripe', 'EOS87732328', '17 December 2024', 'December', '2024', 'pending', '2024-12-17 08:48:48', NULL),
(28, 'Ali Akbar', 'ali@ymail.com', '01890369682', 'UDD-5,UDDIPON,MAINUL ROAD, DHAKA CANTONMENT, 3rd Floor', 'handcash', '15', 'Direct Payment', 'EOS44085388', '17 December 2024', 'December', '2024', 'pending', '2024-12-17 08:50:01', '2024-12-17 08:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `question` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `course_id`, `user_id`, `instructor_id`, `parent_id`, `subject`, `question`, `created_at`, `updated_at`) VALUES
(8, 9, 15, 10, NULL, 'Help me', 'Sir i am not understanding week 1', '2024-12-12 10:41:15', NULL),
(15, 9, 15, 10, NULL, 'Help me', '1111111111111111111111111111111111', '2024-12-13 00:32:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `rating` varchar(255) NOT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `course_id`, `user_id`, `comment`, `rating`, `instructor_id`, `status`, `created_at`, `updated_at`) VALUES
(9, 8, 15, 'safasfasfasfasfasf', '5', 10, '1', '2024-12-13 12:29:06', '2024-12-15 08:36:58'),
(10, 8, 15, 'asfasfasfasfasfasf', '4', 10, '1', '2024-12-13 12:29:39', '2024-12-15 08:36:57'),
(13, 8, 15, 'asfasdasdasdasd', '2', 10, '1', '2024-12-15 08:42:14', '2024-12-15 08:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `smtp_settings`
--

CREATE TABLE `smtp_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mailer` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smtp_settings`
--

INSERT INTO `smtp_settings` (`id`, `mailer`, `host`, `port`, `username`, `password`, `encryption`, `from_address`, `created_at`, `updated_at`) VALUES
(2, 'smtp', 'sandbox.smtp.mailtrap.io', '2525', '1c9e45e9da715a', '3f1b118c77cac6', 'tls', 'bracbux@gmail.com', NULL, '2024-12-17 08:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `subcategory_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `subcategory_name`, `subcategory_slug`, `created_at`, `updated_at`) VALUES
(2, 7, 'Finance', 'finance', '2024-11-29 07:32:56', '2024-11-29 07:32:56'),
(3, 6, 'Accounting', 'accounting', '2024-11-30 05:14:45', '2024-11-30 05:14:45'),
(4, 4, 'Python Programming', 'python-programming', '2024-11-30 05:15:06', '2024-11-30 05:15:06'),
(5, 4, 'Laravel 10', 'laravel-10', '2024-12-04 06:49:53', '2024-12-04 06:49:53'),
(6, 4, 'DJANGO & POSTGRESQL', 'django-postgresql', '2024-12-09 11:13:52', '2024-12-09 11:13:52'),
(7, 11, 'Taylors Series', 'taylors-series', '2024-12-09 11:16:06', '2024-12-09 11:16:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('admin','instructor','user') NOT NULL DEFAULT 'user',
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `last_seen` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `role`, `status`, `last_seen`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Faiaz Zahin', 'fz00', 'admin@gmail.com', NULL, '$2y$10$8Rdc5JVCpNdP5bX3enuE4O8qtDOMaMu5qLbD1TDWbjrRNFZZnsZ4e', '202411131612images.jpg', '01890369683', 'dhk', 'admin', '1', '2024-12-17 14:25:46', NULL, NULL, '2024-12-17 08:25:46'),
(2, 'Instructor22', 'instructor', 'instructor@gmail.com', NULL, '$2y$10$eBDxe75bx8H76VP5rSPUJeYHzNdg7oIvcOLa08sp2XJ.rcznUHKA.', '202411132058images.jpg', '22', 'uk', 'instructor', '0', NULL, NULL, NULL, '2024-11-30 01:22:56'),
(3, 'user', NULL, 'user@gmail.com', NULL, '$2y$10$mTxHlUwqyK7I6f0ps5vNGu5ufmfJvZSZdgAvJ9NpWSV42U9gXPjii', '202411150816unnamed.webp', NULL, NULL, 'user', '1', NULL, NULL, NULL, '2024-11-15 03:15:13'),
(5, 'Faiaz Zahin', NULL, 'faiaz.zahin@g.bracu.ac.bd', NULL, '$2y$10$CRuve3fdHw.RS4Cvf6sexuRc8eAUmMBbeI5gCq9a1tSJgabM54ccG', NULL, NULL, NULL, 'user', '1', NULL, NULL, '2024-11-14 08:30:03', '2024-11-14 08:30:03'),
(8, 'faiaz', NULL, 'raju@gmail.com', NULL, '$2y$10$XGkYgkM.5wScyX0LWQGjAe0j04QHG4u9Nzxf5yjCujVwpR8Apr7JW', NULL, NULL, NULL, 'user', '1', NULL, NULL, '2024-11-14 09:20:07', '2024-11-14 09:20:07'),
(10, 'Sakib', 'chushankumar', 'sakib@gmail.com', NULL, '$2y$10$ZEkkZya9U2tCfRnBwNa4/.qAGfaEbieIOvv/MoSkpzchzg4gmOLB6', '202412061047unnamed.webp', '0101010101', 'Dhaka', 'instructor', '1', '2024-12-17 14:51:35', NULL, NULL, '2024-12-17 08:51:35'),
(12, 'Sakib Al Hasan', 'saking', 'sakib11@gmail.com', NULL, '$2y$10$iVtUqw3/4myDGG5lFL7/3efvjHee6eO2fstoUfOR6WRtErpXqgqrC', '202412051429favicon.png', '0171717171', 'Dhaka', 'user', '1', NULL, NULL, '2024-12-05 08:28:15', '2024-12-05 08:29:01'),
(14, 'Mofiz', 'mofiz11', 'mofiz@gmail.com', NULL, '$2y$10$SZv83sCOHaMzWuuAih9ederMkVuykjtY6fddPBOZC.8VirHYMUgne', NULL, '0161616161', 'Savar,Dhaka', 'instructor', '0', NULL, NULL, NULL, '2024-12-06 04:53:03'),
(15, 'Ali Akbar', NULL, 'ali@ymail.com', NULL, '$2y$10$0Uo11wRk9CXb9QbVxja2GOWHgN0pSKw7YQBX.TG5p2Te5Q/9IBnMm', NULL, NULL, NULL, 'user', '1', '2024-12-17 13:34:41', NULL, '2024-12-09 08:38:39', '2024-12-17 07:34:41');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(6, 15, 9, '2024-12-17 08:49:35', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_goals`
--
ALTER TABLE `course_goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_lectures`
--
ALTER TABLE `course_lectures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_sections`
--
ALTER TABLE `course_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_course_id_foreign` (`course_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `course_goals`
--
ALTER TABLE `course_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `course_lectures`
--
ALTER TABLE `course_lectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `course_sections`
--
ALTER TABLE `course_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
