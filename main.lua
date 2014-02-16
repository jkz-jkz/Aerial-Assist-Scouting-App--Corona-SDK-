-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local toast = require("toast");

display.setStatusBar(display.HiddenStatusBar)

centerX = display.contentCenterX
centerY = display.contentCenterY

screenLeft = display.screenOriginX
screenWidth = display.contentWidth - screenLeft * 2
screenRight = screenLeft + screenWidth
screenTop = display.screenOriginY
screenHeight = display.contentHeight - screenTop * 2
screenBottom = screenTop + screenHeight

display.contentWidth = screenWidth
display.contentHeight = screenHeight

local barWidth = screenHeight/80

local scaleValue = screenHeight/22

local textBoxWidth = scaleValue * 6
local textBoxHeight = scaleValue * 3

local bottomButtonWidth = scaleValue * 4
local bottomButtonHeight = scaleValue * 3

local autoShotX = screenWidth/8
local autoShotY = screenHeight/1.4

local autoScoreX = screenWidth/3.2
local autoScoreY = screenHeight/1.4

local foulX = screenWidth/1.42
local foulY = screenHeight/1.4

local technicalFoulX = screenWidth/1.18
local technicalFoulY = screenHeight/1.4

local offenseX = screenWidth/1.425
local offenseY = screenHeight/3

local defenseX = screenWidth/1.12
local defenseY = screenHeight/3

local highGoalX = screenWidth/6.8
local highGoalY = screenHeight/1.4

local lowGoalX = screenWidth/3.6
local lowGoalY = screenHeight/1.4

local skillX = screenWidth/2.45
local skillY = screenHeight/1.4

local humanX = screenWidth/1.8
local humanY = screenHeight/1.4

local autoX = screenWidth/6
local autoY = screenHeight/3

local hotX = screenWidth/2
local hotY = screenHeight/3

local mobilityX = screenWidth/1.2
local mobilityY = screenHeight/3


local trussX = screenWidth/8
local trussY = screenHeight/4.2

local catchX = screenWidth/3.2
local catchY = screenHeight/4.2

local throwPassX = screenWidth/2
local throwPassY = screenHeight/4.2

local cooperatesX = screenWidth/6
local cooperatesY = screenHeight/2.34

local underPressureX = screenWidth/2.3
local underPressureY = screenHeight/2.34

local group = display.newGroup()

-------------------------------------------------------------------------------------
-- Set the stage
-------------------------------------------------------------------------------------

local background = display.newImage("Background.png")
background.x = screenWidth/2
background.y = screenHeight/2
background.height = background.height * (screenWidth/background.width)
background.width = screenWidth
background.alpha = 0.5
background:toBack()

local topBar = display.newRect(screenWidth/2, 0, screenWidth, barWidth)
topBar.y = topBar.height/2

local bottomBar = display.newRect(screenWidth/2, 0, screenWidth, barWidth)
bottomBar.y = screenHeight - topBar.height/2

local leftBar = display.newRect(0, screenHeight/2, barWidth, screenHeight)
leftBar.x = leftBar.width/2

local rightBar = display.newRect(0, screenHeight/2, barWidth, screenHeight)
rightBar.x = screenWidth - leftBar.width/2

-------------------------------------------------------------------------------------
-- Interactive elements
-------------------------------------------------------------------------------------

local triangleUp = {scaleValue,0,
					scaleValue * 2,scaleValue * 2,
					0,scaleValue * 2}
					
local triangleDown = {scaleValue,scaleValue * 2,
					scaleValue * 2,0,
					0,0}
					
local shotUpButton = display.newPolygon(autoShotX, autoShotY - (scaleValue * 2.5), triangleUp)
group:insert(shotUpButton)
local shotDownButton = display.newPolygon(autoShotX, autoShotY + (scaleValue * 2.5), triangleDown)
group:insert(shotDownButton)

local scoreUpButton = display.newPolygon(autoScoreX, autoScoreY - (scaleValue * 2.5), triangleUp)
group:insert(scoreUpButton)
local scoreDownButton = display.newPolygon(autoScoreX, autoScoreY + (scaleValue * 2.5), triangleDown)
group:insert(scoreDownButton)


local foulUpButton = display.newPolygon(foulX, foulY - (scaleValue * 2.5), triangleUp)
local foulDownButton = display.newPolygon(foulX, foulY + (scaleValue * 2.5), triangleDown)

