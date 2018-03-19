--SV--
util.AddNetworkString("DefconSet")
util.AddNetworkString("DefconUpdate")
local Defcon = 5 // Set the default Defcon to 5

net.Receive("DefconSet",function(len,ply)
	Defcon = net.ReadInt()
	if !list.contains("!stafflist",ply:GetUserGroup()) then // Check syntax and the list (make it in shared)|Got to make sure that the user is staff and did not just send the net message with l33t h3xorz
		
		//Prints a message to the center of all players screens advising of the Defcon change
		for k , v in pairs(player.GetAll()) do
			v.PrintMessage(4,"Be advised, your current Defcon is now "..Defcon)
		end
		
		// Sends the message to update the defcon box in the top left
		net.Start("DefconUpdate")
			net.WriteInt(Defcon)
		net.Broadcast()
	end
end)

// Sends the player the current Defcon when they spawn, so they dont have to wait for the defcon to change so they can see the defcon
hook.Add("PlayerInitailSpawn","SpawnDefcon",function(ply)
	net.Start("DefconUpdate")
		net.Writeint(Defcon)
	net.Send(ply)
end)



--CL--
// Run when the Defcon is changed, updates the box in the top left
net.Receive("Defcon Update",function()
	local DefconInt = net.ReadInt
	if DefconInt == 5 then
		// Removes the box if defcon is five
	else
		// A table of the colors assosiated with each Defcon (by index)
		local ColorTable ={
			{255,0,0}, //Defcon 1, red
			{255,165,0}, //Defcon 2, orange
			{255,255,0}, //Defcon 3, yellow
			{65,105,255}, //Defcon 4, blue
		}
		
		local DefconText = "Defcon "..DefconInt
		local DefconColor = ColorTable[DefconInt]
	end
end)
