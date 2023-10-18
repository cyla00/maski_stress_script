local offsetY = 0
function ResetDrawText()
  offsetY = 0
end

function DrawDebugText(text)
  if not Config.debug then return end
	offsetY = offsetY + 0.02
	SetTextScale(0.35, 0.35)
	SetTextColor(255, 255, 255, 255)
	SetTextCentre(false)
	SetTextDropshadow(1, 1, 1, 0, 200)
	SetTextFontForCurrentCommand(0)
	DisplayText(CreateVarString(10, "LITERAL_STRING", text), 0.01, offsetY)
end