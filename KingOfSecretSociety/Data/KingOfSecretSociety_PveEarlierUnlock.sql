-- KingOfSecretSociety_PveEarlierUnlock
-- Author: Konomi
-- DateCreated: 10/18/2022 2:17:14
--------------------------------------------------------------

UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_RENAISSANCE' WHERE GovernorPromotionType LIKE '%_3';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_INDUSTRIAL' WHERE GovernorPromotionType LIKE '%_4';
UPDATE GovernorPromotionConditions SET HiddenWithoutPrereqs = 0;