local technicalFoulUpButton = display.newPolygon(technicalFoulX, technicalFoulY - (scaleValue * 2.5), triangleUp)
local technicalFoulDownButton = display.newPolygon(technicalFoulX, technicalFoulY + (scaleValue * 2.5), triangleDown)

local offenseUpButton = display.newPolygon(offenseX + screenWidth, offenseY - (scaleValue * 2.5), triangleUp)
group:insert(offenseUpButton)
local offenseDownButton = display.newPolygon(offenseX + screenWidth, offenseY + (scaleValue * 2.5), triangleDown)
group:insert(offenseDownButton)

local defenseUpButton = display.newPolygon(defenseX + screenWidth, defenseY - (scaleValue * 2.5), triangleUp)
group:insert(defenseUpButton)
local defenseDownButton = display.newPolygon(defenseX + screenWidth, defenseY + (scaleValue * 2.5), triangleDown)
group:insert(defenseDownButton)

local highGoalUpButton = display.newPolygon(highGoalX + screenWidth, highGoalY - (scaleValue * 2.5), triangleUp)
group:insert(highGoalUpButton)
local highGoalDownButton = display.newPolygon(highGoalX + screenWidth, highGoalY + (scaleValue * 2.5), triangleDown)
group:insert(highGoalDownButton)

local lowGoalUpButton = display.newPolygon(lowGoalX + screenWidth, lowGoalY - (scaleValue * 2.5), triangleUp)
group:insert(lowGoalUpButton)
local lowGoalDownButton = display.newPolygon(lowGoalX + screenWidth, lowGoalY + (scaleValue * 2.5), triangleDown)
group:insert(lowGoalDownButton)

local skillUpButton = display.newPolygon(skillX + screenWidth, skillY - (scaleValue * 2.5), triangleUp)
group:insert(skillUpButton)
local skillDownButton = display.newPolygon(skillX + screenWidth, skillY + (scaleValue * 2.5), triangleDown)
group:insert(skillDownButton)

local humanUpButton = display.newPolygon(humanX + screenWidth, humanY - (scaleValue * 2.5), triangleUp)
group:insert(humanUpButton)
local humanDownButton = display.newPolygon(humanX + screenWidth, humanY + (scaleValue * 2.5), triangleDown)
group:insert(humanDownButton)

local backButton = display.newRect(screenWidth + bottomButtonWidth/2, screenHeight - bottomButtonHeight/2, bottomButtonWidth, bottomButtonHeight)
group:insert(backButton)

local bottomRightButton = display.newRect(screenWidth - bottomButtonWidth/2, screenHeight - bottomButtonHeight/2, bottomButtonWidth, bottomButtonHeight)

local clearButton = display.newRect(screenWidth/2, screenHeight - bottomButtonHeight/2, bottomButtonWidth, bottomButtonHeight)
group:insert(clearButton)

local teamTextBox = native.newTextField(textBoxWidth/2, textBoxHeight/2, textBoxWidth, textBoxHeight)

local matchBox = native.newTextField(screenWidth - (textBoxWidth/2), textBoxHeight/2, textBoxWidth, textBoxHeight)

-------------------------------------------------------------------------------------
-- Set the text
-------------------------------------------------------------------------------------

local teamText = display.newText("Team #", teamTextBox.x + teamTextBox.width/1.2, teamTextBox.y, system.NativeFont, scaleValue * 2)
teamText:scale(0.4, 0.4)
teamText.align = left

local matchText = display.newText("Match #", matchBox.x - matchBox.width/1.2, teamTextBox.y, system.NativeFont, scaleValue * 2)
matchText:scale(0.4, 0.4)
matchText.align = right

local modeText = display.newText("Autonomous", screenWidth/2, teamTextBox.y, system.NativeFont, scaleValue * 2)
modeText:scale(0.6, 0.6)
modeText.align = center

local shotText = display.newText("Shot: ".."N/A", autoShotX, autoShotY, system.NativeFont, scaleValue * 2)
shotText:scale(0.6, 0.6)
shotText.align = center
group:insert(shotText)

local scoreText = display.newText("Score: "..0, autoScoreX, autoScoreY, system.NativeFont, scaleValue * 2)
scoreText:scale(0.6, 0.6)
scoreText.align = center
group:insert(scoreText)


local foulText = display.newText("Foul: "..0, foulX, foulY, system.NativeFont, scaleValue * 2)
foulText:scale(0.6, 0.6)
foulText.align = center

