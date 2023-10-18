function StopRun()
  if stopRunLoop then return end
  stopRunLoop = true
  if IsPedRunning(PlayerPedId()) then
    ClearPedTasks(PlayerPedId())
  end
  Citizen.CreateThread(function()
    while stressValue >= Config.stopRunAt do
      Wait(0)
      DrawDebugText("STOP RUN")
      DisableControlAction(0,`INPUT_SPRINT`,true)
    end
    stopRunLoop = false
  end)
end

function StopJump()
  if stopJumpLoop then return end
  stopJumpLoop = true
  Citizen.CreateThread(function()
    while stressValue >= Config.stopJumpAt do
      Wait(0)
      DrawDebugText("STOP JUMP")
      DisableControlAction(0,`INPUT_JUMP`,true)
    end
    stopJumpLoop = false
  end)
end
