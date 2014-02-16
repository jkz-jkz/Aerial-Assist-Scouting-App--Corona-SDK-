display.contentWidth = screenWidth
display.contentHeight = screenHeight

application = {
	content = {
		--width = 640,
		--height = 960, 
		--width = 768,
		--height = 1280, 
		width = screenWidth,
		height = screenHeight,
		scale = "letterBox",
		fps = 60,
		
		--[[
        imageSuffix = {
		    ["@2x"] = 2,
		}
		--]]
	},

    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
}
