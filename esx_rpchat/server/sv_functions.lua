function GetCharacterName(source)
  if Config.EnableESXIdentity then
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then 
      if xPlayer.getName() == GetPlayerName(source) then 
        local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
          ['@identifier'] = GetPlayerIdentifiers(source)[1]
        })
    
        if result[1] and result[1].firstname and result[1].lastname then
          if Config.OnlyFirstname then
            return result[1].firstname
          else
            return ('%s %s'):format(result[1].firstname, result[1].lastname)
          end
        end
      elseif xPlayer.getName() ~= GetPlayerName(source) then 
        return xPlayer.getName()
      end
    end
  else
    return GetPlayerName(source)
  end
end

function GetCharacterJobName(source) 
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer then 
    return xPlayer.job.name
  end
end

function GetCharacterPhoneNumber(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer then 
    if xPlayer.get('phoneNumber') ~= nil then 
      return xPlayer.get('phoneNumber')
    else
      local result = MySQL.Sync.fetchAll('SELECT phone_number FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifiers(source)[1]
      })
    
      if result[1] and result[1].phone_number then
        return result[1].phone_number
      end
    end
  end
end