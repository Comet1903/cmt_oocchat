ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("ooc", function(source, args)
    local argString = table.concat(args, " ")
    TriggerClientEvent('cmt_oocchat:newmessage', source, argString)
end, false)

RegisterNetEvent('cmt_oocchat:messageplayer')
AddEventHandler('cmt_oocchat:messageplayer', function(player, message)
    TriggerClientEvent('cmt_oocchat:displaymessage', source, message, "OOC | " .. GetPlayerName(source))
    TriggerClientEvent('cmt_oocchat:displaymessage', player, message, "OOC | " .. GetPlayerName(source))
end)