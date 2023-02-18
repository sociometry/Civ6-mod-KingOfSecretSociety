-- KingOfSecretSociety_NatureMach
-- Author: Konomi
-- DateCreated: 9/5/2022 18:25:31
--------------------------------------------------------------

INSERT INTO Types 
		(Type,								Kind)
VALUES 	('POLICY_KOSS_NATUREMACH_1',		'KIND_POLICY'),
	 	('POLICY_KOSS_NATUREMACH_2',		'KIND_POLICY'),
	 	('POLICY_KOSS_NATUREMACH_3',		'KIND_POLICY'),
	 	('POLICY_KOSS_NATUREMACH_4',		'KIND_POLICY');

INSERT INTO Policies 
		(PolicyType,						Name,																			Description,									GovernmentSlotType,		ExplicitUnlock)
VALUES 	('POLICY_KOSS_NATUREMACH_1',		'[ICON_SECRETSOCIETY_NATURAL] 1 {LOC_GOVERNOR_PROMOTION_NATURAL_1_NAME}',		'LOC_POLICY_KOSS_NATUREMACH_1_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_NATUREMACH_2',		'[ICON_SECRETSOCIETY_NATURAL] 2 {LOC_GOVERNOR_PROMOTION_NATURAL_2_NAME}',		'LOC_POLICY_KOSS_NATUREMACH_2_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_NATUREMACH_3',		'[ICON_SECRETSOCIETY_NATURAL] 3 {LOC_GOVERNOR_PROMOTION_NATURAL_3_NAME}',		'LOC_POLICY_KOSS_NATUREMACH_3_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_NATUREMACH_4',		'[ICON_SECRETSOCIETY_NATURAL] 4 {LOC_GOVERNOR_PROMOTION_NATURAL_4_NAME}',		'LOC_POLICY_KOSS_NATUREMACH_4_DESCRIPTION',		'SLOT_WILDCARD',	 	1);

INSERT INTO KOSS_GovernorPromotionPolicies
		(GovernorPromotionType,								PolicyType)
VALUES	('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_1',		'POLICY_KOSS_NATUREMACH_1'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_2',		'POLICY_KOSS_NATUREMACH_2'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_3',		'POLICY_KOSS_NATUREMACH_3'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_4',		'POLICY_KOSS_NATUREMACH_4');

INSERT INTO KOSS_SocietyPolicyBackgrounds
		(PolicyPrefix,				Background)
VALUES	('POLICY_KOSS_NATU',		'Governments_KOSS_OtherCard');

INSERT INTO PolicyModifiers
		(PolicyType,						ModifierId)
VALUES	('POLICY_KOSS_NATUREMACH_1',		'NATURAL_FEATURE_APPEAL_JUNGLE'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_FEATURE_APPEAL_FLOODPLAINS'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_FEATURE_APPEAL_MARSH'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_FOREST_UNLOCK'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_CHARMING_PRODUCTION'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_CHARMING_GOLD'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_DISTRICTS_YIELD_SCIENCE_1'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_DISTRICTS_YIELD_PRODUCTION_1'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_DISTRICTS_YIELD_GOLD_1'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_DISTRICTS_YIELD_FAITH_1'),
		('POLICY_KOSS_NATUREMACH_1',		'NATURAL_DISTRICTS_YIELD_CULTURE_1'),
		('POLICY_KOSS_NATUREMACH_2',		'NATURAL_CITY_APPEAL'),
		('POLICY_KOSS_NATUREMACH_2',		'NATURAL_PLOT_YIELD_PRODUCTION'),
		('POLICY_KOSS_NATUREMACH_2',		'NATURAL_PLOT_YIELD_GOLD'),
		('POLICY_KOSS_NATUREMACH_2',		'NATURAL_DISTRICTS_YIELD_SCIENCE'),
		('POLICY_KOSS_NATUREMACH_2',		'NATURAL_DISTRICTS_YIELD_PRODUCTION'),
		('POLICY_KOSS_NATUREMACH_2',		'NATURAL_DISTRICTS_YIELD_GOLD'),
		('POLICY_KOSS_NATUREMACH_2',		'NATURAL_DISTRICTS_YIELD_FAITH'),
		('POLICY_KOSS_NATUREMACH_2',		'NATURAL_DISTRICTS_YIELD_CULTURE'),
		('POLICY_KOSS_NATUREMACH_3',		'NATURAL_CITY_APPEAL_1'),
		('POLICY_KOSS_NATUREMACH_3',		'NATURAL_FOREST_NO_IMPROVEMENT'),
		('POLICY_KOSS_NATUREMACH_3',		'NATURAL_JUNGLE_NO_IMPROVEMENT'),
		('POLICY_KOSS_NATUREMACH_3',		'NATURAL_WORK_GRASS_MOUNTAIN'),
		('POLICY_KOSS_NATUREMACH_3',		'NATURAL_WORK_PLAINS_MOUNTAIN'),
		('POLICY_KOSS_NATUREMACH_3',		'NATURAL_WORK_DESERT_MOUNTAIN'),
		('POLICY_KOSS_NATUREMACH_3',		'NATURAL_WORK_TUNDRA_MOUNTAIN'),
		('POLICY_KOSS_NATUREMACH_3',		'NATURAL_WORK_SNOW_MOUNTAIN'),
		('POLICY_KOSS_NATUREMACH_4',		'NATURAL_ALLOW_PROJECT');