local technicalFoulText = display.newText("T-Foul: "..0, technicalFoulX, technicalFoulY, system.NativeFont, scaleValue * 2)
technicalFoulText:scale(0.6, 0.6)
technicalFoulText.align = center


local offenseText = display.newText("Offense:\nPoor", offenseX + screenWidth, offenseY, system.NativeFont, scaleValue * 2)
offenseText:scale(0.6, 0.6)
offenseText.align = center
group:insert(offenseText)

local defenseText = display.newText("Defense:\nPoor", defenseX + screenWidth, defenseY, system.NativeFont, scaleValue * 2)
defenseText:scale(0.6, 0.6)
defenseText.align = center
group:insert(defenseText)

local highGoalText = display.newText("High: "..0, highGoalX + screenWidth, highGoalY, system.NativeFont, scaleValue * 2)
highGoalText:scale(0.6, 0.6)
highGoalText.align = center
group:insert(highGoalText)

local lowGoalText = display.newText("Low: "..0, lowGoalX + screenWidth, lowGoalY, system.NativeFont, scaleValue * 2)
lowGoalText:scale(0.6, 0.6)
lowGoalText.align = center
group:insert(lowGoalText)

local skillText = display.newText("Skill:\nPoor", skillX + screenWidth, skillY, system.NativeFont, scaleValue * 2)
skillText:scale(0.6, 0.6)
skillText.align = center
group:insert(skillText)

local humanText = display.newText("Human:\nPoor", humanX + screenWidth, humanY, system.NativeFont, scaleValue * 2)
humanText:scale(0.6, 0.6)
humanText.align = center
group:insert(humanText)

local autoYes = display.newText("Yes", 0, 0, system.NativeFont, scaleValue * 2)
autoYes.anchorX = 1
autoYes.x = autoX - (autoYes.width/6)
autoYes.y = autoY + (autoYes.height/3)
autoYes:scale(0.8, 0.8)
autoYes.alpha = 0.5
group:insert(autoYes)
local autoNo = display.newText("No", 0, 0, system.NativeFont, scaleValue * 2)
autoNo.anchorX = 0
autoNo.x = autoX + (autoYes.width/6)
autoNo.y = autoY + (autoYes.height/3)
autoNo:scale(0.8, 0.8)
group:insert(autoNo)
local autoSlash = display.newText("/", autoX, 0, system.NativeFont, scaleValue * 2)
autoSlash.y = autoY + (autoYes.height/3)
autoSlash:scale(0.8, 0.8)
group:insert(autoSlash)
local autoDescription = display.newText("Autonomous?", autoX, 0, system.NativeFont, scaleValue * 2)
autoDescription.y = autoY - (autoYes.height/3)
autoDescription:scale(0.6, 0.6)
group:insert(autoDescription)

local hotYes = display.newText("Yes", 0, 0, system.NativeFont, scaleValue * 2)
hotYes.anchorX = 1
hotYes.x = hotX - (hotYes.width/6)
hotYes.y = hotY + (hotYes.height/3)
hotYes:scale(0.8, 0.8)
hotYes.alpha = 0.5
group:insert(hotYes)
local hotNo = display.newText("No", 0, 0, system.NativeFont, scaleValue * 2)
hotNo.anchorX = 0
hotNo.x = hotX + (hotYes.width/6)
hotNo.y = hotY + (hotYes.height/3)
hotNo:scale(0.8, 0.8)
group:insert(hotNo)
local hotSlash = display.newText("/", hotX, 0, system.NativeFont, scaleValue * 2)
hotSlash.y = hotY + (hotYes.height/3)
hotSlash:scale(0.8, 0.8)
group:insert(hotSlash)
local hotDescription = display.newText("Hot?", hotX, 0, system.NativeFont, scaleValue * 2)
hotDescription.y = hotY - (hotYes.height/3)
hotDescription:scale(0.6, 0.6)
group:insert(hotDescription)

