-- GovernmentScreen_KingOfSecretSociety
-- Author: Konomi
-- DateCreated: 8/14/2022 20:23:53
--------------------------------------------------------------

-- =================================================================================
-- Import base file
-- =================================================================================
-- It seems that in Dramatic Age mode, 'GovernmentScreen_Byzantium_Gaul_Expansion2_MODE.lua' will not be loaded.
-- IDK the reason. So those replacements in the file have to be copied to this file.
-- Fuck Firaxis
local files = {
	"GovernmentScreen_Byzantium_Gaul_Expansion2_MODE.lua",
    "GovernmentScreen_Expansion2.lua",
    "GovernmentScreen.lua",
}

for _, file in ipairs(files) do
    include(file)
    if Initialize then
        print("King Of Secret Society: Loading " .. file .. " as base file");
        break
    end
end

-- ===========================================================================
--	CACHE BASE FUNCTIONS
-- ===========================================================================
local ORIGINAL_GetPolicyBGTexture = GetPolicyBGTexture;
local ORIGINAL_PopulateLivePlayerData = PopulateLivePlayerData;
local ORIGINAL_RealizeFilterTabs = RealizeFilterTabs;
local ORIGINAL_LateInitialize = LateInitialize;
-- ===========================================================================
--	VARIABLES
-- ===========================================================================
local m_ShowNotification = false
local m_PoliciesToShow = {}
local m_KossGovernorInfo = GameInfo.Governors and GameInfo.Governors['GOVERNOR_KNM_KING_OF_SECRET_SOCIETY']
local m_CodeOfLawsInfo = GameInfo.Civics['CIVIC_CODE_OF_LAWS']
local m_IsDramaticAgeModeOn = GameConfiguration.GetValue('GAMEMODE_DRAMATICAGES')
-- ===========================================================================
--	OVERRIDES
-- ===========================================================================
function FilterKingPolicies(policy)
    local policyDef:table = GameInfo.Policies[policy.PolicyHash];
    if policyDef and string.sub(policyDef.PolicyType, 1, 12) == 'POLICY_KOSS_' then
        return true;
    end
    return false;
end
-- ===========================================================================
-- Copy from GovernmentScreen_Byzantium_Gaul_Expansion2_MODE.lua
function FilterGoldenPolicies(policy)
    local policyDef:table = GameInfo.Policies_XP1[policy.PolicyHash];
    if policyDef ~= nil and policyDef.RequiresGoldenAge then
        return true;
    end
    return false;
end
-- ===========================================================================
function GetPolicyBGTexture(policyType)
	if m_IsDramaticAgeModeOn then
		-- Copy from GovernmentScreen_Byzantium_Gaul_Expansion2_MODE.lua
		local expansionPolicy:table = GameInfo.Policies_XP1[policyType];
		if expansionPolicy and expansionPolicy.RequiresGoldenAge then
			return "Governments_GoldenCard";
		end
	end

	local str = string.sub(policyType, 1, 16)
	if GameInfo.KOSS_SocietyPolicyBackgrounds[str] then
		return GameInfo.KOSS_SocietyPolicyBackgrounds[str].Background
	end
	
	return ORIGINAL_GetPolicyBGTexture(policyType);
end
-- ===========================================================================
function PopulateLivePlayerData( ePlayer:number )
	
	if ePlayer == PlayerTypes.NONE then
		return;
	end

	ORIGINAL_PopulateLivePlayerData(ePlayer);

	if(ePlayer == Game.GetLocalPlayer() and m_kUnlockedPolicies) then

		if m_IsDramaticAgeModeOn then
			-- Copy from GovernmentScreen_Byzantium_Gaul_Expansion2_MODE.lua
			local eraTable:table = Game.GetEras();
			if eraTable:HasDarkAge(ePlayer) and Game.GetCurrentGameTurn() == eraTable:GetCurrentEraStartTurn() then
				for policyType, isUnlocked in pairs(m_kUnlockedPolicies) do
					if isUnlocked then
						local expansionPolicy:table = GameInfo.Policies_XP1[policyType];
						if expansionPolicy and expansionPolicy.RequiresDarkAge then
							m_kNewPoliciesThisTurn[policyType] = true;
						end
					end
				end
			end
		end

		if m_ShowNotification then
			for policyType, _ in pairs(m_PoliciesToShow) do
				m_kNewPoliciesThisTurn[policyType] = true;
			end
			m_PoliciesToShow = {}
		end
	end 
