-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2018 at 08:25 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tranquil_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `entconfig`
--

CREATE TABLE `entconfig` (
  `configId` int(11) NOT NULL,
  `configKey` varchar(255) NOT NULL,
  `configValue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entconfig`
--

INSERT INTO `entconfig` (`configId`, `configKey`, `configValue`) VALUES
(1, 'SITE_TITLE', 'Tranquil');

-- --------------------------------------------------------

--
-- Table structure for table `entinfocontent`
--

CREATE TABLE `entinfocontent` (
  `contentId` int(11) NOT NULL,
  `contentTitle` varchar(255) NOT NULL,
  `contentText` text NOT NULL,
  `contentMetaKeywords` text NOT NULL,
  `contentMetaDescription` text NOT NULL,
  `contentMetaCanonicalUrl` varchar(255) NOT NULL,
  `contentStatus` enum('active','preview','inactive') NOT NULL,
  `contentCreated` datetime NOT NULL,
  `contentUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entinfocontent`
--

INSERT INTO `entinfocontent` (`contentId`, `contentTitle`, `contentText`, `contentMetaKeywords`, `contentMetaDescription`, `contentMetaCanonicalUrl`, `contentStatus`, `contentCreated`, `contentUpdated`) VALUES
(1, 'Tranquil', '<h1>Tranquil</h1>\r\n\r\n<h2>What is tranquil?</h2>\r\n\r\n<p>Tranquil is a light CMS and MVC-based PHP-framework, written from ground-up using secure technologies and open-source solutions.</p>\r\n\r\n<p>Tranquil utilizes the tranquil-css-framework, which is freely available on its <a href="http://cdn.dronki.tech/tranquil/css/" target="_blank">CDN-page</a>.</p>\r\n\r\n<p>The administration uses <a href="https://ckeditor.com/" target="_blank">CKEditor</a>, and due to this framework being open-source and easy to modify, it&#39;s quite easy to replace CKEditor to <a href="https://www.tinymce.com/download/" target="_blank">TinyMCE</a>.</p>\r\n\r\n<p>Pages such as this, can be created using the administration, and all pages supports meta-tags, meta-description, and canonical-URL. Pages can also be set as active (available for all), preview (only available for admins to preview), and inactive (not available to anyone).</p>\r\n\r\n<p>This framework also utilizes a template-engine that is written from scratch, so each view can add scripts, stylesheets, and meta-tags on the fly when generating the page.</p>\r\n\r\n<h2>Core-functions:</h2>\r\n\r\n<ul>\r\n	<li>clConfig.php - for reading and storing variables in the database.</li>\r\n	<li>clDbPDO.php - for communicating with the database.</li>\r\n	<li>clLogger.php - Log important messages from modules to a file.</li>\r\n	<li>clRegistry.php - Instantiate and control instantiated objects from one file.</li>\r\n	<li>clRouter.php - Takes care of all the routing performed in the framework.</li>\r\n	<li>clTableHtml.php - Create tables on the fly.</li>\r\n	<li>clTemplate.php - The template-engine.</li>\r\n	<li>clView.php - View-rendering and scripting-engine.</li>\r\n</ul>\r\n\r\n<h2>Models:</h2>\r\n\r\n<ul>\r\n	<li>admin - The model responsible for the administration.</li>\r\n	<li>infoContent - The model for inserting and managing the pages that can be displayed.</li>\r\n	<li>moduleInstaller - Not quite done yet.</li>\r\n	<li>navigation - Generates the navigation based on parents, groups, classes, behavior, and prefix-content (such as <a href="https://fontawesome.com/icons?d=gallery" target="_blank">fontawesome</a>)</li>\r\n</ul>\r\n\r\n<h2>TODO:</h2>\r\n\r\n<ul>\r\n	<li>Finish the moduleInstaller.</li>\r\n	<li>Finish the settings-model and views.</li>\r\n	<li>Finish the router-views.</li>\r\n	<li><s>Create clPagination.</s>&nbsp;- <strong>Fixed 2018-03-19</strong></li>\r\n	<li>Add more capabilities to the infoContent-editor.</li>\r\n	<li>Expand the scripting-engine in the clView.php.</li>\r\n	<li>Rewrite administration-CSS.</li>\r\n	<li><s>Fix the depth-bug in the navigation.&nbsp;</s>&nbsp;- <strong>Fixed 2018-03-19</strong></li>\r\n</ul>\r\n', 'meta, key, words', 'metadescription', '', 'active', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'test-page', '<p>You can include other views by doing:</p>\r\n\r\n<p>{view:infoContent/404}</p>\r\n', '', '', '', 'active', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `entnavigation`
--

CREATE TABLE `entnavigation` (
  `navigationId` int(11) NOT NULL,
  `navigationGroup` varchar(255) NOT NULL,
  `navigationParentId` int(11) NOT NULL,
  `navigationSort` int(255) NOT NULL,
  `navigationName` varchar(255) NOT NULL,
  `navigationClass` varchar(255) NOT NULL,
  `navigationHref` varchar(255) NOT NULL,
  `navigationBehavior` enum('_self','_blank','_parent','_top') NOT NULL,
  `navigationPrefixContent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entnavigation`
--

INSERT INTO `entnavigation` (`navigationId`, `navigationGroup`, `navigationParentId`, `navigationSort`, `navigationName`, `navigationClass`, `navigationHref`, `navigationBehavior`, `navigationPrefixContent`) VALUES
(1, 'guest', 0, 0, 'Home', '', '/', '_self', ''),
(2, 'guest', 1, 0, 'Sub', '', '/test-page', '_self', ''),
(3, 'admin', 0, 0, 'Dashboard', '', '/admin', '_self', '<i class="fas fa-tachometer-alt"></i>'),
(4, 'admin', 0, 0, 'Pages', '', '/admin/infoContent', '_self', '<i class="far fa-file-alt"></i>');

-- --------------------------------------------------------

--
-- Table structure for table `entroutes`
--

CREATE TABLE `entroutes` (
  `routeId` int(11) NOT NULL,
  `routePath` varchar(255) NOT NULL,
  `routeTemplate` varchar(255) NOT NULL,
  `routeModel` varchar(255) NOT NULL,
  `routeView` varchar(255) NOT NULL,
  `routeViewId` int(11) NOT NULL,
  `routeCreated` datetime NOT NULL,
  `routeUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entroutes`
--

INSERT INTO `entroutes` (`routeId`, `routePath`, `routeTemplate`, `routeModel`, `routeView`, `routeViewId`, `routeCreated`, `routeUpdated`) VALUES
(1, '/', 'default', 'infoContent', 'show', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '/admin', 'admin', 'admin', 'admin', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '/admin/login', 'adminLogin', 'admin', 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '/admin/logout', 'admin', 'admin', 'logout', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '/admin/infoContent', 'admin', 'infoContent', 'list', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '/admin/infoContent/add', 'admin', 'infoContent', 'formAdd', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '/test-page', 'default', 'infoContent', 'show', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '/admin/routes', 'admin', 'router', 'list', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '/admin/developer', 'admin', 'admin', 'developerMenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `entusers`
--

CREATE TABLE `entusers` (
  `userId` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  `userStatus` enum('user','moderator','admin') NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userLastLogin` datetime NOT NULL,
  `userCreated` datetime NOT NULL,
  `userUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entusers`
--

INSERT INTO `entusers` (`userId`, `userName`, `userPass`, `userStatus`, `userEmail`, `userLastLogin`, `userCreated`, `userUpdated`) VALUES
(1, 'developer', '7e7aad44abe3c029bd3a7543520605e1', 'admin', '', '2018-03-09 17:45:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entconfig`
--
ALTER TABLE `entconfig`
  ADD PRIMARY KEY (`configId`,`configKey`) USING BTREE,
  ADD UNIQUE KEY `configKey` (`configKey`);

--
-- Indexes for table `entinfocontent`
--
ALTER TABLE `entinfocontent`
  ADD PRIMARY KEY (`contentId`);

--
-- Indexes for table `entnavigation`
--
ALTER TABLE `entnavigation`
  ADD PRIMARY KEY (`navigationId`);

--
-- Indexes for table `entroutes`
--
ALTER TABLE `entroutes`
  ADD PRIMARY KEY (`routeId`,`routePath`),
  ADD UNIQUE KEY `routePath` (`routePath`);

--
-- Indexes for table `entusers`
--
ALTER TABLE `entusers`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userName` (`userName`,`userEmail`),
  ADD UNIQUE KEY `userId_2` (`userId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `userId_3` (`userId`),
  ADD KEY `userName_2` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `entconfig`
--
ALTER TABLE `entconfig`
  MODIFY `configId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `entinfocontent`
--
ALTER TABLE `entinfocontent`
  MODIFY `contentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `entnavigation`
--
ALTER TABLE `entnavigation`
  MODIFY `navigationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `entroutes`
--
ALTER TABLE `entroutes`
  MODIFY `routeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `entusers`
--
ALTER TABLE `entusers`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
