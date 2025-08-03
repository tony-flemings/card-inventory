CREATE TABLE `DimManufacturer` (
  `id` int NOT NULL,
  `manufacturer_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DimManufacturer`
--

INSERT INTO `DimManufacturer` (`id`, `manufacturer_name`) VALUES
(2, 'Topps');

CREATE TABLE `DimTransactionType` (
  `id` int NOT NULL,
  `transaction_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DimTransactionType`
--

INSERT INTO `DimTransactionType` (`id`, `transaction_type`) VALUES
(3, 'Purchase'),
(4, 'Sale');

CREATE TABLE `DimUser` (
  `id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email_address` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `join_date_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DimUser`
--

INSERT INTO `DimUser` (`id`, `first_name`, `last_name`, `email_address`, `phone`, `join_date_id`) VALUES
(4, 'Anthony', 'Flemings', 'tony.flemings@gmail.com', '614.315.1897', 241292);

CREATE TABLE `DimCardset` (
  `id` int NOT NULL,
  `setname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `release_date_id` int NOT NULL,
  `cardcount` int DEFAULT NULL,
  `manufacturer_id` int NOT NULL,
  `cardtype_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DimCardset`
--

INSERT INTO `DimCardset` (`id`, `setname`, `release_date_id`, `cardcount`, `manufacturer_id`, `cardtype_id`) VALUES
(5, '2023 Topps Series One', 240396, 330, 2, 9),
(6, '2023 Topps Series Two', 240508, 330, 2, 9),
(7, '2024 Topps Series One', 240760, 350, 2, 9),
(8, '2024 Topps Series Two', 240879, 350, 2, 9);

CREATE TABLE `DimGrader` (
  `id` int NOT NULL,
  `grader_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `grader_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DimGrader`
--

INSERT INTO `DimGrader` (`id`, `grader_name`, `grader_url`) VALUES
(5, 'Beckett', 'www.beckett.com'),
(6, 'PSA', 'www.psacard.com'),
(7, 'SGC', 'www.gosgc.com'),
(8, 'CGC', 'www.cgccards.com');

CREATE TABLE `DimCondition` (
  `id` int NOT NULL,
  `is_graded` tinyint(1) NOT NULL DEFAULT '0',
  `condition_code` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grader_id` int DEFAULT NULL,
  `grade` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `condition_description` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DimCondition`
--

INSERT INTO `DimCondition` (`id`, `is_graded`, `condition_code`, `grader_id`, `grade`, `condition_description`) VALUES
(27, 0, 'Near Mint +', NULL, NULL, 'Ungraded : Near Mint +'),
(28, 0, 'Excellent', NULL, NULL, 'Ungraded : Excellent'),
(29, 0, 'Good', NULL, NULL, 'Ungraded : Good'),
(30, 0, 'Fair', NULL, NULL, 'Ungraded : Fair'),
(31, 0, 'Poor', NULL, NULL, 'Ungraded : Poor'),
(32, 1, 'Gem Mint', 6, '10', 'PSA 10 : Gem Mint'),
(33, 1, 'Mint', 6, '9', 'PSA 9 : Mint'),
(34, 1, 'NM-MT', 6, '8', 'PSA 8 : NM-MT '),
(35, 1, 'NM', 6, '7', 'PSA 7 : NM'),
(36, 1, 'Pristine', 5, '10', 'BGS 10 : Pristine'),
(37, 1, 'Gem Mint', 5, '9.5', 'BGS 9.5 : Gem Mint'),
(38, 1, 'Mint', 5, '9', 'BGS 9 : Mint'),
(39, 1, 'Near Mint/Mint', 5, '8', 'BGS 8 : Near Mint/Mint'),
(40, 1, 'Near Mint', 5, '7', 'BGS 7 : Near Mint');

CREATE TABLE `DimFolder` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `folder_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `DimVariation` (
  `id` int NOT NULL,
  `cardset_id` int NOT NULL,
  `variation_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `print_run` int DEFAULT NULL,
  `base_set_size` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DimVariation`
--

INSERT INTO `DimVariation` (`id`, `cardset_id`, `variation_name`, `print_run`, `base_set_size`) VALUES
(368, 5, 'Base', NULL, 330),
(369, 5, '1988 Topps Baseball', NULL, 100),
(370, 5, '1988 Topps Baseball Autographs', NULL, 117),
(371, 5, '1988 Topps Baseball Relics', NULL, 85),
(372, 5, '1988 Topps Chrome Baseball Silver Packs Autographs', NULL, 75),
(373, 5, '1988 Topps Chrome Silver Packs', NULL, 100),
(374, 5, '2022\'s Greatest Hits', NULL, 25),
(375, 5, '2022\'s Greatest Hits Autographs', NULL, 16),
(376, 5, 'AKA', NULL, 10),
(377, 5, 'All Aces', NULL, 25),
(378, 5, 'All Aces Autographs', NULL, 18),
(379, 5, 'Baseball Stars Autographs', NULL, 112),
(380, 5, 'Baseball Stars Dual Autographs', NULL, 41),
(381, 5, 'City Connect Manufactured Patch Cards', NULL, 49),
(382, 5, 'Clear', NULL, 100),
(383, 5, 'Cut Signatures', NULL, 50),
(384, 5, 'Heavy Lumber', NULL, 20),
(385, 5, 'Home Run Challenge Code Cards', NULL, 30),
(386, 5, 'In the Name Relics', NULL, 42),
(387, 5, 'Major League Material', NULL, 87),
(388, 5, 'Major League Material Autographs', NULL, 46),
(389, 5, 'One-Two Punch', NULL, 25),
(390, 5, 'One-Two Punch Dual Autographs', NULL, 9),
(391, 5, 'Oversized 1988 Topps Baseball - League Leaders Boxtoppers', NULL, 25),
(392, 5, 'Oversized 1988 Topps Baseball - League Leaders Boxtoppers Autographs', NULL, 15),
(393, 5, 'Patchwork of the Past Commemorative Patch Cards', NULL, 30),
(394, 5, 'Patchwork of the Past Commemorative Patch Cards Autographs', NULL, 19),
(395, 5, 'Postseason Performance Autograph Relics', NULL, 20),
(396, 5, 'Postseason Performance Autographs', NULL, 15),
(397, 5, 'Postseason Performance Relics', NULL, 38),
(398, 5, 'Stars of MLB', NULL, 30),
(399, 5, 'Stars of MLB Chrome', NULL, 30),
(400, 5, 'Team Logo Manufactured Patch Cards', NULL, 50),
(401, 5, 'Team Logo Manufactured Patch Cards Autographs', NULL, 27),
(402, 5, 'Topps Reverence Autograph Patch Cards', NULL, 55),
(403, 5, 'Welcome to the Club', NULL, 24),
(404, 5, 'Welcome to the Club Autographs', NULL, 15),
(405, 5, 'World Series Champion Autograph Relics', NULL, 9),
(406, 5, 'World Series Champion Autographs', NULL, 10),
(407, 5, 'World Series Champions Relics', NULL, 12),
(408, 6, 'Base', NULL, 330),
(409, 6, '1988 Topps Baseball', NULL, 50),
(410, 6, '1988 Topps Baseball All-Star Relics', NULL, 50),
(411, 6, '1988 Topps Baseball All-Stars', NULL, 50),
(412, 6, '1988 Topps Baseball All-Stars Autographs', NULL, 71),
(413, 6, '1988 Topps Baseball Autographs', NULL, 97),
(414, 6, '1988 Topps Baseball Chrome Silver Packs', NULL, 148),
(415, 6, '1988 Topps Baseball Relics', NULL, 50),
(416, 6, '2022 Silver Slugger Award Winners', NULL, 20),
(417, 6, '2022 Silver Slugger Award Winners Autographs', NULL, 9),
(418, 6, '2023 World Baseball Classic Stars', NULL, 56),
(419, 6, '2023 World Baseball Classic Stars Autographs', NULL, 37),
(420, 6, 'All Aces', NULL, 25),
(421, 6, 'All Aces Autographs', NULL, 15),
(422, 6, 'Baseball Stars Autographs', NULL, 63),
(423, 6, 'Baseball Stars Dual Autographs', NULL, 16),
(424, 6, 'Clear', NULL, 100),
(425, 6, 'Crowning Achievements Commemorative Patch', NULL, 25),
(426, 6, 'Crowning Achievements Commemorative Patch Autographs', NULL, 12),
(427, 6, 'Cut Signatures', NULL, 50),
(428, 6, 'Father\'s Day Commemorative Team Patch', NULL, 50),
(429, 6, 'Father\'s Day Commemorative Team Patch Autographs', NULL, 38),
(430, 6, 'Favorite Sons', NULL, 20),
(431, 6, 'Favorite Sons Autographs', NULL, 12),
(432, 6, 'Heavy Lumber', NULL, 20),
(433, 6, 'Home Run Challenge Code Cards', NULL, 30),
(434, 6, 'In the Name Relics', NULL, 60),
(435, 6, 'Legends of the Game', NULL, 30),
(436, 6, 'Legends of the Game Autographs', NULL, 12),
(437, 6, 'Luke the Cardist Art Cards', NULL, 17),
(438, 6, 'Major League Materials', NULL, 53),
(439, 6, 'Major League Materials Autographs', NULL, 33),
(440, 6, 'Oversized Topps Record Breaker', NULL, 25),
(441, 6, 'Oversized Topps Record Breakers Autographs', NULL, 12),
(442, 6, 'Significant Statistics', NULL, 25),
(443, 6, 'Significant Statistics Autographs', NULL, 12),
(444, 6, 'Social Media Follow Back Redemptions', NULL, 23),
(445, 6, 'Stars of MLB', NULL, 30),
(446, 6, 'Stars of MLB Chrome', NULL, 30),
(447, 6, 'Topps Reverence Auto Patch', NULL, 57),
(448, 7, 'Base', NULL, 369),
(449, 7, '1989 Topps Baseball', NULL, 100),
(450, 7, '1989 Topps Baseball Autographs', NULL, 137),
(451, 7, '1989 Topps Baseball Chrome Silver Packs', NULL, 100),
(452, 7, '1989 Topps Baseball Chrome Silver Packs Autographs', NULL, 78),
(453, 7, '1989 Topps Baseball Foil Mega Box', NULL, 100),
(454, 7, '1989 Topps Baseball Relics', NULL, 95),
(455, 7, '2023 All-Topps Team', NULL, 12),
(456, 7, '2023 All-Topps Team Autographs', NULL, 9),
(457, 7, '2023 Greatest Hits', NULL, 31),
(458, 7, '2023 Greatest Hits Autographs', NULL, 22),
(459, 7, 'Baseball Stars Autographs', NULL, 88),
(460, 7, 'Baseball Stars Dual Autographs', NULL, 29),
(461, 7, 'Celebration of the Kid', NULL, 24),
(462, 7, 'Celebration of the Kid Autographs', NULL, 24),
(463, 7, 'City Connection Swatch Collection', NULL, 32),
(464, 7, 'Companion Cards', NULL, 25),
(465, 7, 'Cut Signatures', NULL, 46),
(466, 7, 'Grand Gamers', NULL, 26),
(467, 7, 'Grand Gamers Autographs', NULL, 14),
(468, 7, 'Heavy Lumber', NULL, 20),
(469, 7, 'Heavy Lumber Autograph Relics', NULL, 9),
(470, 7, 'Home Run Challenge Code', NULL, 30),
(471, 7, 'Home Sweet Home Stadium Medallions', NULL, 50),
(472, 7, 'Home Sweet Home Stadium Medallions Autographs', NULL, 41),
(473, 7, 'Homefield Advantage', NULL, 10),
(474, 7, 'In the Name Relics', NULL, 60),
(475, 7, 'Legendary Homefield Advantage', NULL, 5),
(476, 7, 'Major League Material', NULL, 79),
(477, 7, 'Major League Material Autographs', NULL, 41),
(478, 7, 'Oversized 2024 Topps Baseball', NULL, 25),
(479, 7, 'Postseason Performance Autograph Relics', NULL, 48),
(480, 7, 'Postseason Performance Autographs', NULL, 59),
(481, 7, 'Postseason Performance Relics', NULL, 61),
(482, 7, 'Social Media Follow Back Redemptions', NULL, 10),
(483, 7, 'Stars of MLB', NULL, 31),
(484, 7, 'Stars of MLB Chrome', NULL, 30),
(485, 7, 'Superstar Blueprint', NULL, 25),
(486, 7, 'Superstar Blueprint Autographs', NULL, 18),
(487, 7, 'Team Color Border Variations', NULL, 300),
(488, 7, 'Topps Mega Star', NULL, 20),
(489, 7, 'Topps Reverence Autograph Patch', NULL, 51),
(490, 7, 'World Champion Autographs', NULL, 11),
(491, 7, 'World Champion Relics', NULL, 7),
(492, 7, 'World Series Champion Autograph Relics', NULL, 6),
(493, 8, 'Base', NULL, 350),
(494, 8, '1989 Topps Baseball', NULL, 50),
(495, 8, '1989 Topps Baseball All-Star', NULL, 50),
(496, 8, '1989 Topps Baseball All-Star Autographs', NULL, 67),
(497, 8, '1989 Topps Baseball All-Star Mega Box Foilboard', NULL, 50),
(498, 8, '1989 Topps Baseball All-Star Relics', NULL, 53),
(499, 8, '1989 Topps Baseball Autographs', NULL, 95),
(500, 8, '1989 Topps Baseball Chrome Silver Packs', NULL, 100),
(501, 8, '1989 Topps Baseball Chrome Silver Packs Autographs', NULL, 88),
(502, 8, '1989 Topps Baseball Mega Box Foilboard', NULL, 50),
(503, 8, '1989 Topps Baseball Relics', NULL, 45),
(504, 8, '2023 Dynamic Dual Autographs', NULL, 2),
(505, 8, '2023 First Pitch', NULL, 2),
(506, 8, '2023 First Pitch Autographs', NULL, 3),
(507, 8, '2023 Let\'s Play Ball', NULL, 1),
(508, 8, '2023 Let\'s Play Ball Autographs', NULL, 1),
(509, 8, '2023 Silver Slugger Award Autographs', NULL, 14),
(510, 8, '2023 Silver Slugger Award Winners', NULL, 20),
(511, 8, '40/70', NULL, 20),
(512, 8, '40/70 Autographs', NULL, 11),
(513, 8, 'Around the Horn', NULL, 30),
(514, 8, 'Baseball Stars Autographs', NULL, 87),
(515, 8, 'Baseball Stars Dual Autographs', NULL, 68),
(516, 8, 'Baseball Stars Triple Autographs', NULL, 30),
(517, 8, 'City Connect Swatch Collection', NULL, 40),
(518, 8, 'City to City', NULL, 30),
(519, 8, 'City to City Autographs', NULL, 25),
(520, 8, 'Companion Cards', NULL, 25),
(521, 8, 'Covering the Field', NULL, 25),
(522, 8, 'Cut Signatures', NULL, 41),
(523, 8, 'Fantasy Favorites', NULL, 20),
(524, 8, 'Heavy Lumber', NULL, 20),
(525, 8, 'Heavy Lumber Autograph Relics', NULL, 9),
(526, 8, 'Home Field Advantage', NULL, 10),
(527, 8, 'Home Run Challenge Code Cards', NULL, 30),
(528, 8, 'In the Name Relics', NULL, 55),
(529, 8, 'Legendary Home Field Advantage', NULL, 5),
(530, 8, 'Major League Materials', NULL, 42),
(531, 8, 'Major League Materials Autographs', NULL, 77),
(532, 8, 'Oversized 2024 Topps Baseball', NULL, 25),
(533, 8, 'Platinum Performers', NULL, 30),
(534, 8, 'Rounding the Bases Relics', NULL, 25),
(535, 8, 'Short Print Variations', NULL, 10),
(536, 8, 'Signature Tunes Dual Autographs', NULL, 2),
(537, 8, 'Significant Statistics', NULL, 25),
(538, 8, 'Significant Statistics Autographs', NULL, 17),
(539, 8, 'Social Media Follow Back Redemptions', NULL, 22),
(540, 8, 'Stars of MLB', NULL, 30),
(541, 8, 'Stars of MLB Chrome', NULL, 30),
(542, 8, 'Topps Mega Stars', NULL, 20),
(543, 8, 'Topps Reverence Autograph Patch', NULL, 38),
(544, 8, 'Women in Baseball', NULL, 5);

CREATE TABLE `DimCard` (
  `id` int NOT NULL,
  `cardset_id` int NOT NULL,
  `cardtype_id` int NOT NULL,
  `card_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_short` tinyint(1) NOT NULL DEFAULT '0',
  `rarity` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `player_team` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `card_number` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `feature` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `variation_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DimCard`
--

INSERT INTO `DimCard` (`id`, `cardset_id`, `cardtype_id`, `card_name`, `is_short`, `rarity`, `image`, `player_name`, `player_team`, `card_number`, `feature`, `variation_id`) VALUES
(13002, 5, 9, 'Juan Soto', 0, '', '', 'Juan Soto', 'San Diego Padres', '1', '', 368),
(13003, 5, 9, 'Zach Thompson', 0, '', '', 'Zach Thompson', 'Pittsburgh Pirates', '2', '', 368),
(13004, 5, 9, 'Bryce Harper', 0, '', '', 'Bryce Harper', 'Philadelphia Phillies', '3', '', 368),
(13005, 5, 9, 'Yadier Molina', 0, '', '', 'Yadier Molina', 'St. Louis Cardinals', '4', '', 368),
(13006, 5, 9, 'Albert Pujols', 0, '', '', 'Albert Pujols', 'St. Louis Cardinals', '5', '', 368),
(13007, 5, 9, 'Paul Blackburn', 0, '', '', 'Paul Blackburn', 'Oakland Athletics', '6', '', 368),
(13008, 5, 9, 'Bobby Witt Jr.', 0, '', '', 'Bobby Witt Jr.', 'Kansas City Royals', '7', '', 368),
(13009, 5, 9, 'Sam Moll', 0, '', '', 'Sam Moll', 'Oakland Athletics', '8', '', 368),
(13010, 5, 9, 'Scott Barlow', 0, '', '', 'Scott Barlow', 'Kansas City Royals', '9', '', 368),
(13011, 5, 9, 'Trevor Story', 0, '', '', 'Trevor Story', 'Boston Red Sox', '10', '', 368),
(13012, 5, 9, 'Rafael Devers', 0, '', '', 'Rafael Devers', 'Boston Red Sox', '11', '', 368),
(13013, 5, 9, 'Jeffrey Springs', 0, '', '', 'Jeffrey Springs', 'Tampa Bay Rays', '12', '', 368),
(13014, 5, 9, 'Giovanny Gallegos', 0, '', '', 'Giovanny Gallegos', 'St. Louis Cardinals', '13', '', 368),
(13015, 5, 9, 'Brandon Drury', 0, '', '', 'Brandon Drury', 'San Diego Padres', '14', '', 368),
(13016, 5, 9, 'Michael Grove', 0, '', '', 'Michael Grove', 'Los Angeles Dodgers', '15', 'RC', 368),
(13017, 5, 9, 'Nolan Gorman', 0, '', '', 'Nolan Gorman', 'St. Louis Cardinals', '16', 'RC', 368),
(13018, 5, 9, 'Shohei Ohtani', 0, '', '', 'Shohei Ohtani', 'Los Angeles Angels', '17', '', 368),
(13019, 5, 9, 'Tanner Scott', 0, '', '', 'Tanner Scott', 'Miami Marlins', '18', '', 368),
(13020, 5, 9, 'Joey Votto', 0, '', '', 'Joey Votto', 'Cincinnati Reds', '19', '', 368),
(13021, 5, 9, 'Pete Alonso', 0, '', '', 'Pete Alonso', 'New York Mets', '20', '', 368),
(13022, 5, 9, 'Max Scherzer', 0, '', '', 'Max Scherzer', 'New York Mets', '21', '', 368),
(13023, 5, 9, 'Clayton Kershaw', 0, '', '', 'Clayton Kershaw', 'Los Angeles Dodgers', '22', '', 368),
(13024, 5, 9, 'Fernando Tatis Jr.', 0, '', '', 'Fernando Tatis Jr.', 'San Diego Padres', '23', '', 368),
(13025, 5, 9, 'Miguel Cabrera', 0, '', '', 'Miguel Cabrera', 'Detroit Tigers', '24', '', 368),
(13026, 5, 9, 'Byron Buxton', 0, '', '', 'Byron Buxton', 'Minnesota Twins', '25', '', 368),
(13027, 5, 9, 'Trent Grisham', 0, '', '', 'Trent Grisham', 'San Diego Padres', '26', '', 368),
(13028, 5, 9, 'Mike Trout', 0, '', '', 'Mike Trout', 'Los Angeles Angels', '27', '', 368),
(13029, 5, 9, 'Corey Knebel', 0, '', '', 'Corey Knebel', 'Philadelphia Phillies', '28', '', 368),
(13030, 5, 9, 'Trevor Rogers', 0, '', '', 'Trevor Rogers', 'Miami Marlins', '29', '', 368),
(13031, 5, 9, 'Kenley Jansen', 0, '', '', 'Kenley Jansen', 'Atlanta Braves', '30', '', 368),
(13032, 5, 9, 'Riley Greene', 0, '', '', 'Riley Greene', 'Detroit Tigers', '31', 'RC', 368),
(13033, 5, 9, 'Jordan Montgomery', 0, '', '', 'Jordan Montgomery', 'St. Louis Cardinals', '32', '', 368),
(13034, 5, 9, 'Kyle Farmer', 0, '', '', 'Kyle Farmer', 'Cincinnati Reds', '33', '', 368),
(13035, 5, 9, 'Zack Thompson', 0, '', '', 'Zack Thompson', 'St. Louis Cardinals', '34', 'RC', 368),
(13036, 5, 9, 'CJ Abrams', 0, '', '', 'CJ Abrams', 'Washington Nationals', '35', '- Future Stars', 368),
(13037, 5, 9, 'Brandon Lowe', 0, '', '', 'Brandon Lowe', 'Tampa Bay Rays', '36', '', 368),
(13038, 5, 9, 'Josh Smith', 0, '', '', 'Josh Smith', 'Texas Rangers', '37', 'RC', 368),
(13039, 5, 9, 'Jorge Mateo', 0, '', '', 'Jorge Mateo', 'Baltimore Orioles', '38', '', 368),
(13040, 5, 9, 'Adam Wainwright', 0, '', '', 'Adam Wainwright', 'St. Louis Cardinals', '39', '', 368),
(13041, 5, 9, 'Keegan Thompson', 0, '', '', 'Keegan Thompson', 'Chicago Cubs', '40', '', 368),
(13042, 5, 9, 'Brian Serven', 0, '', '', 'Brian Serven', 'Colorado Rockies', '41', 'RC', 368),
(13043, 5, 9, 'Franchy Cordero', 0, '', '', 'Franchy Cordero', 'Boston Red Sox', '42', '', 368),
(13044, 5, 9, 'Paul Goldschmidt / Freddie Freeman / Jeff McNeil', 0, '', '', 'Paul Goldschmidt / Freddie Freeman / Jeff McNeil', 'St. Louis Cardinals, Los Angeles Dodgers, New York Mets', '43', '- League Leaders', 368),
(13047, 5, 9, 'Jesús Sánchez', 0, '', '', 'Jesús Sánchez', 'Miami Marlins', '44', '', 368),
(13048, 5, 9, 'Gerrit Cole', 0, '', '', 'Gerrit Cole', 'New York Yankees', '45', '', 368),
(13049, 5, 9, 'Jorge Alfaro', 0, '', '', 'Jorge Alfaro', 'San Diego Padres', '46', '', 368),
(13050, 5, 9, 'Ryan Mountcastle', 0, '', '', 'Ryan Mountcastle', 'Baltimore Orioles', '47', '', 368),
(13051, 5, 9, 'Jacob deGrom', 0, '', '', 'Jacob deGrom', 'New York Mets', '48', '', 368),
(13052, 5, 9, 'Mitch Haniger', 0, '', '', 'Mitch Haniger', 'Seattle Mariners', '49', '', 368),
(13053, 5, 9, 'Mookie Betts', 0, '', '', 'Mookie Betts', 'Los Angeles Dodgers', '50', '', 368),
(13054, 5, 9, 'Chas McCormick', 0, '', '', 'Chas McCormick', 'Houston Astros', '51', '', 368),
(13055, 5, 9, 'Matthew Liberatore', 0, '', '', 'Matthew Liberatore', 'St. Louis Cardinals', '52', 'RC', 368),
(13056, 5, 9, 'Dylan Cease', 0, '', '', 'Dylan Cease', 'Chicago White Sox', '53', '', 368),
(13057, 5, 9, 'Marcus Stroman', 0, '', '', 'Marcus Stroman', 'Chicago Cubs', '54', '', 368),
(13058, 5, 9, 'Cristian Javier', 0, '', '', 'Cristian Javier', 'Houston Astros', '55', '', 368),
(13059, 5, 9, 'Jermaine Palacios', 0, '', '', 'Jermaine Palacios', 'Minnesota Twins', '56', 'RC', 368),
(13060, 5, 9, 'Ha-Seong Kim', 0, '', '', 'Ha-Seong Kim', 'San Diego Padres', '57', '', 368),
(13061, 5, 9, 'Iván Herrera', 0, '', '', 'Iván Herrera', 'St. Louis Cardinals', '58', 'RC', 368),
(13062, 5, 9, 'Eduardo Rodriguez', 0, '', '', 'Eduardo Rodriguez', 'Detroit Tigers', '59', '', 368),
(13063, 5, 9, 'Josh Rojas', 0, '', '', 'Josh Rojas', 'Arizona Diamondbacks', '60', '', 368),
(13064, 5, 9, 'Tyrone Taylor', 0, '', '', 'Tyrone Taylor', 'Milwaukee Brewers', '61', '', 368),
(13065, 5, 9, 'Aaron Judge', 0, '', '', 'Aaron Judge', 'New York Yankees', '62', '', 368),
(13066, 5, 9, 'C.J. Cron', 0, '', '', 'C.J. Cron', 'Colorado Rockies', '63', '', 368),
(13067, 5, 9, 'Josh Donaldson', 0, '', '', 'Josh Donaldson', 'New York Yankees', '64', '', 368),
(13068, 5, 9, 'Triston McKenzie', 0, '', '', 'Triston McKenzie', 'Cleveland Guardians', '65', '', 368),
(13069, 5, 9, 'Brandon Crawford', 0, '', '', 'Brandon Crawford', 'San Francisco Giants', '66', '', 368),
(13070, 5, 9, 'Travis Swaggerty', 0, '', '', 'Travis Swaggerty', 'Pittsburgh Pirates', '67', 'RC', 368),
(13071, 5, 9, 'William Contreras', 0, '', '', 'William Contreras', 'Atlanta Braves', '68', '', 368),
(13072, 5, 9, 'Caleb Kilian', 0, '', '', 'Caleb Kilian', 'Chicago Cubs', '69', 'RC', 368),
(13073, 5, 9, 'Darin Ruf', 0, '', '', 'Darin Ruf', 'New York Mets', '70', '', 368),
(13074, 5, 9, 'Merrill Kelly', 0, '', '', 'Merrill Kelly', 'Arizona Diamondbacks', '71', '', 368),
(13075, 5, 9, 'Jon Berti', 0, '', '', 'Jon Berti', 'Miami Marlins', '72', '', 368),
(13076, 5, 9, 'Jon Gray', 0, '', '', 'Jon Gray', 'Texas Rangers', '73', '', 368),
(13077, 5, 9, 'Tarik Skubal', 0, '', '', 'Tarik Skubal', 'Detroit Tigers', '74', '', 368),
(13078, 5, 9, 'JT Brubaker', 0, '', '', 'JT Brubaker', 'Pittsburgh Pirates', '75', '', 368),
(13079, 5, 9, 'Josh Winckowski', 0, '', '', 'Josh Winckowski', 'Boston Red Sox', '76', 'RC', 368),
(13080, 5, 9, 'Kyle Bradish', 0, '', '', 'Kyle Bradish', 'Baltimore Orioles', '77', '', 368),
(13081, 5, 9, 'Sonny Gray', 0, '', '', 'Sonny Gray', 'Minnesota Twins', '78', '', 368),
(13082, 5, 9, 'Tyler O\'Neill', 0, '', '', 'Tyler O\'Neill', 'St. Louis Cardinals', '79', '', 368),
(13083, 5, 9, 'Tanner Rainey', 0, '', '', 'Tanner Rainey', 'Washington Nationals', '80', '', 368),
(13084, 5, 9, 'Ozzie Albies', 0, '', '', 'Ozzie Albies', 'Atlanta Braves', '81', '', 368),
(13085, 5, 9, 'Framber Valdez / Justin Verlander / Alek Manoah', 0, '', '', 'Framber Valdez / Justin Verlander / Alek Manoah', 'Houston Astros, Toronto Blue Jays', '82', '- League Leaders', 368),
(13087, 5, 9, 'Tylor Megill', 0, '', '', 'Tylor Megill', 'New York Mets', '83', '', 368),
(13088, 5, 9, 'Toronto Blue Jays', 0, '', '', 'Toronto Blue Jays', 'Toronto Blue Jays', '84', '- Team Card', 368),
(13089, 5, 9, 'Max Stassi', 0, '', '', 'Max Stassi', 'Los Angeles Angels', '85', '', 368),
(13090, 5, 9, 'Gregory Soto', 0, '', '', 'Gregory Soto', 'Detroit Tigers', '86', '', 368),
(13091, 5, 9, 'Ethan Small', 0, '', '', 'Ethan Small', 'Milwaukee Brewers', '87', 'RC', 368),
(13092, 5, 9, 'Luis Robert', 0, '', '', 'Luis Robert', 'Chicago White Sox', '88', '', 368),
(13093, 5, 9, 'Brett Baty', 0, '', '', 'Brett Baty', 'New York Mets', '89', 'RC', 368),
(13094, 5, 9, 'Korey Lee', 0, '', '', 'Korey Lee', 'Houston Astros', '90', 'RC', 368),
(13095, 5, 9, 'Josh Naylor', 0, '', '', 'Josh Naylor', 'Cleveland Guardians', '91', '', 368),
(13096, 5, 9, 'Triston Casas', 0, '', '', 'Triston Casas', 'Boston Red Sox', '92', 'RC', 368),
(13097, 5, 9, 'Los Angeles Angels', 0, '', '', 'Los Angeles Angels', 'Los Angeles Angels', '93', '- Team Card', 368),
(13098, 5, 9, 'Oswald Peraza', 0, '', '', 'Oswald Peraza', 'New York Yankees', '94', 'RC', 368),
(13099, 5, 9, 'Jonah Bride', 0, '', '', 'Jonah Bride', 'Oakland Athletics', '95', 'RC', 368),
(13100, 5, 9, 'Kyle Gibson', 0, '', '', 'Kyle Gibson', 'Philadelphia Phillies', '96', '', 368),
(13101, 5, 9, 'Brandon Hughes', 0, '', '', 'Brandon Hughes', 'Chicago Cubs', '97', 'RC', 368),
(13102, 5, 9, 'Mike Yastrzemski', 0, '', '', 'Mike Yastrzemski', 'San Francisco Giants', '98', '', 368),
(13103, 5, 9, 'Antonio Senzatela', 0, '', '', 'Antonio Senzatela', 'Colorado Rockies', '99', '', 368),
(13104, 5, 9, 'Paul Goldschmidt', 0, '', '', 'Paul Goldschmidt', 'St. Louis Cardinals', '100', '', 368),
(13105, 5, 9, 'Tyler Mahle', 0, '', '', 'Tyler Mahle', 'Minnesota Twins', '101', '', 368),
(13106, 5, 9, 'Salvador Perez', 0, '', '', 'Salvador Perez', 'Kansas City Royals', '102', '', 368),
(13107, 5, 9, 'Taylor Ward', 0, '', '', 'Taylor Ward', 'Los Angeles Angels', '103', '', 368),
(13108, 5, 9, 'Keston Hiura', 0, '', '', 'Keston Hiura', 'Milwaukee Brewers', '104', '', 368),
(13109, 5, 9, 'Seth Beer', 0, '', '', 'Seth Beer', 'Arizona Diamondbacks', '105', '', 368),
(13110, 5, 9, 'Willy Adames', 0, '', '', 'Willy Adames', 'Milwaukee Brewers', '106', '', 368),
(13111, 5, 9, 'Sandy Alcantara', 0, '', '', 'Sandy Alcantara', 'Miami Marlins', '107', '', 368),
(13112, 5, 9, 'Alex Cobb', 0, '', '', 'Alex Cobb', 'San Francisco Giants', '108', '', 368),
(13113, 5, 9, 'Eric Lauer', 0, '', '', 'Eric Lauer', 'Milwaukee Brewers', '109', '', 368),
(13114, 5, 9, 'Randal Grichuk', 0, '', '', 'Randal Grichuk', 'Colorado Rockies', '110', '', 368),
(13115, 5, 9, 'Hunter Brown', 0, '', '', 'Hunter Brown', 'Houston Astros', '111', 'RC', 368),
(13116, 5, 9, 'Baltimore Orioles', 0, '', '', 'Baltimore Orioles', 'Baltimore Orioles', '112', '- Team Card', 368),
(13117, 5, 9, 'Mookie Betts', 0, '', '', 'Mookie Betts', 'Los Angeles Dodgers', '113', '- Combo Card', 368),
(13118, 5, 9, 'Ian Anderson', 0, '', '', 'Ian Anderson', 'Atlanta Braves', '114', '', 368),
(13119, 5, 9, 'Raisel Iglesias', 0, '', '', 'Raisel Iglesias', 'Atlanta Braves', '115', '', 368),
(13120, 5, 9, 'Steven Kwan', 0, '', '', 'Steven Kwan', 'Cleveland Guardians', '116', '', 368),
(13121, 5, 9, 'Emmanuel Clase', 0, '', '', 'Emmanuel Clase', 'Cleveland Guardians', '117', '', 368),
(13122, 5, 9, 'Eduardo Escobar', 0, '', '', 'Eduardo Escobar', 'New York Mets', '118', '', 368),
(13123, 5, 9, 'Oscar Gonzalez', 0, '', '', 'Oscar Gonzalez', 'Cleveland Guardians', '119', 'RC', 368),
(13124, 5, 9, 'Patrick Wisdom', 0, '', '', 'Patrick Wisdom', 'Chicago Cubs', '120', '', 368),
(13125, 5, 9, 'Luis García', 0, '', '', 'Luis García', 'Houston Astros', '121', '', 368),
(13126, 5, 9, 'Yonathan Daza', 0, '', '', 'Yonathan Daza', 'Colorado Rockies', '122', '', 368),
(13127, 5, 9, 'Zach Davies', 0, '', '', 'Zach Davies', 'Arizona Diamondbacks', '123', '', 368),
(13128, 5, 9, 'Nathaniel Lowe', 0, '', '', 'Nathaniel Lowe', 'Texas Rangers', '124', '', 368),
(13129, 5, 9, 'Marcell Ozuna', 0, '', '', 'Marcell Ozuna', 'Atlanta Braves', '125', '', 368),
(13130, 5, 9, 'Harold Castro', 0, '', '', 'Harold Castro', 'Detroit Tigers', '126', '', 368),
(13131, 5, 9, 'Shea Langeliers', 0, '', '', 'Shea Langeliers', 'Oakland Athletics', '127', 'RC', 368),
(13132, 5, 9, 'Alec Bohm', 0, '', '', 'Alec Bohm', 'Philadelphia Phillies', '128', '', 368),
(13133, 5, 9, 'Nolan Jones', 0, '', '', 'Nolan Jones', 'Cleveland Guardians', '129', 'RC', 368),
(13134, 5, 9, 'Keibert Ruiz', 0, '', '', 'Keibert Ruiz', 'Washington Nationals', '130', '', 368),
(13135, 5, 9, 'Cody Bellinger', 0, '', '', 'Cody Bellinger', 'Los Angeles Dodgers', '131', '', 368),
(13136, 5, 9, 'Gavin Sheets', 0, '', '', 'Gavin Sheets', 'Chicago White Sox', '132', '', 368),
(13137, 5, 9, 'Roberto Pérez', 0, '', '', 'Roberto Pérez', 'Pittsburgh Pirates', '133', '', 368),
(13138, 5, 9, 'Kansas City Royals', 0, '', '', 'Kansas City Royals', 'Kansas City Royals', '134', '- Team Card', 368),
(13139, 5, 9, 'Buddy Kennedy', 0, '', '', 'Buddy Kennedy', 'Arizona Diamondbacks', '135', 'RC', 368),
(13140, 5, 9, 'Dylan Bundy', 0, '', '', 'Dylan Bundy', 'Minnesota Twins', '136', '', 368),
(13141, 5, 9, 'Kyle Hendricks', 0, '', '', 'Kyle Hendricks', 'Chicago Cubs', '137', '', 368),
(13142, 5, 9, 'Marcus Wilson', 0, '', '', 'Marcus Wilson', 'Seattle Mariners', '138', 'RC', 368),
(13143, 5, 9, 'Joe Barlow', 0, '', '', 'Joe Barlow', 'Texas Rangers', '139', '', 368),
(13144, 5, 9, 'Lenyn Sosa', 0, '', '', 'Lenyn Sosa', 'Chicago White Sox', '140', 'RC', 368),
(13145, 5, 9, 'Jonah Heim', 0, '', '', 'Jonah Heim', 'Texas Rangers', '141', '', 368),
(13146, 5, 9, 'Lucas Giolito', 0, '', '', 'Lucas Giolito', 'Chicago White Sox', '142', '', 368),
(13147, 5, 9, 'Nestor Cortes', 0, '', '', 'Nestor Cortes', 'New York Yankees', '143', '', 368),
(13148, 5, 9, 'Marco Gonzales', 0, '', '', 'Marco Gonzales', 'Seattle Mariners', '144', '', 368),
(13149, 5, 9, 'Noah Syndergaard', 0, '', '', 'Noah Syndergaard', 'Philadelphia Phillies', '145', '', 368),
(13150, 5, 9, 'Alex Verdugo', 0, '', '', 'Alex Verdugo', 'Boston Red Sox', '146', '', 368),
(13151, 5, 9, 'Daniel Vogelbach', 0, '', '', 'Daniel Vogelbach', 'New York Mets', '147', '', 368),
(13152, 5, 9, 'Seth Brown', 0, '', '', 'Seth Brown', 'Oakland Athletics', '148', '', 368),
(13153, 5, 9, 'Josiah Gray', 0, '', '', 'Josiah Gray', 'Washington Nationals', '149', '- Future Stars', 368),
(13154, 5, 9, 'Ronald Acuña Jr.', 0, '', '', 'Ronald Acuña Jr.', 'Atlanta Braves', '150', '', 368),
(13155, 5, 9, 'Tyler Wells', 0, '', '', 'Tyler Wells', 'Baltimore Orioles', '151', '', 368),
(13156, 5, 9, 'Nick Pivetta', 0, '', '', 'Nick Pivetta', 'Boston Red Sox', '152', '', 368),
(13157, 5, 9, 'Kevin Gausman', 0, '', '', 'Kevin Gausman', 'Toronto Blue Jays', '153', '', 368),
(13158, 5, 9, 'Jonathan Aranda', 0, '', '', 'Jonathan Aranda', 'Tampa Bay Rays', '154', 'RC', 368),
(13159, 5, 9, 'Hunter Greene', 0, '', '', 'Hunter Greene', 'Cincinnati Reds', '155', '- Future Stars', 368),
(13160, 5, 9, 'Kyle Stowers', 0, '', '', 'Kyle Stowers', 'Baltimore Orioles', '156', 'RC', 368),
(13161, 5, 9, 'Christian Vázquez', 0, '', '', 'Christian Vázquez', 'Houston Astros', '157', '', 368),
(13162, 5, 9, 'Kris Bryant', 0, '', '', 'Kris Bryant', 'Colorado Rockies', '158', '', 368),
(13163, 5, 9, 'A.J. Minter', 0, '', '', 'A.J. Minter', 'Atlanta Braves', '159', '', 368),
(13164, 5, 9, 'Cal Raleigh', 0, '', '', 'Cal Raleigh', 'Seattle Mariners', '160', '- Future Stars', 368),
(13165, 5, 9, 'Carlos Carrasco', 0, '', '', 'Carlos Carrasco', 'New York Mets', '161', '', 368),
(13166, 5, 9, 'Isiah Kiner-Falefa', 0, '', '', 'Isiah Kiner-Falefa', 'New York Yankees', '162', '', 368),
(13167, 5, 9, 'Miguel Vargas', 0, '', '', 'Miguel Vargas', 'Los Angeles Dodgers', '163', 'RC', 368),
(13168, 5, 9, 'Dany Jiménez', 0, '', '', 'Dany Jiménez', 'Oakland Athletics', '164', '', 368),
(13169, 5, 9, 'Jeter Downs', 0, '', '', 'Jeter Downs', 'Boston Red Sox', '165', 'RC', 368),
(13170, 5, 9, 'Tyler Stephenson', 0, '', '', 'Tyler Stephenson', 'Cincinnati Reds', '166', '', 368),
(13171, 5, 9, 'Michael Massey', 0, '', '', 'Michael Massey', 'Kansas City Royals', '167', 'RC', 368),
(13172, 5, 9, 'Atlanta Braves', 0, '', '', 'Atlanta Braves', 'Atlanta Braves', '168', '- Team Card', 368),
(13173, 5, 9, 'Gabriel Moreno', 0, '', '', 'Gabriel Moreno', 'Toronto Blue Jays', '169', 'RC', 368),
(13174, 5, 9, 'Michael Chavis', 0, '', '', 'Michael Chavis', 'Pittsburgh Pirates', '170', '', 368),
(13175, 5, 9, 'Mychal Givens', 0, '', '', 'Mychal Givens', 'New York Mets', '171', '', 368),
(13176, 5, 9, 'Jazz Chisholm Jr.', 0, '', '', 'Jazz Chisholm Jr.', 'Miami Marlins', '172', '', 368),
(13177, 5, 9, 'San Francisco Giants', 0, '', '', 'San Francisco Giants', 'San Francisco Giants', '173', '- Team Card', 368),
(13178, 5, 9, 'Julio Rodríguez', 0, '', '', 'Julio Rodríguez', 'Seattle Mariners', '174', '- Combo Card', 368),
(13179, 5, 9, 'Liam Hendriks', 0, '', '', 'Liam Hendriks', 'Chicago White Sox', '175', '', 368),
(13180, 5, 9, 'Kody Clemens', 0, '', '', 'Kody Clemens', 'Detroit Tigers', '176', 'RC', 368),
(13181, 5, 9, 'Kendall Graveman', 0, '', '', 'Kendall Graveman', 'Chicago White Sox', '177', '', 368),
(13182, 5, 9, 'Austin Riley, Kyle Schwarber, Pete Alonso', 0, '', '', 'Austin Riley, Kyle Schwarber, Pete Alonso', 'Atlanta Braves, Philadelphia Phillies, New York Mets', '178', '- League Leaders', 368),
(13185, 5, 9, 'Carlos Rodón', 0, '', '', 'Carlos Rodón', 'San Francisco Giants', '179', '', 368),
(13186, 5, 9, 'Dominic Leone', 0, '', '', 'Dominic Leone', 'San Francisco Giants', '180', '', 368),
(13187, 5, 9, 'Yordan Alvarez', 0, '', '', 'Yordan Alvarez', 'Houston Astros', '181', '', 368),
(13188, 5, 9, 'Nick Pratto', 0, '', '', 'Nick Pratto', 'Kansas City Royals', '182', 'RC', 368),
(13189, 5, 9, 'Seiya Suzuki', 0, '', '', 'Seiya Suzuki', 'Chicago Cubs', '183', '', 368),
(13190, 5, 9, 'Beau Brieske', 0, '', '', 'Beau Brieske', 'Detroit Tigers', '184', '', 368),
(13191, 5, 9, 'Brayan Bello', 0, '', '', 'Brayan Bello', 'Boston Red Sox', '185', 'RC', 368),
(13192, 5, 9, 'Teoscar Hernández', 0, '', '', 'Teoscar Hernández', 'Toronto Blue Jays', '186', '', 368),
(13193, 5, 9, 'Seth Lugo', 0, '', '', 'Seth Lugo', 'New York Mets', '187', '', 368),
(13194, 5, 9, 'Davis Martin', 0, '', '', 'Davis Martin', 'Chicago White Sox', '188', 'RC', 368),
(13195, 5, 9, 'Brad Keller', 0, '', '', 'Brad Keller', 'Kansas City Royals', '189', '', 368),
(13196, 5, 9, 'Pete Alonso', 0, '', '', 'Pete Alonso', 'New York Mets', '190', '- Combo Card', 368),
(13197, 5, 9, 'Caleb Smith', 0, '', '', 'Caleb Smith', 'Arizona Diamondbacks', '191', '', 368),
(13198, 5, 9, 'Christian Yelich', 0, '', '', 'Christian Yelich', 'Milwaukee Brewers', '192', '', 368),
(13199, 5, 9, 'Luis García', 0, '', '', 'Luis García', 'Washington Nationals', '193', '', 368),
(13200, 5, 9, 'Josh Staumont', 0, '', '', 'Josh Staumont', 'Kansas City Royals', '194', '', 368),
(13201, 5, 9, 'George Kirby', 0, '', '', 'George Kirby', 'Seattle Mariners', '195', '- Future Stars', 368),
(13202, 5, 9, 'Jordan Romano', 0, '', '', 'Jordan Romano', 'Toronto Blue Jays', '196', '', 368),
(13203, 5, 9, 'Andrew Benintendi', 0, '', '', 'Andrew Benintendi', 'New York Yankees', '197', '', 368),
(13204, 5, 9, 'Vladimir Gutierrez', 0, '', '', 'Vladimir Gutierrez', 'Cincinnati Reds', '198', '', 368),
(13205, 5, 9, 'Starling Marte', 0, '', '', 'Starling Marte', 'New York Mets', '199', '', 368),
(13206, 5, 9, 'Freddie Freeman', 0, '', '', 'Freddie Freeman', 'Los Angeles Dodgers', '200', '', 368),
(13207, 5, 9, 'Trevor Larnach', 0, '', '', 'Trevor Larnach', 'Minnesota Twins', '201', '', 368),
(13208, 5, 9, 'Tony Gonsolin', 0, '', '', 'Tony Gonsolin', 'Los Angeles Dodgers', '202', '', 368),
(13209, 5, 9, 'Gary Sánchez', 0, '', '', 'Gary Sánchez', 'Minnesota Twins', '203', '', 368),
(13210, 5, 9, 'Manuel Margot', 0, '', '', 'Manuel Margot', 'Tampa Bay Rays', '204', '', 368),
(13211, 5, 9, 'JJ Bleday', 0, '', '', 'JJ Bleday', 'Miami Marlins', '205', 'RC', 368),
(13212, 5, 9, 'Gunnar Henderson', 0, '', '', 'Gunnar Henderson', 'Baltimore Orioles', '206', 'RC', 368),
(13213, 5, 9, 'Paul Sewald', 0, '', '', 'Paul Sewald', 'Seattle Mariners', '207', '', 368),
(13214, 5, 9, 'Blake Snell', 0, '', '', 'Blake Snell', 'San Diego Padres', '208', '', 368),
(13215, 5, 9, 'Darick Hall', 0, '', '', 'Darick Hall', 'Philadelphia Phillies', '209', 'RC', 368),
(13216, 5, 9, 'Riley Greene', 0, '', '', 'Riley Greene', 'Detroit Tigers', '210', '- Combo Card', 368),
(13217, 5, 9, 'Max Fried / Sandy Alcantara / Julio Urías', 0, '', '', 'Max Fried / Sandy Alcantara / Julio Urías', 'Atlanta Braves, Miami Marlins, Los Angeles Dodgers', '211', '- League Leaders', 368),
(13220, 5, 9, 'Jordan Lyles', 0, '', '', 'Jordan Lyles', 'Baltimore Orioles', '212', '', 368),
(13221, 5, 9, 'Owen Miller', 0, '', '', 'Owen Miller', 'Cleveland Guardians', '213', '', 368),
(13222, 5, 9, 'Graham Ashcraft', 0, '', '', 'Graham Ashcraft', 'Cincinnati Reds', '214', 'RC', 368),
(13223, 5, 9, 'Wander Franco', 0, '', '', 'Wander Franco', 'Tampa Bay Rays', '215', '- Future Stars', 368),
(13224, 5, 9, 'Vladimir Guerrero Jr.', 0, '', '', 'Vladimir Guerrero Jr.', 'Toronto Blue Jays', '216', '- Combo Card', 368),
(13225, 5, 9, 'Luis Arraez', 0, '', '', 'Luis Arraez', 'Minnesota Twins', '217', '', 368),
(13226, 5, 9, 'Jhoan Duran', 0, '', '', 'Jhoan Duran', 'Minnesota Twins', '218', '', 368),
(13227, 5, 9, 'Los Angeles Dodgers', 0, '', '', 'Los Angeles Dodgers', 'Los Angeles Dodgers', '219', '- Team Card', 368),
(13228, 5, 9, 'Chicago Cubs', 0, '', '', 'Chicago Cubs', 'Chicago Cubs', '220', '- Team Card', 368),
(13229, 5, 9, 'Rhys Hoskins', 0, '', '', 'Rhys Hoskins', 'Philadelphia Phillies', '221', '', 368),
(13230, 5, 9, 'Jose Altuve', 0, '', '', 'Jose Altuve', 'Houston Astros', '222', '', 368),
(13231, 5, 9, 'Eli Morgan', 0, '', '', 'Eli Morgan', 'Cleveland Guardians', '223', '', 368),
(13232, 5, 9, 'Jake Cronenworth', 0, '', '', 'Jake Cronenworth', 'San Diego Padres', '224', '', 368),
(13233, 5, 9, 'Corbin Burnes', 0, '', '', 'Corbin Burnes', 'Milwaukee Brewers', '225', '', 368),
(13234, 5, 9, 'Michael Harris II', 0, '', '', 'Michael Harris II', 'Atlanta Braves', '226', 'RC', 368),
(13235, 5, 9, 'Yandy Díaz', 0, '', '', 'Yandy Díaz', 'Tampa Bay Rays', '227', '', 368),
(13236, 5, 9, 'Ryan Pressly', 0, '', '', 'Ryan Pressly', 'Houston Astros', '228', '', 368),
(13237, 5, 9, 'Ryan Helsley', 0, '', '', 'Ryan Helsley', 'St. Louis Cardinals', '229', '', 368),
(13238, 5, 9, 'Albert Almora', 0, '', '', 'Albert Almora', 'Cincinnati Reds', '230', '', 368),
(13239, 5, 9, 'Rony García', 0, '', '', 'Rony García', 'Detroit Tigers', '231', '', 368),
(13240, 5, 9, 'Ian Happ', 0, '', '', 'Ian Happ', 'Chicago Cubs', '232', '', 368),
(13241, 5, 9, 'Taylor Rogers', 0, '', '', 'Taylor Rogers', 'Milwaukee Brewers', '233', '', 368),
(13242, 5, 9, 'St. Louis Cardinals', 0, '', '', 'St. Louis Cardinals', 'St. Louis Cardinals', '234', '- Team Card', 368),
(13243, 5, 9, 'Robbie Ray', 0, '', '', 'Robbie Ray', 'Seattle Mariners', '235', '', 368),
(13244, 5, 9, 'Shane McClanahan', 0, '', '', 'Shane McClanahan', 'Tampa Bay Rays', '236', '', 368),
(13245, 5, 9, 'Brandon Marsh', 0, '', '', 'Brandon Marsh', 'Philadelphia Phillies', '237', '- Future Stars', 368),
(13246, 5, 9, 'Liover Peguero', 0, '', '', 'Liover Peguero', 'Pittsburgh Pirates', '238', 'RC', 368),
(13247, 5, 9, 'Ketel Marte', 0, '', '', 'Ketel Marte', 'Arizona Diamondbacks', '239', '', 368),
(13248, 5, 9, 'Paul Goldschmidt / Pete Alonso / Francisco Lindor', 0, '', '', 'Paul Goldschmidt / Pete Alonso / Francisco Lindor', 'St. Louis Cardinals, New York Mets', '240', '- League Leaders', 368),
(13250, 5, 9, 'Kyle Tucker / José Ramírez / Aaron Judge', 0, '', '', 'Kyle Tucker / José Ramírez / Aaron Judge', 'Houston Astros, Cleveland Guardians, New York Yankees', '241', '- League Leaders', 368),
(13253, 5, 9, 'Jarren Duran', 0, '', '', 'Jarren Duran', 'Boston Red Sox', '242', '- Future Stars', 368),
(13254, 5, 9, 'Evan Lee', 0, '', '', 'Evan Lee', 'Washington Nationals', '243', 'RC', 368),
(13255, 5, 9, 'César Hernández', 0, '', '', 'César Hernández', 'Washington Nationals', '244', '', 368),
(13256, 5, 9, 'Aaron Judge', 0, '', '', 'Aaron Judge', 'New York Yankees', '245', '- Combo Card', 368),
(13257, 5, 9, 'Aaron Judge / Mike Trout / Yordan Alvarez', 0, '', '', 'Aaron Judge / Mike Trout / Yordan Alvarez', 'New York Yankees, Los Angeles Angels, Houston Astros', '246', '- League Leaders', 368),
(13260, 5, 9, 'Gavin Lux', 0, '', '', 'Gavin Lux', 'Los Angeles Dodgers', '247', '', 368),
(13261, 5, 9, 'Rhys Hoskins', 0, '', '', 'Rhys Hoskins', 'Philadelphia Phillies', '248', '- Combo Card', 368),
(13262, 5, 9, 'Frank Schwindel', 0, '', '', 'Frank Schwindel', 'Chicago Cubs', '249', '', 368),
(13263, 5, 9, 'Adley Rutschman', 0, '', '', 'Adley Rutschman', 'Baltimore Orioles', '250', '(RC)', 368),
(13264, 5, 9, 'Max Castillo', 0, '', '', 'Max Castillo', 'Kansas City Royals', '251', 'RC', 368),
(13265, 5, 9, 'Austin Meadows', 0, '', '', 'Austin Meadows', 'Detroit Tigers', '252', '', 368),
(13266, 5, 9, 'Max Kepler', 0, '', '', 'Max Kepler', 'Minnesota Twins', '253', '', 368),
(13267, 5, 9, 'Jimmy Herget', 0, '', '', 'Jimmy Herget', 'Los Angeles Angels', '254', '', 368),
(13268, 5, 9, 'Cal Quantrill', 0, '', '', 'Cal Quantrill', 'Cleveland Guardians', '255', '', 368),
(13269, 5, 9, 'José Ramírez', 0, '', '', 'José Ramírez', 'Cleveland Guardians', '256', '', 368),
(13270, 5, 9, 'Yadiel Hernandez', 0, '', '', 'Yadiel Hernandez', 'Washington Nationals', '257', '', 368),
(13271, 5, 9, 'Erick Fedde', 0, '', '', 'Erick Fedde', 'Washington Nationals', '258', '', 368),
(13272, 5, 9, 'Mark Appel', 0, '', '', 'Mark Appel', 'Philadelphia Phillies', '259', 'RC', 368),
(13273, 5, 9, 'Matt Chapman', 0, '', '', 'Matt Chapman', 'Toronto Blue Jays', '260', '', 368),
(13274, 5, 9, 'Martin Perez', 0, '', '', 'Martin Perez', 'Texas Rangers', '261', '', 368),
(13275, 5, 9, 'Camilo Doval', 0, '', '', 'Camilo Doval', 'San Francisco Giants', '262', '', 368),
(13276, 5, 9, 'Arizona Diamondbacks', 0, '', '', 'Arizona Diamondbacks', 'Arizona Diamondbacks', '263', '- Team Card', 368),
(13277, 5, 9, 'Steele Walker', 0, '', '', 'Steele Walker', 'San Francisco Giants', '264', 'RC', 368),
(13278, 5, 9, 'Anthony Santander', 0, '', '', 'Anthony Santander', 'Baltimore Orioles', '265', '', 368),
(13279, 5, 9, 'Tommy Pham', 0, '', '', 'Tommy Pham', 'Boston Red Sox', '266', '', 368),
(13280, 5, 9, 'Dean Kremer', 0, '', '', 'Dean Kremer', 'Baltimore Orioles', '267', '', 368),
(13281, 5, 9, 'Yasmani Grandal', 0, '', '', 'Yasmani Grandal', 'Chicago White Sox', '268', '', 368),
(13282, 5, 9, 'Steven Matz', 0, '', '', 'Steven Matz', 'St. Louis Cardinals', '269', '', 368),
(13283, 5, 9, 'Yusei Kikuchi', 0, '', '', 'Yusei Kikuchi', 'Toronto Blue Jays', '270', '', 368),
(13284, 5, 9, 'Cleveland Guardians', 0, '', '', 'Cleveland Guardians', 'Cleveland Guardians', '271', '- Team Card', 368),
(13285, 5, 9, 'Kevin Kiermaier', 0, '', '', 'Kevin Kiermaier', 'Tampa Bay Rays', '272', '', 368),
(13286, 5, 9, 'Boston Red Sox', 0, '', '', 'Boston Red Sox', 'Boston Red Sox', '273', '- Team Card', 368),
(13287, 5, 9, 'Matt Duffy', 0, '', '', 'Matt Duffy', 'Los Angeles Angels', '274', '', 368),
(13288, 5, 9, 'Vaughn Grissom', 0, '', '', 'Vaughn Grissom', 'Atlanta Braves', '275', 'RC', 368),
(13289, 5, 9, 'David MacKinnon', 0, '', '', 'David MacKinnon', 'Oakland Athletics', '276', 'RC', 368),
(13290, 5, 9, 'David Villar', 0, '', '', 'David Villar', 'San Francisco Giants', '277', 'RC', 368),
(13291, 5, 9, 'Aaron Nola', 0, '', '', 'Aaron Nola', 'Philadelphia Phillies', '278', '', 368),
(13292, 5, 9, 'Yu Darvish', 0, '', '', 'Yu Darvish', 'San Diego Padres', '279', '', 368),
(13293, 5, 9, 'Julio Urías', 0, '', '', 'Julio Urías', 'Los Angeles Dodgers', '280', '', 368),
(13294, 5, 9, 'Aaron Ashby', 0, '', '', 'Aaron Ashby', 'Milwaukee Brewers', '281', '', 368),
(13295, 5, 9, 'Tim Anderson', 0, '', '', 'Tim Anderson', 'Chicago White Sox', '282', '', 368),
(13296, 5, 9, 'Matt Strahm', 0, '', '', 'Matt Strahm', 'Boston Red Sox', '283', '', 368),
(13297, 5, 9, 'Yu Darvish / Julio Urías / Kyle Wright', 0, '', '', 'Yu Darvish / Julio Urías / Kyle Wright', 'San Diego Padres, Los Angeles Dodgers, Atlanta Braves', '284', '- League Leaders', 368),
(13300, 5, 9, 'Oneil Cruz', 0, '', '', 'Oneil Cruz', 'Pittsburgh Pirates', '285', '- Future Stars', 368),
(13301, 5, 9, 'Ezequiel Duran', 0, '', '', 'Ezequiel Duran', 'Texas Rangers', '286', 'RC', 368),
(13302, 5, 9, 'Brendan Rodgers', 0, '', '', 'Brendan Rodgers', 'Colorado Rockies', '287', '', 368),
(13303, 5, 9, 'Jack Suwinski', 0, '', '', 'Jack Suwinski', 'Pittsburgh Pirates', '288', '', 368),
(13304, 5, 9, 'Luis Arraez / Aaron Judge / Xander Bogaerts', 0, '', '', 'Luis Arraez / Aaron Judge / Xander Bogaerts', 'Minnesota Twins, New York Yankees, Boston Red Sox', '289', '- League Leaders', 368),
(13307, 5, 9, 'Max Fried', 0, '', '', 'Max Fried', 'Atlanta Braves', '290', '', 368),
(13308, 5, 9, 'New York Mets', 0, '', '', 'New York Mets', 'New York Mets', '291', '- Team Card', 368),
(13309, 5, 9, 'Texas Rangers', 0, '', '', 'Texas Rangers', 'Texas Rangers', '292', '- Team Card', 368),
(13310, 5, 9, 'J.T. Realmuto', 0, '', '', 'J.T. Realmuto', 'Philadelphia Phillies', '293', '', 368),
(13311, 5, 9, 'Tommy Edman', 0, '', '', 'Tommy Edman', 'St. Louis Cardinals', '294', '', 368),
(13312, 5, 9, 'Bryson Stott', 0, '', '', 'Bryson Stott', 'Philadelphia Phillies', '295', '- Future Stars', 368),
(13313, 5, 9, 'Cristian Pache', 0, '', '', 'Cristian Pache', 'Oakland Athletics', '296', '', 368),
(13314, 5, 9, 'Abraham Toro', 0, '', '', 'Abraham Toro', 'Seattle Mariners', '297', '', 368),
(13315, 5, 9, 'Shane Bieber', 0, '', '', 'Shane Bieber', 'Cleveland Guardians', '298', '', 368),
(13316, 5, 9, 'Gleyber Torres', 0, '', '', 'Gleyber Torres', 'New York Yankees', '299', '', 368),
(13317, 5, 9, 'Vladimir Guerrero Jr.', 0, '', '', 'Vladimir Guerrero Jr.', 'Toronto Blue Jays', '300', '', 368),
(13318, 5, 9, 'Ryan McMahon', 0, '', '', 'Ryan McMahon', 'Colorado Rockies', '301', '', 368),
(13319, 5, 9, 'Vinnie Pasquantino', 0, '', '', 'Vinnie Pasquantino', 'Kansas City Royals', '302', 'RC', 368),
(13320, 5, 9, 'Jorge Alfaro', 0, '', '', 'Jorge Alfaro', 'San Diego Padres', '303', '- Combo Card', 368),
(13321, 5, 9, 'Alex Wood', 0, '', '', 'Alex Wood', 'San Francisco Giants', '304', '', 368),
(13322, 5, 9, 'Ji-Man Choi', 0, '', '', 'Ji-Man Choi', 'Tampa Bay Rays', '305', '', 368),
(13323, 5, 9, 'Jesse Winker', 0, '', '', 'Jesse Winker', 'Seattle Mariners', '306', '', 368),
(13324, 5, 9, 'Danny Jansen', 0, '', '', 'Danny Jansen', 'Toronto Blue Jays', '307', '', 368),
(13325, 5, 9, 'Christopher Morel', 0, '', '', 'Christopher Morel', 'Chicago Cubs', '308', 'RC', 368),
(13326, 5, 9, 'Sean Murphy', 0, '', '', 'Sean Murphy', 'Oakland Athletics', '309', '', 368),
(13327, 5, 9, 'Josh Naylor', 0, '', '', 'Josh Naylor', 'Cleveland Guardians', '310', '- Combo Card', 368),
(13328, 5, 9, 'Alek Manoah / Justin Verlander / Dylan Cease', 0, '', '', 'Alek Manoah / Justin Verlander / Dylan Cease', 'Toronto Blue Jays, Houston Astros, Chicago White Sox', '311', '- League Leaders', 368),
(13331, 5, 9, 'Pavin Smith', 0, '', '', 'Pavin Smith', 'Arizona Diamondbacks', '312', '', 368),
(13332, 5, 9, 'Cal Mitchell', 0, '', '', 'Cal Mitchell', 'Pittsburgh Pirates', '313', 'RC', 368),
(13333, 5, 9, 'Ke\'Bryan Hayes', 0, '', '', 'Ke\'Bryan Hayes', 'Pittsburgh Pirates', '314', '', 368),
(13334, 5, 9, 'Corey Seager', 0, '', '', 'Corey Seager', 'Texas Rangers', '315', '', 368),
(13335, 5, 9, 'Washington Nationals', 0, '', '', 'Washington Nationals', 'Washington Nationals', '316', '- Team Card', 368),
(13336, 5, 9, 'Cedric Mullins', 0, '', '', 'Cedric Mullins', 'Baltimore Orioles', '317', '', 368),
(13337, 5, 9, 'Jerar Encarnacion', 0, '', '', 'Jerar Encarnacion', 'Miami Marlins', '318', 'RC', 368),
(13338, 5, 9, 'Brad Miller', 0, '', '', 'Brad Miller', 'Texas Rangers', '319', '', 368),
(13339, 5, 9, 'Cade Cavalli', 0, '', '', 'Cade Cavalli', 'Washington Nationals', '320', 'RC', 368),
(13340, 5, 9, 'Garrett Cooper', 0, '', '', 'Garrett Cooper', 'Miami Marlins', '321', '', 368),
(13341, 5, 9, 'Luis Urías', 0, '', '', 'Luis Urías', 'Milwaukee Brewers', '322', '', 368),
(13342, 5, 9, 'Adrian Houser', 0, '', '', 'Adrian Houser', 'Milwaukee Brewers', '323', '', 368),
(13343, 5, 9, 'Santiago Espinal', 0, '', '', 'Santiago Espinal', 'Toronto Blue Jays', '324', '', 368),
(13344, 5, 9, 'German Márquez', 0, '', '', 'German Márquez', 'Colorado Rockies', '325', '', 368),
(13345, 5, 9, 'Byron Buxton', 0, '', '', 'Byron Buxton', 'Minnesota Twins', '326', '- Combo Card', 368),
(13346, 5, 9, 'Patrick Sandoval', 0, '', '', 'Patrick Sandoval', 'Los Angeles Angels', '327', '', 368),
(13347, 5, 9, 'Brady Singer', 0, '', '', 'Brady Singer', 'Kansas City Royals', '328', '', 368),
(13348, 5, 9, 'Mark Canha', 0, '', '', 'Mark Canha', 'New York Mets', '329', '', 368),
(13349, 5, 9, 'Julio Rodríguez', 0, '', '', 'Julio Rodríguez', 'Seattle Mariners', '330', '', 368),
(13350, 5, 9, 'José Abreu', 0, '', '', 'José Abreu', 'Chicago White Sox', 'T88-1', '', 369),
(13351, 5, 9, 'Max Scherzer', 0, '', '', 'Max Scherzer', 'New York Mets', 'T88-2', '', 369),
(13352, 5, 9, 'Sandy Alcantara', 0, '', '', 'Sandy Alcantara', 'Miami Marlins', 'T88-3', '', 369),
(13353, 5, 9, 'Buster Posey', 0, '', '', 'Buster Posey', 'San Francisco Giants', 'T88-4', '', 369),
(13354, 5, 9, 'Mark McGwire', 0, '', '', 'Mark McGwire', 'Oakland Athletics', 'T88-5', '', 369),
(13355, 5, 9, 'Oneil Cruz', 0, '', '', 'Oneil Cruz', 'Pittsburgh Pirates', 'T88-6', '', 369),
(13356, 5, 9, 'George Brett', 0, '', '', 'George Brett', 'Kansas City Royals', 'T88-7', '', 369),
(13357, 5, 9, 'Alek Manoah', 0, '', '', 'Alek Manoah', 'Toronto Blue Jays', 'T88-8', '', 369),
(13358, 5, 9, 'Josh Jung', 0, '', '', 'Josh Jung', 'Texas Rangers', 'T88-9', '', 369),
(13359, 5, 9, 'José Ramírez', 0, '', '', 'José Ramírez', 'Cleveland Guardians', 'T88-10', '', 369),
(13360, 5, 9, 'Christopher Morel', 0, '', '', 'Christopher Morel', 'Chicago Cubs', 'T88-11', '', 369),
(13361, 5, 9, 'Willie Mays', 0, '', '', 'Willie Mays', 'San Francisco Giants', 'T88-12', '', 369),
(13362, 5, 9, 'Justin Verlander', 0, '', '', 'Justin Verlander', 'Houston Astros', 'T88-13', '', 369),
(13363, 5, 9, 'Gabriel Moreno', 0, '', '', 'Gabriel Moreno', 'Toronto Blue Jays', 'T88-14', '', 369),
(13364, 5, 9, 'Christian Yelich', 0, '', '', 'Christian Yelich', 'Milwaukee Brewers', 'T88-15', '', 369),
(13365, 5, 9, 'Shea Langeliers', 0, '', '', 'Shea Langeliers', 'Oakland Athletics', 'T88-16', '', 369),
(13366, 5, 9, 'Julio Urías', 0, '', '', 'Julio Urías', 'Los Angeles Dodgers', 'T88-17', '', 369),
(13367, 5, 9, 'Michael Harris II', 0, '', '', 'Michael Harris II', 'Atlanta Braves', 'T88-18', '', 369),
(13368, 5, 9, 'Fernando Tatis Jr.', 0, '', '', 'Fernando Tatis Jr.', 'San Diego Padres', 'T88-19', '', 369),
(13369, 5, 9, 'Ke\'Bryan Hayes', 0, '', '', 'Ke\'Bryan Hayes', 'Pittsburgh Pirates', 'T88-20', '', 369),
(13370, 5, 9, 'Clayton Kershaw', 0, '', '', 'Clayton Kershaw', 'Los Angeles Dodgers', 'T88-21', '', 369),
(13371, 5, 9, 'Nestor Cortes', 0, '', '', 'Nestor Cortes', 'New York Yankees', 'T88-22', '', 369),
(13372, 5, 9, 'Cal Ripken Jr.', 0, '', '', 'Cal Ripken Jr.', 'Baltimore Orioles', 'T88-23', '', 369),
(13373, 5, 9, 'Brayan Bello', 0, '', '', 'Brayan Bello', 'Boston Red Sox', 'T88-24', '', 369),
(13374, 5, 9, 'Ezequiel Duran', 0, '', '', 'Ezequiel Duran', 'Texas Rangers', 'T88-25', '', 369),
(13375, 5, 9, 'Nolan Arenado', 0, '', '', 'Nolan Arenado', 'St. Louis Cardinals', 'T88-26', '', 369),
(13376, 5, 9, 'Chipper Jones', 0, '', '', 'Chipper Jones', 'Atlanta Braves', 'T88-27', '', 369),
(13377, 5, 9, 'Will Clark', 0, '', '', 'Will Clark', 'San Francisco Giants', 'T88-28', '', 369),
(13378, 5, 9, 'Graham Ashcraft', 0, '', '', 'Graham Ashcraft', 'Cincinnati Reds', 'T88-29', '', 369),
(13379, 5, 9, 'Bo Bichette', 0, '', '', 'Bo Bichette', 'Toronto Blue Jays', 'T88-30', '', 369),
(13380, 5, 9, 'Randy Arozarena', 0, '', '', 'Randy Arozarena', 'Tampa Bay Rays', 'T88-31', '', 369),
(13381, 5, 9, 'Kris Bryant', 0, '', '', 'Kris Bryant', 'Colorado Rockies', 'T88-32', '', 369),
(13382, 5, 9, 'Salvador Perez', 0, '', '', 'Salvador Perez', 'Kansas City Royals', 'T88-33', '', 369),
(13383, 5, 9, 'Carlos Correa', 0, '', '', 'Carlos Correa', 'Minnesota Twins', 'T88-34', '', 369),
(13384, 5, 9, 'Trevor Story', 0, '', '', 'Trevor Story', 'Boston Red Sox', 'T88-35', '', 369),
(13385, 5, 9, 'Francisco Lindor', 0, '', '', 'Francisco Lindor', 'New York Mets', 'T88-36', '', 369),
(13386, 5, 9, 'Aaron Judge', 0, '', '', 'Aaron Judge', 'New York Yankees', 'T88-37', '', 369),
(13387, 5, 9, 'Corbin Burnes', 0, '', '', 'Corbin Burnes', 'Milwaukee Brewers', 'T88-38', '', 369),
(13388, 5, 9, 'Miguel Cabrera', 0, '', '', 'Miguel Cabrera', 'Detroit Tigers', 'T88-39', '', 369),
(13389, 5, 9, 'Brendan Rodgers', 0, '', '', 'Brendan Rodgers', 'Colorado Rockies', 'T88-40', '', 369),
(13390, 5, 9, 'Paul Goldschmidt', 0, '', '', 'Paul Goldschmidt', 'St. Louis Cardinals', 'T88-41', '', 369),
(13391, 5, 9, 'Triston Casas', 0, '', '', 'Triston Casas', 'Boston Red Sox', 'T88-42', '', 369),
(13392, 5, 9, 'Ichiro', 0, '', '', 'Ichiro', 'Seattle Mariners', 'T88-43', '', 369),
(13393, 5, 9, 'Jackie Robinson', 0, '', '', 'Jackie Robinson', 'Brooklyn Dodgers', 'T88-44', '', 369),
(13394, 5, 9, 'Mike Trout', 0, '', '', 'Mike Trout', 'Los Angeles Angels', 'T88-45', '', 369),
(13395, 5, 9, 'Wander Franco', 0, '', '', 'Wander Franco', 'Tampa Bay Rays', 'T88-46', '', 369),
(13396, 5, 9, 'Manny Machado', 0, '', '', 'Manny Machado', 'San Diego Padres', 'T88-47', '', 369),
(13397, 5, 9, 'Shane Bieber', 0, '', '', 'Shane Bieber', 'Cleveland Guardians', 'T88-48', '', 369),
(13398, 5, 9, 'Hunter Greene', 0, '', '', 'Hunter Greene', 'Cincinnati Reds', 'T88-49', '', 369),
(13399, 5, 9, 'Max Meyer', 0, '', '', 'Max Meyer', 'Miami Marlins', 'T88-50', '', 369),
(13400, 5, 9, 'Bo Jackson', 0, '', '', 'Bo Jackson', 'Kansas City Royals', 'T88-51', '', 369),
(13401, 5, 9, 'Bryce Harper', 0, '', '', 'Bryce Harper', 'Philadelphia Phillies', 'T88-52', '', 369),
(13402, 5, 9, 'Jeter Downs', 0, '', '', 'Jeter Downs', 'Boston Red Sox', 'T88-53', '', 369),
(13403, 5, 9, 'Jacob deGrom', 0, '', '', 'Jacob deGrom', 'New York Mets', 'T88-54', '', 369),
(13404, 5, 9, 'Barry Larkin', 0, '', '', 'Barry Larkin', 'Cincinnati Reds', 'T88-55', '', 369),
(13405, 5, 9, 'Eddie Murray', 0, '', '', 'Eddie Murray', 'Baltimore Orioles', 'T88-56', '', 369),
(13406, 5, 9, 'Greg Maddux', 0, '', '', 'Greg Maddux', 'Atlanta Braves', 'T88-57', '', 369),
(13407, 5, 9, 'Alex Bregman', 0, '', '', 'Alex Bregman', 'Houston Astros', 'T88-58', '', 369),
(13408, 5, 9, 'Freddie Freeman', 0, '', '', 'Freddie Freeman', 'Los Angeles Dodgers', 'T88-59', '', 369),
(13409, 5, 9, 'Rickey Henderson', 0, '', '', 'Rickey Henderson', 'Oakland Athletics', 'T88-60', '', 369),
(13410, 5, 9, 'Vladimir Guerrero', 0, '', '', 'Vladimir Guerrero', 'Montréal Expos', 'T88-61', '', 369),
(13411, 5, 9, 'Jeff Bagwell', 0, '', '', 'Jeff Bagwell', 'Houston Astros', 'T88-62', '', 369),
(13412, 5, 9, 'Ozzie Albies', 0, '', '', 'Ozzie Albies', 'Atlanta Braves', 'T88-63', '', 369),
(13413, 5, 9, 'Julio Rodríguez', 0, '', '', 'Julio Rodríguez', 'Seattle Mariners', 'T88-64', '', 369),
(13414, 5, 9, 'Vinnie Pasquantino', 0, '', '', 'Vinnie Pasquantino', 'Kansas City Royals', 'T88-65', '', 369),
(13415, 5, 9, 'Shohei Ohtani', 0, '', '', 'Shohei Ohtani', 'Los Angeles Angels', 'T88-66', '', 369),
(13416, 5, 9, 'Rafael Devers', 0, '', '', 'Rafael Devers', 'Boston Red Sox', 'T88-67', '', 369),
(13417, 5, 9, 'Vladimir Guerrero Jr.', 0, '', '', 'Vladimir Guerrero Jr.', 'Toronto Blue Jays', 'T88-68', '', 369),
(13418, 5, 9, 'Adley Rutschman', 0, '', '', 'Adley Rutschman', 'Baltimore Orioles', 'T88-69', '', 369),
(13419, 5, 9, 'Juan Soto', 0, '', '', 'Juan Soto', 'San Diego Padres', 'T88-70', '', 369),
(13420, 5, 9, 'Javier Báez', 0, '', '', 'Javier Báez', 'Detroit Tigers', 'T88-71', '', 369),
(13421, 5, 9, 'Don Mattingly', 0, '', '', 'Don Mattingly', 'New York Yankees', 'T88-72', '', 369),
(13422, 5, 9, 'Seiya Suzuki', 0, '', '', 'Seiya Suzuki', 'Chicago Cubs', 'T88-73', '', 369),
(13423, 5, 9, 'Pete Alonso', 0, '', '', 'Pete Alonso', 'New York Mets', 'T88-74', '', 369),
(13424, 5, 9, 'Dylan Cease', 0, '', '', 'Dylan Cease', 'Chicago White Sox', 'T88-75', '', 369),
(13425, 5, 9, 'Jose Altuve', 0, '', '', 'Jose Altuve', 'Houston Astros', 'T88-76', '', 369),
(13426, 5, 9, 'Jazz Chisholm Jr.', 0, '', '', 'Jazz Chisholm Jr.', 'Miami Marlins', 'T88-77', '', 369),
(13427, 5, 9, 'Robin Yount', 0, '', '', 'Robin Yount', 'Milwaukee Brewers', 'T88-78', '', 369),
(13428, 5, 9, 'Gerrit Cole', 0, '', '', 'Gerrit Cole', 'New York Yankees', 'T88-79', '', 369),
(13429, 5, 9, 'Sonny Gray', 0, '', '', 'Sonny Gray', 'Minnesota Twins', 'T88-80', '', 369),
(13430, 5, 9, 'Ronald Acuña Jr.', 0, '', '', 'Ronald Acuña Jr.', 'Atlanta Braves', 'T88-81', '', 369),
(13431, 5, 9, 'Ken Griffey Jr.', 0, '', '', 'Ken Griffey Jr.', 'Seattle Mariners', 'T88-82', '', 369),
(13432, 5, 9, 'Corey Seager', 0, '', '', 'Corey Seager', 'Texas Rangers', 'T88-83', '', 369),
(13433, 5, 9, 'Wade Boggs', 0, '', '', 'Wade Boggs', 'Boston Red Sox', 'T88-84', '', 369),
(13434, 5, 9, 'Frank Thomas', 0, '', '', 'Frank Thomas', 'Chicago White Sox', 'T88-85', '', 369),
(13435, 5, 9, 'Nolan Ryan', 0, '', '', 'Nolan Ryan', 'Texas Rangers', 'T88-86', '', 369),
(13436, 5, 9, 'Tony Gwynn', 0, '', '', 'Tony Gwynn', 'San Diego Padres', 'T88-87', '', 369),
(13437, 5, 9, 'Mookie Betts', 0, '', '', 'Mookie Betts', 'Los Angeles Dodgers', 'T88-88', '', 369),
(13438, 5, 9, 'Luis Robert', 0, '', '', 'Luis Robert', 'Chicago White Sox', 'T88-89', '', 369),
(13439, 5, 9, 'Bobby Witt Jr.', 0, '', '', 'Bobby Witt Jr.', 'Kansas City Royals', 'T88-90', '', 369),
(13440, 5, 9, 'Joey Votto', 0, '', '', 'Joey Votto', 'Cincinnati Reds', 'T88-91', '', 369),
(13441, 5, 9, 'Ryne Sandberg', 0, '', '', 'Ryne Sandberg', 'Chicago Cubs', 'T88-92', '', 369),
(13442, 5, 9, 'Riley Greene', 0, '', '', 'Riley Greene', 'Detroit Tigers', 'T88-93', '', 369),
(13443, 5, 9, 'Mike Schmidt', 0, '', '', 'Mike Schmidt', 'Philadelphia Phillies', 'T88-94', '', 369),
(13444, 5, 9, 'Matthew Liberatore', 0, '', '', 'Matthew Liberatore', 'St. Louis Cardinals', 'T88-95', '', 369),
(13445, 5, 9, 'Brett Baty', 0, '', '', 'Brett Baty', 'New York Mets', 'T88-96', '', 369),
(13446, 5, 9, 'Nolan Gorman', 0, '', '', 'Nolan Gorman', 'St. Louis Cardinals', 'T88-97', '', 369),
(13447, 5, 9, 'Spencer Torkelson', 0, '', '', 'Spencer Torkelson', 'Detroit Tigers', 'T88-98', '', 369),
(13448, 5, 9, 'Byron Buxton', 0, '', '', 'Byron Buxton', 'Minnesota Twins', 'T88-99', '', 369),
(13449, 5, 9, 'Anthony Rizzo', 0, '', '', 'Anthony Rizzo', 'New York Yankees', 'T88-100', '', 369),
(13450, 5, 9, 'Aaron Judge', 0, '', '', 'Aaron Judge', 'New York Yankees', '88BA-AJU', '', 370),
(13451, 5, 9, 'Anthony Rizzo', 0, '', '', 'Anthony Rizzo', 'New York Yankees', '88BA-ARZ', '', 370),
(13452, 5, 9, 'Brett Baty', 0, '', '', 'Brett Baty', 'New York Mets', '88BA-BB', '', 370),
(13453, 5, 9, 'Byron Buxton', 0, '', '', 'Byron Buxton', 'Minnesota Twins', '88BA-BBU', '', 370),
(13454, 5, 9, 'Brandon Hughes', 0, '', '', 'Brandon Hughes', 'Chicago Cubs', '88BA-BH', '', 370),
(13455, 5, 9, 'Bryce Harper', 0, '', '', 'Bryce Harper', 'Philadelphia Phillies', '88BA-BHA', '', 370),
(13456, 5, 9, 'Buddy Kennedy', 0, '', '', 'Buddy Kennedy', 'Arizona Diamondbacks', '88BA-BK', '', 370),
(13457, 5, 9, 'Bligh Madris', 0, '', '', 'Bligh Madris', 'Pittsburgh Pirates', '88BA-BMA', '', 370),
(13458, 5, 9, 'Bryan Reynolds', 0, '', '', 'Bryan Reynolds', 'Pittsburgh Pirates', '88BA-BR', '', 370),
(13459, 5, 9, 'Brian Serven', 0, '', '', 'Brian Serven', 'Colorado Rockies', '88BA-BS', '', 370),
(13460, 5, 9, 'Bubba Thompson', 0, '', '', 'Bubba Thompson', 'Texas Rangers', '88BA-BUB', '', 370),
(13461, 5, 9, 'Brandon Woodruff', 0, '', '', 'Brandon Woodruff', 'Milwaukee Brewers', '88BA-BWO', '', 370),
(13462, 5, 9, 'Corbin Carroll', 0, '', '', 'Corbin Carroll', 'Arizona Diamondbacks', '88BA-CAR', '', 370),
(13463, 5, 9, 'Corbin Burnes', 0, '', '', 'Corbin Burnes', 'Milwaukee Brewers', '88BA-CBU', '', 370),
(13464, 5, 9, 'Conner Capel', 0, '', '', 'Conner Capel', 'St. Louis Cardinals', '88BA-CCA', '', 370),
(13465, 5, 9, 'Caleb Kilian', 0, '', '', 'Caleb Kilian', 'Chicago Cubs', '88BA-CK', '', 370),
(13466, 5, 9, 'Cal Mitchell', 0, '', '', 'Cal Mitchell', 'Pittsburgh Pirates', '88BA-CMI', '', 370),
(13467, 5, 9, 'Christopher Morel', 0, '', '', 'Christopher Morel', 'Chicago Cubs', '88BA-CMO', '', 370),
(13468, 5, 9, 'Canaan Smith-Njigba', 0, '', '', 'Canaan Smith-Njigba', 'Pittsburgh Pirates', '88BA-CS', '', 370),
(13469, 5, 9, 'Dave Stewart', 0, '', '', 'Dave Stewart', 'Oakland Athletics', '88BA-DAS', '', 370),
(13470, 5, 9, 'Dennis Eckersley', 0, '', '', 'Dennis Eckersley', 'Oakland Athletics', '88BA-DE', '', 370),
(13471, 5, 9, 'Darick Hall', 0, '', '', 'Darick Hall', 'Philadelphia Phillies', '88BA-DHA', '', 370),
(13472, 5, 9, 'Derek Jeter', 0, '', '', 'Derek Jeter', 'New York Yankees', '88BA-DJ', '', 370),
(13473, 5, 9, 'Don Mattingly', 0, '', '', 'Don Mattingly', 'New York Yankees', '88BA-DMA', '', 370),
(13474, 5, 9, 'David MacKinnon', 0, '', '', 'David MacKinnon', 'Los Angeles Angels', '88BA-DMAC', '', 370),
(13475, 5, 9, 'David Villar', 0, '', '', 'David Villar', 'San Francisco Giants', '88BA-DV', '', 370),
(13476, 5, 9, 'David Wright', 0, '', '', 'David Wright', 'New York Mets', '88BA-DWR', '', 370),
(13477, 5, 9, 'Ezequiel Duran', 0, '', '', 'Ezequiel Duran', 'Texas Rangers', '88BA-EDU', '', 370),
(13478, 5, 9, 'Edgar Martinez', 0, '', '', 'Edgar Martinez', 'Seattle Mariners', '88BA-EMA', '', 370),
(13479, 5, 9, 'Esteury Ruiz', 0, '', '', 'Esteury Ruiz', 'Milwaukee Brewers', '88BA-ERZ', '', 370),
(13480, 5, 9, 'Ethan Small', 0, '', '', 'Ethan Small', 'Milwaukee Brewers', '88BA-ES', '', 370),
(13481, 5, 9, 'Graham Ashcraft', 0, '', '', 'Graham Ashcraft', 'Cincinnati Reds', '88BA-GA', '', 370),
(13482, 5, 9, 'Gunnar Henderson', 0, '', '', 'Gunnar Henderson', 'Baltimore Orioles', '88BA-GH', '', 370),
(13483, 5, 9, 'George Kirby', 0, '', '', 'George Kirby', 'Seattle Mariners', '88BA-GK', '', 370),
(13484, 5, 9, 'George Springer', 0, '', '', 'George Springer', 'Toronto Blue Jays', '88BA-GS', '', 370),
(13485, 5, 9, 'Jonathan Aranda', 0, '', '', 'Jonathan Aranda', 'Tampa Bay Rays', '88BA-JAR', '', 370),
(13486, 5, 9, 'Jonah Bride', 0, '', '', 'Jonah Bride', 'Oakland Athletics', '88BA-JBR', '', 370),
(13487, 5, 9, 'Jose Canseco', 0, '', '', 'Jose Canseco', 'Oakland Athletics', '88BA-JCA', '', 370),
(13488, 5, 9, 'Josh Jung', 0, '', '', 'Josh Jung', 'Texas Rangers', '88BA-JJ', '', 370),
(13489, 5, 9, 'JJ Bleday', 0, '', '', 'JJ Bleday', 'Miami Marlins', '88BA-JJB', '', 370),
(13490, 5, 9, 'John Kruk', 0, '', '', 'John Kruk', 'Philadelphia Phillies', '88BA-JK', '', 370),
(13491, 5, 9, 'Joe Musgrove', 0, '', '', 'Joe Musgrove', 'San Diego Padres', '88BA-JM', '', 370),
(13492, 5, 9, 'Julio Rodriguez', 0, '', '', 'Julio Rodriguez', 'Seattle Mariners', '88BA-JROD', '', 370),
(13493, 5, 9, 'Josh Smith', 0, '', '', 'Josh Smith', 'Texas Rangers', '88BA-JSM', '', 370),
(13494, 5, 9, 'Justin Steele', 0, '', '', 'Justin Steele', 'Chicago Cubs', '88BA-JST', '', 370),
(13495, 5, 9, 'Josh Winckowski', 0, '', '', 'Josh Winckowski', 'Boston Red Sox', '88BA-JWI', '', 370),
(13496, 5, 9, 'Kody Clemens', 0, '', '', 'Kody Clemens', 'Detroit Tigers', '88BA-KC', '', 370),
(13497, 5, 9, 'Ke\'Bryan Hayes', 0, '', '', 'Ke\'Bryan Hayes', 'Pittsburgh Pirates', '88BA-KH', '', 370),
(13498, 5, 9, 'Korey Lee', 0, '', '', 'Korey Lee', 'Houston Astros', '88BA-KL', '', 370),
(13499, 5, 9, 'Charles Leblanc', 0, '', '', 'Charles Leblanc', 'Miami Marlins', '88BA-LEB', '', 370),
(13500, 5, 9, 'Liover Peguero', 0, '', '', 'Liover Peguero', 'Pittsburgh Pirates', '88BA-LP', '', 370),
(13501, 5, 9, 'Logan Webb', 0, '', '', 'Logan Webb', 'San Francisco Giants', '88BA-LWE', '', 370),
(13502, 5, 9, 'Mark Appel', 0, '', '', 'Mark Appel', 'Philadelphia Phillies', '88BA-MA', '', 370),
(13503, 5, 9, 'Davis Martin', 0, '', '', 'Davis Martin', 'Chicago White Sox', '88BA-MAR', '', 370),
(13504, 5, 9, 'Michael Massey', 0, '', '', 'Michael Massey', 'Kansas City Royals', '88BA-MAS', '', 370),
(13505, 5, 9, 'Michael Grove', 0, '', '', 'Michael Grove', 'Los Angeles Dodgers', '88BA-MG', '', 370),
(13506, 5, 9, 'Michael Harris II', 0, '', '', 'Michael Harris II', 'Atlanta Braves', '88BA-MH', '', 370),
(13507, 5, 9, 'Mark McGwire', 0, '', '', 'Mark McGwire', 'Oakland Athletics', '88BA-MMC', '', 370),
(13508, 5, 9, 'Max Muncy', 0, '', '', 'Max Muncy', 'Los Angeles Dodgers', '88BA-MMU', '', 370),
(13509, 5, 9, 'Michael Stefanic', 0, '', '', 'Michael Stefanic', 'Los Angeles Angels', '88BA-MS', '', 370),
(13510, 5, 9, 'Mike Schmidt', 0, '', '', 'Mike Schmidt', 'Philadelphia Phillies', '88BA-MSC', '', 370),
(13511, 5, 9, 'Marcus Wilson', 0, '', '', 'Marcus Wilson', 'Seattle Mariners', '88BA-MW', '', 370),
(13512, 5, 9, 'Narciso Crook', 0, '', '', 'Narciso Crook', 'Chicago Cubs', '88BA-NC', '', 370),
(13513, 5, 9, 'Nestor Cortes', 0, '', '', 'Nestor Cortes', 'New York Yankees', '88BA-NCO', '', 370),
(13514, 5, 9, 'Nolan Gorman', 0, '', '', 'Nolan Gorman', 'St. Louis Cardinals', '88BA-NGO', '', 370),
(13515, 5, 9, 'Oscar Gonzalez', 0, '', '', 'Oscar Gonzalez', 'Cleveland Guardians', '88BA-OG', '', 370),
(13516, 5, 9, 'Oswald Peraza', 0, '', '', 'Oswald Peraza', 'New York Yankees', '88BA-OP', '', 370),
(13517, 5, 9, 'Ozzie Smith', 0, '', '', 'Ozzie Smith', 'St. Louis Cardinals', '88BA-OS', '', 370),
(13518, 5, 9, 'James Outman', 0, '', '', 'James Outman', 'Los Angeles Dodgers', '88BA-OUT', '', 370),
(13519, 5, 9, 'Pete Alonso', 0, '', '', 'Pete Alonso', 'New York Mets', '88BA-PA', '', 370),
(13520, 5, 9, 'Paul Goldschmidt', 0, '', '', 'Paul Goldschmidt', 'St. Louis Cardinals', '88BA-PG', '', 370),
(13521, 5, 9, 'Sean Bouchard', 0, '', '', 'Sean Bouchard', 'Colorado Rockies', '88BA-SBO', '', 370),
(13522, 5, 9, 'Steve Carlton', 0, '', '', 'Steve Carlton', 'Philadelphia Phillies', '88BA-SC', '', 370),
(13523, 5, 9, 'Sonny Gray', 0, '', '', 'Sonny Gray', 'Minnesota Twins', '88BA-SG', '', 370),
(13524, 5, 9, 'Shea Langeliers', 0, '', '', 'Shea Langeliers', 'Oakland Athletics', '88BA-SL', '', 370),
(13525, 5, 9, 'Steele Walker', 0, '', '', 'Steele Walker', 'Texas Rangers', '88BA-SW', '', 370);
INSERT INTO `DimCard` (`id`, `cardset_id`, `cardtype_id`, `card_name`, `is_short`, `rarity`, `image`, `player_name`, `player_team`, `card_number`, `feature`, `variation_id`) VALUES
(13526, 5, 9, 'Travis Swaggerty', 0, '', '', 'Travis Swaggerty', 'Pittsburgh Pirates', '88BA-TS', '', 370),
(13527, 5, 9, 'Terrin Vavra', 0, '', '', 'Terrin Vavra', 'Baltimore Orioles', '88BA-VAV', '', 370),
(13528, 5, 9, 'Vinnie Pasquantino', 0, '', '', 'Vinnie Pasquantino', 'Kansas City Royals', '88BA-VP', '', 370),
(13529, 5, 9, 'Zack Thompson', 0, '', '', 'Zack Thompson', 'St. Louis Cardinals', '88BA-ZT', '', 370),
(13530, 5, 9, 'Andruw Jones', 0, '', '', 'Andruw Jones', 'Atlanta Braves', '88BA-AJ', '', 370),
(13531, 5, 9, 'Adley Rutschman', 0, '', '', 'Adley Rutschman', 'Baltimore Orioles', '88BA-ARU', '', 370),
(13532, 5, 9, 'Bo Jackson', 0, '', '', 'Bo Jackson', 'Kansas City Royals', '88BA-BJ', '', 370),
(13533, 5, 9, 'Barry Larkin', 0, '', '', 'Barry Larkin', 'Cincinnati Reds', '88BA-BL', '', 370),
(13534, 5, 9, 'Bobby Witt Jr.', 0, '', '', 'Bobby Witt Jr.', 'Kansas City Royals', '88BA-BW', '', 370),
(13535, 5, 9, 'Carlton Fisk', 0, '', '', 'Carlton Fisk', 'Chicago White Sox', '88BA-CF', '', 370),
(13536, 5, 9, 'Dale Murphy', 0, '', '', 'Dale Murphy', 'Atlanta Braves', '88BA-DM', '', 370),
(13537, 5, 9, 'David Ortiz', 0, '', '', 'David Ortiz', 'Boston Red Sox', '88BA-DO', '', 370),
(13538, 5, 9, 'Dansby Swanson', 0, '', '', 'Dansby Swanson', 'Atlanta Braves', '88BA-DS', '', 370),
(13539, 5, 9, 'Dontrelle Willis', 0, '', '', 'Dontrelle Willis', 'Florida Marlins', '88BA-DW', '', 370),
(13540, 5, 9, 'Eric Davis', 0, '', '', 'Eric Davis', 'Cincinnati Reds', '88BA-ED', '', 370),
(13541, 5, 9, 'Eddie Murray', 0, '', '', 'Eddie Murray', 'Baltimore Orioles', '88BA-EM', '', 370),
(13542, 5, 9, 'Frank Thomas', 0, '', '', 'Frank Thomas', 'Chicago White Sox', '88BA-FT', '', 370),
(13543, 5, 9, 'Jeter Downs', 0, '', '', 'Jeter Downs', 'Boston Red Sox', '88BA-JD', '', 370),
(13544, 5, 9, 'John Smoltz', 0, '', '', 'John Smoltz', 'Atlanta Braves', '88BA-JS', '', 370),
(13545, 5, 9, 'Joey Votto', 0, '', '', 'Joey Votto', 'Cincinnati Reds', '88BA-JV', '', 370),
(13546, 5, 9, 'Jason Varitek', 0, '', '', 'Jason Varitek', 'Boston Red Sox', '88BA-JVA', '', 370),
(13547, 5, 9, 'Luis Castillo', 0, '', '', 'Luis Castillo', 'Seattle Mariners', '88BA-LC', '', 370),
(13548, 5, 9, 'Luis Robert', 0, '', '', 'Luis Robert', 'Chicago White Sox', '88BA-LR', '', 370),
(13549, 5, 9, 'Larry Walker', 0, '', '', 'Larry Walker', 'Colorado Rockies', '88BA-LW', '', 370),
(13550, 5, 9, 'Matt Olson', 0, '', '', 'Matt Olson', 'Atlanta Braves', '88BA-MO', '', 370),
(13551, 5, 9, 'Mike Trout', 0, '', '', 'Mike Trout', 'Los Angeles Angels', '88BA-MT', '', 370),
(13552, 5, 9, 'Nomar Garciaparra', 0, '', '', 'Nomar Garciaparra', 'Boston Red Sox', '88BA-NG', '', 370),
(13553, 5, 9, 'Nolan Jones', 0, '', '', 'Nolan Jones', 'Cleveland Guardians', '88BA-NJ', '', 370),
(13554, 5, 9, 'Nick Pratto', 0, '', '', 'Nick Pratto', 'Kansas City Royals', '88BA-NP', '', 370),
(13555, 5, 9, 'Patrick Wisdom', 0, '', '', 'Patrick Wisdom', 'Chicago Cubs', '88BA-PW', '', 370),
(13556, 5, 9, 'Ronald Acuña Jr.', 0, '', '', 'Ronald Acuña Jr.', 'Atlanta Braves', '88BA-RA', '', 370),
(13557, 5, 9, 'Riley Greene', 0, '', '', 'Riley Greene', 'Detroit Tigers', '88BA-RG', '', 370),
(13558, 5, 9, 'Ryan Mountcastle', 0, '', '', 'Ryan Mountcastle', 'Baltimore Orioles', '88BA-RM', '', 370),
(13559, 5, 9, 'Shane Bieber', 0, '', '', 'Shane Bieber', 'Cleveland Guardians', '88BA-SB', '', 370),
(13560, 5, 9, 'Steven Kwan', 0, '', '', 'Steven Kwan', 'Cleveland Guardians', '88BA-SK', '', 370),
(13561, 5, 9, 'Shohei Ohtani', 0, '', '', 'Shohei Ohtani', 'Los Angeles Angels', '88BA-SO', '', 370),
(13562, 5, 9, 'Tyler Freeman', 0, '', '', 'Tyler Freeman', 'Cleveland Guardians', '88BA-TF', '', 370),
(13563, 5, 9, 'Tom Glavine', 0, '', '', 'Tom Glavine', 'Atlanta Braves', '88BA-TG', '', 370),
(13564, 5, 9, 'Tim Raines', 0, '', '', 'Tim Raines', 'Chicago White Sox', '88BA-TR', '', 370),
(13565, 5, 9, 'Drew Waters', 0, '', '', 'Drew Waters', 'Kansas City Royals', '88BA-WAT', '', 370),
(13566, 5, 9, 'Wade Boggs', 0, '', '', 'Wade Boggs', 'Boston Red Sox', '88BA-WB', '', 370),
(13567, 5, 9, 'Adrian Beltre', 0, '', '', 'Adrian Beltre', 'Texas Rangers', '88R-AB', '', 371),
(13568, 5, 9, 'Alex Bregman', 0, '', '', 'Alex Bregman', 'Houston Astros', '88R-ABR', '', 371),
(13569, 5, 9, 'Aroldis Chapman', 0, '', '', 'Aroldis Chapman', 'New York Yankees', '88R-AC', '', 371),
(13570, 5, 9, 'Aaron Judge', 0, '', '', 'Aaron Judge', 'New York Yankees', '88R-AJ', '', 371),
(13571, 5, 9, 'Alex Kirilloff', 0, '', '', 'Alex Kirilloff', 'Minnesota Twins', '88R-AK', '', 371),
(13572, 5, 9, 'Aaron Nola', 0, '', '', 'Aaron Nola', 'Philadelphia Phillies', '88R-AN', '', 371),
(13573, 5, 9, 'Andy Pettitte', 0, '', '', 'Andy Pettitte', 'New York Yankees', '88R-AP', '', 371),
(13574, 5, 9, 'Albert Pujols', 0, '', '', 'Albert Pujols', 'St. Louis Cardinals', '88R-APU', '', 371),
(13575, 5, 9, 'Alex Rodriguez', 0, '', '', 'Alex Rodriguez', 'New York Yankees', '88R-AR', '', 371),
(13576, 5, 9, 'Adley Rutschman', 0, '', '', 'Adley Rutschman', 'Baltimore Orioles', '88R-ARU', '', 371),
(13577, 5, 9, 'Anthony Rizzo', 0, '', '', 'Anthony Rizzo', 'New York Yankees', '88R-ARZ', '', 371),
(13578, 5, 9, 'Byron Buxton', 0, '', '', 'Byron Buxton', 'Minnesota Twins', '88R-BB', '', 371),
(13579, 5, 9, 'Bo Bichette', 0, '', '', 'Bo Bichette', 'Toronto Blue Jays', '88R-BBI', '', 371),
(13580, 5, 9, 'Brandon Crawford', 0, '', '', 'Brandon Crawford', 'San Francisco Giants', '88R-BC', '', 371),
(13581, 5, 9, 'Bryce Harper', 0, '', '', 'Bryce Harper', 'Philadelphia Phillies', '88R-BH', '', 371),
(13582, 5, 9, 'Barry Larkin', 0, '', '', 'Barry Larkin', 'Cincinnati Reds', '88R-BL', '', 371),
(13583, 5, 9, 'Buster Posey', 0, '', '', 'Buster Posey', 'San Francisco Giants', '88R-BP', '', 371),
(13584, 5, 9, 'Bobby Witt Jr.', 0, '', '', 'Bobby Witt Jr.', 'Kansas City Royals', '88R-BW', '', 371),
(13585, 5, 9, 'Cody Bellinger', 0, '', '', 'Cody Bellinger', 'Los Angeles Dodgers', '88R-CB', '', 371),
(13586, 5, 9, 'Craig Biggio', 0, '', '', 'Craig Biggio', 'Houston Astros', '88R-CBI', '', 371),
(13587, 5, 9, 'Carlos Correa', 0, '', '', 'Carlos Correa', 'Minnesota Twins', '88R-CC', '', 371),
(13588, 5, 9, 'Chipper Jones', 0, '', '', 'Chipper Jones', 'Atlanta Braves', '88R-CJ', '', 371),
(13589, 5, 9, 'Christopher Morel', 0, '', '', 'Christopher Morel', 'Chicago Cubs', '88R-CM', '', 371),
(13590, 5, 9, 'Cal Ripken Jr.', 0, '', '', 'Cal Ripken Jr.', 'Baltimore Orioles', '88R-CR', '', 371),
(13591, 5, 9, 'CC Sabathia', 0, '', '', 'CC Sabathia', 'New York Yankees', '88R-CS', '', 371),
(13592, 5, 9, 'Christian Yelich', 0, '', '', 'Christian Yelich', 'Milwaukee Brewers', '88R-CY', '', 371),
(13593, 5, 9, 'Derek Jeter', 0, '', '', 'Derek Jeter', 'New York Yankees', '88R-DJ', '', 371),
(13594, 5, 9, 'David Ortiz', 0, '', '', 'David Ortiz', 'Boston Red Sox', '88R-DO', '', 371),
(13595, 5, 9, 'Dustin Pedroia', 0, '', '', 'Dustin Pedroia', 'Boston Red Sox', '88R-DP', '', 371),
(13596, 5, 9, 'Eloy Jiménez', 0, '', '', 'Eloy Jiménez', 'Chicago White Sox', '88R-EJ', '', 371),
(13597, 5, 9, 'Eddie Murray', 0, '', '', 'Eddie Murray', 'Baltimore Orioles', '88R-EM', '', 371),
(13598, 5, 9, 'Fernando Tatis Jr.', 0, '', '', 'Fernando Tatis Jr.', 'San Diego Padres', '88R-FT', '', 371),
(13599, 5, 9, 'Frank Thomas', 0, '', '', 'Frank Thomas', 'Chicago White Sox', '88R-FTH', '', 371),
(13600, 5, 9, 'Gerrit Cole', 0, '', '', 'Gerrit Cole', 'New York Yankees', '88R-GC', '', 371),
(13601, 5, 9, 'George Springer', 0, '', '', 'George Springer', 'Toronto Blue Jays', '88R-GS', '', 371),
(13602, 5, 9, 'Giancarlo Stanton', 0, '', '', 'Giancarlo Stanton', 'New York Yankees', '88R-GST', '', 371),
(13603, 5, 9, 'Gleyber Torres', 0, '', '', 'Gleyber Torres', 'New York Yankees', '88R-GT', '', 371),
(13604, 5, 9, 'Hunter Greene', 0, '', '', 'Hunter Greene', 'Cincinnati Reds', '88R-HG', '', 371),
(13605, 5, 9, 'Ivan Rodriguez', 0, '', '', 'Ivan Rodriguez', 'Texas Rangers', '88R-IR', '', 371),
(13606, 5, 9, 'Jose Altuve', 0, '', '', 'Jose Altuve', 'Houston Astros', '88R-JA', '', 371),
(13607, 5, 9, 'Jeff Bagwell', 0, '', '', 'Jeff Bagwell', 'Houston Astros', '88R-JB', '', 371),
(13608, 5, 9, 'Jazz Chisholm Jr.', 0, '', '', 'Jazz Chisholm Jr.', 'Miami Marlins', '88R-JC', '', 371),
(13609, 5, 9, 'Jonathan India', 0, '', '', 'Jonathan India', 'Cincinnati Reds', '88R-JI', '', 371),
(13610, 5, 9, 'J.D. Martinez', 0, '', '', 'J.D. Martinez', 'Boston Red Sox', '88R-JM', '', 371),
(13611, 5, 9, 'Jeremy Pena', 0, '', '', 'Jeremy Pena', 'Houston Astros', '88R-JP', '', 371),
(13612, 5, 9, 'José Ramírez', 0, '', '', 'José Ramírez', 'Cleveland Guardians', '88R-JRA', '', 371),
(13613, 5, 9, 'Julio Rodriguez', 0, '', '', 'Julio Rodriguez', 'Seattle Mariners', '88R-JROD', '', 371),
(13614, 5, 9, 'John Smoltz', 0, '', '', 'John Smoltz', 'Atlanta Braves', '88R-JS', '', 371),
(13615, 5, 9, 'Juan Soto', 0, '', '', 'Juan Soto', 'San Diego Padres', '88R-JSO', '', 371),
(13616, 5, 9, 'Joey Votto', 0, '', '', 'Joey Votto', 'Cincinnati Reds', '88R-JV', '', 371),
(13617, 5, 9, 'Kris Bryant', 0, '', '', 'Kris Bryant', 'Colorado Rockies', '88R-KB', '', 371),
(13618, 5, 9, 'Ken Griffey Jr.', 0, '', '', 'Ken Griffey Jr.', 'Seattle Mariners', '88R-KG', '', 371),
(13619, 5, 9, 'Kirby Puckett', 0, '', '', 'Kirby Puckett', 'Minnesota Twins', '88R-KP', '', 371),
(13620, 5, 9, 'Luis Severino', 0, '', '', 'Luis Severino', 'New York Yankees', '88R-LS', '', 371),
(13621, 5, 9, 'Larry Walker', 0, '', '', 'Larry Walker', 'Colorado Rockies', '88R-LW', '', 371),
(13622, 5, 9, 'Miguel Cabrera', 0, '', '', 'Miguel Cabrera', 'Detroit Tigers', '88R-MC', '', 371),
(13623, 5, 9, 'Manny Machado', 0, '', '', 'Manny Machado', 'San Diego Padres', '88R-MM', '', 371),
(13624, 5, 9, 'Mark McGwire', 0, '', '', 'Mark McGwire', 'Oakland Athletics', '88R-MMC', '', 371),
(13625, 5, 9, 'Mike Piazza', 0, '', '', 'Mike Piazza', 'New York Mets', '88R-MP', '', 371),
(13626, 5, 9, 'Mariano Rivera', 0, '', '', 'Mariano Rivera', 'New York Yankees', '88R-MR', '', 371),
(13627, 5, 9, 'Manny Ramirez', 0, '', '', 'Manny Ramirez', 'Boston Red Sox', '88R-MRA', '', 371),
(13628, 5, 9, 'Mike Trout', 0, '', '', 'Mike Trout', 'Los Angeles Angels', '88R-MT', '', 371),
(13629, 5, 9, 'Nolan Arenado', 0, '', '', 'Nolan Arenado', 'St. Louis Cardinals', '88R-NA', '', 371),
(13630, 5, 9, 'Nolan Gorman', 0, '', '', 'Nolan Gorman', 'St. Louis Cardinals', '88R-NG', '', 371),
(13631, 5, 9, 'Oneil Cruz', 0, '', '', 'Oneil Cruz', 'Pittsburgh Pirates', '88R-OC', '', 371),
(13632, 5, 9, 'Ozzie Smith', 0, '', '', 'Ozzie Smith', 'St. Louis Cardinals', '88R-OS', '', 371),
(13633, 5, 9, 'Pete Alonso', 0, '', '', 'Pete Alonso', 'New York Mets', '88R-PA', '', 371),
(13634, 5, 9, 'Paul Goldschmidt', 0, '', '', 'Paul Goldschmidt', 'St. Louis Cardinals', '88R-PG', '', 371),
(13635, 5, 9, 'Ronald Acuña Jr.', 0, '', '', 'Ronald Acuña Jr.', 'Atlanta Braves', '88R-RAJ', '', 371),
(13636, 5, 9, 'Rafael Devers', 0, '', '', 'Rafael Devers', 'Boston Red Sox', '88R-RD', '', 371),
(13637, 5, 9, 'Riley Greene', 0, '', '', 'Riley Greene', 'Detroit Tigers', '88R-RG', '', 371),
(13638, 5, 9, 'Rhys Hoskins', 0, '', '', 'Rhys Hoskins', 'Philadelphia Phillies', '88R-RH', '', 371),
(13639, 5, 9, 'Ryan Mountcastle', 0, '', '', 'Ryan Mountcastle', 'Baltimore Orioles', '88R-RM', '', 371),
(13640, 5, 9, 'Ryne Sandberg', 0, '', '', 'Ryne Sandberg', 'Chicago Cubs', '88R-RS', '', 371),
(13641, 5, 9, 'Shohei Ohtani', 0, '', '', 'Shohei Ohtani', 'Los Angeles Angels', '88R-SO', '', 371),
(13642, 5, 9, 'Sammy Sosa', 0, '', '', 'Sammy Sosa', 'Chicago Cubs', '88R-SS', '', 371),
(13643, 5, 9, 'Tony Gwynn', 0, '', '', 'Tony Gwynn', 'San Diego Padres', '88R-TG', '', 371),
(13644, 5, 9, 'Trea Turner', 0, '', '', 'Trea Turner', 'Los Angeles Dodgers', '88R-TT', '', 371),
(13645, 5, 9, 'Vladimir Guerrero Jr.', 0, '', '', 'Vladimir Guerrero Jr.', 'Toronto Blue Jays', '88R-VG', '', 371),
(13646, 5, 9, 'Wade Boggs', 0, '', '', 'Wade Boggs', 'Boston Red Sox', '88R-WB', '', 371),
(13647, 5, 9, 'Willson Contreras', 0, '', '', 'Willson Contreras', 'Chicago Cubs', '88R-WC', '', 371),
(13648, 5, 9, 'Wander Franco', 0, '', '', 'Wander Franco', 'Tampa Bay Rays', '88R-WF', '', 371),
(13649, 5, 9, 'Xander Bogaerts', 0, '', '', 'Xander Bogaerts', 'Boston Red Sox', '88R-XB', '', 371),
(13650, 5, 9, 'Yordan Alvarez', 0, '', '', 'Yordan Alvarez', 'Houston Astros', '88R-YA', '', 371),
(13651, 5, 9, 'Yadier Molina', 0, '', '', 'Yadier Molina', 'St. Louis Cardinals', '88R-YM', '', 371),
(13652, 5, 9, 'Ronald Acuña Jr.', 0, '', '', 'Ronald Acuña Jr.', 'Atlanta Braves', 'T88C-1', '', 372),
(13653, 5, 9, 'Liover Peguero', 0, '', '', 'Liover Peguero', 'Pittsburgh Pirates', 'T88C-2', '', 372),
(13654, 5, 9, 'Christopher Morel', 0, '', '', 'Christopher Morel', 'Chicago Cubs', 'T88C-4', '', 372),
(13655, 5, 9, 'Adley Rutschman', 0, '', '', 'Adley Rutschman', 'Baltimore Orioles', 'T88C-5', '', 372),
(13656, 5, 9, 'Tyler Freeman', 0, '', '', 'Tyler Freeman', 'Cleveland Guardians', 'T88C-7', '', 372),
(13657, 5, 9, 'Vladimir Guerrero Jr.', 0, '', '', 'Vladimir Guerrero Jr.', 'Toronto Blue Jays', 'T88C-9', '', 372),
(13658, 5, 9, 'Terrin Vavra', 0, '', '', 'Terrin Vavra', 'Baltimore Orioles', 'T88C-10', '', 372),
(13659, 5, 9, 'Cal Ripken Jr.', 0, '', '', 'Cal Ripken Jr.', 'Baltimore Orioles', 'T88C-11', '', 372),
(13660, 5, 9, 'Vaughn Grissom', 0, '', '', 'Vaughn Grissom', 'Atlanta Braves', 'T88C-13', '', 372),
(13661, 5, 9, 'Bubba Thompson', 0, '', '', 'Bubba Thompson', 'Texas Rangers', 'T88C-16', '', 372),
(13662, 5, 9, 'Pete Alonso', 0, '', '', 'Pete Alonso', 'New York Mets', 'T88C-17', '', 372),
(13663, 5, 9, 'Barry Larkin', 0, '', '', 'Barry Larkin', 'Cincinnati Reds', 'T88C-18', '', 372),
(13664, 5, 9, 'Robin Yount', 0, '', '', 'Robin Yount', 'Milwaukee Brewers', 'T88C-19', '', 372),
(13665, 5, 9, 'Ethan Small', 0, '', '', 'Ethan Small', 'Milwaukee Brewers', 'T88C-20', '', 372),
(13666, 5, 9, 'James Outman', 0, '', '', 'James Outman', 'Los Angeles Dodgers', 'T88C-21', '', 372),
(13667, 5, 9, 'Alex Bregman', 0, '', '', 'Alex Bregman', 'Houston Astros', 'T88C-22', '', 372),
(13668, 5, 9, 'Bryce Harper', 0, '', '', 'Bryce Harper', 'Philadelphia Phillies', 'T88C-23', '', 372),
(13669, 5, 9, 'Shea Langeliers', 0, '', '', 'Shea Langeliers', 'Oakland Athletics', 'T88C-24', '', 372),
(13670, 5, 9, 'Korey Lee', 0, '', '', 'Korey Lee', 'Houston Astros', 'T88C-25', '', 372),
(13671, 5, 9, 'Josh Smith', 0, '', '', 'Josh Smith', 'Texas Rangers', 'T88C-26', '', 372),
(13672, 5, 9, 'Shohei Ohtani', 0, '', '', 'Shohei Ohtani', 'Los Angeles Angels', 'T88C-27', '', 372),
(13673, 5, 9, 'Charles Leblanc', 0, '', '', 'Charles Leblanc', 'Miami Marlins', 'T88C-28', '', 372),
(13674, 5, 9, 'Juan Soto', 0, '', '', 'Juan Soto', 'San Diego Padres', 'T88C-30', '', 372),
(13675, 5, 9, 'Nolan Arenado', 0, '', '', 'Nolan Arenado', 'St. Louis Cardinals', 'T88C-31', '', 372),
(13676, 5, 9, 'Brayan Bello', 0, '', '', 'Brayan Bello', 'Boston Red Sox', 'T88C-33', '', 372),
(13677, 5, 9, 'José Ramírez', 0, '', '', 'José Ramírez', 'Cleveland Guardians', 'T88C-34', '', 372),
(13678, 5, 9, 'Will Clark', 0, '', '', 'Will Clark', 'San Francisco Giants', 'T88C-35', '', 372),
(13679, 5, 9, 'Kyle Stowers', 0, '', '', 'Kyle Stowers', 'Baltimore Orioles', 'T88C-37', '', 372),
(13680, 5, 9, 'Julio Rodríguez', 0, '', '', 'Julio Rodríguez', 'Seattle Mariners', 'T88C-38', '', 372),
(13681, 5, 9, 'Anthony Rizzo', 0, '', '', 'Anthony Rizzo', 'New York Yankees', 'T88C-39', '', 372),
(13682, 5, 9, 'Ke\'Bryan Hayes', 0, '', '', 'Ke\'Bryan Hayes', 'Pittsburgh Pirates', 'T88C-41', '', 372),
(13683, 5, 9, 'Matthew Liberatore', 0, '', '', 'Matthew Liberatore', 'St. Louis Cardinals', 'T88C-42', '', 372),
(13684, 5, 9, 'DL Hall', 0, '', '', 'DL Hall', 'Baltimore Orioles', 'T88C-43', '', 372),
(13685, 5, 9, 'Bobby Witt Jr.', 0, '', '', 'Bobby Witt Jr.', 'Kansas City Royals', 'T88C-44', '', 372),
(13686, 5, 9, 'Frank Thomas', 0, '', '', 'Frank Thomas', 'Chicago White Sox', 'T88C-45', '', 372),
(13687, 5, 9, 'Rafael Devers', 0, '', '', 'Rafael Devers', 'Boston Red Sox', 'T88C-47', '', 372),
(13688, 5, 9, 'Mark McGwire', 0, '', '', 'Mark McGwire', 'Oakland Athletics', 'T88C-49', '', 372),
(13689, 5, 9, 'Nick Pratto', 0, '', '', 'Nick Pratto', 'Kansas City Royals', 'T88C-50', '', 372),
(13690, 5, 9, 'Michael Harris II', 0, '', '', 'Michael Harris II', 'Atlanta Braves', 'T88C-51', '', 372),
(13691, 5, 9, 'Chipper Jones', 0, '', '', 'Chipper Jones', 'Atlanta Braves', 'T88C-53', '', 372),
(13692, 5, 9, 'Jeter Downs', 0, '', '', 'Jeter Downs', 'Boston Red Sox', 'T88C-55', '', 372),
(13693, 5, 9, 'Josh Winckowski', 0, '', '', 'Josh Winckowski', 'Boston Red Sox', 'T88C-56', '', 372),
(13694, 5, 9, 'Randy Johnson', 0, '', '', 'Randy Johnson', 'Seattle Mariners', 'T88C-57', '', 372),
(13695, 5, 9, 'JJ Bleday', 0, '', '', 'JJ Bleday', 'Miami Marlins', 'T88C-58', '', 372),
(13696, 5, 9, 'Nolan Jones', 0, '', '', 'Nolan Jones', 'Cleveland Guardians', 'T88C-59', '', 372),
(13697, 5, 9, 'Iván Herrera', 0, '', '', 'Iván Herrera', 'St. Louis Cardinals', 'T88C-60', '', 372),
(13698, 5, 9, 'Ryne Sandberg', 0, '', '', 'Ryne Sandberg', 'Chicago Cubs', 'T88C-63', '', 372),
(13699, 5, 9, 'Cal Mitchell', 0, '', '', 'Cal Mitchell', 'Pittsburgh Pirates', 'T88C-64', '', 372),
(13700, 5, 9, 'Joey Meneses', 0, '', '', 'Joey Meneses', 'Washington Nationals', 'T88C-65', '', 372),
(13701, 5, 9, 'Ken Griffey Jr.', 0, '', '', 'Ken Griffey Jr.', 'Seattle Mariners', 'T88C-66', '', 372),
(13702, 5, 9, 'Riley Greene', 0, '', '', 'Riley Greene', 'Detroit Tigers', 'T88C-67', '', 372),
(13703, 5, 9, 'Paul Goldschmidt', 0, '', '', 'Paul Goldschmidt', 'St. Louis Cardinals', 'T88C-69', '', 372),
(13704, 5, 9, 'Miguel Cabrera', 0, '', '', 'Miguel Cabrera', 'Detroit Tigers', 'T88C-71', '', 372),
(13705, 5, 9, 'Caleb Kilian', 0, '', '', 'Caleb Kilian', 'Chicago Cubs', 'T88C-72', '', 372),
(13706, 5, 9, 'Vladimir Guerrero', 0, '', '', 'Vladimir Guerrero', 'Montréal Expos', 'T88C-73', '', 372),
(13707, 5, 9, 'Salvador Perez', 0, '', '', 'Salvador Perez', 'Kansas City Royals', 'T88C-75', '', 372),
(13708, 5, 9, 'Nolan Ryan', 0, '', '', 'Nolan Ryan', 'Houston Astros', 'T88C-76', '', 372),
(13709, 5, 9, 'Mike Trout', 0, '', '', 'Mike Trout', 'Los Angeles Angels', 'T88C-77', '', 372),
(13710, 5, 9, 'Ezequiel Duran', 0, '', '', 'Ezequiel Duran', 'Texas Rangers', 'T88C-78', '', 372),
(13711, 5, 9, 'Fernando Tatis Jr.', 0, '', '', 'Fernando Tatis Jr.', 'San Diego Padres', 'T88C-79', '', 372),
(13712, 5, 9, 'Rhys Hoskins', 0, '', '', 'Rhys Hoskins', 'Philadelphia Phillies', 'T88C-80', '', 372),
(13713, 5, 9, 'Aaron Judge', 0, '', '', 'Aaron Judge', 'New York Yankees', 'T88C-81', '', 372),
(13714, 5, 9, 'Yordan Alvarez', 0, '', '', 'Yordan Alvarez', 'Houston Astros', 'T88C-82', '', 372),
(13715, 5, 9, 'Gabriel Moreno', 0, '', '', 'Gabriel Moreno', 'Toronto Blue Jays', 'T88C-84', '', 372),
(13716, 5, 9, 'Max Meyer', 0, '', '', 'Max Meyer', 'Miami Marlins', 'T88C-86', '', 372),
(13717, 5, 9, 'Don Mattingly', 0, '', '', 'Don Mattingly', 'New York Yankees', 'T88C-88', '', 372),
(13718, 5, 9, 'Byron Buxton', 0, '', '', 'Byron Buxton', 'Minnesota Twins', 'T88C-89', '', 372),
(13719, 5, 9, 'Nolan Gorman', 0, '', '', 'Nolan Gorman', 'St. Louis Cardinals', 'T88C-90', '', 372),
(13720, 5, 9, 'Vinnie Pasquantino', 0, '', '', 'Vinnie Pasquantino', 'Kansas City Royals', 'T88C-91', '', 372),
(13721, 5, 9, 'Oscar Gonzalez', 0, '', '', 'Oscar Gonzalez', 'Cleveland Guardians', 'T88C-92', '', 372),
(13722, 5, 9, 'Graham Ashcraft', 0, '', '', 'Graham Ashcraft', 'Cincinnati Reds', 'T88C-93', '', 372),
(13723, 5, 9, 'Nelson Velázquez', 0, '', '', 'Nelson Velázquez', 'Chicago Cubs', 'T88C-94', '', 372),
(13724, 5, 9, 'Bo Jackson', 0, '', '', 'Bo Jackson', 'Kansas City Royals', 'T88C-95', '', 372),
(13725, 5, 9, 'Joey Votto', 0, '', '', 'Joey Votto', 'Cincinnati Reds', 'T88C-96', '', 372),
(13726, 5, 9, 'Darick Hall', 0, '', '', 'Darick Hall', 'Philadelphia Phillies', 'T88C-99', '', 372),
(13727, 5, 9, 'Ronald Acuña Jr.', 0, '', '', 'Ronald Acuña Jr.', 'Atlanta Braves', 'T88C-1', '', 373),
(13728, 5, 9, 'Liover Peguero', 0, '', '', 'Liover Peguero', 'Pittsburgh Pirates', 'T88C-2', '', 373),
(13729, 5, 9, 'Bo Bichette', 0, '', '', 'Bo Bichette', 'Toronto Blue Jays', 'T88C-3', '', 373),
(13730, 5, 9, 'Christopher Morel', 0, '', '', 'Christopher Morel', 'Chicago Cubs', 'T88C-4', '', 373),
(13731, 5, 9, 'Adley Rutschman', 0, '', '', 'Adley Rutschman', 'Baltimore Orioles', 'T88C-5', '', 373),
(13732, 5, 9, 'Jacob deGrom', 0, '', '', 'Jacob deGrom', 'New York Mets', 'T88C-6', '', 373),
(13733, 5, 9, 'Tyler Freeman', 0, '', '', 'Tyler Freeman', 'Cleveland Guardians', 'T88C-7', '', 373),
(13734, 5, 9, 'Rickey Henderson', 0, '', '', 'Rickey Henderson', 'Oakland Athletics', 'T88C-8', '', 373),
(13735, 5, 9, 'Vladimir Guerrero Jr.', 0, '', '', 'Vladimir Guerrero Jr.', 'Toronto Blue Jays', 'T88C-9', '', 373),
(13736, 5, 9, 'Terrin Vavra', 0, '', '', 'Terrin Vavra', 'Baltimore Orioles', 'T88C-10', '', 373),
(13737, 5, 9, 'Cal Ripken Jr.', 0, '', '', 'Cal Ripken Jr.', 'Baltimore Orioles', 'T88C-11', '', 373),
(13738, 5, 9, 'George Brett', 0, '', '', 'George Brett', 'Kansas City Royals', 'T88C-12', '', 373),
(13739, 5, 9, 'Vaughn Grissom', 0, '', '', 'Vaughn Grissom', 'Atlanta Braves', 'T88C-13', '', 373),
(13740, 5, 9, 'Brett Baty', 0, '', '', 'Brett Baty', 'New York Mets', 'T88C-14', '', 373),
(13741, 5, 9, 'Justin Verlander', 0, '', '', 'Justin Verlander', 'Houston Astros', 'T88C-15', '', 373),
(13742, 5, 9, 'Bubba Thompson', 0, '', '', 'Bubba Thompson', 'Texas Rangers', 'T88C-16', '', 373),
(13743, 5, 9, 'Pete Alonso', 0, '', '', 'Pete Alonso', 'New York Mets', 'T88C-17', '', 373),
(13744, 5, 9, 'Barry Larkin', 0, '', '', 'Barry Larkin', 'Cincinnati Reds', 'T88C-18', '', 373),
(13745, 5, 9, 'Robin Yount', 0, '', '', 'Robin Yount', 'Milwaukee Brewers', 'T88C-19', '', 373),
(13746, 5, 9, 'Ethan Small', 0, '', '', 'Ethan Small', 'Milwaukee Brewers', 'T88C-20', '', 373),
(13747, 5, 9, 'James Outman', 0, '', '', 'James Outman', 'Los Angeles Dodgers', 'T88C-21', '', 373),
(13748, 5, 9, 'Alex Bregman', 0, '', '', 'Alex Bregman', 'Houston Astros', 'T88C-22', '', 373),
(13749, 5, 9, 'Bryce Harper', 0, '', '', 'Bryce Harper', 'Philadelphia Phillies', 'T88C-23', '', 373),
(13750, 5, 9, 'Shea Langeliers', 0, '', '', 'Shea Langeliers', 'Oakland Athletics', 'T88C-24', '', 373),
(13751, 5, 9, 'Korey Lee', 0, '', '', 'Korey Lee', 'Houston Astros', 'T88C-25', '', 373),
(13752, 5, 9, 'Josh Smith', 0, '', '', 'Josh Smith', 'Texas Rangers', 'T88C-26', '', 373),
(13753, 5, 9, 'Shohei Ohtani', 0, '', '', 'Shohei Ohtani', 'Los Angeles Angels', 'T88C-27', '', 373),
(13754, 5, 9, 'Charles Leblanc', 0, '', '', 'Charles Leblanc', 'Miami Marlins', 'T88C-28', '', 373),
(13755, 5, 9, 'Luis Robert', 0, '', '', 'Luis Robert', 'Chicago White Sox', 'T88C-29', '', 373),
(13756, 5, 9, 'Juan Soto', 0, '', '', 'Juan Soto', 'San Diego Padres', 'T88C-30', '', 373),
(13757, 5, 9, 'Nolan Arenado', 0, '', '', 'Nolan Arenado', 'St. Louis Cardinals', 'T88C-31', '', 373),
(13758, 5, 9, 'Jackie Robinson', 0, '', '', 'Jackie Robinson', 'Brooklyn Dodgers', 'T88C-32', '', 373),
(13759, 5, 9, 'Brayan Bello', 0, '', '', 'Brayan Bello', 'Boston Red Sox', 'T88C-33', '', 373),
(13760, 5, 9, 'José Ramírez', 0, '', '', 'José Ramírez', 'Cleveland Guardians', 'T88C-34', '', 373),
(13761, 5, 9, 'Will Clark', 0, '', '', 'Will Clark', 'San Francisco Giants', 'T88C-35', '', 373),
(13762, 5, 9, 'Jazz Chisholm Jr.', 0, '', '', 'Jazz Chisholm Jr.', 'Miami Marlins', 'T88C-36', '', 373),
(13763, 5, 9, 'Kyle Stowers', 0, '', '', 'Kyle Stowers', 'Baltimore Orioles', 'T88C-37', '', 373),
(13764, 5, 9, 'Julio Rodriguez', 0, '', '', 'Julio Rodriguez', 'Seattle Mariners', 'T88C-38', '', 373),
(13765, 5, 9, 'Anthony Rizzo', 0, '', '', 'Anthony Rizzo', 'New York Yankees', 'T88C-39', '', 373),
(13766, 5, 9, 'Ozzie Smith', 0, '', '', 'Ozzie Smith', 'St. Louis Cardinals', 'T88C-40', '', 373),
(13767, 5, 9, 'Ke\'Bryan Hayes', 0, '', '', 'Ke\'Bryan Hayes', 'Pittsburgh Pirates', 'T88C-41', '', 373),
(13768, 5, 9, 'Matthew Liberatore', 0, '', '', 'Matthew Liberatore', 'St. Louis Cardinals', 'T88C-42', '', 373),
(13769, 5, 9, 'DL Hall', 0, '', '', 'DL Hall', 'Baltimore Orioles', 'T88C-43', '', 373),
(13770, 5, 9, 'Bobby Witt Jr.', 0, '', '', 'Bobby Witt Jr.', 'Kansas City Royals', 'T88C-44', '', 373),
(13771, 5, 9, 'Frank Thomas', 0, '', '', 'Frank Thomas', 'Chicago White Sox', 'T88C-45', '', 373),
(13772, 5, 9, 'Willie Mays', 0, '', '', 'Willie Mays', 'San Francisco Giants', 'T88C-46', '', 373),
(13773, 5, 9, 'Rafael Devers', 0, '', '', 'Rafael Devers', 'Boston Red Sox', 'T88C-47', '', 373),
(13774, 5, 9, 'Miguel Vargas', 0, '', '', 'Miguel Vargas', 'Los Angeles Dodgers', 'T88C-48', '', 373),
(13775, 5, 9, 'Mark McGwire', 0, '', '', 'Mark McGwire', 'Oakland Athletics', 'T88C-49', '', 373),
(13776, 5, 9, 'Nick Pratto', 0, '', '', 'Nick Pratto', 'Kansas City Royals', 'T88C-50', '', 373),
(13777, 5, 9, 'Michael Harris II', 0, '', '', 'Michael Harris II', 'Atlanta Braves', 'T88C-51', '', 373),
(13778, 5, 9, 'Buster Posey', 0, '', '', 'Buster Posey', 'San Francisco Giants', 'T88C-52', '', 373),
(13779, 5, 9, 'Chipper Jones', 0, '', '', 'Chipper Jones', 'Atlanta Braves', 'T88C-53', '', 373),
(13780, 5, 9, 'Francisco Lindor', 0, '', '', 'Francisco Lindor', 'New York Mets', 'T88C-54', '', 373),
(13781, 5, 9, 'Jeter Downs', 0, '', '', 'Jeter Downs', 'Boston Red Sox', 'T88C-55', '', 373),
(13782, 5, 9, 'Josh Winckowski', 0, '', '', 'Josh Winckowski', 'Boston Red Sox', 'T88C-56', '', 373),
(13783, 5, 9, 'Randy Johnson', 0, '', '', 'Randy Johnson', 'Seattle Mariners', 'T88C-57', '', 373),
(13784, 5, 9, 'JJ Bleday', 0, '', '', 'JJ Bleday', 'Miami Marlins', 'T88C-58', '', 373),
(13785, 5, 9, 'Nolan Jones', 0, '', '', 'Nolan Jones', 'Cleveland Guardians', 'T88C-59', '', 373),
(13786, 5, 9, 'Ivan Herrera', 0, '', '', 'Ivan Herrera', 'St. Louis Cardinals', 'T88C-60', '', 373),
(13787, 5, 9, 'Oswaldo Cabrera', 0, '', '', 'Oswaldo Cabrera', 'New York Yankees', 'T88C-61', '', 373),
(13788, 5, 9, 'Christian Yelich', 0, '', '', 'Christian Yelich', 'Milwaukee Brewers', 'T88C-62', '', 373),
(13789, 5, 9, 'Ryne Sandberg', 0, '', '', 'Ryne Sandberg', 'Chicago Cubs', 'T88C-63', '', 373),
(13790, 5, 9, 'Cal Mitchell', 0, '', '', 'Cal Mitchell', 'Pittsburgh Pirates', 'T88C-64', '', 373),
(13791, 5, 9, 'Joey Meneses', 0, '', '', 'Joey Meneses', 'Washington Nationals', 'T88C-65', '', 373),
(13792, 5, 9, 'Ken Griffey Jr.', 0, '', '', 'Ken Griffey Jr.', 'Seattle Mariners', 'T88C-66', '', 373),
(13793, 5, 9, 'Riley Greene', 0, '', '', 'Riley Greene', 'Detroit Tigers', 'T88C-67', '', 373),
(13794, 5, 9, 'Wander Franco', 0, '', '', 'Wander Franco', 'Tampa Bay Rays', 'T88C-68', '', 373),
(13795, 5, 9, 'Paul Goldschmidt', 0, '', '', 'Paul Goldschmidt', 'St. Louis Cardinals', 'T88C-69', '', 373),
(13796, 5, 9, 'Javier Báez', 0, '', '', 'Javier Báez', 'Detroit Tigers', 'T88C-70', '', 373),
(13797, 5, 9, 'Miguel Cabrera', 0, '', '', 'Miguel Cabrera', 'Detroit Tigers', 'T88C-71', '', 373),
(13798, 5, 9, 'Caleb Kilian', 0, '', '', 'Caleb Kilian', 'Chicago Cubs', 'T88C-72', '', 373),
(13799, 5, 9, 'Vladimir Guerrero', 0, '', '', 'Vladimir Guerrero', 'Montréal Expos', 'T88C-73', '', 373),
(13800, 5, 9, 'Mookie Betts', 0, '', '', 'Mookie Betts', 'Los Angeles Dodgers', 'T88C-74', '', 373),
(13801, 5, 9, 'Salvador Perez', 0, '', '', 'Salvador Perez', 'Kansas City Royals', 'T88C-75', '', 373),
(13802, 5, 9, 'Nolan Ryan', 0, '', '', 'Nolan Ryan', 'Houston Astros', 'T88C-76', '', 373),
(13803, 5, 9, 'Mike Trout', 0, '', '', 'Mike Trout', 'Los Angeles Angels', 'T88C-77', '', 373),
(13804, 5, 9, 'Ezequiel Duran', 0, '', '', 'Ezequiel Duran', 'Texas Rangers', 'T88C-78', '', 373),
(13805, 5, 9, 'Fernando Tatis Jr.', 0, '', '', 'Fernando Tatis Jr.', 'San Diego Padres', 'T88C-79', '', 373),
(13806, 5, 9, 'Rhys Hoskins', 0, '', '', 'Rhys Hoskins', 'Philadelphia Phillies', 'T88C-80', '', 373),
(13807, 5, 9, 'Aaron Judge', 0, '', '', 'Aaron Judge', 'New York Yankees', 'T88C-81', '', 373),
(13808, 5, 9, 'Yordan Alvarez', 0, '', '', 'Yordan Alvarez', 'Houston Astros', 'T88C-82', '', 373),
(13809, 5, 9, 'Tony Gwynn', 0, '', '', 'Tony Gwynn', 'San Diego Padres', 'T88C-83', '', 373),
(13810, 5, 9, 'Gabriel Moreno', 0, '', '', 'Gabriel Moreno', 'Toronto Blue Jays', 'T88C-84', '', 373),
(13811, 5, 9, 'Carlos Correa', 0, '', '', 'Carlos Correa', 'Minnesota Twins', 'T88C-85', '', 373),
(13812, 5, 9, 'Max Meyer', 0, '', '', 'Max Meyer', 'Miami Marlins', 'T88C-86', '', 373),
(13813, 5, 9, 'Clayton Kershaw', 0, '', '', 'Clayton Kershaw', 'Los Angeles Dodgers', 'T88C-87', '', 373),
(13814, 5, 9, 'Don Mattingly', 0, '', '', 'Don Mattingly', 'New York Yankees', 'T88C-88', '', 373),
(13815, 5, 9, 'Byron Buxton', 0, '', '', 'Byron Buxton', 'Minnesota Twins', 'T88C-89', '', 373),
(13816, 5, 9, 'Nolan Gorman', 0, '', '', 'Nolan Gorman', 'St. Louis Cardinals', 'T88C-90', '', 373),
(13817, 5, 9, 'Vinnie Pasquantino', 0, '', '', 'Vinnie Pasquantino', 'Kansas City Royals', 'T88C-91', '', 373),
(13818, 5, 9, 'Oscar Gonzalez', 0, '', '', 'Oscar Gonzalez', 'Cleveland Guardians', 'T88C-92', '', 373),
(13819, 5, 9, 'Graham Ashcraft', 0, '', '', 'Graham Ashcraft', 'Cincinnati Reds', 'T88C-93', '', 373),
(13820, 5, 9, 'Nelson Velazquez', 0, '', '', 'Nelson Velazquez', 'Chicago Cubs', 'T88C-94', '', 373),
(13821, 5, 9, 'Bo Jackson', 0, '', '', 'Bo Jackson', 'Kansas City Royals', 'T88C-95', '', 373),
(13822, 5, 9, 'Joey Votto', 0, '', '', 'Joey Votto', 'Cincinnati Reds', 'T88C-96', '', 373),
(13823, 5, 9, 'Kris Bryant', 0, '', '', 'Kris Bryant', 'Colorado Rockies', 'T88C-97', '', 373),
(13824, 5, 9, 'Matt Olson', 0, '', '', 'Matt Olson', 'Atlanta Braves', 'T88C-98', '', 373),
(13825, 5, 9, 'Darick Hall', 0, '', '', 'Darick Hall', 'Philadelphia Phillies', 'T88C-99', '', 373),
(13826, 5, 9, 'Freddie Freeman', 0, '', '', 'Freddie Freeman', 'Los Angeles Dodgers', 'T88C-100', '', 373);

CREATE TABLE `FactInventory` (
  `id` int NOT NULL,
  `condition_id` int DEFAULT NULL,
  `card_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `quantity` int NOT NULL,
  `acquisition_date_id` int DEFAULT NULL,
  `folder_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FactTransaction`
--

CREATE TABLE `FactTransaction` (
  `id` int NOT NULL,
  `condition_id` int DEFAULT NULL,
  `transaction_date_id` int NOT NULL,
  `seller` int NOT NULL,
  `buyer` int NOT NULL,
  `card_id` int NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `quantity` int NOT NULL,
  `transaction_type_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `DimCard`
--
ALTER TABLE `DimCard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cardset_card` (`cardset_id`),
  ADD KEY `fk_cardtype_card` (`cardtype_id`),
  ADD KEY `fk_variation_card` (`variation_id`);

--
-- Indexes for table `DimCardCategory`
--
ALTER TABLE `DimCardCategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DimCardset`
--
ALTER TABLE `DimCardset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `i_release_date` (`release_date_id`),
  ADD KEY `i_manufacturer_id` (`manufacturer_id`),
  ADD KEY `fk_cardtype_cardset` (`cardtype_id`);

--
-- Indexes for table `DimCardType`
--
ALTER TABLE `DimCardType`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_type` (`card_category_id`);

--
-- Indexes for table `DimCondition`
--
ALTER TABLE `DimCondition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_grader_condition` (`grader_id`);

--
-- Indexes for table `DimDate`
--
ALTER TABLE `DimDate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DimFolder`
--
ALTER TABLE `DimFolder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_folder` (`user_id`);

--
-- Indexes for table `DimGrader`
--
ALTER TABLE `DimGrader`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DimManufacturer`
--
ALTER TABLE `DimManufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DimTransactionType`
--
ALTER TABLE `DimTransactionType`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DimUser`
--
ALTER TABLE `DimUser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_date_user` (`join_date_id`);

--
-- Indexes for table `DimVariation`
--
ALTER TABLE `DimVariation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cardset_variation` (`cardset_id`);

--
-- Indexes for table `FactInventory`
--
ALTER TABLE `FactInventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_condition_inv` (`condition_id`),
  ADD KEY `fk_card_inv` (`card_id`),
  ADD KEY `fk_owner_inv` (`owner_id`),
  ADD KEY `fk_date_inv` (`acquisition_date_id`),
  ADD KEY `fk_folder_inv` (`folder_id`);

--
-- Indexes for table `FactTransaction`
--
ALTER TABLE `FactTransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_condition_tran` (`condition_id`),
  ADD KEY `fk_date_tran` (`transaction_date_id`),
  ADD KEY `fk_seller_tran` (`seller`),
  ADD KEY `fk_buyer_tran` (`buyer`),
  ADD KEY `fk_card_tran` (`card_id`),
  ADD KEY `fk_transactiontype_transaction` (`transaction_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `DimCard`
--
ALTER TABLE `DimCard`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13827;

--
-- AUTO_INCREMENT for table `DimCardCategory`
--
ALTER TABLE `DimCardCategory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `DimCardset`
--
ALTER TABLE `DimCardset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `DimCardType`
--
ALTER TABLE `DimCardType`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `DimCondition`
--
ALTER TABLE `DimCondition`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `DimDate`
--
ALTER TABLE `DimDate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260548;

--
-- AUTO_INCREMENT for table `DimFolder`
--
ALTER TABLE `DimFolder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `DimGrader`
--
ALTER TABLE `DimGrader`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `DimManufacturer`
--
ALTER TABLE `DimManufacturer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `DimTransactionType`
--
ALTER TABLE `DimTransactionType`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `DimUser`
--
ALTER TABLE `DimUser`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `DimVariation`
--
ALTER TABLE `DimVariation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=545;

--
-- AUTO_INCREMENT for table `FactInventory`
--
ALTER TABLE `FactInventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FactTransaction`
--
ALTER TABLE `FactTransaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `DimCard`
--
ALTER TABLE `DimCard`
  ADD CONSTRAINT `fk_cardset_card` FOREIGN KEY (`cardset_id`) REFERENCES `DimCardset` (`id`),
  ADD CONSTRAINT `fk_cardtype_card` FOREIGN KEY (`cardtype_id`) REFERENCES `DimCardType` (`id`),
  ADD CONSTRAINT `fk_variation_card` FOREIGN KEY (`variation_id`) REFERENCES `DimVariation` (`id`);

--
-- Constraints for table `DimCardset`
--
ALTER TABLE `DimCardset`
  ADD CONSTRAINT `fk_cardtype_cardset` FOREIGN KEY (`cardtype_id`) REFERENCES `DimCardType` (`id`),
  ADD CONSTRAINT `fk_date_cardset` FOREIGN KEY (`release_date_id`) REFERENCES `DimDate` (`id`),
  ADD CONSTRAINT `fk_man_cardset` FOREIGN KEY (`manufacturer_id`) REFERENCES `DimManufacturer` (`id`);

--
-- Constraints for table `DimCardType`
--
ALTER TABLE `DimCardType`
  ADD CONSTRAINT `fk_category_type` FOREIGN KEY (`card_category_id`) REFERENCES `DimCardCategory` (`id`);

--
-- Constraints for table `DimCondition`
--
ALTER TABLE `DimCondition`
  ADD CONSTRAINT `fk_grader_condition` FOREIGN KEY (`grader_id`) REFERENCES `DimGrader` (`id`);

--
-- Constraints for table `DimFolder`
--
ALTER TABLE `DimFolder`
  ADD CONSTRAINT `fk_user_folder` FOREIGN KEY (`user_id`) REFERENCES `DimUser` (`id`);

--
-- Constraints for table `DimUser`
--
ALTER TABLE `DimUser`
  ADD CONSTRAINT `fk_date_user` FOREIGN KEY (`join_date_id`) REFERENCES `DimDate` (`id`);

--
-- Constraints for table `DimVariation`
--
ALTER TABLE `DimVariation`
  ADD CONSTRAINT `fk_cardset_variation` FOREIGN KEY (`cardset_id`) REFERENCES `DimCardset` (`id`);

--
-- Constraints for table `FactInventory`
--
ALTER TABLE `FactInventory`
  ADD CONSTRAINT `fk_card_inv` FOREIGN KEY (`card_id`) REFERENCES `DimCard` (`id`),
  ADD CONSTRAINT `fk_condition_inv` FOREIGN KEY (`condition_id`) REFERENCES `DimCondition` (`id`),
  ADD CONSTRAINT `fk_date_inv` FOREIGN KEY (`acquisition_date_id`) REFERENCES `DimDate` (`id`),
  ADD CONSTRAINT `fk_folder_inv` FOREIGN KEY (`folder_id`) REFERENCES `DimFolder` (`id`),
  ADD CONSTRAINT `fk_owner_inv` FOREIGN KEY (`owner_id`) REFERENCES `DimUser` (`id`);

--
-- Constraints for table `FactTransaction`
--
ALTER TABLE `FactTransaction`
  ADD CONSTRAINT `fk_buyer_tran` FOREIGN KEY (`buyer`) REFERENCES `DimUser` (`id`),
  ADD CONSTRAINT `fk_card_tran` FOREIGN KEY (`card_id`) REFERENCES `DimCard` (`id`),
  ADD CONSTRAINT `fk_condition_tran` FOREIGN KEY (`condition_id`) REFERENCES `DimCondition` (`id`),
  ADD CONSTRAINT `fk_date_tran` FOREIGN KEY (`transaction_date_id`) REFERENCES `DimDate` (`id`),
  ADD CONSTRAINT `fk_seller_tran` FOREIGN KEY (`seller`) REFERENCES `DimUser` (`id`),
  ADD CONSTRAINT `fk_transactiontype_transaction` FOREIGN KEY (`transaction_type_id`) REFERENCES `DimTransactionType` (`id`);
COMMIT;