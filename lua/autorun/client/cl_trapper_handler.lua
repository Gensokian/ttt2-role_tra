local refractMaterial = Material("vgui/ttt/trapper_refract")
local refractData = {}

local EFFECT_TIME = 2

net.Receive("ttt2_role_trapper_used_tbutton", function()
	local wasTrapperUse = net.ReadBool()
	local butPos = Vector(
		net.ReadFloat(),
		net.ReadFloat(),
		net.ReadFloat()
	)

	refractData[#refractData + 1] = {
		wasTrapperUse = wasTrapperUse,
		butPos = butPos,
		time = CurTime()
	}
end)


hook.Add("PreDrawEffects","TTT2_TrapperRipple",function()
	local effectAmount = #refractData

	if effectAmount == 0 then return end

	-- iterate over all effects and handle them seperately
	for i = 1, effectAmount do
		-- get effect from table
		local effect = refractData[i]

		-- calculate size based on time
		local refractSize = (CurTime() - effect.time) ^ 2 * 2048

		-- draw in 3D space
		cam.Start3D()
		render.SetMaterial(refractMaterial)
		render.DrawSprite(effect.butPos, refractSize, refractSize, COLOR_WHITE)
		cam.End3D()

		-- remove after render time
		if CurTime() - effect.time > EFFECT_TIME then
			table.remove(refractData, i)
		end
	end
end)
