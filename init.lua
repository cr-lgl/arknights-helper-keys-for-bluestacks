--- functions
function focusBlueStacksApp()
    local appName = "BlueStacks"
    if hs.appfinder.appFromName(appName) == nil then
        hs.alert.show("You have to run Arknights")
    else
        hs.application.launchOrFocus(appName)
    end
end

function getLocation()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local geometry = win:size()

    return {
        x = frame.x,
        y = frame.y,
        w = geometry.w,
        h = geometry.h,
    }
end

function clickMenuInGame(x, y)
    local location = hs.mouse.getRelativePosition()
    hs.eventtap.leftClick({ ["y"] = y,["x"] = x}, 0)
    hs.mouse.setRelativePosition(location)
end

--- hotkeys
hs.hotkey.bind({}, 'q', function()
    focusBlueStacksApp()
    local location = getLocation()
    clickMenuInGame(location.x + location.w - 95, location.y + 85)
end)

hs.hotkey.bind({}, 'w', function()
    focusBlueStacksApp()
    local location = getLocation()
    clickMenuInGame(location.x + location.w - 20, location.y + location.h - 20)
end)

hs.hotkey.bind({}, 'e', function()
    focusBlueStacksApp()
    local location = getLocation()
    clickMenuInGame(location.x + location.w - 200, location.y + 85)
end)