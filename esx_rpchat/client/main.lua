local PlayerData              = {}
local nbrDisplaying = 1
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_rpchat:sendMe')
AddEventHandler('esx_rpchat:sendMe', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(202, 83, 220, 0.6); border-radius: 10px;"><i class="fas fa-user-circle"></i> {0}: {1}</div>',
        args = { title, message }
    })
	end
end)

RegisterNetEvent('esx_rpchat:sendDo')
AddEventHandler('esx_rpchat:sendDo', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(220, 173, 17, 0.6); border-radius: 10px;"><i class="fas fa-users"></i> {0}: {1}</div>',
        args = { title, message }
    })
	end
end)

RegisterNetEvent('esx_rpchat:sendLocalOOC')
AddEventHandler('esx_rpchat:sendLocalOOC', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(99, 99, 99, 0.3); border-radius: 10px;"><i class="fas fa-street-view"></i> {0}: {1}</div>',
        args = { title, message }
    })
	end
end)

RegisterNetEvent('esx_rpchat:getCoords')
AddEventHandler('esx_rpchat:getCoords', function(player)
	local ped = PlayerPedId()
    local coords = GetEntityCoords(ped, false)
    local heading = GetEntityHeading(ped)

    local message = tostring("X: " .. coords.x .. " Y: " .. coords.y .. " Z: " .. coords.z .. " HEADING: " .. heading)
    TriggerServerEvent('esx_rpchat:showCoord', player, message)

end)

announcestring = false
lastfor = 10

RegisterNetEvent('announce')
announcestring = false
AddEventHandler('announce', function(msg)
	announcestring = msg
	PlaySoundFrontend(-1, "DELETE","HUD_DEATHMATCH_SOUNDSET", 1)
	Citizen.Wait(lastfor * 1000)
	announcestring = false
end)

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~r~Oznámení")
    PushScaleformMovieFunctionParameterString(announcestring)
    PopScaleformMovieFunctionVoid()
    return scaleform
end


Citizen.CreateThread(function()
while true do
	Citizen.Wait(0)
    if announcestring then
		scaleform = Initialize("mp_big_message_freemode")
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
    end
end
end)


Citizen.CreateThread(function()
  TriggerEvent('chat:addSuggestion', '/tweet',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  TriggerEvent('chat:addSuggestion', '/anontwt',  _U('anontwt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/ooc', _U('ooc_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/news', 'Globálna informácia z frakcie Weazel News (iba pre redaktorov)',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/inzerat', 'odoslanie inzerátu - stojí 250$!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  TriggerEvent('chat:addSuggestion', '/police', 'Oznámenie polície - len pre políciu!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  TriggerEvent('chat:addSuggestion', '/ens', 'Oznámení Ambulance - pro ems!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  --TriggerEvent('chat:addSuggestion', '/sheriff', 'Oznámenie Sheriff - pro sheriffy!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/gps', 'Zobrazí vám vašu aktuálnu pozíciu (súradnice XYZ a smer pohľadu)')
	TriggerEvent('chat:addSuggestion', '/doc', 'Napise za vas proces napriklad /do 1/10 (max 100)', { { name = 'pocet', help = 'pocet opakovani' } } )
  --if PlayerData.job ~= nil and PlayerData.job.name ~= 'police' then
  	--TriggerEvent('chat:addSuggestion', '/bm',   _U('bm_prefix'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		--TriggerEvent('chat:removeSuggestion', '/tweet')
		--TriggerEvent('chat:removeSuggestion', '/me')
		--TriggerEvent('chat:removeSuggestion', '/do')
    TriggerEvent('chat:removeSuggestion', '/bm')
    TriggerEvent('chat:removeSuggestion', '/rk')
    TriggerEvent('chat:removeSuggestion', '/rukojmi')
    TriggerEvent('chat:removeSuggestion', '/nazada')
    TriggerEvent('chat:removeSuggestion', '/narameno')
    TriggerEvent('chat:removeSuggestion', '/givecar')
    TriggerEvent('chat:removeSuggestion', '/givecarplate')
	--	TriggerEvent('chat:removeSuggestion', '/news')
		--TriggerEvent('chat:removeSuggestion', '/inzerat')
		TriggerEvent('chat:removeSuggestion', '/gps')
		--*TriggerEvent('chat:removeSuggestion', '/doc')
	end
end)