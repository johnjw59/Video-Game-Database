-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 15, 2015 at 06:30 AM
-- Server version: 5.5.42-MariaDB
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jwiebeca_cpsc304`
--

-- --------------------------------------------------------

--
-- Table structure for table `creator`
--

CREATE TABLE IF NOT EXISTS `creator` (
  `creator_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` tinytext NOT NULL,
  `type` tinytext NOT NULL,
  `description` text NOT NULL,
  `country` tinytext NOT NULL,
  `year_founded` smallint(4) NOT NULL,
  `website` tinytext NOT NULL,
  `image_url` tinytext NOT NULL,
  PRIMARY KEY (`creator_id`),
  UNIQUE KEY `creator_id` (`creator_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `creator`
--

INSERT INTO `creator` (`creator_id`, `company_name`, `type`, `description`, `country`, `year_founded`, `website`, `image_url`) VALUES
(1, 'EA', 'publisher', 'Founded and incorporated on May 28, 1982 by Trip Hawkins, the company was a pioneer of the early home computer games industry', 'USA', 1982, 'www.ea.com', 'ea.png'),
(2, 'Nintendo', 'both', 'Nintendo is a Japanese multinational consumer electronics company headquartered in Kyoto, Japan. Nintendo is the world''s largest video game company by revenue', 'Japan', 1889, 'www.nintendo.com', 'nintendo.png'),
(3, 'Blizzard', 'both', 'Blizzard was founded under the name Silicon & Synapse and is currently a subsidiary of American company Activision Blizzard', 'USA', 1991, 'us.blizzard.com', 'blizzard.png'),
(4, 'Activision', 'publisher', 'Activion is the world''s first independent developer and distributor of video games for gaming consoles. Its first products were cartridges for the Atari 2600 video console system', 'USA', 1979, 'www.activision.com', 'activision.png'),
(5, 'Bioware', 'developer', 'BioWare is currently owned by American company Electronic Arts. The company specializes in role-playing video games, and became famous for launching highly praised and successful licensed franchises', 'Canada', 2007, 'www.bioware.com', 'bioware.png');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `image_url` tinytext NOT NULL,
  `description` text NOT NULL,
  `release_date` date NOT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE KEY `game_id` (`game_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`game_id`, `title`, `image_url`, `description`, `release_date`) VALUES
(1, 'Mass Effect 2', 'mass_effect_2.png', 'After being revived from death and having to join a pro-human organization without a choice, Commander Shepard must assemble a team, battle a new threat, and make tough choices in order to save the galaxy from total annihilation once more.', '2010-01-26'),
(2, 'Call of Duty Black Ops', 'cod_black_ops.png', 'When he''s interrogated by unknown figures, Alex Mason has to remember the location of a broadcast station, to stop a horrifying biotic weapon attack. During the progress, he begins to suspect the true identity of his Soviet friend-Victor Reznov.', '2010-09-11'),
(3, 'StarCraft 2', 'starcraft_2.png', 'Four years after the events of StarCraft: Brood War, Jim Raynor fights against the Dominion and begins a search for artifacts when at the same time zerg attack once again.', '2014-11-21'),
(4, 'Super Smash Bros. for Wii U', 'smash_bros_wiiu.png', 'Famous characters from Nintendo''s franchises, as well as special guest characters, come to battle each other.', '2014-09-21');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_id` (`genre_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `name`, `description`) VALUES
(1, 'first-person shooter', 'Action games where the player is “behind the eyes” of the game character in a first-person perspective. Although a number of FPS games also support third-person views'),
(2, 'action/adventure', 'Action-adventure games can be described in terms of a blend of the characteristics associated with both adventure and action games, i.e. often involving both exploration and puzzle solving alongside fast-paced action sequences.'),
(3, 'real-time strategy', 'RTS games typically defined a number of goals around resource collection, base and unit construction and engagement in combat with other players or computer opponents who also share similar goals.'),
(4, 'platformer', 'This genre often requires the protagonist to run and jump between surfaces (i.e. platforms) whilst avoiding game objects and the detrimental effects of gravity.'),
(5, 'fighter', 'In fighting games the player typically fights other players or the computer in some form of one-on-one combat.');

-- --------------------------------------------------------

--
-- Table structure for table `isGenre`
--

CREATE TABLE IF NOT EXISTS `isGenre` (
  `game_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`game_id`,`genre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isGenre`
--

INSERT INTO `isGenre` (`game_id`, `genre_id`) VALUES
(1, 2),
(2, 1),
(3, 5),
(4, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `madeBy`
--

CREATE TABLE IF NOT EXISTS `madeBy` (
  `game_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`game_id`,`creator_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `madeBy`
--

INSERT INTO `madeBy` (`game_id`, `creator_id`) VALUES
(1, 1),
(1, 5),
(2, 4),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `onPlatform`
--

CREATE TABLE IF NOT EXISTS `onPlatform` (
  `game_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  PRIMARY KEY (`game_id`,`platform_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onPlatform`
--

INSERT INTO `onPlatform` (`game_id`, `platform_id`) VALUES
(1, 1),
(1, 2),
(3, 4),
(4, 3),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `platform`
--

CREATE TABLE IF NOT EXISTS `platform` (
  `platform_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `manufacturer` tinytext NOT NULL,
  PRIMARY KEY (`platform_id`),
  UNIQUE KEY `platform_id` (`platform_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `platform`
--

INSERT INTO `platform` (`platform_id`, `name`, `manufacturer`) VALUES
(1, 'Playstation 3', 'Sony'),
(2, 'Xbox 360', 'Microsoft');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `text` text,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `review_id` (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `email` tinytext NOT NULL,
  `password` tinytext NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;