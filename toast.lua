module(..., package.seeall)

local trueDestroy

function trueDestroy(toast)
    toast:removeSelf()
    toast = nil
end

function new(pText, pTime)
    local text = pText or "nil"
    local pTime = pTime
    local toast = display.newGroup()
	
	local fontSize = 31.8

    toast.text = display.newText(toast, pText, 0, 0, "Roboto-Regular", fontSize * 2)
	toast.text:scale(0.5, 0.5)
	toast.text.align = "center"
    toast.background = display.newRoundedRect(toast, 0, 0, toast.text.width/2 * 1.37,  toast.text.height/2 + fontSize * 1.72, fontSize * 1.5)
    toast.background:setFillColor(0.3, 0.3, 0.3)
	toast.background.alpha = 0.9
	
    toast.text:toFront()

    toast.alpha = 0
    toast.transition = transition.to(toast, {time = 250, alpha = 1})

    if pTime ~= nil then
        timer.performWithDelay(pTime, function() destroy(toast) end)
    end

    toast.x = display.contentWidth/2
    toast.y = display.contentHeight/1.32

    return toast
end

function destroy(toast)
    toast.transition = transition.to(toast, {time = 250, alpha = 0, onComplete = function() trueDestroy(toast) end})
end