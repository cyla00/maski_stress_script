AddEventHandler('playerJoining', function()
  local source = source
  Player(source).state.kd_stress_steamID = GetPlayerIdentifierByType(source,'steam')
end)

Citizen.CreateThread(function()
  for _, source in ipairs(GetPlayers()) do
    Player(source).state.kd_stress_steamID = GetPlayerIdentifierByType(source,'steam')
  end
end)