local mobilityYes = display.newText("Yes", 0, 0, system.NativeFont, scaleValue * 2)
mobilityYes.anchorX = 1
mobilityYes.x = mobilityX - (mobilityYes.width/6)
mobilityYes.y = mobilityY + (mobilityYes.height/3)
mobilityYes:scale(0.8, 0.8)
mobilityYes.alpha = 0.5
group:insert(mobilityYes)
local mobilityNo = display.newText("No", 0, 0, system.NativeFont, scaleValue * 2)
mobilityNo.anchorX = 0
mobilityNo.x = mobilityX + (mobilityYes.width/6)
mobilityNo.y = mobilityY + (mobilityYes.height/3)
mobilityNo:scale(0.8, 0.8)
group:insert(mobilityNo)
local mobilitySlash = display.newText("/", mobilityX, 0, system.NativeFont, scaleValue * 2)
mobilitySlash.y = mobilityY + (mobilityYes.height/3)
mobilitySlash:scale(0.8, 0.8)
group:insert(mobilitySlash)
local mobilityDescription = display.newText("Mobility?", mobilityX, 0, system.NativeFont, scaleValue * 2)
mobilityDescription.y = mobilityY - (mobilityYes.height/3)
mobilityDescription:scale(0.6, 0.6)
group:insert(mobilityDescription)

local backButtonText = display.newText("Back", 0, 0, system.NativeFont, scaleValue * 2)
backButtonText:scale(0.6, 0.6)
backButtonText:setFillColor(0, 0 ,0)
backButtonText.x = backButton.x
backButtonText.y = backButton.y
group:insert(backButtonText)

local bottomRightButtonText = display.newText("Next", 0, 0, system.NativeFont, scaleValue * 2)
bottomRightButtonText:scale(0.6, 0.6)
bottomRightButtonText:setFillColor(0, 0 ,0)
bottomRightButtonText.x = bottomRightButton.x
bottomRightButtonText.y = bottomRightButton.y

local clearButtonText = display.newText("Clear", 0, 0, system.NativeFont, scaleValue * 2)
clearButtonText:scale(0.6, 0.6)
clearButtonText:setFillColor(0, 0 ,0)
clearButtonText.x = clearButton.x
clearButtonText.y = clearButton.y
group:insert(clearButtonText)


local trussYes = display.newText("Yes", 0, 0, system.NativeFont, scaleValue * 2)
trussYes.anchorX = 1
trussYes.x = trussX - (trussYes.width/6) + screenWidth
trussYes.y = trussY + (trussYes.height/3)
trussYes:scale(0.8, 0.8)
trussYes.alpha = 0.5
group:insert(trussYes)
local trussNo = display.newText("No", 0, 0, system.NativeFont, scaleValue * 2)
trussNo.anchorX = 0
trussNo.x = trussX + (trussYes.width/6) + screenWidth
trussNo.y = trussY + (trussYes.height/3)
trussNo:scale(0.8, 0.8)
group:insert(trussNo)
local trussSlash = display.newText("/", trussX + screenWidth, 0, system.NativeFont, scaleValue * 2)
trussSlash.y = trussY + (trussYes.height/3)
trussSlash:scale(0.8, 0.8)
group:insert(trussSlash)
local trussDescription = display.newText("Over Truss?", trussX + screenWidth, 0, system.NativeFont, scaleValue * 2)
trussDescription.y = trussY - (trussYes.height/3)
trussDescription:scale(0.6, 0.6)
group:insert(trussDescription)

local catchYes = display.newText("Yes", 0, 0, system.NativeFont, scaleValue * 2)
catchYes.anchorX = 1
catchYes.x = catchX - (catchYes.width/6) + screenWidth
catchYes.y = catchY + (catchYes.height/3)
catchYes:scale(0.8, 0.8)
catchYes.alpha = 0.5
group:insert(catchYes)
local catchNo = display.newText("No", 0, 0, system.NativeFont, scaleValue * 2)
catchNo.anchorX = 0
catchNo.x = catchX + (catchYes.width/6) + screenWidth
catchNo.y = catchY + (catchYes.height/3)
catchNo:scale(0.8, 0.8)
group:insert(catchNo)
local catchSlash = display.newText("/", catchX + screenWidth, 0, system.NativeFont, scaleValue * 2)
catchSlash.y = catchY + (catchYes.height/3)
catchSlash:scale(0.8, 0.8)
group:insert(catchSlash)
local catchDescription = display.newText("Catches?", catchX + screenWidth, 0, system.NativeFont, scaleValue * 2)
catchDescription.y = catchY - (catchYes.height/3)
catchDescription:scale(0.6, 0.6)
group:insert(catchDescription)

