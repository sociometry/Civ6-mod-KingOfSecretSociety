-- KingOfSecretSociety_GreatWorks
-- Author: Konomi
-- DateCreated: 8/1/2022 00:45:54
--------------------------------------------------------------

INSERT INTO Types (Type, Kind)
SELECT GreatWorkType || '123', 'KIND_GREATWORK' FROM GreatWorks_MODE;

INSERT INTO GreatWorks (GreatWorkType, GreatWorkObjectType, Name, Tourism)
SELECT m.GreatWorkType || '123', 'GREATWORKOBJECT_RELIC', Name, Tourism FROM GreatWorks_MODE m, GreatWorks g WHERE m.GreatWorkType = g.GreatWorkType;

INSERT INTO GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
SELECT m.GreatWorkType || '123', YieldType, YieldChange FROM GreatWorks_MODE m, GreatWork_YieldChanges g WHERE m.GreatWorkType = g.GreatWorkType;

INSERT INTO GreatWorks_MODE (GreatWorkType, RequiredGovernor)
SELECT GreatWorkType || '123', 'GOVERNOR_KNM_KING_OF_SECRET_SOCIETY' FROM GreatWorks_MODE;
