// Have one for players initial spawn

// Confirms that the person sending the Defcon command is a staff member, and then broadcasts the update to all players
net.Receive("DefconSet",function(len,ply)
	local Defcon = net.ReadInt()
	if !list.contains("!stafflist",ply:GetUserGroup()) then // Check syntax and the list (make it in shared)
		net.Start("DefconUpdate")
			net.WriteInt(Defcon)
		net.Broadcast()
	end
end)

// Updates the defcon for all players
net.Receive("Defcon Update",function()
	local DefconInt = net.ReadInt
	// insert hide for defcon 5
	local ColorTable ={
		{255,0,0}, //Defcon 1, red
		{255,165,0}, //Defcon 2, orange
		{255,255,0}, //Defcon 3, yellow
		{65,105,255}, //Defcon 4, blue
	}
	local DefconText = "Defcon "..DefconInt
	local DefconColor = ColorTable[DefconInt]
end)
