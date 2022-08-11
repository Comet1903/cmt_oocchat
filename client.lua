ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("cmt_oocchat:newmessage")
AddEventHandler("cmt_oocchat:newmessage", function(message)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	local target = GetPlayerServerId(closestPlayer)
	print(target)
	if message == "" or message == nil or message == " " then
		ESX.ShowNotification("Ungültige angabe!<br>/ooc &lttext&gt", "RZR | OOC")
	else
		if target == PlayerId() or target == 0 or closestDistance > 2.5 then
			ESX.ShowNotification("Kein Spieler in der Nähe", "RZR | OOC")
		else
			TriggerServerEvent("cmt_oocchat:messageplayer", target, message)
		end
	end

end)

RegisterNetEvent("cmt_oocchat:displaymessage")
AddEventHandler("cmt_oocchat:displaymessage", function(message, titel)
    ESX.ShowNotification(message, titel)
end)

ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
