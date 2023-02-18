-- KingOfSecretSociety_Schema_Mods
-- Author: Konomi
-- DateCreated: 9/13/2022 17:12:58
--------------------------------------------------------------

DROP TABLE IF EXISTS Mod_SecretSocietyPopupData;

CREATE TABLE Mod_SecretSocietyPopupData (
	'Governor' TEXT NOT NULL,
	'Society' TEXT NOT NULL,
	'FileName' TEXT,
	PRIMARY KEY(Governor),
	FOREIGN KEY (Governor) REFERENCES Governors(GovernorType) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Society) REFERENCES SecretSocieties(SecretSocietyType) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT OR REPLACE INTO Mod_SecretSocietyPopupData (Governor, Society)
SELECT GovernorType, SecretSocietyType
FROM SecretSocieties;

UPDATE Mod_SecretSocietyPopupData
SET FileName = (SELECT PortraitImageSelected FROM Governors WHERE GovernorType = Governor);
