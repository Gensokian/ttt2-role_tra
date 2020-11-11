CreateConVar("ttt_trapper_tbutton_show_to_trapper", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_trapper_tbutton_show_to_others", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_trapper_convars", function(tbl)
	tbl[ROLE_TRAPPER] = tbl[ROLE_TRAPPER] or {}

	table.insert(tbl[ROLE_TRAPPER], {
		cvar = "ttt_trapper_tbutton_show_to_trapper",
		checkbox = true,
		desc = "ttt_trapper_tbutton_show_to_trapper (def. 1)"
	})

	table.insert(tbl[ROLE_TRAPPER], {
		cvar = "ttt_trapper_tbutton_show_to_others",
		checkbox = true,
		desc = "ttt_trapper_tbutton_show_to_others (def. 1)"
	})
end)
