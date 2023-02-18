-- KingOfSecretSociety_Schema
-- Author: Konomi
-- DateCreated: 8/15/2022 10:18:23
--------------------------------------------------------------

CREATE TABLE KOSS_GovernorPromotionPolicies(
	'PolicyType' TEXT NOT NULL,	
	'GovernorPromotionType' TEXT NOT NULL,
	'Ban' BOOLEAN NOT NULL CHECK (Ban IN (0,1)) DEFAULT 0,
    PRIMARY KEY(PolicyType),
	FOREIGN KEY (GovernorPromotionType) REFERENCES GovernorPromotions(GovernorPromotionType) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (PolicyType) REFERENCES Policies(PolicyType) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE KOSS_PolicyAttachModifiers(
	'PolicyType' TEXT NOT NULL,	
	'ModifierID' TEXT NOT NULL,
    PRIMARY KEY(PolicyType, ModifierID),
	FOREIGN KEY (PolicyType) REFERENCES Policies(PolicyType) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE KOSS_SocietyPolicyBackgrounds(
	'PolicyPrefix' TEXT NOT NULL,	
	'Background' TEXT NOT NULL,	
	PRIMARY KEY(PolicyPrefix)
);

CREATE TRIGGER CreateBanModifier AFTER INSERT ON KOSS_GovernorPromotionPolicies WHEN New.Ban = 1 BEGIN
	INSERT INTO Modifiers
			(ModifierId,							ModifierType,										RunOnce,	Permanent)
	VALUES	('KOSS_BAN_' || New.PolicyType,			'MODIFIER_KOSS_PLAYER_ADJUST_BANNED_POLICY',		1,			1);

	INSERT INTO ModifierArguments
			(ModifierId,							Name,					Value)
	VALUES	('KOSS_BAN_' || New.PolicyType,			'PolicyType',			New.PolicyType);
END;
