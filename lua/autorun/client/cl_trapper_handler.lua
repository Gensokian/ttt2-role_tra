net.Receive("ttt2_role_trapper_used_tbutton", function()
	local wasTrapperUse = net.ReadBool()
	local butPos = Vector(
		net.ReadFloat(),
		net.ReadFloat(),
		net.ReadFloat()
	)

	print("Button was used!")
	print("Was Trapper usage: " .. tostring(wasTrapperUse))
	print(butPos)
end)
