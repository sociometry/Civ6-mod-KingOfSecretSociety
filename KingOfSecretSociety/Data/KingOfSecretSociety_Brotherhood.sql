-- KingOfSecretSociety_Brotherhood
-- Author: Konomi
-- DateCreated: 9/13/2022 13:32:49
--------------------------------------------------------------

INSERT INTO Types 
		(Type,								Kind)
VALUES 	('POLICY_KOSS_BROTHERHOOD_1',		'KIND_POLICY'),
	 	('POLICY_KOSS_BROTHERHOOD_2',		'KIND_POLICY'),
	 	('POLICY_KOSS_BROTHERHOOD_3',		'KIND_POLICY'),
	 	('POLICY_KOSS_BROTHERHOOD_4',		'KIND_POLICY');

INSERT INTO Policies 
		(PolicyType,						Name,																	Description,										GovernmentSlotType,		ExplicitUnlock)
VALUES 	('POLICY_KOSS_BROTHERHOOD_1',		'[ICON_SECRETSOCIETY_BOS] 1 {LOC_GOVERNOR_PROMOTION_BOS_1_NAME}',		'LOC_POLICY_KOSS_BROTHERHOOD_1_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_BROTHERHOOD_2',		'[ICON_SECRETSOCIETY_BOS] 2 {LOC_GOVERNOR_PROMOTION_BOS_2_NAME}',		'LOC_POLICY_KOSS_BROTHERHOOD_2_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_BROTHERHOOD_3',		'[ICON_SECRETSOCIETY_BOS] 3 {LOC_GOVERNOR_PROMOTION_BOS_3_NAME}',		'LOC_POLICY_KOSS_BROTHERHOOD_3_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_BROTHERHOOD_4',		'[ICON_SECRETSOCIETY_BOS] 4 {LOC_GOVERNOR_PROMOTION_BOS_4_NAME}',		'LOC_POLICY_KOSS_BROTHERHOOD_4_DESCRIPTION',		'SLOT_WILDCARD',	 	1);

INSERT INTO KOSS_GovernorPromotionPolicies
		(GovernorPromotionType,								PolicyType)
VALUES	('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_1',		'POLICY_KOSS_BROTHERHOOD_1'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_2',		'POLICY_KOSS_BROTHERHOOD_2'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_3',		'POLICY_KOSS_BROTHERHOOD_3'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_4',		'POLICY_KOSS_BROTHERHOOD_4');

INSERT INTO KOSS_PolicyAttachModifiers
		(PolicyType,								ModifierID)
VALUES	('POLICY_KOSS_BROTHERHOOD_1',				'MODIFIER_GOVERNOR_PROMOTION_BOS_1_UNIT_VB'),
		('POLICY_KOSS_BROTHERHOOD_2',				'MODIFIER_GOVERNOR_PROMOTION_BOS_1_UNIT_VB'),
		('POLICY_KOSS_BROTHERHOOD_3',				'MODIFIER_GOVERNOR_PROMOTION_BOS_1_UNIT_VB');

INSERT INTO KOSS_SocietyPolicyBackgrounds
		(PolicyPrefix,				Background)
VALUES	('POLICY_KOSS_BROT',		'Governments_KOSS_OtherCard');

INSERT INTO PolicyModifiers
		(PolicyType,						ModifierId)
VALUES	('POLICY_KOSS_BROTHERHOOD_1',		'MODIFIER_GOVERNOR_PROMOTION_BOS_1_GREAT_PERSON'),
		('POLICY_KOSS_BROTHERHOOD_1',		'MODIFIER_GOVERNOR_PROMOTION_BOS_1_UNIT_UNLOCK'),
		('POLICY_KOSS_BROTHERHOOD_2',		'MODIFIER_GOVERNOR_PROMOTION_BOS_2_GREAT_PERSON'),
		('POLICY_KOSS_BROTHERHOOD_2',		'MODIFIER_GOVERNOR_PROMOTION_BOS_2_UNIT_UNLOCK'),
		('POLICY_KOSS_BROTHERHOOD_3',		'MODIFIER_GOVERNOR_PROMOTION_BOS_3_GREAT_PERSON'),
		('POLICY_KOSS_BROTHERHOOD_3',		'MODIFIER_GOVERNOR_PROMOTION_BOS_3_UNIT_UNLOCK'),
		('POLICY_KOSS_BROTHERHOOD_3',		'MODIFIER_GOVERNOR_PROMOTION_BOS_3_UNIT_UNLOCK3'),
		('POLICY_KOSS_BROTHERHOOD_4',		'MODIFIER_GOVERNOR_PROMOTION_BOS_4_GREAT_PERSON'),
		('POLICY_KOSS_BROTHERHOOD_4',		'MODIFIER_GOVERNOR_PROMOTION_BOS_4_UNIT_UNLOCK');