local throwPassYes = display.newText("Yes", 0, 0, system.NativeFont, scaleValue * 2)
throwPassYes.anchorX = 1
throwPassYes.x = throwPassX - (throwPassYes.width/6) + screenWidth
throwPassYes.y = throwPassY + (throwPassYes.height/3)
throwPassYes:scale(0.8, 0.8)
throwPassYes.alpha = 0.5
group:insert(throwPassYes)
local throwPassNo = display.newText("No", 0, 0, system.NativeFont, scaleValue * 2)
throwPassNo.anchorX = 0
throwPassNo.x = throwPassX + (throwPassYes.width/6) + screenWidth
throwPassNo.y = throwPassY + (throwPassYes.height/3)
throwPassNo:scale(0.8, 0.8)
group:insert(throwPassNo)
local throwPassSlash = display.newText("/", throwPassX + screenWidth, 0, system.NativeFont, scaleValue * 2)
throwPassSlash.y = throwPassY + (throwPassYes.height/3)
throwPassSlash:scale(0.8, 0.8)
group:insert(throwPassSlash)
local throwPassDescription = display.newText("Throw/Pass?", throwPassX + screenWidth, 0, system.NativeFont, scaleValue * 2)
throwPassDescription.y = throwPassY - (throwPassYes.height/3)
throwPassDescription:scale(0.6, 0.6)
group:insert(throwPassDescription)

local cooperatesYes = display.newText("Yes", 0, 0, system.NativeFont, scaleValue * 2)
cooperatesYes.anchorX = 1
cooperatesYes.x = cooperatesX - (cooperatesYes.width/6) + screenWidth
cooperatesYes.y = cooperatesY + (cooperatesYes.height/3)
cooperatesYes:scale(0.8, 0.8)
cooperatesYes.alpha = 0.5
group:insert(cooperatesYes)
local cooperatesNo = display.newText("No", 0, 0, system.NativeFont, scaleValue * 2)
cooperatesNo.anchorX = 0
cooperatesNo.x = cooperatesX + (cooperatesYes.width/6) + screenWidth
cooperatesNo.y = cooperatesY + (cooperatesYes.height/3)
cooperatesNo:scale(0.8, 0.8)
group:insert(cooperatesNo)
local cooperatesSlash = display.newText("/", cooperatesX + screenWidth, 0, system.NativeFont, scaleValue * 2)
cooperatesSlash.y = cooperatesY + (cooperatesYes.height/3)
cooperatesSlash:scale(0.8, 0.8)
group:insert(cooperatesSlash)
local cooperatesDescription = display.newText("Co-operates?", cooperatesX + screenWidth, 0, system.NativeFont, scaleValue * 2)
cooperatesDescription.y = cooperatesY - (cooperatesYes.height/3)
cooperatesDescription:scale(0.6, 0.6)
group:insert(cooperatesDescription)

local underPressureYes = display.newText("Yes", 0, 0, system.NativeFont, scaleValue * 2)
underPressureYes.anchorX = 1
underPressureYes.x = underPressureX - (underPressureYes.width/6) + screenWidth
underPressureYes.y = underPressureY + (underPressureYes.height/3)
underPressureYes:scale(0.8, 0.8)
underPressureYes.alpha = 0.5
group:insert(underPressureYes)
local underPressureNo = display.newText("No", 0, 0, system.NativeFont, scaleValue * 2)
underPressureNo.anchorX = 0
underPressureNo.x = underPressureX + (underPressureYes.width/6) + screenWidth
underPressureNo.y = underPressureY + (underPressureYes.height/3)
underPressureNo:scale(0.8, 0.8)
group:insert(underPressureNo)
local underPressureSlash = display.newText("/", underPressureX + screenWidth, 0, system.NativeFont, scaleValue * 2)
underPressureSlash.y = underPressureY + (underPressureYes.height/3)
underPressureSlash:scale(0.8, 0.8)
group:insert(underPressureSlash)
local underPressureDescription = display.newText("Under Pressure?", underPressureX + screenWidth, 0, system.NativeFont, scaleValue * 2)
underPressureDescription.y = underPressureY - (underPressureYes.height/3)
underPressureDescription:scale(0.6, 0.6)
group:insert(underPressureDescription)

-------------------------------------------------------------------------------------
-- Event listeners (for interactive elements)
-------------------------------------------------------------------------------------

local auto = 0
local hot = 0
local mobility = 0

local shot = "N/A"
local score = 0

local truss = 0
local catch = 0
local throwPass = 0
local cooperates = 0
local underPressure = 0

local offense = 1	-- P/F/E
local defense = 1	-- P/F/E
local highGoal = 0
local lowGoal = 0
local skill = 1	-- P/F/E
local human = 1	-- P/F/E


local foul = 0
local technicalFoul = 0

local export = false


-- First screen

