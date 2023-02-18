-- KingOfSecretSociety_Gameplay
-- Author: Konomi
-- DateCreated: 8/1/2022 13:23:07
--------------------------------------------------------------
local m_PolicyAttachModifiers = {}

function KOSS_UnlockPolicy(playerID:number, params:table)
	--print('KOSS_UnlockPolicy', playerID, params.GovernorPromotionType)
	if Players[playerID] then
		local pPlayerCulture : object = Players[playerID]:GetCulture()
		for row in GameInfo.KOSS_GovernorPromotionPolicies() do
			if row.GovernorPromotionType == params.GovernorPromotionType then
				pPlayerCulture:UnlockPolicy(GameInfo.Policies[row.PolicyType].Index)
			end
		end
	end
end
-- ===========================================================================
function OnGovernmentPolicyChanged(playerID:number, policyID:number)
	--print('OnGovernmentPolicyChanged', playerID, policyID)
	local pPlayer = Players[playerID]
	if pPlayer then
		local policyInfo = GameInfo.Policies[policyID]
		if policyInfo and string.sub(policyInfo.PolicyType, 1, 12) == 'POLICY_KOSS_' then
			local kossPolicyInfo = GameInfo.KOSS_GovernorPromotionPolicies[policyInfo.PolicyType]
			if kossPolicyInfo and kossPolicyInfo.Ban then
				if pPlayer:GetProperty(policyInfo.PolicyType .. '_TO_BAN') ~= 1 then
					pPlayer:SetProperty(policyInfo.PolicyType .. '_TO_BAN', 1)
				else
					pPlayer:AttachModifierByID('KOSS_BAN_' .. policyInfo.PolicyType)
				end
			end
		end
	end
end
-- ===========================================================================
function OnPolicyChanged(playerID:number, policyID:number, bEnacted:boolean)
	--print('OnPolicyChanged', playerID, policyID, bEnacted)
	local pPlayer = Players[playerID]
	if pPlayer then
		local policyInfo = GameInfo.Policies[policyID]
		if policyInfo and string.sub(policyInfo.PolicyType, 1, 12) == 'POLICY_KOSS_' and bEnacted and m_PolicyAttachModifiers[policyInfo.PolicyType] then
			if pPlayer:GetProperty(policyInfo.PolicyType) == nil then
				for _, modifier in ipairs(m_PolicyAttachModifiers[policyInfo.PolicyType]) do
					pPlayer:AttachModifierByID(modifier)
					--print('attach', modifier)
				end
				pPlayer:SetProperty(policyInfo.PolicyType, 1)
			end
		end
	end
end
-- ===========================================================================
function Initialize()
	local results = DB.Query('SELECT * FROM KOSS_PolicyAttachModifiers')
	if results then
		for _, row in ipairs(results) do
			if m_PolicyAttachModifiers[row.PolicyType] == nil then
				m_PolicyAttachModifiers[row.PolicyType] = {}
			end
			table.insert(m_PolicyAttachModifiers[row.PolicyType], row.ModifierID)
		end
	end

	GameEvents.KOSS_UnlockPolicy.Add(KOSS_UnlockPolicy)
	GameEvents.PolicyChanged.Add(OnPolicyChanged)
	Events.GovernmentPolicyChanged.Add(OnGovernmentPolicyChanged)
end

Events.LoadGameViewStateDone.Add(Initialize)
