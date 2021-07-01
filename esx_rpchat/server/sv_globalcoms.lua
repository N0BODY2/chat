ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- GPS command
RegisterCommand('gps', function(source, args, raw)
 TriggerClientEvent('esx_rpchat:getCoords', source, source);
end)

RegisterServerEvent('esx_rpchat:showCoord')
AddEventHandler('esx_rpchat:showCoord', function(source, msg)
  TriggerClientEvent('chat:addMessage', source, {
     template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(0, 90, 90, 0.6); border-radius: 10px;"><i class="fas fa-map-marker-alt"></i> GPS: {0}</div>',
        args = { msg }
    })
end)

AddEventHandler('chatMessage', function(source, name, message)
  if string.sub(message, 1, string.len('/')) ~= '/' then
    CancelEvent()

    if Config.EnableESXIdentity then name = GetCharacterName(source) end

    TriggerClientEvent('esx_rpchat:sendLocalOOC', -1, source, name, message, {30, 144, 255});
  end
end)

RegisterCommand('ooc', function(source, args, rawCommand)
  local playerName = GetPlayerName(source)
  local msg = rawCommand:sub(5)

  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(200, 200, 200, 0.80); border-radius: 10px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
      args = { playerName, msg }
  })
end, false)

RegisterCommand('announce', function(source,args,raw)
  local xPlayer = ESX.GetPlayerFromId(source)
     local toSay = ''
        for i=1,#args do
     toSay = toSay .. args[i] .. ' ' 
   end  
   if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(204, 0, 0, 0.9); border-radius: 20px;"><i class="fas fa-bullhorn"></i>  Oznámení: {0}</div>',
        args = { toSay }
    })
  end
end,false)

RegisterCommand('tweet', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    fal = GetCharacterName(source)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 10px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
        args = { fal, msg }
    })
end, false)

RegisterCommand('twt', function(source, args, rawCommand)
  local playerName = GetPlayerName(source)
  local msg = rawCommand:sub(4)
  fal = GetCharacterName(source)

  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 10px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
      args = { fal, msg }
  })
end, false)

RegisterCommand('ad', function(source, args, rawCommand)
  local playerName = GetPlayerName(source)
  local msg = rawCommand:sub(3)
  fal = GetCharacterName(source)

  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255 , 255, 0, 0.2); border-radius: 10px;"><i class="fas fa-ad"></i> Reklama:{0}<br> {1}</div>',
      args = { fal, msg }
  })
end, false)

-- Anontwt
RegisterCommand('Anontwt', function(source, args, rawCommand)
  local playerName = GetPlayerName(source)
  local msg = rawCommand:sub(8)
  fal = GetCharacterName(source)

  TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 10px;"><i class="fab fa-twitter"></i> @Anonym:<br> {1}</div>',
      args = { fal, msg }
  })
end, false)

-- BLACKMARKET
TriggerEvent('es:addCommand', 'bm', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
--   local msg = rawCommand:sub(3)
    fal = GetCharacterName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local toSay = ''
       for i=1,#args do
    toSay = toSay .. args[i] .. ' ' -- Concats two strings together
  end

  if xPlayer.job.name ~= 'police' then
    TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.3vw 0.8vw; margin: 0.5vw 0.5vw 0.5vw 0; border-radius:10px; background-color: rgba(202,40,40, 0.6);"><strong style="font-size: 10pt;"><img src="https://stars.djmetla.eu/blackmarket.png" width="20" height="20" style="position: relative; left: -5px; top:3px;">Blackmarket zprava:</strong><br><p style="padding-top: .3vw">{0}</p></div>',
        args = {toSay}
    })
  end
end, false)

-- Anontwt
RegisterCommand('bm', function(source, args, rawCommand)
    local toSay = ''
         for i=1,#args do
      toSay = toSay .. args[i] .. ' ' 
    end

  TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.3vw 0.8vw; margin: 0.5vw 0.5vw 0.5vw 0; border-radius:10px; background-color: rgba(202,40,40, 0.6);"><strong style="font-size: 10pt;"><img src="https://stars.djmetla.eu/blackmarket.png" width="20" height="20" style="position: relative; left: -5px; top:3px;">Blackmarket zprava:</strong><br><p style="padding-top: .3vw">{0}</p></div>',
      args = {toSay}
  })
end, false)

RegisterCommand('news', function(source, args, rawCommand)
  local xPlayer = ESX.GetPlayerFromId(source)
     local toSay = ''
        for i=1,#args do
     toSay = toSay .. args[i] .. ' ' 
   end
 
     job = xPlayer.job.name
 
 
     if job == 'lifeinvader' then 
     TriggerClientEvent('chat:addMessage', -1, {
       template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(205, 0, 0, 0.9); border-radius: 10px;"><i class="fas fa-newspaper"></i>  Weazel News: {0}</div>',
         args = {toSay}
     })
   else 
     TriggerClientEvent('chat:addMessage', source, {
       template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(205, 0, 0, 0.9); border-radius: 10px;"><i class="fas fa-exclamation"></i>  Musíš pracovat u Weazel News pro možnost použít /news <i class="fas fa-exclamation"></i></div>',
       args = {}
     })
   end
end, false)

