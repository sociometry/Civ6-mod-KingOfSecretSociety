-- SecretSocietyPopup
-- DateCreated: 7/25/2022 12:48:13 PM
--------------------------------------------------------------
-- This is a clone of the official Firaxis file with the exception of the first section

-- ===========================================================================
--	CONSTANTS
-- ===========================================================================

local kDiscoveredImages:table = {};

for row in GameInfo.Mod_SecretSocietyPopupData() do
	kDiscoveredImages[row.Society] = row.FileName;
end

-- ===========================================================================
function OnContinueButton()
	Close();
end

-- ===========================================================================
function OnOpenGovernorsButton()
	Close();
	LuaEvents.GovernorPanel_Open();
end

-- ===========================================================================
function Open()
	UIManager:QueuePopup(ContextPtr, PopupPriority.Low);
end

-- ===========================================================================
function Close()
	UIManager:DequeuePopup(ContextPtr);
end

-- ===========================================================================
function OnInputHandler( pInputStruct:table )
	local uiMsg :number = pInputStruct:GetMessageType();
	if uiMsg == KeyEvents.KeyUp and pInputStruct:GetKey() == Keys.VK_ESCAPE then
		Close();
		return true;
	end
	return false;
end

-- ===========================================================================
function OnInit(isReload:boolean)
	LateInitialize();
end

-- ===========================================================================
function OnSecretSocietyDiscovered( pNotification:table )
	--print('popup OnSecretSocietyDiscovered')
	if pNotification == nil then
		return;
	end

	local eType:number = pNotification:GetType();
	if eType ~= NotificationTypes.SECRETSOCIETY_DISCOVERED then
		return;
	end

	ShowDiscovery(pNotification);
end

-- ===========================================================================
function ShowDiscovery(pNotification:table)

	local ePlayer:number = pNotification:GetValue( "PARAM_DATA0" );
	if ePlayer ~= Game.GetLocalPlayer() then
		return;
	end
	local kPlayer:table = Players[ePlayer];
	if kPlayer == nil then
		return;
	end
	local kPlayerGovernors:table = kPlayer:GetGovernors();
	if kPlayerGovernors == nil then
		return;
	end

	local eSociety:number = pNotification:GetValue( "PARAM_DATA1" );
	local kSocietyDef:table = GameInfo.SecretSocieties[eSociety];
	if kSocietyDef == nil then
		return;
	end

	local bIsFirstDiscovery:boolean = pNotification:GetValue( "PARAM_DATA2" );

	Controls.EventTitle:SetText(Locale.ToUpper(Locale.Lookup("LOC_DISCOVERED_SOCIETY", kSocietyDef.Name)));

	if bIsFirstDiscovery then
		Controls.EventDescription:SetText(Locale.Lookup("LOC_DISCOVERED_SOCIETY_FIRST_DESC", kSocietyDef.Name, kSocietyDef.IconString));
	else
		Controls.EventDescription:SetText(Locale.Lookup("LOC_DISCOVERED_SOCIETY_SUBSEQUENT_DESC", kSocietyDef.Name, kSocietyDef.IconString));
	end
	
	Controls.SocietyImage:SetTexture(kDiscoveredImages[kSocietyDef.SecretSocietyType]);
	local memberSocietyHash = kPlayerGovernors:GetSecretSociety();
	local kMemberSocietyDef:table = GameInfo.SecretSocieties[memberSocietyHash];
	if (kMemberSocietyDef ~= nil) then
		Controls.SocietyDescription:SetText(Locale.Lookup("LOC_DISCOVERED_SOCIETY_WHILE_MEMBER_OF_ANOTHER", kSocietyDef.Name, kMemberSocietyDef.Name));		
	else
		Controls.SocietyDescription:SetText(Locale.Lookup(kSocietyDef.DiscoveryText));
	end

	Open();

	--Dismiss the notification right away so that the notification manager does not see others as duplicates
	NotificationManager.Dismiss(pNotification:GetPlayerID(), pNotification:GetID());
end

-- ===========================================================================
function OnSecretSocietyJoined( pNotification:table )
	if pNotification == nil then
		return;
	end

	local eType:number = pNotification:GetType();
	if eType ~= NotificationTypes.SECRETSOCIETY_JOINED then
		return;
	end

	local ePlayer:number = pNotification:GetValue( "PARAM_DATA0" );
	local eSociety:number = pNotification:GetValue( "PARAM_DATA1" );

	ShowJoined(ePlayer, eSociety);
end

-- ===========================================================================
function ShowJoined(ePlayer:number, eSociety:number)

	if ePlayer ~= Game.GetLocalPlayer() then
		return;
	end

	local kSocietyDef:table = GameInfo.SecretSocieties[eSociety];
	if kSocietyDef == nil then
		return;
	end

	Controls.EventTitle:SetText(Locale.ToUpper(Locale.Lookup("LOC_JOINED_SOCIETY", kSocietyDef.Name)));
	Controls.EventDescription:SetText(Locale.Lookup("LOC_JOINED_SOCIETY_DESC", kSocietyDef.Name, kSocietyDef.IconString));
	
	Controls.SocietyImage:SetTexture("SecretSocieties_EventsFG_Discover");
	Controls.SocietyDescription:SetText(Locale.Lookup(kSocietyDef.MembershipText));

	Open();
end

-- ===========================================================================
function Subscribe()
	LuaEvents.NotificationPanel_SecretSocietyDiscovered.Add( OnSecretSocietyDiscovered );
	LuaEvents.NotificationPanel_SecretSocietyJoined.Add( OnSecretSocietyJoined );
end

-- ===========================================================================
function Unsubscribe()
	LuaEvents.NotificationPanel_SecretSocietyDiscovered.Remove( OnSecretSocietyDiscovered );
	LuaEvents.NotificationPanel_SecretSocietyJoined.Remove( OnSecretSocietyJoined );
end

-- ===========================================================================
function OnShutdown()
	Unsubscribe();
end

-- ===========================================================================
function LateInitialize()
	Subscribe();
end

-- ===========================================================================
function Initialize()
	ContextPtr:SetInitHandler( OnInit );
	ContextPtr:SetInputHandler( OnInputHandler, true );
	ContextPtr:SetShutdown( OnShutdown );

	Controls.OpenGovernorsButton:RegisterCallback( Mouse.eLClick, OnOpenGovernorsButton );
	Controls.ContinueButton:RegisterCallback( Mouse.eLClick, OnContinueButton );
end
Initialize();