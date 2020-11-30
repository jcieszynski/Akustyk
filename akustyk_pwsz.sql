-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Lis 2020, 17:39
-- Wersja serwera: 10.4.6-MariaDB
-- Wersja PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `akustyk_pwsz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `audio_embed`
--

CREATE TABLE `audio_embed` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `embed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `audio_embed`
--

INSERT INTO `audio_embed` (`id`, `name`, `url`, `created_at`, `updated_at`, `visible`, `author`, `embed`, `description`, `category_id`) VALUES
(19, 'Jan Brzechwa - \"Na Straganie\"', 'https://soundcloud.com/pwszelblag/jan-brzechwa-na-straganie', '2019-10-14 18:54:38', '2019-12-07 16:56:12', b'1', 'Jacek Cieszyński', '<iframe width=\"100%\" height=\"400\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?visual=true&url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F515062749&show_artwork=true\"></iframe>', 'Listen to Jan Brzechwa - \"Na Straganie\" by PWSZ w Elblągu #np on #SoundCloud', 3),
(34, 'Kubuś Puchatek by PWSZ w Elblągu', 'https://soundcloud.com/pwszelblag/sets/kubus-puchatek', '2019-12-07 16:06:48', '2019-12-07 18:16:35', b'1', 'Jacek Cieszyński2', '<iframe width=\"100%\" height=\"450\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?visual=true&url=https%3A%2F%2Fapi.soundcloud.com%2Fplaylists%2F624094818&show_artwork=true\"></iframe>', 'Listen to Kubuś Puchatek by PWSZ w Elblągu #np on #SoundCloud', 1),
(36, 'Mały Książę by PWSZ w Elblągu', 'https://soundcloud.com/pwszelblag/sets/maly-ksiaze', '2019-12-07 18:23:21', '2019-12-07 18:23:21', b'1', 'Jacek Cieszyński', '<iframe width=\"100%\" height=\"450\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?visual=true&url=https%3A%2F%2Fapi.soundcloud.com%2Fplaylists%2F273615258&show_artwork=true\"></iframe>', 'Listen to Mały Książę by PWSZ w Elblągu #np on #SoundCloud', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Nagrania', 'nagrania', '2019-10-16 11:25:24', '2019-10-16 11:25:24');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commenter_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commenter_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `child_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `comments`
--

INSERT INTO `comments` (`id`, `commenter_id`, `commenter_type`, `guest_name`, `guest_email`, `commentable_type`, `commentable_id`, `comment`, `approved`, `child_id`, `created_at`, `updated_at`) VALUES
(1, '17', 'App\\User', NULL, NULL, 'App\\Post', '3', 'Zapraszamy', 1, NULL, '2019-10-17 20:29:04', '2019-10-17 20:29:04'),
(2, '17', 'App\\User', NULL, NULL, 'App\\Post', '2', '***Super***', 1, NULL, '2019-10-17 20:33:16', '2019-10-17 20:33:16'),
(3, '2', 'App\\User', NULL, NULL, 'App\\Post', '2', 'jeden', 1, 2, '2019-10-19 06:33:34', '2019-10-19 06:33:34'),
(6, '21', 'App\\User', NULL, NULL, 'App\\Post', '3', 'nieźle :)', 1, NULL, '2019-10-23 21:58:56', '2019-10-23 21:58:56'),
(7, '21', 'App\\User', NULL, NULL, 'App\\Post', '3', 'ddd', 1, 1, '2019-10-23 21:59:13', '2019-10-23 21:59:13'),
(9, '21', 'App\\User', NULL, NULL, 'App\\Post', '4', 'fajniee', 1, NULL, '2019-10-27 13:06:42', '2019-10-27 17:19:56'),

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact_forms`
--

CREATE TABLE `contact_forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_agent` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `contact_forms`
--

INSERT INTO `contact_forms` (`id`, `user`, `email`, `message`, `ip_address`, `created_at`, `updated_at`, `user_agent`) VALUES
(89, 'Jacek Cieszyński', 'jacox520@gmail.com', 'Testowa wiadomość wysłana na adres email witryny.', '127.0.0.1', '2019-12-05 19:53:46', '2019-12-05 19:53:46', 'Przeglądarka : Chrome,Wersja przeglądarki : 78.0.3904.108,System operacyjny : Windows,Wersja systemu : 10.0,Urządzenie : WebKit,Wspierane jezyki : pl-pl,pl,en-us,en');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Zrzut danych tabeli `data_rows`
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
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 5, 'author_id', 'text', 'Autor', 1, 0, 1, 1, 0, 1, '{}', 2),
(31, 5, 'category_id', 'text', 'Kategoria', 0, 0, 1, 1, 1, 0, '{}', 3),
(32, 5, 'title', 'text', 'Tytuł', 1, 1, 1, 1, 1, 1, '{}', 4),
(33, 5, 'excerpt', 'text_area', 'Fragment', 0, 0, 1, 1, 1, 1, '{}', 5),
(34, 5, 'body', 'rich_text_box', 'Treść', 1, 0, 1, 1, 1, 1, '{}', 6),
(35, 5, 'image', 'image', 'Obraz strony', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'nazwa do adresu', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Opis strony', 0, 0, 1, 1, 1, 1, '{}', 9),
(38, 5, 'meta_keywords', 'text_area', 'Słowa kluczowe', 0, 0, 1, 1, 1, 1, '{}', 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Utworzono', 0, 1, 1, 0, 0, 0, '{}', 12),
(41, 5, 'updated_at', 'timestamp', 'Zaktualizowano', 0, 0, 0, 0, 0, 0, '{}', 13),
(42, 5, 'seo_title', 'text', 'Tytuł dla wyszukiwarek', 0, 1, 1, 1, 1, 1, '{}', 14),
(43, 5, 'featured', 'checkbox', 'Polecane', 1, 1, 1, 1, 1, 1, '{}', 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Autor', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Tytuł', 1, 1, 1, 1, 1, 1, '{}', 3),
(47, 6, 'excerpt', 'text_area', 'Fragment', 0, 0, 1, 1, 1, 1, '{}', 4),
(48, 6, 'body', 'rich_text_box', 'Treść', 0, 0, 1, 1, 1, 1, '{}', 5),
(49, 6, 'slug', 'text', 'nazwa do adresu', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Opis strony', 0, 0, 1, 1, 1, 1, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Słowa kluczowe', 0, 0, 1, 1, 1, 1, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Utworzono', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Zaktualizowano', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Obraz strony', 0, 1, 1, 1, 1, 1, '{}', 12),
(56, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(57, 1, 'provider', 'text', 'Provider', 1, 1, 1, 1, 1, 0, '{}', 12),
(58, 1, 'provider_id', 'text', 'Provider Id', 0, 0, 0, 0, 0, 0, '{}', 13),
(76, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(77, 9, 'user_id', 'text', 'User Id', 0, 1, 1, 0, 0, 0, '{}', 2),
(78, 9, 'email', 'text', 'Email', 1, 1, 1, 0, 0, 0, '{}', 3),
(79, 9, 'message', 'text', 'Message', 1, 1, 1, 0, 0, 0, '{}', 4),
(80, 9, 'ip_address', 'text', 'IP Address', 0, 1, 1, 0, 0, 0, '{}', 5),
(81, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(82, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(83, 9, 'form_belongsto_user_relationship', 'relationship', 'user', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(84, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(85, 11, 'user', 'text', 'Użytkownik', 1, 1, 1, 0, 0, 1, '{}', 2),
(86, 11, 'email', 'text', 'Email', 1, 1, 1, 0, 0, 1, '{}', 3),
(87, 11, 'message', 'text', 'Wiadomość', 1, 1, 1, 0, 0, 1, '{}', 4),
(88, 11, 'ip_address', 'text', 'Adres IP', 0, 1, 1, 0, 0, 1, '{}', 5),
(89, 11, 'created_at', 'timestamp', 'Utworzono', 0, 1, 1, 0, 0, 1, '{}', 6),
(90, 11, 'updated_at', 'timestamp', 'Zaktualizowano', 0, 0, 0, 0, 0, 0, '{}', 7),
(92, 11, 'user_agent', 'text', 'Dodatkowe informacje', 0, 1, 1, 0, 0, 1, '{}', 8),
(93, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(94, 13, 'name', 'text', 'Nazwa', 0, 1, 1, 1, 0, 1, '{}', 2),
(95, 13, 'embed', 'text', 'Adres', 0, 0, 0, 0, 0, 1, '{}', 3),
(96, 13, 'created_at', 'timestamp', 'Utworzono', 0, 1, 1, 0, 0, 1, '{}', 4),
(97, 13, 'updated_at', 'timestamp', 'Zaktualizowano', 0, 0, 0, 0, 0, 0, '{}', 5),
(98, 13, 'visible', 'checkbox', 'Widoczność', 1, 1, 1, 1, 1, 1, '{\"on\":\"Visible\",\"off\":\"Hidden\",\"checked\":true}', 6),
(100, 13, 'author', 'text', 'Autor', 1, 1, 1, 0, 0, 1, '{}', 7),
(102, 13, 'url', 'text', 'Adres', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"url\",\"messages\":{\"url\":\"Podaj poprawny url\"}}}', 8),
(103, 18, 'id', 'text', 'id', 1, 0, 0, 0, 0, 0, '{}', 1),
(104, 18, 'image', 'image', 'Zdjęcie', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 2),
(106, 18, 'created_at', 'timestamp', 'Utworzono', 0, 1, 1, 0, 0, 1, '{}', 4),
(107, 18, 'updated_at', 'timestamp', 'Zaktualizowano', 0, 0, 0, 0, 0, 0, '{}', 5),
(110, 18, 'name', 'text', 'Opis', 1, 1, 1, 1, 1, 1, '{}', 2),
(111, 19, 'id', 'text', 'id', 1, 0, 0, 0, 0, 0, '{}', 1),
(112, 19, 'header', 'text', 'header', 1, 1, 1, 1, 1, 1, '{}', 2),
(113, 19, 'text', 'rich_text_box', 'text', 0, 1, 1, 1, 1, 1, '{}', 3),
(114, 19, 'created_at', 'timestamp', 'created at', 0, 1, 1, 0, 0, 1, '{}', 5),
(115, 19, 'updated_at', 'timestamp', 'updated at', 0, 0, 0, 0, 0, 0, '{}', 6),
(116, 19, 'view', 'radio_btn', 'site', 1, 1, 1, 1, 1, 1, '{\"default\":\"main\",\"options\":{\"contact-us\":\"contact\",\"music\":\"music\",\"\\/\":\"main\",\"other\":\"other\",\"gallery\":\"gallery\",\"audio-files\":\"download\",\"audio-files\\/wiersze\":\"download\\/wiersze\",\"audio-files\\/bajki\":\"download\\/bajki\",\"audio-files\\/opowiadania\":\"download\\/opowiadania\",\"audio-files\\/goscie\":\"download\\/goscie\",\"audio-files\\/polecane\":\"download\\/polecane\",\"music\\/wiersze\":\"music\\/wiersze\",\"amusic\\/bajki\":\"music\\/bajki\",\"music\\/opowiadania\":\"music\\/opowiadania\",\"music\\/goscie\":\"music\\/goscie\",\"music\\/polecane\":\"music\\/polecane\"},\"validation\":{\"rule\":\"unique:default_text,view\",\"messages\":{\"unique\":\"Ta strona ma przypisany nag\\u0142\\u00f3wek\"}}}', 4),
(119, 18, 'equipment_gallery_belongsto_user_relationship', 'relationship', 'Użytkownik', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audio_embed\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(120, 18, 'author_id', 'select_dropdown', 'ID autora', 0, 1, 1, 0, 0, 1, '{}', 7),
(121, 13, 'description', 'text_area', 'Opis', 0, 1, 1, 1, 0, 1, '{}', 9),
(122, 21, 'id', 'text', 'id', 1, 0, 0, 0, 0, 0, '{}', 1),
(123, 21, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"unique:music_category,name\",\"messages\":{\"unique\":\"Taka kategoria istnieje\"}}}', 2),
(124, 21, 'created_at', 'timestamp', 'created at', 0, 1, 1, 0, 0, 1, '{}', 3),
(125, 21, 'updated_at', 'timestamp', 'updated at', 0, 0, 0, 0, 0, 0, '{}', 4),
(126, 21, 'visible', 'checkbox', 'visible', 1, 1, 1, 1, 1, 1, '{\"on\":\"Visible\",\"off\":\"Hidden\",\"checked\":true}', 5),
(127, 21, 'author_id', 'text', 'user', 0, 1, 1, 0, 0, 1, '{}', 6),
(128, 21, 'music_category_belongsto_user_relationship', 'relationship', 'user', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audio_embed\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(131, 13, 'category_id', 'text', 'Kategoria', 0, 1, 1, 1, 1, 1, '{\"null\":0}', 10),
(132, 13, 'audio_embed_belongsto_music_category_relationship', 'relationship', 'Kategoria muzyki', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\MusicCategory\",\"table\":\"music_category\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audio_embed\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(133, 23, 'id', 'text', 'id', 1, 0, 0, 0, 0, 0, '{}', 1),
(134, 23, 'name', 'text', 'Nazwa', 1, 1, 1, 1, 0, 1, '{}', 2),
(135, 23, 'visible', 'checkbox', 'Widoczność', 1, 1, 1, 1, 1, 1, '{\"on\":\"Visible\",\"off\":\"Hidden\",\"checked\":true}', 3),
(136, 23, 'download', 'checkbox', 'Czy można pobrać ?', 0, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\",\"checked\":true}', 4),
(137, 23, 'created_at', 'timestamp', 'Utworzono', 0, 1, 1, 0, 0, 1, '{}', 5),
(138, 23, 'updated_at', 'timestamp', 'Zaktualizowano', 0, 0, 0, 0, 0, 0, '{}', 6),
(139, 23, 'path', 'file', 'Muzyka', 1, 1, 1, 0, 1, 1, '{\"preserveFileUploadName\":\"yes\"}', 7),
(144, 23, 'category_id', 'number', 'ID kategorii', 0, 0, 0, 0, 0, 1, '{}', 9),
(145, 23, 'music_collection_belongsto_music_category_relationship', 'relationship', 'Kategoria', 0, 1, 1, 1, 0, 1, '{\"model\":\"App\\\\MusicCategory\",\"table\":\"music_category\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audio_embed\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(146, 23, 'author', 'checkbox', 'Autor', 0, 1, 1, 0, 0, 1, '{}', 10),
(159, 1, 'last_login', 'text', 'last_login', 0, 1, 1, 1, 1, 1, '{}', 14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-04-14 14:25:49', '2019-12-23 23:20:35'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(5, 'posts', 'posts', 'Post', 'Posty', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-04-14 14:25:50', '2019-12-03 00:35:13'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-04-14 14:25:50', '2019-12-02 12:44:13'),
(9, 'forms', 'forms', 'Form', 'Forms', 'voyager-file-text', 'App\\Form', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"email\",\"scope\":null}', '2019-06-30 12:59:32', '2019-06-30 16:57:11'),
(11, 'contact_forms', 'contact', 'Contact Form', 'Contact Forms', 'voyager-file-text', 'App\\ContactForm', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"email\",\"scope\":null}', '2019-07-03 18:15:56', '2019-12-05 19:54:43'),
(13, 'audio_embed', 'audio-embed', 'Muzyka SoundCloud', 'Muzyka SoundCloud', 'voyager-music', 'App\\AudioEmbed', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-18 11:29:12', '2019-12-01 20:42:56'),
(18, 'equipment_gallery', 'equipment-gallery', 'Galeria zdjęć', 'Galeria zdjęć', 'voyager-params', 'App\\EquipmentGallery', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-09-08 14:16:04', '2019-12-07 15:52:23'),
(19, 'default_text', 'default-text', 'Default Text', 'Default Texts', 'voyager-documentation', 'App\\DefaultText', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-10-09 18:50:29', '2019-10-24 17:05:26'),
(21, 'music_category', 'music-category', 'Music Category', 'Music Categories', 'voyager-categories', 'App\\MusicCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-10-14 17:18:50', '2019-10-14 18:10:43'),
(23, 'music_collection', 'music-collection', 'Muzyka pobranie', 'Muzyka pobranie', 'voyager-world', 'App\\MusicCollection', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-10-18 10:34:29', '2019-12-07 19:30:17');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `default_text`
--

CREATE TABLE `default_text` (
  `id` int(10) UNSIGNED NOT NULL,
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `view` char(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `default_text`
--

INSERT INTO `default_text` (`id`, `header`, `text`, `created_at`, `updated_at`, `view`) VALUES
(3, 'Akustyk PWSZ w Elblągu', '<p>Witamy na stronie naszego koła.</p>\n<p>Tutaj znajdziecie najświeższe treści z naszej działalności :)</p>', '2019-10-10 12:31:22', '2019-10-10 19:24:37', '/'),
(4, 'Muzyka', '<p>To co tworzymy jest na wyciągnięcie ręki !</p>', '2019-10-10 13:39:47', '2019-10-10 13:39:47', 'music'),
(5, 'Skontaktuj się z nami ', '', '2019-10-24 15:53:35', '2019-10-24 15:54:29', 'contact-us'),
(6, 'Galeria', '<p>To co mamy w naszym asortymencie !</p>', '2019-10-24 16:28:54', '2019-10-24 16:28:54', 'gallery'),
(7, 'Nasze utwory do pobrania !', '', '2019-10-24 16:35:13', '2019-10-24 16:35:13', 'audio-files'),
(8, 'Wiersze', '', '2019-10-24 16:35:54', '2019-10-24 16:35:54', 'audio-files/wiersze'),
(9, 'Polecane', '', '2019-10-24 17:04:34', '2019-10-24 17:07:26', 'audio-files/polecane'),
(10, 'Bajki', '', '2019-10-24 17:08:13', '2019-10-24 17:08:13', 'audio-files/bajki'),
(11, 'Opowiadania', '', '2019-10-24 17:08:46', '2019-10-24 17:08:46', 'audio-files/opowiadania'),
(12, 'Goście', '', '2019-10-24 17:09:48', '2019-10-24 17:09:48', 'audio-files/goscie'),
(13, 'Wiersze', '', '2019-10-24 17:10:24', '2019-10-24 17:10:24', 'music/wiersze'),
(14, 'Bajki', '', '2019-10-24 17:10:43', '2019-10-24 17:10:43', 'amusic/bajki'),
(15, 'Opowiadania', '', '2019-10-24 17:11:06', '2019-10-24 17:11:06', 'music/opowiadania'),
(16, 'Goście', '', '2019-10-24 17:11:25', '2019-10-24 17:11:25', 'music/goscie'),
(17, 'Polecane', '', '2019-10-24 17:11:37', '2019-10-24 17:11:37', 'music/polecane');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `equipment_gallery`
--

CREATE TABLE `equipment_gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `equipment_gallery`
--

INSERT INTO `equipment_gallery` (`id`, `name`, `created_at`, `updated_at`, `image`, `author_id`) VALUES
(9, 'Sprzęt wykorzystywany do nagrywania', '2019-10-22 18:52:26', '2019-12-07 14:32:22', 'equipment-gallery\\December2019\\iV8f2xPYX6aoatw8kVZn.jpg', 17),
(12, 'Słuchawki wykorzystywane podczas prac', '2019-10-23 14:32:02', '2019-12-07 14:32:07', 'equipment-gallery\\October2019\\mx47hCgRMqaaeFQE6ih5.jpg', 17);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-04-14 14:25:49', '2019-04-14 14:25:49');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Panel ', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2019-04-14 14:25:49', '2019-12-01 20:30:43', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2019-04-14 14:25:49', '2019-10-23 22:11:31', 'voyager.media.index', NULL),
(3, 1, 'Użytkownicy', '', '_self', 'voyager-person', '#000000', NULL, 3, '2019-04-14 14:25:49', '2019-12-01 20:31:05', 'voyager.users.index', 'null'),
(4, 1, 'Role', '', '_self', 'voyager-lock', '#000000', NULL, 2, '2019-04-14 14:25:49', '2019-12-01 20:30:56', 'voyager.roles.index', 'null'),
(5, 1, 'Narzędzia', '', '_self', 'voyager-tools', '#000000', NULL, 8, '2019-04-14 14:25:49', '2019-12-01 20:31:45', NULL, ''),
(6, 1, 'Kreator menu', '', '_self', 'voyager-list', '#000000', 5, 1, '2019-04-14 14:25:49', '2019-12-01 20:32:33', 'voyager.menus.index', 'null'),
(7, 1, 'Baza danych', '', '_self', 'voyager-data', '#000000', 5, 2, '2019-04-14 14:25:49', '2019-12-01 20:32:42', 'voyager.database.index', 'null'),
(8, 1, 'Kompas', '', '_self', 'voyager-compass', '#000000', 5, 3, '2019-04-14 14:25:49', '2019-12-01 20:32:50', 'voyager.compass.index', 'null'),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-04-14 14:25:49', '2019-06-30 11:23:02', 'voyager.bread.index', NULL),
(10, 1, 'Ustawienia', '', '_self', 'voyager-settings', '#000000', NULL, 9, '2019-04-14 14:25:49', '2019-12-01 20:33:12', 'voyager.settings.index', 'null'),
(11, 1, 'Kategorie', '', '_self', 'voyager-categories', '#000000', NULL, 7, '2019-04-14 14:25:49', '2019-12-01 20:36:05', 'voyager.categories.index', 'null'),
(12, 1, 'Posty', '', '_self', 'voyager-news', '#000000', NULL, 5, '2019-04-14 14:25:50', '2019-12-01 20:31:19', 'voyager.posts.index', 'null'),
(13, 1, 'Strony', '', '_self', 'voyager-file-text', '#000000', NULL, 6, '2019-04-14 14:25:50', '2019-12-01 20:31:30', 'voyager.pages.index', 'null'),
(14, 1, 'Haki', '', '_self', 'voyager-hook', '#000000', 5, 5, '2019-04-14 14:25:50', '2019-12-01 20:33:04', 'voyager.hooks', 'null'),
(18, 1, 'Formularz kontaktowy', '', '_self', 'voyager-file-text', '#000000', NULL, 10, '2019-07-03 18:15:56', '2019-12-01 20:33:23', 'voyager.contact.index', 'null'),
(20, 1, 'Muzyka SoundCloud', '', '_self', 'voyager-music', '#000000', NULL, 11, '2019-08-18 11:29:12', '2019-12-01 20:33:38', 'voyager.audio-embed.index', 'null'),
(24, 1, 'Galeria zdjęć', '', '_self', 'voyager-params', '#000000', NULL, 12, '2019-09-08 14:16:04', '2019-12-01 20:33:48', 'voyager.equipment-gallery.index', 'null'),
(26, 1, 'Text w nagłówkach', '', '_self', 'voyager-documentation', '#000000', NULL, 13, '2019-10-10 10:17:41', '2019-12-01 20:33:59', 'voyager.default-text.index', 'null'),
(28, 1, 'Kategorie muzyki', '', '_self', 'voyager-categories', '#000000', NULL, 14, '2019-10-14 17:18:50', '2019-12-01 20:34:11', 'voyager.music-category.index', 'null'),
(30, 1, 'Muzyka pliki', '', '_self', 'voyager-world', '#000000', NULL, 15, '2019-10-18 10:34:29', '2019-10-23 22:11:31', 'voyager.music-collection.index', 'null');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2016_01_01_000000_create_pages_table', 2),
(28, '2016_01_01_000000_create_posts_table', 2),
(29, '2016_02_15_204651_create_categories_table', 2),
(30, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(31, '2019_10_14_175359_create_user_roles_table', 3),
(32, '2018_06_30_113500_create_comments_table', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `music_category`
--

CREATE TABLE `music_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `music_category`
--

INSERT INTO `music_category` (`id`, `name`, `created_at`, `updated_at`, `visible`, `author_id`) VALUES
(1, 'Wiersze', '2019-10-14 17:29:23', '2019-10-14 17:34:06', b'1', 17),
(2, 'Bajki', '2019-10-14 17:36:38', '2019-10-14 17:36:38', b'1', 17),
(3, 'Opowiadania', '2019-10-14 17:36:48', '2019-10-14 17:36:48', b'1', 17),
(4, 'Goście', '2019-10-14 17:36:55', '2019-10-14 17:36:55', b'1', 17),
(5, 'Polecane', '2019-10-14 17:37:02', '2019-10-19 09:00:05', b'1', 17);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `music_collection`
--

CREATE TABLE `music_collection` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` bit(1) NOT NULL,
  `download` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `music_collection`
--

INSERT INTO `music_collection` (`id`, `name`, `visible`, `download`, `created_at`, `updated_at`, `path`, `category_id`, `author`) VALUES
(41, 'Mały Książę - Rozdział 1 - Przeszłość autora', b'1', b'1', '2019-12-07 22:16:45', '2019-12-07 22:16:45', '[{\"download_link\":\"music-collection\\\\December2019\\\\Ma\\u0142y Ksi\\u0105\\u017c\\u0119 - Rozdzia\\u0142 1 - Przesz\\u0142o\\u015b\\u0107 autora.mp3\",\"original_name\":\"Ma\\u0142y Ksi\\u0105\\u017c\\u0119 - Rozdzia\\u0142 1 - Przesz\\u0142o\\u015b\\u0107 autora.mp3\"}]', 0, 'Jacek Cieszyński'),
(42, 'Mały Książę - Rozdział 3 - Opis małej planety', b'1', b'1', '2019-12-07 22:16:53', '2019-12-07 22:16:53', '[{\"download_link\":\"music-collection\\\\December2019\\\\Ma\\u0142y Ksi\\u0105\\u017c\\u0119 - Rozdzia\\u0142 3 - Opis ma\\u0142ej planety.mp3\",\"original_name\":\"Ma\\u0142y Ksi\\u0105\\u017c\\u0119 - Rozdzia\\u0142 3 - Opis ma\\u0142ej planety.mp3\"}]', 0, 'Jacek Cieszyński');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 17, 'Testowy wpis', 'Testowy wpis', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam pellentesque augue nibh, ut laoreet enim convallis at. Etiam dapibus nulla eget eros faucibus, sit amet condimentum nisi pharetra. Donec et venenatis nisi. Donec consectetur lobortis fringilla. Proin molestie est eget varius imperdiet. Praesent accumsan tellus ac nibh iaculis pellentesque. Sed elementum in tellus ac condimentum. Sed pharetra risus ut felis suscipit ullamcorper. Pellentesque dui leo, semper sed turpis vel, tristique eleifend tortor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum vehicula dapibus elit ut feugiat. Duis maximus lorem vulputate ligula facilisis efficitur. Aenean libero mi, mattis vitae magna ut, scelerisque rhoncus nisl. Morbi non ipsum ultrices, lobortis risus et, viverra justo. Integer dictum, ex ac fermentum hendrerit, elit risus iaculis lorem, ac finibus augue dolor sit amet elit.', 'pages\\December2019\\NHKg3s3wa5LIMjWzIZjH.png', 'testowa-strona', 'Records akustyk to listening by users', 'pwsz,elblag,akustyk', 'ACTIVE', '2019-10-03 18:45:54', '2019-12-02 12:33:50');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('jacox520@gmail.com', '$2y$10$n/9kII23sNBVf6Q/xv4fEOgWhhXs9uLOVmbXbRvP4/xDyNMjuMjtm', '2019-06-25 15:32:05'),
('furypower520@gmail.com', '$2y$10$tOAZdZy0zDlckK0.Cvsig.mM6u3Fb8Ii4GF/.dJijV/WRvzlhsV8e', '2019-11-18 15:57:34');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(2, 'browse_bread', NULL, '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(3, 'browse_database', NULL, '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(4, 'browse_media', NULL, '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(5, 'browse_compass', NULL, '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(6, 'browse_menus', 'menus', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(7, 'read_menus', 'menus', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(8, 'edit_menus', 'menus', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(9, 'add_menus', 'menus', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(10, 'delete_menus', 'menus', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(11, 'browse_roles', 'roles', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(12, 'read_roles', 'roles', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(13, 'edit_roles', 'roles', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(14, 'add_roles', 'roles', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(15, 'delete_roles', 'roles', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(16, 'browse_users', 'users', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(17, 'read_users', 'users', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(18, 'edit_users', 'users', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(19, 'add_users', 'users', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(20, 'delete_users', 'users', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(21, 'browse_settings', 'settings', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(22, 'read_settings', 'settings', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(23, 'edit_settings', 'settings', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(24, 'add_settings', 'settings', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(25, 'delete_settings', 'settings', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(26, 'browse_categories', 'categories', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(27, 'read_categories', 'categories', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(28, 'edit_categories', 'categories', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(29, 'add_categories', 'categories', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(30, 'delete_categories', 'categories', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(31, 'browse_posts', 'posts', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(32, 'read_posts', 'posts', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(33, 'edit_posts', 'posts', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(34, 'add_posts', 'posts', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(35, 'delete_posts', 'posts', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(36, 'browse_pages', 'pages', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(37, 'read_pages', 'pages', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(38, 'edit_pages', 'pages', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(39, 'add_pages', 'pages', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(40, 'delete_pages', 'pages', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(41, 'browse_hooks', NULL, '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(52, 'browse_forms', 'forms', '2019-06-30 12:59:32', '2019-06-30 12:59:32'),
(53, 'read_forms', 'forms', '2019-06-30 12:59:32', '2019-06-30 12:59:32'),
(54, 'edit_forms', 'forms', '2019-06-30 12:59:32', '2019-06-30 12:59:32'),
(55, 'add_forms', 'forms', '2019-06-30 12:59:32', '2019-06-30 12:59:32'),
(56, 'delete_forms', 'forms', '2019-06-30 12:59:32', '2019-06-30 12:59:32'),
(57, 'browse_contact_forms', 'contact_forms', '2019-07-03 18:15:56', '2019-07-03 18:15:56'),
(58, 'read_contact_forms', 'contact_forms', '2019-07-03 18:15:56', '2019-07-03 18:15:56'),
(59, 'edit_contact_forms', 'contact_forms', '2019-07-03 18:15:56', '2019-07-03 18:15:56'),
(60, 'add_contact_forms', 'contact_forms', '2019-07-03 18:15:56', '2019-07-03 18:15:56'),
(61, 'delete_contact_forms', 'contact_forms', '2019-07-03 18:15:56', '2019-07-03 18:15:56'),
(62, 'browse_audio_embed', 'audio_embed', '2019-08-18 11:29:12', '2019-08-18 11:29:12'),
(63, 'read_audio_embed', 'audio_embed', '2019-08-18 11:29:12', '2019-08-18 11:29:12'),
(64, 'edit_audio_embed', 'audio_embed', '2019-08-18 11:29:12', '2019-08-18 11:29:12'),
(65, 'add_audio_embed', 'audio_embed', '2019-08-18 11:29:12', '2019-08-18 11:29:12'),
(66, 'delete_audio_embed', 'audio_embed', '2019-08-18 11:29:12', '2019-08-18 11:29:12'),
(82, 'browse_equipment_gallery', 'equipment_gallery', '2019-09-08 14:16:04', '2019-09-08 14:16:04'),
(83, 'read_equipment_gallery', 'equipment_gallery', '2019-09-08 14:16:04', '2019-09-08 14:16:04'),
(84, 'edit_equipment_gallery', 'equipment_gallery', '2019-09-08 14:16:04', '2019-09-08 14:16:04'),
(85, 'add_equipment_gallery', 'equipment_gallery', '2019-09-08 14:16:04', '2019-09-08 14:16:04'),
(86, 'delete_equipment_gallery', 'equipment_gallery', '2019-09-08 14:16:04', '2019-09-08 14:16:04'),
(87, 'browse_default_text', 'default_text', '2019-10-09 18:50:30', '2019-10-09 18:50:30'),
(88, 'read_default_text', 'default_text', '2019-10-09 18:50:30', '2019-10-09 18:50:30'),
(89, 'edit_default_text', 'default_text', '2019-10-09 18:50:30', '2019-10-09 18:50:30'),
(90, 'add_default_text', 'default_text', '2019-10-09 18:50:30', '2019-10-09 18:50:30'),
(91, 'delete_default_text', 'default_text', '2019-10-09 18:50:30', '2019-10-09 18:50:30'),
(97, 'browse_music_category', 'music_category', '2019-10-14 17:18:50', '2019-10-14 17:18:50'),
(98, 'read_music_category', 'music_category', '2019-10-14 17:18:50', '2019-10-14 17:18:50'),
(99, 'edit_music_category', 'music_category', '2019-10-14 17:18:50', '2019-10-14 17:18:50'),
(100, 'add_music_category', 'music_category', '2019-10-14 17:18:50', '2019-10-14 17:18:50'),
(101, 'delete_music_category', 'music_category', '2019-10-14 17:18:50', '2019-10-14 17:18:50'),
(107, 'browse_music_collection', 'music_collection', '2019-10-18 10:34:29', '2019-10-18 10:34:29'),
(108, 'read_music_collection', 'music_collection', '2019-10-18 10:34:29', '2019-10-18 10:34:29'),
(109, 'edit_music_collection', 'music_collection', '2019-10-18 10:34:29', '2019-10-18 10:34:29'),
(110, 'add_music_collection', 'music_collection', '2019-10-18 10:34:29', '2019-10-18 10:34:29'),
(111, 'delete_music_collection', 'music_collection', '2019-10-18 10:34:29', '2019-10-18 10:34:29');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
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
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 3),
(56, 1),
(56, 3),
(57, 1),
(57, 3),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(61, 1),
(61, 3),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(64, 3),
(65, 1),
(65, 3),
(66, 1),
(66, 3),
(82, 1),
(82, 3),
(83, 1),
(83, 3),
(84, 1),
(84, 3),
(85, 1),
(85, 3),
(86, 1),
(86, 3),
(87, 1),
(87, 3),
(88, 1),
(88, 3),
(89, 1),
(89, 3),
(90, 1),
(90, 3),
(91, 1),
(91, 3),
(97, 1),
(97, 3),
(98, 1),
(98, 3),
(99, 1),
(99, 3),
(100, 1),
(100, 3),
(101, 1),
(101, 3),
(107, 1),
(107, 3),
(108, 1),
(108, 3),
(109, 1),
(109, 3),
(110, 1),
(110, 3),
(111, 1),
(111, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(3, 17, 1, 'Nowy sprzęt', 'Nowy sprzęt', 'Nowy sprzet przybył do naszego studia ! Sprawdźcie sami', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam pellentesque augue nibh, ut laoreet enim convallis at. Etiam dapibus nulla eget eros faucibus, sit amet condimentum nisi pharetra. Donec et venenatis nisi. Donec consectetur lobortis fringilla. Proin molestie est eget varius imperdiet. Praesent accumsan tellus ac nibh iaculis pellentesque. Sed elementum in tellus ac condimentum. Sed pharetra risus ut felis suscipit ullamcorper. Pellentesque dui leo, semper sed turpis vel, tristique eleifend tortor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum vehicula dapibus elit ut feugiat. Duis maximus lorem vulputate ligula facilisis efficitur. Aenean libero mi, mattis vitae magna ut, scelerisque rhoncus nisl. Morbi non ipsum ultrices, lobortis risus et, viverra justo. Integer dictum, ex ac fermentum hendrerit, elit risus iaculis lorem, ac finibus augue dolor sit amet elit.', 'posts\\December2019\\mjazSigoBp0hJuMfQOg4.jpg', 'nowy-sprzet', 'nowy sprzęt dla Akustyka', 'Akustykpwsz,pwszelblag', 'PUBLISHED', 0, '2019-10-17 18:18:49', '2019-12-03 00:30:13'),
(4, 17, 1, 'Akustyk PWSZ', '', 'Parę słów o tym co robimy', 'Witamy na stronie koła naukowego. Tutaj dowiecie się o rzeczach ciekawych.', 'posts\\October2019\\2oVfT95JR8NiyxeOkPDD.png', 'akustyk-pwsz', 'Kilka słów o naszym kole ', 'pwsz', 'PUBLISHED', 0, '2019-10-24 13:56:48', '2019-10-26 16:11:15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(2, 'user', 'Normal User', '2019-04-14 14:25:49', '2019-04-14 14:25:49'),
(3, 'moderator', 'Moderator', '2019-06-30 10:46:46', '2019-06-30 10:46:46');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Akustyk', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Koło naukowe PWSZ w Elblągu', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\October2019\\H5dWE5Rxs0Duexo6a81n.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\October2019\\GLimPjDY2DrHi1qfLPez.jpg', '', 'image', 4, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Akustyk', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Witamy w panelu administracyjnym', '', 'text', 1, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 2, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\October2019\\63CQbexXJUfr7N9QveEM.png', '', 'image', 3, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '106965394981-0ho39iqmvc4lbocv1kaqvsj797n0cdrd.apps.googleusercontent.com', '', 'text', 5, 'Admin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-04-14 14:25:50', '2019-04-14 14:25:50'),
(33, 'menu_items', 'title', 15, 'en', 'Forms', '2019-06-30 11:22:54', '2019-06-30 11:22:54'),
(36, 'data_types', 'display_name_singular', 9, 'en', 'Form', '2019-06-30 13:00:38', '2019-06-30 13:00:38'),
(37, 'data_types', 'display_name_plural', 9, 'en', 'Forms', '2019-06-30 13:00:38', '2019-06-30 13:00:38'),
(39, 'data_types', 'display_name_singular', 11, 'en', 'Contact Form', '2019-07-03 18:22:52', '2019-07-03 18:22:52'),
(40, 'data_types', 'display_name_plural', 11, 'en', 'Contact Forms', '2019-07-03 18:22:52', '2019-07-03 18:22:52'),
(41, 'data_types', 'display_name_singular', 6, 'en', 'Page', '2019-07-23 18:56:13', '2019-07-23 18:56:13'),
(42, 'data_types', 'display_name_plural', 6, 'en', 'Pages', '2019-07-23 18:56:13', '2019-07-23 18:56:13'),
(44, 'menu_items', 'title', 5, 'en', 'Tools', '2019-07-23 19:09:53', '2019-07-23 19:09:53'),
(45, 'data_types', 'display_name_singular', 13, 'en', 'Audio Embed', '2019-08-18 11:40:07', '2019-08-18 11:40:07'),
(46, 'data_types', 'display_name_plural', 13, 'en', 'Audio Embeds', '2019-08-18 11:40:07', '2019-08-18 11:40:07'),
(47, 'data_rows', 'display_name', 93, 'en', 'Id', '2019-09-08 11:00:08', '2019-09-08 11:00:08'),
(48, 'data_rows', 'display_name', 94, 'en', 'Name', '2019-09-08 11:00:08', '2019-09-08 11:00:08'),
(49, 'data_rows', 'display_name', 102, 'en', 'Url', '2019-09-08 11:00:08', '2019-09-08 11:00:08'),
(50, 'data_rows', 'display_name', 96, 'en', 'Created at', '2019-09-08 11:00:08', '2019-09-08 11:00:08'),
(51, 'data_rows', 'display_name', 97, 'en', 'Updated at', '2019-09-08 11:00:08', '2019-09-08 11:00:08'),
(52, 'data_rows', 'display_name', 98, 'en', 'Visibility', '2019-09-08 11:00:08', '2019-09-08 11:00:08'),
(53, 'data_rows', 'display_name', 100, 'en', 'Author', '2019-09-08 11:00:08', '2019-09-08 11:00:08'),
(54, 'data_rows', 'display_name', 95, 'en', 'Link', '2019-09-08 11:00:08', '2019-09-08 11:00:08'),
(57, 'data_types', 'display_name_singular', 18, 'en', 'Equipment Gallery', '2019-09-08 14:20:20', '2019-09-08 14:20:20'),
(58, 'data_types', 'display_name_plural', 18, 'en', 'Equipment Galleries', '2019-09-08 14:20:20', '2019-09-08 14:20:20'),
(59, 'data_rows', 'display_name', 103, 'en', 'id', '2019-09-08 14:22:45', '2019-09-08 14:22:45'),
(60, 'data_rows', 'display_name', 104, 'en', 'Images', '2019-09-08 14:22:45', '2019-09-08 14:22:45'),
(61, 'data_rows', 'display_name', 105, 'en', 'Description', '2019-09-08 14:22:45', '2019-09-08 14:22:45'),
(62, 'data_rows', 'display_name', 106, 'en', 'Created at', '2019-09-08 14:22:45', '2019-09-08 14:22:45'),
(63, 'data_rows', 'display_name', 107, 'en', 'Updated at', '2019-09-08 14:22:45', '2019-09-08 14:22:45'),
(64, 'data_rows', 'display_name', 108, 'en', 'user_id', '2019-09-08 14:22:45', '2019-09-08 14:22:45'),
(65, 'data_rows', 'display_name', 109, 'en', 'users', '2019-09-08 14:22:45', '2019-09-08 14:22:45'),
(66, 'pages', 'title', 1, 'en', 'Records', '2019-10-03 18:46:58', '2019-10-03 18:46:58'),
(67, 'pages', 'slug', 1, 'en', 'records', '2019-10-03 18:46:58', '2019-10-03 18:46:58'),
(69, 'data_types', 'display_name_singular', 19, 'en', 'Default Text', '2019-10-10 10:01:31', '2019-10-10 10:01:31'),
(70, 'data_types', 'display_name_plural', 19, 'en', 'Default Texts', '2019-10-10 10:01:31', '2019-10-10 10:01:31'),
(71, 'data_rows', 'display_name', 111, 'en', 'id', '2019-10-10 10:15:59', '2019-10-10 10:15:59'),
(72, 'data_rows', 'display_name', 112, 'en', 'header', '2019-10-10 10:15:59', '2019-10-10 10:15:59'),
(73, 'data_rows', 'display_name', 113, 'en', 'text', '2019-10-10 10:15:59', '2019-10-10 10:15:59'),
(74, 'data_rows', 'display_name', 114, 'en', 'created at', '2019-10-10 10:15:59', '2019-10-10 10:15:59'),
(75, 'data_rows', 'display_name', 115, 'en', 'updated at', '2019-10-10 10:15:59', '2019-10-10 10:15:59'),
(76, 'menu_items', 'title', 26, 'en', 'Default texts', '2019-10-10 10:17:41', '2019-10-10 10:17:41'),
(77, 'data_rows', 'display_name', 116, 'en', 'site', '2019-10-10 10:25:19', '2019-10-10 10:25:19'),
(78, 'default_text', 'header', 3, 'en', 'Akustyk PWSZ in Elblag', '2019-10-10 19:24:37', '2019-10-10 19:24:37'),
(79, 'default_text', 'text', 3, 'en', '<p>&nbsp;Welcome to website of student research group.</p>\n<p>&nbsp;You can find here the latest content from our business :)</p>', '2019-10-10 19:24:37', '2019-10-10 19:24:37'),
(80, 'data_rows', 'display_name', 110, 'en', 'title', '2019-10-12 19:04:33', '2019-10-12 19:04:33'),
(81, 'data_rows', 'display_name', 119, 'en', 'users', '2019-10-12 20:08:18', '2019-10-12 20:08:18'),
(84, 'data_rows', 'display_name', 120, 'en', 'author id', '2019-10-12 20:14:56', '2019-10-12 20:14:56'),
(85, 'data_rows', 'display_name', 121, 'en', 'description', '2019-10-14 11:41:20', '2019-10-14 11:41:20'),
(86, 'data_types', 'display_name_singular', 21, 'en', 'Music Category', '2019-10-14 17:22:08', '2019-10-14 17:22:08'),
(87, 'data_types', 'display_name_plural', 21, 'en', 'Music Categories', '2019-10-14 17:22:08', '2019-10-14 17:22:08'),
(88, 'data_rows', 'display_name', 122, 'en', 'id', '2019-10-14 17:22:44', '2019-10-14 17:22:44'),
(89, 'data_rows', 'display_name', 123, 'en', 'name', '2019-10-14 17:22:44', '2019-10-14 17:22:44'),
(90, 'data_rows', 'display_name', 124, 'en', 'created at', '2019-10-14 17:22:44', '2019-10-14 17:22:44'),
(91, 'data_rows', 'display_name', 125, 'en', 'updated at', '2019-10-14 17:22:44', '2019-10-14 17:22:44'),
(92, 'data_rows', 'display_name', 126, 'en', 'visible', '2019-10-14 17:22:44', '2019-10-14 17:22:44'),
(93, 'data_rows', 'display_name', 127, 'en', 'user', '2019-10-14 17:35:49', '2019-10-14 17:35:49'),
(94, 'data_rows', 'display_name', 128, 'en', 'users', '2019-10-14 17:35:49', '2019-10-14 17:35:49'),
(95, 'data_rows', 'display_name', 129, 'en', 'music_category', '2019-10-14 18:16:58', '2019-10-14 18:16:58'),
(96, 'data_rows', 'display_name', 130, 'en', 'category', '2019-10-14 18:24:56', '2019-10-14 18:24:56'),
(97, 'data_rows', 'display_name', 131, 'en', 'category', '2019-10-14 19:10:16', '2019-10-14 19:10:16'),
(98, 'data_rows', 'display_name', 132, 'en', 'music_category', '2019-10-15 09:32:43', '2019-10-15 09:32:43'),
(99, 'categories', 'slug', 1, 'en', 'records', '2019-10-16 11:25:24', '2019-10-16 11:25:24'),
(100, 'categories', 'name', 1, 'en', 'Records', '2019-10-16 11:25:24', '2019-10-16 11:25:24'),
(108, 'posts', 'title', 3, 'en', 'Nowy sprzęt', '2019-10-17 18:19:00', '2019-10-17 18:19:00'),
(109, 'posts', 'seo_title', 3, 'en', 'Nowy sprzęt', '2019-10-17 18:19:00', '2019-10-17 18:19:00'),
(110, 'posts', 'excerpt', 3, 'en', 'Nowy sprzet przybył do naszego studia ! Sprawdźcie sami', '2019-10-17 18:19:00', '2019-10-17 18:19:00'),
(111, 'posts', 'body', 3, 'en', '<h2>Today to our studio arrived</h2>\n<ul>\n<li>\n<div>Cymbałki :)</div>\n</li>\n<li>\n<div>Ustniki</div>\n</li>\n<li>\n<div>Smyczki</div>\n</li>\n</ul>', '2019-10-17 18:19:00', '2019-10-24 13:15:48'),
(112, 'posts', 'slug', 3, 'en', 'nowy-sprzet', '2019-10-17 18:19:00', '2019-10-17 18:19:00'),
(113, 'posts', 'meta_description', 3, 'en', 'nowy sprzęt dla Akustyka', '2019-10-17 18:19:00', '2019-10-17 18:19:00'),
(114, 'posts', 'meta_keywords', 3, 'en', 'Akustykpwsz,pwszelblag', '2019-10-17 18:19:00', '2019-10-17 18:19:00'),
(115, 'menu_items', 'title', 30, 'en', 'Music Collections', '2019-10-18 10:36:04', '2019-10-18 10:36:04'),
(116, 'data_types', 'display_name_singular', 23, 'en', 'Music Collection', '2019-10-18 10:39:41', '2019-10-18 10:39:41'),
(117, 'data_types', 'display_name_plural', 23, 'en', 'Music Collections', '2019-10-18 10:39:41', '2019-10-18 10:39:41'),
(118, 'data_rows', 'display_name', 133, 'en', 'id', '2019-10-18 10:40:31', '2019-10-18 10:40:31'),
(119, 'data_rows', 'display_name', 134, 'en', 'name', '2019-10-18 10:40:31', '2019-10-18 10:40:31'),
(120, 'data_rows', 'display_name', 135, 'en', 'visible', '2019-10-18 10:40:31', '2019-10-18 10:40:31'),
(121, 'data_rows', 'display_name', 136, 'en', 'download', '2019-10-18 10:40:31', '2019-10-18 10:40:31'),
(122, 'data_rows', 'display_name', 137, 'en', 'created at', '2019-10-18 10:40:31', '2019-10-18 10:40:31'),
(123, 'data_rows', 'display_name', 138, 'en', 'updated at', '2019-10-18 10:40:31', '2019-10-18 10:40:31'),
(124, 'data_rows', 'display_name', 139, 'en', 'music', '2019-10-18 10:40:31', '2019-10-18 10:40:31'),
(125, 'data_rows', 'display_name', 140, 'en', 'count', '2019-10-18 10:40:31', '2019-10-18 10:40:31'),
(128, 'audio_embed', 'description', 33, 'en', 'CAROL OF BELLS REMIX\n\nPurchase link: https://five-o.bandcamp.com/releasess', '2019-10-19 21:21:33', '2019-10-19 21:21:33'),
(129, 'audio_embed', 'name', 33, 'en', 'Home Alone ( 5oh! Christmas dubstep edit) by FIVE-O', '2019-10-19 21:21:33', '2019-10-19 21:21:33'),
(130, 'data_rows', 'display_name', 144, 'en', 'category', '2019-10-22 12:37:27', '2019-10-22 12:37:27'),
(131, 'data_rows', 'display_name', 145, 'en', 'music_category', '2019-10-22 12:37:27', '2019-10-22 12:37:27'),
(132, 'data_rows', 'display_name', 146, 'en', 'author', '2019-10-22 13:05:16', '2019-10-22 13:05:16'),
(133, 'equipment_gallery', 'description', 11, 'en', '<p>&nbsp;</p>\n<div id=\"lipsum\">\n<h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et ligula blandit, pellentesque turpis vel, tempus leo. Donec tincidunt consectetur metus id suscipit. Aenean at libero lectus. Aenean a fermentum orci. Donec maximus consequat efficitur. Praesent eu turpis tempor, bibendum nunc sit amet, tempor massa. Curabitur quis commodo massa.</h2>\n<p><span style=\"color: #993366;\"> Nulla tincidunt congue nulla sed posuere. Pellentesque vel leo a lorem congue consectetur non non velit. Curabitur condimentum maximus odio, a suscipit tortor molestie sed. Nunc tempor leo nec tortor pulvinar varius non nec sapien. Pellentesque dapibus, nibh sed tincidunt laoreet, tortor risus scelerisque eros, ut egestas arcu tortor sed lacus. Sed condimentum sapien turpis, eu rutrum nibh varius ut. Vestibulum augue lorem, elementum scelerisque odio vel, euismod blandit massa. Morbi ac pulvinar dolor. Nulla interdum nunc vel turpis consequat, in finibus massa mattis. In hac habitasse platea dictumst. Morbi nec congue sem. Sed id blandit arcu, eget faucibus mi. </span></p>\n<p><span style=\"color: #993366;\"> Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam erat magna, gravida sed malesuada et, pretium eu enim. Cras gravida venenatis sagittis. Cras iaculis convallis diam, vel congue augue aliquet et. Donec ac quam in mi imperdiet pellentesque. Nullam lacinia tellus sit amet rhoncus commodo. Pellentesque accumsan erat ultrices, dapibus libero sed, luctus arcu. </span></p>\n<p><span style=\"color: #993366;\"> Nullam posuere pulvinar ipsum, et ullamcorper lorem condimentum sed. Mauris dapibus, magna vel dictum ultricies, turpis quam tristique turpis, et vulputate dolor nulla ac nulla. Sed porta purus sed ligula rhoncus malesuada. Nulla rutrum auctor congue. Nam eget nibh ac libero convallis finibus. Vestibulum eget enim ac lorem suscipit sollicitudin ac ac erat. Phasellus volutpat nulla mauris, et congue purus commodo eget. Etiam ut orci vehicula, lobortis enim vitae, feugiat sapien. Vestibulum nec iaculis eros, eu fermentum turpis. Duis leo libero, pulvinar vitae tempus non, suscipit at leo. Nulla vel arcu non augue malesuada pulvinar id tempor massa. Donec erat magna, porttitor sed mattis ut, pretium et leo. Proin vel porttitor odio. Nulla gravida gravida leo. </span></p>\n<p><span style=\"color: #993366;\"> Sed interdum est vel sem vehicula egestas. Suspendisse nunc eros, pellentesque eget venenatis a, ornare nec tortor. Vestibulum nulla ante, elementum non aliquam nec, sodales nec nibh. Donec non eleifend est. Morbi quis metus nulla. Nunc lacinia enim vel imperdiet imperdiet. Proin sit amet lorem mi. Integer malesuada metus eu ante dignissim lacinia sit amet id ligula. Donec consequat neque eu nibh imperdiet commodo. Nam pharetra mattis aliquet. Pellentesque interdum lorem dolor, sed blandit tortor convallis a. Cras sem elit, cursus et fringilla quis, bibendum sed est. Fusce ut augue feugiat, venenatis ipsum auctor, dapibus est. Vestibulum lacinia imperdiet lorem. </span></p>\n</div>', '2019-10-22 19:36:51', '2019-10-22 19:36:51'),
(135, 'equipment_gallery', 'name', 12, 'en', 'Nom', '2019-10-23 14:32:02', '2019-10-23 14:32:02'),
(136, 'data_rows', 'display_name', 147, 'en', 'Id', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(137, 'data_rows', 'display_name', 148, 'en', 'Commenter Id', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(138, 'data_rows', 'display_name', 149, 'en', 'Commenter Type', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(139, 'data_rows', 'display_name', 150, 'en', 'Guest Name', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(140, 'data_rows', 'display_name', 151, 'en', 'Guest Email', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(141, 'data_rows', 'display_name', 152, 'en', 'Commentable Type', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(142, 'data_rows', 'display_name', 153, 'en', 'Commentable Id', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(143, 'data_rows', 'display_name', 154, 'en', 'Comment', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(144, 'data_rows', 'display_name', 155, 'en', 'Approved', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(145, 'data_rows', 'display_name', 156, 'en', 'Child Id', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(146, 'data_rows', 'display_name', 157, 'en', 'Created At', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(147, 'data_rows', 'display_name', 158, 'en', 'Updated At', '2019-10-23 22:03:33', '2019-10-23 22:03:33'),
(150, 'default_text', 'header', 5, 'en', 'Contact with us', '2019-10-24 15:53:35', '2019-10-24 15:53:35'),
(151, 'default_text', 'header', 7, 'en', 'Our music to download', '2019-10-24 16:35:13', '2019-10-24 16:35:13'),
(152, 'default_text', 'header', 8, 'en', 'Poems', '2019-10-24 16:35:54', '2019-10-24 16:35:54'),
(153, 'default_text', 'header', 9, 'en', 'Recommended', '2019-10-24 17:04:34', '2019-10-24 17:07:14'),
(154, 'default_text', 'header', 10, 'en', 'Tales', '2019-10-24 17:08:13', '2019-10-24 17:08:13'),
(155, 'default_text', 'header', 11, 'en', 'Stories', '2019-10-24 17:08:46', '2019-10-24 17:08:46'),
(156, 'default_text', 'header', 12, 'en', 'Guests', '2019-10-24 17:09:48', '2019-10-24 17:09:48'),
(157, 'default_text', 'header', 13, 'en', 'Poems', '2019-10-24 17:10:24', '2019-10-24 17:10:24'),
(158, 'default_text', 'header', 14, 'en', 'Tales', '2019-10-24 17:10:43', '2019-10-24 17:10:43'),
(159, 'default_text', 'header', 15, 'en', 'Stories', '2019-10-24 17:11:06', '2019-10-24 17:11:06'),
(160, 'default_text', 'header', 16, 'en', 'Guests', '2019-10-24 17:11:25', '2019-10-24 17:11:25'),
(161, 'default_text', 'header', 17, 'en', 'Recommended', '2019-10-24 17:11:37', '2019-10-24 17:11:37'),
(166, 'posts', 'title', 4, 'en', 'Akustyk PWSZ', '2019-10-26 16:11:15', '2019-10-26 16:11:15'),
(167, 'posts', 'excerpt', 4, 'en', 'Few words ', '2019-10-26 16:11:15', '2019-12-03 00:36:51'),
(168, 'posts', 'body', 4, 'en', 'Witamy na stronie koła naukowego. Tutaj dowiecie się o rzeczach ciekawych. Welcome', '2019-10-26 16:11:15', '2019-12-03 00:36:16'),
(169, 'posts', 'slug', 4, 'en', 'akustyk-pwsz', '2019-10-26 16:11:15', '2019-10-26 16:11:15'),
(170, 'posts', 'meta_description', 4, 'en', 'Kilka słów o naszym kole ', '2019-10-26 16:11:15', '2019-10-26 16:11:15'),
(171, 'posts', 'meta_keywords', 4, 'en', 'pwsz', '2019-10-26 16:11:15', '2019-10-26 16:11:15'),
(172, 'menu_items', 'title', 1, 'en', 'Dashboard', '2019-12-01 20:30:43', '2019-12-01 20:30:43'),
(173, 'menu_items', 'title', 4, 'en', 'Roles', '2019-12-01 20:30:56', '2019-12-01 20:30:56'),
(174, 'menu_items', 'title', 3, 'en', 'Users', '2019-12-01 20:31:05', '2019-12-01 20:31:05'),
(175, 'menu_items', 'title', 12, 'en', 'Posts', '2019-12-01 20:31:19', '2019-12-01 20:31:19'),
(176, 'menu_items', 'title', 13, 'en', 'Pages', '2019-12-01 20:31:30', '2019-12-01 20:31:30'),
(177, 'menu_items', 'title', 11, 'en', 'Categories', '2019-12-01 20:31:37', '2019-12-01 20:31:37'),
(178, 'menu_items', 'title', 6, 'en', 'Menu Builder', '2019-12-01 20:32:33', '2019-12-01 20:32:33'),
(179, 'menu_items', 'title', 7, 'en', 'Database', '2019-12-01 20:32:42', '2019-12-01 20:32:42'),
(180, 'menu_items', 'title', 8, 'en', 'Compass', '2019-12-01 20:32:50', '2019-12-01 20:32:50'),
(181, 'menu_items', 'title', 14, 'en', 'Hooks', '2019-12-01 20:33:04', '2019-12-01 20:33:04'),
(182, 'menu_items', 'title', 10, 'en', 'Settings', '2019-12-01 20:33:12', '2019-12-01 20:33:12'),
(183, 'menu_items', 'title', 18, 'en', 'Contact Forms', '2019-12-01 20:33:23', '2019-12-01 20:33:23'),
(184, 'menu_items', 'title', 20, 'en', 'Audio Embeds', '2019-12-01 20:33:38', '2019-12-01 20:33:38'),
(185, 'menu_items', 'title', 24, 'en', 'Equipment Galleries', '2019-12-01 20:33:48', '2019-12-01 20:33:48'),
(186, 'menu_items', 'title', 28, 'en', 'Music Categories', '2019-12-01 20:34:11', '2019-12-01 20:34:11'),
(187, 'pages', 'body', 1, 'en', '<p>dddd</p>', '2019-12-02 00:16:07', '2019-12-02 00:16:07'),
(188, 'data_rows', 'display_name', 44, 'en', 'ID', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(189, 'data_rows', 'display_name', 45, 'en', 'Author', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(190, 'data_rows', 'display_name', 46, 'en', 'Title', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(191, 'data_rows', 'display_name', 47, 'en', 'Excerpt', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(192, 'data_rows', 'display_name', 48, 'en', 'Body', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(193, 'data_rows', 'display_name', 55, 'en', 'Page Image', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(194, 'data_rows', 'display_name', 49, 'en', 'Slug', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(195, 'data_rows', 'display_name', 50, 'en', 'Meta Description', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(196, 'data_rows', 'display_name', 51, 'en', 'Meta Keywords', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(197, 'data_rows', 'display_name', 52, 'en', 'Status', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(198, 'data_rows', 'display_name', 53, 'en', 'Created At', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(199, 'data_rows', 'display_name', 54, 'en', 'Updated At', '2019-12-02 12:44:13', '2019-12-02 12:44:13'),
(200, 'data_rows', 'display_name', 29, 'en', 'ID', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(201, 'data_rows', 'display_name', 30, 'en', 'Author', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(202, 'data_rows', 'display_name', 31, 'en', 'Category', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(203, 'data_rows', 'display_name', 32, 'en', 'Title', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(204, 'data_rows', 'display_name', 42, 'en', 'SEO Title', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(205, 'data_rows', 'display_name', 33, 'en', 'Excerpt', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(206, 'data_rows', 'display_name', 34, 'en', 'Body', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(207, 'data_rows', 'display_name', 35, 'en', 'Post Image', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(208, 'data_rows', 'display_name', 36, 'en', 'Slug', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(209, 'data_rows', 'display_name', 37, 'en', 'Meta Description', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(210, 'data_rows', 'display_name', 38, 'en', 'Meta Keywords', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(211, 'data_rows', 'display_name', 39, 'en', 'Status', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(212, 'data_rows', 'display_name', 43, 'en', 'Featured', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(213, 'data_rows', 'display_name', 40, 'en', 'Created At', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(214, 'data_rows', 'display_name', 41, 'en', 'Updated At', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(215, 'data_types', 'display_name_singular', 5, 'en', 'Post', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(216, 'data_types', 'display_name_plural', 5, 'en', 'Posts', '2019-12-03 00:35:13', '2019-12-03 00:35:13'),
(217, 'posts', 'seo_title', 4, 'en', 'New equipment', '2019-12-03 00:37:50', '2019-12-03 00:37:50'),
(218, 'data_rows', 'display_name', 84, 'en', 'Id', '2019-12-05 19:54:43', '2019-12-05 19:54:43'),
(219, 'data_rows', 'display_name', 85, 'en', 'User', '2019-12-05 19:54:43', '2019-12-05 19:54:43'),
(220, 'data_rows', 'display_name', 86, 'en', 'Email', '2019-12-05 19:54:43', '2019-12-05 19:54:43'),
(221, 'data_rows', 'display_name', 87, 'en', 'Message', '2019-12-05 19:54:43', '2019-12-05 19:54:43'),
(222, 'data_rows', 'display_name', 88, 'en', 'Ip Address', '2019-12-05 19:54:43', '2019-12-05 19:54:43'),
(223, 'data_rows', 'display_name', 89, 'en', 'Created At', '2019-12-05 19:54:43', '2019-12-05 19:54:43'),
(224, 'data_rows', 'display_name', 90, 'en', 'Updated At', '2019-12-05 19:54:43', '2019-12-05 19:54:43'),
(225, 'data_rows', 'display_name', 92, 'en', 'Additional Information', '2019-12-05 19:54:43', '2019-12-05 19:54:43'),
(226, 'equipment_gallery', 'name', 9, 'en', 'Asdqwerty', '2019-12-07 14:31:37', '2019-12-07 14:31:37'),
(240, 'data_rows', 'display_name', 1, 'en', 'ID', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(241, 'data_rows', 'display_name', 21, 'en', 'Role', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(242, 'data_rows', 'display_name', 2, 'en', 'Name', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(243, 'data_rows', 'display_name', 3, 'en', 'Email', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(244, 'data_rows', 'display_name', 8, 'en', 'Avatar', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(245, 'data_rows', 'display_name', 56, 'en', 'Email Verified At', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(246, 'data_rows', 'display_name', 4, 'en', 'Password', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(247, 'data_rows', 'display_name', 5, 'en', 'Remember Token', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(248, 'data_rows', 'display_name', 11, 'en', 'Settings', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(249, 'data_rows', 'display_name', 6, 'en', 'Created At', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(250, 'data_rows', 'display_name', 7, 'en', 'Updated At', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(251, 'data_rows', 'display_name', 57, 'en', 'Provider', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(252, 'data_rows', 'display_name', 58, 'en', 'Provider Id', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(253, 'data_rows', 'display_name', 9, 'en', 'Role', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(254, 'data_rows', 'display_name', 10, 'en', 'Roles', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(255, 'data_types', 'display_name_singular', 1, 'en', 'User', '2019-12-23 23:20:35', '2019-12-23 23:20:35'),
(256, 'data_types', 'display_name_plural', 1, 'en', 'Users', '2019-12-23 23:20:35', '2019-12-23 23:20:35');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'laravel',
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `provider`, `provider_id`, `last_login`) VALUES
(28, 1, 'AkustykAdmin', 'akustykpwsz@gmail.com', 'users/default.png', '2019-12-02 23:00:00', '$2y$10$RYeHUw4g/guoAiwN2QxrY.CUJVeMUMENj/yYS/fbMJH2dbbqpAhMy', NULL, NULL, '2019-12-23 23:23:49', '2020-11-04 16:02:03', 'laravel', NULL, '2020-11-04 17:00:52');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `audio_embed`
--
ALTER TABLE `audio_embed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audio_embed_embed_index` (`embed`);

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_commenter_id_commenter_type_index` (`commenter_id`,`commenter_type`),
  ADD KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  ADD KEY `comments_child_id_foreign` (`child_id`);

--
-- Indeksy dla tabeli `contact_forms`
--
ALTER TABLE `contact_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indeksy dla tabeli `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indeksy dla tabeli `default_text`
--
ALTER TABLE `default_text`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `default_text_view_unique` (`view`);

--
-- Indeksy dla tabeli `equipment_gallery`
--
ALTER TABLE `equipment_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indeksy dla tabeli `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `music_category`
--
ALTER TABLE `music_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `music_category_name_unique` (`name`);

--
-- Indeksy dla tabeli `music_collection`
--
ALTER TABLE `music_collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_collection_name_index` (`name`);

--
-- Indeksy dla tabeli `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indeksy dla tabeli `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeksy dla tabeli `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indeksy dla tabeli `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indeksy dla tabeli `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indeksy dla tabeli `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeksy dla tabeli `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indeksy dla tabeli `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indeksy dla tabeli `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `audio_embed`
--
ALTER TABLE `audio_embed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `contact_forms`
--
ALTER TABLE `contact_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT dla tabeli `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT dla tabeli `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT dla tabeli `default_text`
--
ALTER TABLE `default_text`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `equipment_gallery`
--
ALTER TABLE `equipment_gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT dla tabeli `music_category`
--
ALTER TABLE `music_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `music_collection`
--
ALTER TABLE `music_collection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT dla tabeli `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT dla tabeli `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ograniczenia dla tabeli `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
