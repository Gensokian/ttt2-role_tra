if SERVER then
	AddCSLuaFile()

	resource.AddFile('materials/vgui/ttt/dynamic/roles/icon_pha.vmt')
end

ROLE.Base = 'ttt_role_base'

function ROLE:PreInitialize()
	self.color = Color(52, 70, 92, 255)

	self.abbr = 'tra'
	self.surviveBonus = 0
	self.scoreKillsMultiplier = 1
	self.scoreTeamKillsMultiplier = -16
	self.preventFindCredits = true
	self.preventKillCredits = true
	self.preventTraitorAloneCredits = true
	self.preventWin = false
	self.unknownTeam = true

	self.defaultTeam = TEAM_INNOCENT

	self.conVarData = {
		pct = 0.17, -- necessary: percentage of getting this role selected (per player)
		maximum = 1, -- maximum amount of roles in a round
		minPlayers = 8, -- minimum amount of players until this role is able to get selected
		credits = 0, -- the starting credits of a specific role
		shopFallback = SHOP_DISABLED,
		togglable = true, -- option to toggle a role for a client if possible (F1 menu)
		random = 45
	    traitorButton = 1, -- can use traitor buttons
	}
end

function ROLE:Initialize()
	if CLIENT then
		-- Role specific language elements
		LANG.AddToLanguage('English', TRAPPER.name, 'Trapper')
		LANG.AddToLanguage('English', 'info_popup_' .. TRAPPER.name,
			[[You are the Trapper!
			Use your ability to use traitor-traps to your advantage.!]])
		LANG.AddToLanguage('English', 'body_found_' .. TRAPPER.abbr, 'They were a Trapper.')
		LANG.AddToLanguage('English', 'search_role_' .. TRAPPER.abbr, 'This person was a Trapper!')
		LANG.AddToLanguage('English', 'target_' .. TRAPPER.name, 'Trapper')
		LANG.AddToLanguage('English', 'ttt2_desc_' .. TRAPPER.name, [[The Trapper is an innocent player that has the special ability to activate traitor traps!]])

		LANG.AddToLanguage('Deutsch', TRAPPER.name, 'Fallensteller')
		LANG.AddToLanguage('Deutsch', 'info_popup_' .. TRAPPER.name,
			[[Du bist ein Fallensteller!
			Der Fallensteller kann gegnerische T-Fallen identifizieren und verwenden!]])
		LANG.AddToLanguage('Deutsch', 'body_found_' .. TRAPPER.abbr, 'Er war ein Fallensteller.')
		LANG.AddToLanguage('Deutsch', 'search_role_' .. TRAPPER.abbr, 'Diese Person war ein Fallensteller!')
		LANG.AddToLanguage('Deutsch', 'target_' .. TRAPPER.name, 'Fallensteller')
		LANG.AddToLanguage('Deutsch', 'ttt2_desc_' .. TRAPPER.name, [[Der Fallensteller ist ein unschuldiger Spieler, der seine Kraft, Fallen auszulösen, gegen die Tiere einsetzen muss!]])
    
    	LANG.AddToLanguage('French', TRAPPER.name, 'Le Trappeur')
		LANG.AddToLanguage('French', 'info_popup_' .. TRAPPER.name,
			[[Tu es un trappeur!
			Le trappeur peut identifier et utiliser les pièges ennemis!]])
		LANG.AddToLanguage('French', 'body_found_' .. TRAPPER.abbr, 'Il était un trappeur!')
		LANG.AddToLanguage('French', 'search_role_' .. TRAPPER.abbr, 'Cette personne était un trappeur!')
		LANG.AddToLanguage('French', 'target_' .. TRAPPER.name, 'Trappeur')
		LANG.AddToLanguage('French', 'ttt2_desc_' .. TRAPPER.name, [[Le trappeur est un joueur innocent qui doit utiliser son pouvoir pour poser des pièges contre l'ennemi!!]])
	end
end
