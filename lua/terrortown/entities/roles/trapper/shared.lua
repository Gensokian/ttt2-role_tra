if SERVER then
	AddCSLuaFile()

	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_tra.vmt")
end

ROLE.Base = "ttt_role_base"

DEFINE_BASECLASS "ttt_role_base"

function ROLE:PreInitialize()
	self.color = Color(96, 113, 94, 255)

	self.abbr = "tra"
	self.surviveBonus = 0
	self.score.killsMultiplier = 2
	self.score.teamKillsMultiplier = -8

	self.preventFindCredits = true
	self.unknownTeam = true
	self.defaultTeam = TEAM_INNOCENT

	self.conVarData = {
		pct = 0.17,
		maximum = 1,
		minPlayers = 8,
		credits = 0,
		shopFallback = SHOP_DISABLED,
		togglable = true,
		random = 45,
		traitorButton = 1
	}
end

function ROLE:Initialize()
	roles.SetBaseRole(self, ROLE_INNOCENT)
end

function ROLE:IsSelectable(avoidHook)
	local buttons = ents.FindByClass("ttt_traitor_button")

	return GetConVar("ttt_newroles_enabled"):GetBool()
		and GetConVar("ttt_" .. self.name .. "_enabled"):GetBool()
		and (buttons and #buttons > 0)
		and BaseClass.IsSelectable(self, avoidHook)
end
