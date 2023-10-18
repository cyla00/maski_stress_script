if Config.debug then
	Citizen.CreateThread(function()
		while true do
			Wait(0)
			ResetDrawText()
			DrawDebugText('Interior ID: '..GetInteriorFromEntity(PlayerPedId()))
			DrawDebugText('Stress: '..stressValue)
		end
	end)
end

Citizen.CreateThread(function()
	stressValue = Config.stressStart
	Wait(1000)
	LoopStressIncrease()
end)

function LoopStressIncrease()
	local gap = 0.05
	local steamID = LocalPlayer.state.kd_stress_steamID
	if Config.specialUsers[steamID] then
		gap = gap * Config.specialUsers[steamID].reduction
	end

	local interiorID = GetInteriorFromEntity(PlayerPedId())

	for _,saloon in pairs (Config.saloons) do
		if interiorID == saloon.interiorID then
			gap = gap * saloon.reduction
		end
	end

	stressValue = stressValue + gap

	-- checks if playes not moving 
	if IsEntityStatic(PlayerPedId()) then
		stressValue = stressValue - 0.06
		if stressValue < 0 then stressValue = 0 end
	end

	-- checks if inside a saloon
	local inside = false
	local interiorID = GetInteriorFromEntity(PlayerPedId())
	for _,saloon in pairs (Config.saloons) do
		if interiorID == saloon.interiorID then
			inside = true
			break
		end
	end

	if inside then 
		stressValue = stressValue - 0.1
		if stressValue < 0 then stressValue = 0 end
	end
	

	if stressValue > 100 then 
		stressValue = 100 
	end
	if stressValue >= Config.stopJumpAt then
		StopJump()
	end
	if stressValue >= Config.stopRunAt then
		StopRun()
	end
	Citizen.SetTimeout(Config.timerIncrease,LoopStressIncrease)
	if stressValue < 0 then stressValue = 0 end
end

-- RegisterNetEvent("kd_stress:client:reduceStress")
-- AddEventHandler("kd_stress:client:reduceStress", function(value)
-- 	local inside = false
-- 	local interiorID = GetInteriorFromEntity(PlayerPedId())
-- 	for _,saloon in pairs (Config.saloons) do
-- 		if interiorID == saloon.interiorID then
-- 			inside = true
-- 			break
-- 		end
-- 	end

-- 	if not inside then return end
-- 	stressValue = stressValue - value
-- 	if stressValue < 0.00 then stressValue = 0.00 end
-- end)