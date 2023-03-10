-- KingOfSecretSociety_Hokusai
-- Author: Konomi
-- DateCreated: 8/15/2022 17:02:40
--------------------------------------------------------------

INSERT INTO Types 
		(Type,										Kind)
VALUES 	('POLICY_KOSS_HOKUSAI_OTO_1',				'KIND_POLICY'),
	 	('POLICY_KOSS_HOKUSAI_OTO_2',				'KIND_POLICY'),
	 	('POLICY_KOSS_HOKUSAI_OTO_3',				'KIND_POLICY'),
	 	('POLICY_KOSS_HOKUSAI_OTO_4',				'KIND_POLICY'),
		('POLICY_KOSS_HOKUSAI_KAS_1',				'KIND_POLICY'),
	 	('POLICY_KOSS_HOKUSAI_KAS_2',				'KIND_POLICY'),
	 	('POLICY_KOSS_HOKUSAI_KAS_3',				'KIND_POLICY'),
	 	('POLICY_KOSS_HOKUSAI_KAS_4',				'KIND_POLICY');

INSERT INTO Policies 
		(PolicyType,						Name,											Description,										GovernmentSlotType,		ExplicitUnlock)
VALUES 	('POLICY_KOSS_HOKUSAI_OTO_1',		'1 {LOC_GOVERNOR_PROMOTION_OTO_1_NAME}',		'LOC_POLICY_KOSS_HOKUSAI_OTO_1_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_HOKUSAI_OTO_2',		'2 {LOC_GOVERNOR_PROMOTION_OTO_2_NAME}',		'LOC_POLICY_KOSS_HOKUSAI_OTO_2_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_HOKUSAI_OTO_3',		'3 {LOC_GOVERNOR_PROMOTION_OTO_3_NAME}',		'LOC_POLICY_KOSS_HOKUSAI_OTO_3_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_HOKUSAI_OTO_4',		'4 {LOC_GOVERNOR_PROMOTION_OTO_4_NAME}',		'LOC_POLICY_KOSS_HOKUSAI_OTO_4_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
		('POLICY_KOSS_HOKUSAI_KAS_1',		'1 {LOC_GOVERNOR_PROMOTION_KAS_1_NAME}',		'LOC_POLICY_KOSS_HOKUSAI_KAS_1_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_HOKUSAI_KAS_2',		'2 {LOC_GOVERNOR_PROMOTION_KAS_2_NAME}',		'LOC_POLICY_KOSS_HOKUSAI_KAS_2_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_HOKUSAI_KAS_3',		'3 {LOC_GOVERNOR_PROMOTION_KAS_3_NAME}',		'LOC_POLICY_KOSS_HOKUSAI_KAS_3_DESCRIPTION',		'SLOT_WILDCARD',	 	1),
	 	('POLICY_KOSS_HOKUSAI_KAS_4',		'4 {LOC_GOVERNOR_PROMOTION_KAS_4_NAME}',		'LOC_POLICY_KOSS_HOKUSAI_KAS_4_DESCRIPTION',		'SLOT_WILDCARD',	 	1);

INSERT INTO KOSS_GovernorPromotionPolicies
		(GovernorPromotionType,								PolicyType)
VALUES	('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_1',		'POLICY_KOSS_HOKUSAI_OTO_1'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_2',		'POLICY_KOSS_HOKUSAI_OTO_2'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_3',		'POLICY_KOSS_HOKUSAI_OTO_3'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_4',		'POLICY_KOSS_HOKUSAI_OTO_4'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_1',		'POLICY_KOSS_HOKUSAI_KAS_1'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_2',		'POLICY_KOSS_HOKUSAI_KAS_2'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_3',		'POLICY_KOSS_HOKUSAI_KAS_3'),
		('GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_4',		'POLICY_KOSS_HOKUSAI_KAS_4');

INSERT INTO KOSS_SocietyPolicyBackgrounds
		(PolicyPrefix,				Background)
VALUES	('POLICY_KOSS_HOKU',		'Governments_KOSS_OtherCard');

INSERT INTO PolicyModifiers
		(PolicyType,						ModifierId)
VALUES	('POLICY_KOSS_HOKUSAI_OTO_1',		'OTO_1'),
		('POLICY_KOSS_HOKUSAI_OTO_1',		'OTO_2'),
		('POLICY_KOSS_HOKUSAI_OTO_1',		'OTO_Y'),
		('POLICY_KOSS_HOKUSAI_OTO_2',		'OTO_HA_1'),
		('POLICY_KOSS_HOKUSAI_OTO_2',		'OTO_HA_2'),
		('POLICY_KOSS_HOKUSAI_OTO_2',		'OTO_HA_3'),
		('POLICY_KOSS_HOKUSAI_OTO_3',		'OTO_DIP'),
		('POLICY_KOSS_HOKUSAI_OTO_4',		'OTO_PROJECT'),
		('POLICY_KOSS_HOKUSAI_KAS_1',		'KAS_CUL'),
		('POLICY_KOSS_HOKUSAI_KAS_2',		'KAS_APPRENTICE'),
		('POLICY_KOSS_HOKUSAI_KAS_3',		'KAS_GREATPEOPLE_1'),
		('POLICY_KOSS_HOKUSAI_KAS_3',		'KAS_GREATPEOPLE_2'),
		('POLICY_KOSS_HOKUSAI_KAS_3',		'KAS_ERN_1'),
		('POLICY_KOSS_HOKUSAI_KAS_3',		'KAS_ERN_2'),
		('POLICY_KOSS_HOKUSAI_KAS_4',		'KAS_PROJECT');
