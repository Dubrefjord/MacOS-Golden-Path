-- Loop through digits 1 to 9
for i = 1, 9 do
    hs.hotkey.bind({"cmd", "shift"}, tostring(i), function()
        local win = hs.window.focusedWindow()
        if not win then return end

        local f = win:frame()

        -- Save the current mouse position so we can restore it later
        local originalMousePos = hs.mouse.getAbsolutePosition()

        -- Grab above the red yellow green circles, since no app specific buttons should ever be there
        local titlebarPoint = {x = f.x + 46, y = f.y + 8}
        hs.mouse.setAbsolutePosition(titlebarPoint)
        hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, titlebarPoint):post()

        -- Move slightly to engage window movement
        local toLeft = {x = titlebarPoint.x - 1, y = titlebarPoint.y}
        hs.mouse.setAbsolutePosition(toLeft)

        -- Press cmd+[i] to switch spaces (these keybindings can be set in stock MacOS under settings, when you have multiple desktops created)
        hs.eventtap.keyStroke({"cmd"}, tostring(i))

        -- Move the window back and release mouse
        local toRight = {x = titlebarPoint.x, y = titlebarPoint.y}
        hs.mouse.setAbsolutePosition(toRight)
        hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, toRight):post()

        -- Return mouse to its original position
        hs.mouse.setAbsolutePosition(originalMousePos)
    end)
end