end

-- ===========================================================================
function RealizeFilterTabs()
	ORIGINAL_RealizeFilterTabs();

	if m_IsDramaticAgeModeOn then
		-- Copy from GovernmentScreen_Byzantium_Gaul_Expansion2_MODE.lua
		CreatePolicyTabButton("LOC_GOVT_FILTER_GOLDEN", FilterGoldenPolicies);
	end

    CreatePolicyTabButton("LOC_GOVT_FILTER_KING_OF_SECRET_SOCIETY", FilterKingPolicies);
end

-- ===========================================================================
function UnlockPolicies(playerID, promotions)
	--print('UnlockPolicies!')
	for _, promotion in ipairs(promotions) do
		UI.RequestPlayerOperation(playerID, PlayerOperations.EXECUTE_SCRIPT, {
			OnStart = 'KOSS_UnlockPolicy',
			GovernorPromotionType = promotion,
		});
		for row in GameInfo.KOSS_GovernorPromotionPolicies() do
			if row.GovernorPromotionType == promotion then
				m_PoliciesToShow[row.PolicyType] = true
			end
		end
	end

	-- Once the player saves the game and loads, this data will lose. But it doesn't matter.
	m_ShowNotification = true
	Events.TurnBegin.Add(OnTurnBegin)
end
-- ===========================================================================
function OnGovernorPromoted(ePlayer, eGovernor, ePromotion)
	if ePlayer ~= Game.GetLocalPlayer() or m_CodeOfLawsInfo == nil then
		return
	end
	local governorPromotionInfo = GameInfo.GovernorPromotions[ePromotion]
	if governorPromotionInfo and string.sub(governorPromotionInfo.GovernorPromotionType, 1, 42) == 'GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_' then
		local pPlayer = Players[ePlayer]
		if pPlayer and pPlayer:GetCulture():HasCivic(m_CodeOfLawsInfo.Index) then
			UnlockPolicies(ePlayer, {governorPromotionInfo.GovernorPromotionType})
		end
	end
end
-- ===========================================================================
function OnCivicCompleted(playerID, iCivic, bCancelled)
	--print('OnCivicCompleted', playerID, iCivic, bCancelled)
	if playerID ~= Game.GetLocalPlayer() or m_CodeOfLawsInfo == nil or m_KossGovernorInfo == nil then
		return
	end
	local pPlayer = Players[playerID]
	if pPlayer and m_CodeOfLawsInfo.Index == iCivic then
		local playerGovernors:object = pPlayer:GetGovernors();
		if playerGovernors == nil then
			return
		end
		local _, tGovernorList = playerGovernors:GetGovernorList();
		for _, pAppointedGovernor:table in ipairs(tGovernorList) do
			if pAppointedGovernor:GetType() == m_KossGovernorInfo.Index then
				local promotions = {
					'GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_1', 'GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_2', 
					'GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_3', 'GOVERNOR_PROMOTION_KING_OF_SECRET_SOCIETY_4',
				}
				local promotionsToUnlock = {}
				for _, promotion in ipairs(promotions) do
					if pAppointedGovernor:HasPromotion(DB.MakeHash(promotion)) then
						table.insert(promotionsToUnlock, promotion)
					end
				end
				UnlockPolicies(playerID, promotionsToUnlock)
				break
			end
		end
	end
end
-- ===========================================================================
function OnTurnBegin(a)
	m_ShowNotification = false
	Events.TurnBegin.Remove(OnTurnBegin)
end

-- ===========================================================================
function LateInitialize()
	ORIGINAL_LateInitialize()
	Events.CivicCompleted.Add(OnCivicCompleted)
	Events.GovernorPromoted.Add(OnGovernorPromoted)
end