RegisterCommand('police', function(source, args, rawCommand)
      local xPlayer = ESX.GetPlayerFromId(source)
      local toSay = ''
         for i=1,#args do
      toSay = toSay .. args[i] .. ' ' -- Concats two strings together
    end
  
      if xPlayer.job.name == 'police' then 
      TriggerClientEvent('chat:addMessage', -1, {
          template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(50, 71, 202, 0.9); border-radius: 10px;"><i class="fas fa-bullhorn"></i> Policie: {0}</div>',
            args = {toSay}
        })
    else 
      TriggerClientEvent('chat:addMessage', source, {
        template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(205, 0, 0, 0.9); border-radius: 10px;"><i class="fas fa-exclamation"></i>  Musíš pracovat u policie pro možnost použít /police <i class="fas fa-exclamation"></i></div>',
        args = {}
      })
    end
end, false)

RegisterCommand('sheriff', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local toSay = ''
      for i=1,#args do
    toSay = toSay .. args[i] .. ' ' -- Concats two strings together
  end

    if xPlayer.job.name == 'sheriff' then 
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(180, 61, 34, 1); border-radius: 10px;"><i class="fas fa-star"></i> Sheriff: {0}</div>',
          args = {toSay}
      })
  else 
    TriggerClientEvent('chat:addMessage', source, {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(205, 0, 0, 0.9); border-radius: 10px;"><i class="fas fa-exclamation"></i>  Musíš pracovat u sheriffu pro možnost použít /sheriff <i class="fas fa-exclamation"></i></div>',
      args = {}
    })
  end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local toSay = ''
      for i=1,#args do
    toSay = toSay .. args[i] .. ' ' -- Concats two strings together
  end

    if xPlayer.job.name == 'ambulance' then 
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(255, 0, 0, 1); border-radius: 10px;"><i class="fas fa-ambulance"></i> Ambulance: {0}</div>',
          args = {toSay}
      })
  else 
    TriggerClientEvent('chat:addMessage', source, {
      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(205, 0, 0, 0.9); border-radius: 10px;"><i class="fas fa-exclamation"></i>  Musíš pracovat u ambulance pro možnost použít /amb <i class="fas fa-exclamation"></i></div>',
      args = {}
    })
  end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local characterName = GetCharacterName(source)
    local phoneNumber = GetCharacterPhoneNumber(source)
    local toSay = ''
        for i=1,#args do
      toSay = toSay .. args[i] .. ' ' -- Concats two strings together
    end

    if xPlayer.get('money') >= 250 then
      TriggerClientEvent('chat:addMessage', -1, {
          template = '<div style="padding: 0.3vw 0.8vw; margin: 0.5vw 0.5vw 0.5vw 0; border-radius:10px; background-color: rgba(67,142,94, 0.6); border-radius: 5px;"><strong style="font-size: 11pt;">[Inzerát] {0} (tel.č: {1}):</strong><br><p style="padding-top: .3vw">{2}</p></div>',
            args = { characterName, phoneNumber, toSay }
        })

      xPlayer.removeMoney(250)

      TriggerClientEvent('chat:addMessage', source, {
        template = '^0[^1PLATBA^0] Za inzerát ste zaplatili 250$',
        args = {}
      })

    else 
      TriggerClientEvent('chat:addMessage', source, {
        template = '^0[^1VAROVANIE^0] Nemáte dostatok financií na zaplatenie inzerátu (250$)',
        args = {}
      })
    end
end, false)


RegisterCommand('me', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end

  TriggerClientEvent('esx_rpchat:sendMe', -1, source, name, args, { 196, 33, 246 })
  TriggerClientEvent('3dme:triggerDisplay', -1, args, source)
end)

RegisterCommand('do', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end

  TriggerClientEvent('esx_rpchat:sendDo', -1, source, name, args, { 255, 198, 0 })
  TriggerClientEvent('3ddo:triggerDisplay', -1, args, source)
end)

RegisterCommand('doc', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end
  if args == nil then
  print('source .. args .. rawCommand')
  return
  end
  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end
  local counter_doc = 0
  local pocetOpakovani = tonumber(args)
  if pocetOpakovani < 101 then
    while counter_doc < pocetOpakovani do
        counter_doc = counter_doc + 1 
        TriggerClientEvent('esx_rpchat:sendDo', -1, source, name, counter_doc .. "/" .. pocetOpakovani , { 255, 198, 0 })
        TriggerClientEvent('3ddoa:triggerDisplay', -1, counter_doc .. "/" .. pocetOpakovani, source)
        Citizen.Wait(2000)
    end 
  end
end)