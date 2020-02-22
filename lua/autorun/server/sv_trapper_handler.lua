util.AddNetworkString("ttt2_role_trapper_used_tbutton")

hook.Add("TTTTraitorButtonActivated", "ttt2_role_trapper_button_used", function(but, ply)
	if not IsValid(but) or not IsValid(ply) or not ply:IsPlayer() then return end

	-- INFORM TRAPPERS ABOUT BUTTON USE
	if GetConVar("ttt_trapper_tbutton_show_to_trapper"):GetBool() and ply:GetSubRole() ~= ROLE_TRAPPER then
		local players = player.GetAll()
		local sendToPlayerTbl = {}

		for i = 1, #players do
			local p = players[i]

			if p:GetSubRole() ~= ROLE_TRAPPER then continue end

			sendToPlayerTbl[#sendToPlayerTbl + 1] = p
		end

		local butPos = but:GetPos()

		net.Start("ttt2_role_trapper_used_tbutton")
		net.WriteBool(false)
		net.WriteFloat(butPos.x)
		net.WriteFloat(butPos.y)
		net.WriteFloat(butPos.z)
		net.Send(sendToPlayerTbl)
	end

	-- INFORM OTHER BUTTON ROLES ABOUT TRAPPER BUTTON USE
	if GetConVar("ttt_trapper_tbutton_show_to_others"):GetBool() and ply:GetSubRole() == ROLE_TRAPPER then
		local players = player.GetAll()
		local sendToPlayerTbl = {}

		for i = 1, #players do
			local p = players[i]

			-- do not send info to trappers
			if p:GetSubRole() == ROLE_TRAPPER then continue end

			local roleName = roles.GetRoleByIndex(p:GetSubRole()).name

			-- do not send info to players that can't use tButtons
			if not GetConVar("ttt_" .. roleName .. "_traitor_button"):GetBool() then continue end

			sendToPlayerTbl[#sendToPlayerTbl + 1] = p
		end

		local butPos = but:GetPos()

		net.Start("ttt2_role_trapper_used_tbutton")
		net.WriteBool(true)
		net.WriteFloat(butPos.x)
		net.WriteFloat(butPos.y)
		net.WriteFloat(butPos.z)
		net.Send(sendToPlayerTbl)
	end
end)
