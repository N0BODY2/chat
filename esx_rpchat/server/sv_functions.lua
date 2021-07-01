function GetCharacterName(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if not Config.usingIdentity then
    local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
      ['@identifier'] = GetPlayerIdentifiers(source)[1]
    })

    if result[1] and result[1].firstname and result[1].lastname then
      if Config.OnlyFirstname then
        return result[1].firstname
      else
        return ('%s %s'):format(result[1].firstname, result[1].lastname)
      end
    else
      return GetPlayerName(source)
    end
  else
    return xPlayer.getName()
  end
end

function GetCharacterJobName(source) 
  local result = MySQL.Sync.fetchAll('SELECT job FROM users WHERE identifier = @identifier', {
    ['@identifier'] = GetPlayerIdentifiers(source)[1]
  })

  if result[1] and result[1].job then
    return result[1].job
  end

  return nil
end

function GetCharacterPhoneNumber(source)
  local result = MySQL.Sync.fetchAll('SELECT phone_number FROM users WHERE identifier = @identifier', {
    ['@identifier'] = GetPlayerIdentifiers(source)[1]
  })

  if result[1] and result[1].phone_number then
    return result[1].phone_number
  end

  return nil
end
