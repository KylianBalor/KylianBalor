ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('dprAstuce:discord')
AddEventHandler('dprAstuce:discord', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Astuce', '~b~Discord', 'Rejoint notre discord: ~b~discord.gg/kY4FAG8ADB ~s~!', 'CHAR_AMANDA', 1)
	end
end)