local function autoIsYes(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		autoNo.alpha = 0.5
		auto = 1
	end
end

local function autoIsNo(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		autoYes.alpha = 0.5
		auto = 0
	end
end

local function hotIsYes(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		hotNo.alpha = 0.5
		hot = 1
	end
end

local function hotIsNo(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		hotYes.alpha = 0.5
		hot = 0
	end
end

local function mobilityIsYes(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		mobilityNo.alpha = 0.5
		mobility = 1
	end
end

local function mobilityIsNo(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		mobilityYes.alpha = 0.5
		mobility = 0
	end
end


local function shotUp(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if shot == "Low" then
			shot = "High"
		elseif shot == "N/A" then
			shot = "Low"
		end
		shotText.text = "Shot: "..shot
	end
end

local function shotDown(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if shot == "High" then
			shot = "Low"
		elseif shot == "Low" then
			shot = "N/A"
		end
		shotText.text = "Shot: "..shot
	end
end

local function addScore(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if score < 5 then
			score = score + 1
		end
		scoreText.text = "Score: "..score
	end
end

local function subtractScore(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if score > 0 then
			score = score - 1
		end
		scoreText.text = "Score: "..score
	end
end


-- Second Screen

local function trussIsYes(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		trussNo.alpha = 0.5
		truss = 1
	end
end

local function trussIsNo(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		trussYes.alpha = 0.5
		truss = 0
	end
end

local function catchIsYes(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		catchNo.alpha = 0.5
		catch = 1
	end
end

local function catchIsNo(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		catchYes.alpha = 0.5
		catch = 0
	end
end

local function throwPassIsYes(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		throwPassNo.alpha = 0.5
		throwPass = 1
	end
end

local function throwPassIsNo(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		throwPassYes.alpha = 0.5
		throwPass = 0
	end
end

local function cooperatesIsYes(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		cooperatesNo.alpha = 0.5
		cooperates = 1
	end
end

local function cooperatesIsNo(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		cooperatesYes.alpha = 0.5
		cooperates = 0
	end
end

local function underPressureIsYes(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		underPressureNo.alpha = 0.5
		underPressure = 1
	end
end

local function underPressureIsNo(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		underPressureYes.alpha = 0.5
		underPressure = 0
	end
end


local function offenseUp(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if offense < 5 then
			offense = offense + 2
		end
		if offense == 1 then
			offenseText.text = "Offense:\nPoor"
		elseif offense == 3 then
			offenseText.text = "Offense:\nFair"
		elseif offense == 5 then
			offenseText.text = "Offense:\nExcellent"
		end
	end
end

local function offenseDown(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if offense > 0 then
			offense = offense - 2
		end
		if offense == 1 then
			offenseText.text = "Offense:\nPoor"
		elseif offense == 3 then
			offenseText.text = "Offense:\nFair"
		elseif offense == 5 then
			offenseText.text = "Offense:\nExcellent"
		end
	end
end

local function defenseUp(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if defense < 5 then
			defense = defense + 2
		end
		if defense == 1 then
			defenseText.text = "Defense:\nPoor"
		elseif defense == 3 then
			defenseText.text = "Defense:\nFair"
		elseif defense == 5 then
			defenseText.text = "Defense:\nExcellent"
		end
	end
end

local function defenseDown(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if defense > 1 then
			defense = defense - 2
		end
		if defense == 1 then
			defenseText.text = "Defense:\nPoor"
		elseif defense == 3 then
			defenseText.text = "Defense:\nFair"
		elseif defense == 5 then
			defenseText.text = "Defense:\nExcellent"
		end
	end
end

local function highGoalUp(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		highGoal = highGoal + 1
		highGoalText.text = "High: "..highGoal
	end
end

local function highGoalDown(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if highGoal > 0 then
			highGoal = highGoal - 1
		end
		highGoalText.text = "High: "..highGoal
	end
end

local function lowGoalUp(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		lowGoal = lowGoal + 1
		lowGoalText.text = "Low: "..lowGoal
	end
end

local function lowGoalDown(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if lowGoal > 0 then
			lowGoal = lowGoal - 1
		end
		lowGoalText.text = "Low: "..lowGoal
	end
end

local function skillUp(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if skill < 5 then
			skill = skill + 2
		end
		if skill == 1 then
			skillText.text = "Skill:\nPoor"
		elseif skill == 3 then
			skillText.text = "Skill:\nFair"
		elseif skill == 5 then
			skillText.text = "Skill:\nExcellent"
		end
	end
end

local function skillDown(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if skill > 1 then
			skill = skill - 2
		end
		if skill == 1 then
			skillText.text = "Skill:\nPoor"
		elseif skill == 3 then
			skillText.text = "Skill:\nFair"
		elseif skill == 5 then
			skillText.text = "Skill:\nExcellent"
		end
	end
end

local function humanUp(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if human < 5 then
			human = human + 2
		end
		if human == 1 then
			humanText.text = "Human:\nPoor"
		elseif human == 3 then
			humanText.text = "Human:\nFair"
		elseif human == 5 then
			humanText.text = "Human:\nExcellent"
		end
	end
end

local function humanDown(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if human > 1 then
			human = human - 2
		end
		if human == 1 then
			humanText.text = "Human:\nPoor"
		elseif human == 3 then
			humanText.text = "Human:\nFair"
		elseif human == 5 then
			humanText.text = "Human:\nExcellent"
		end
	end
end


-- Static options

local function foulUp(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		foul = foul + 1
		foulText.text = "Foul: "..foul
	end
end

local function foulDown(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if foul > 0 then
			foul = foul - 1
		end
		foulText.text = "Foul: "..foul
	end
end

local function technicalFoulUp(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		technicalFoul = technicalFoul + 1
		technicalFoulText.text = "T-Foul: "..technicalFoul
	end
end

local function technicalFoulDown(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		if technicalFoul > 0 then
			technicalFoul = technicalFoul - 1
		end
		technicalFoulText.text = "T-Foul: "..technicalFoul
	end
end


local function textBoxStart(event)
end

local function matchBoxStart(event)
end

local function backButtonPress(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		
		export = false
		bottomRightButtonText.text = "Next"
		modeText.text = "Autonomous"
		
		transition.to(group, {time = 500, x = group.x + screenWidth, transition = easing.outQuart})
		backButton:removeEventListener("touch", backButtonPress)
	end
end

local function bottomRightButtonPress(event)
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		backButton:removeEventListener("touch", backButtonPress)
		bottomRightButton:removeEventListener("touch", bottomRightButtonPress)
		
		local function again()
			backButton:addEventListener("touch", backButtonPress)
			bottomRightButton:addEventListener("touch", bottomRightButtonPress)
		end
		
		if export == true and teamTextBox.text ~= "" and matchBox.text ~= "" then
			export = false
			bottomRightButtonText.text = "Next"
			modeText.text = "Autonomous"
			transition.to(group, {time = 500, x = group.x + screenWidth, onComplete = again, transition = easing.outQuart})
			
			local shotExport
			
			if shot == "N/A" then
				shotExport = 0
			elseif shot == "Low" then
				shotExport = 1
			elseif shot == "High" then
				shotExport = 3
			end
			
			local options = {
				subject = teamTextBox.text..", Match "..matchBox.text,
				body = 
				teamTextBox.text.."\n"..
				matchBox.text..
				"\n\n"..
				auto.."\n"..
				shotExport.."\n"..
				score.."\n"..
				hot.."\n"..
				mobility..
				"\n\n"..
				highGoal.."\n"..
				lowGoal.."\n"..
				truss.."\n"..
				catch.."\n"..
				throwPass..
				"\n\n"..
				foul.."\n"..
				technicalFoul..
				"\n\n"..
				offense.."\n"..
				defense..
				"\n\n"..
				cooperates.."\n"..
				skill.."\n"..
				underPressure..
				"\n\n"..
				human..
				"\n\n"..
				"Fill in pros and cons:"..
				"\n\n"..
				"Pros - "..
				"\n\n"..
				"Cons - ",
			}
			native.showPopup("mail", options)

			--[[local path = system.pathForFile( "myfile.txt", system.DocumentsDirectory )

			local file = io.open( path, "w" )
			file:write( saveData )

			io.close( file )
			file = nil]]
		elseif teamTextBox.text ~= "" and matchBox.text ~= "" or export == false then
			export = true
			bottomRightButtonText.text = "Export"
			modeText.text = "Teleoperated"
			transition.to(group, {time = 500, x = group.x - screenWidth, onComplete = again, transition = easing.outQuart})
		else
			transition.to(group, {time = 1, onComplete = again})
			toast.new("Error: Must add team and match names\nbefore exporting.", 3000)
		end
	end
end

local function clearButtonPress(event)
	local function refresh()
		auto = 0
		hot = 0
		mobility = 0

		shot = "N/A"
		score = 0

		truss = 0
		catch = 0
		throwPass = 0
		cooperates = 0
		underPressure = 0

		offense = 1	-- P/F/E
		defense = 1	-- P/F/E
		highGoal = 0
		lowGoal = 0
		skill = 1	-- P/F/E
		human = 1	-- P/F/E

		foul = 0
		technicalFoul = 0
		
		shotText.text = "Shot: ".."N/A"
		scoreText.text = "Score: "..0
		foulText.text = "Foul: "..0
		technicalFoulText.text = "T-Foul: "..0
		offenseText.text = "Offense:\nPoor"
		defenseText.text = "Defense:\nPoor"
		highGoalText.text = "High: "..0
		lowGoalText.text = "Low: "..0
		skillText.text = "Skill:\nPoor"
		humanText.text = "Human:\nPoor"
		
		teamTextBox.text = ""
		matchBox.text = ""
		
		autoYes.alpha = 0.5
		autoNo.alpha = 1
		
		hotYes.alpha = 0.5
		hotNo.alpha = 1
		
		autoYes.alpha = 0.5
		autoNo.alpha = 1
		
		mobilityYes.alpha = 0.5
		mobilityNo.alpha = 1
		
		trussYes.alpha = 0.5
		trussNo.alpha = 1
		
		catchYes.alpha = 0.5
		catchNo.alpha = 1
		
		throwPassYes.alpha = 0.5
		throwPassNo.alpha = 1

		cooperatesYes.alpha = 0.5
		cooperatesNo.alpha = 1

		underPressureYes.alpha = 0.5
		underPressureNo.alpha = 1
	end
	local function start()
		display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
		event.target.alpha = 0.5
	end
	if event.phase == "began" then
		start()
	elseif event.phase == "moved" then
		if event.target.isFocus ~= true then
			start()
		end
	elseif event.phase  == "ended" or event.phase == "cancelled" then
		display.getCurrentStage():setFocus(nil)
		event.target.isFocus = false
		event.target.alpha = 1
		refresh()
	end
end

bottomRightButton:addEventListener("touch", bottomRightButtonPress)
clearButton:addEventListener("touch", clearButtonPress)

teamTextBox:addEventListener("userInput", textBoxStart)
matchBox:addEventListener("userInput", matchBoxStart)

autoYes:addEventListener("touch", autoIsYes)
autoNo:addEventListener("touch", autoIsNo)
hotYes:addEventListener("touch", hotIsYes)
hotNo:addEventListener("touch", hotIsNo)
mobilityYes:addEventListener("touch", mobilityIsYes)
mobilityNo:addEventListener("touch", mobilityIsNo)

shotUpButton:addEventListener("touch", shotUp)
shotDownButton:addEventListener("touch", shotDown)
scoreUpButton:addEventListener("touch", addScore)
scoreDownButton:addEventListener("touch", subtractScore)


trussYes:addEventListener("touch", trussIsYes)
trussNo:addEventListener("touch", trussIsNo)
catchYes:addEventListener("touch", catchIsYes)
catchNo:addEventListener("touch", catchIsNo)
throwPassYes:addEventListener("touch", throwPassIsYes)
throwPassNo:addEventListener("touch", throwPassIsNo)
cooperatesYes:addEventListener("touch", cooperatesIsYes)
cooperatesNo:addEventListener("touch", cooperatesIsNo)
underPressureYes:addEventListener("touch", underPressureIsYes)
underPressureNo:addEventListener("touch", underPressureIsNo)

offenseUpButton:addEventListener("touch", offenseUp)
offenseDownButton:addEventListener("touch", offenseDown)
defenseUpButton:addEventListener("touch", defenseUp)
defenseDownButton:addEventListener("touch", defenseDown)
highGoalUpButton:addEventListener("touch", highGoalUp)
highGoalDownButton:addEventListener("touch", highGoalDown)
lowGoalUpButton:addEventListener("touch", lowGoalUp)
lowGoalDownButton:addEventListener("touch", lowGoalDown)
skillUpButton:addEventListener("touch", skillUp)
skillDownButton:addEventListener("touch", skillDown)
humanUpButton:addEventListener("touch", humanUp)
humanDownButton:addEventListener("touch", humanDown)

foulUpButton:addEventListener("touch", foulUp)
foulDownButton:addEventListener("touch", foulDown)
technicalFoulUpButton:addEventListener("touch", technicalFoulUp)
technicalFoulDownButton:addEventListener("touch", technicalFoulDown)

