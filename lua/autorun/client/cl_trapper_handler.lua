local refractMaterial = Material("vgui/ttt/trapper_refract")
local refractData

net.Receive("ttt2_role_trapper_used_tbutton", function()
	local wasTrapperUse = net.ReadBool()
	local butPos = Vector(
		net.ReadFloat(),
		net.ReadFloat(),
		net.ReadFloat()
	)

 -- Display the ripple effect where the trap was used!

--

	refractData = {
		wasTrapperUse = wasTrapperUse,
		butPos = butPos,
		time = CurTime()
	}

	--
	-- print("Button was used!")
	-- print("Was Trapper usage: " .. tostring(wasTrapperUse))
	-- print(butPos)

end)


hook.Add("PreDrawEffects","TTT2_TrapperRipple",function()
	if not refractData then return end

	local scrpos = refractData.butPos:ToScreen() -- Position of the used trap
	--if IsOffScreen(scrpos) then return end -- If the effect isn't on screen, don't render it.

	local refractSize = (CurTime() - refractData.time )^2 * 2048

	-- draw.FilteredTexture(scrpos.x - refractSize * 0.5 , scrpos.y - refractSize*0.5, refractSize, refractSize, refractMaterial, 30, Color(0,0,0))


	cam.Start3D() -- Start the 3D function so we can draw onto the screen.
		render.SetMaterial( refractMaterial ) -- Tell render what material we want, in this case the flash from the gravgun
	 	render.DrawSprite( refractData.butPos, refractSize, refractSize, COLOR_WHITE) -- Draw the sprite in the middle of the map, at 16x16 in it's original colour with full alpha.
	 cam.End3D()


	if CurTime()-refractData.time > 2 then
		refractData = nil
	end

end)
