function openBrowser()
    --kitty
    k = hs.application.find("Firefox")
    if k == nil then
        hs.application.launchOrFocus("FireFox")
    end
    k:selectMenuItem("New Window")
end

function openTerminal()
    k = hs.application.find("kitty")
    if k == nil then
        hs.application.launchOrFocus("kitty")
    else
        k:selectMenuItem("New OS Window")
    end
end
-- ⌘ + ⏎ Opens New Terminal
hs.hotkey.bind({"cmd"}, "return", openTerminal)
-- ⌘ + ⇧ + ⏎ Opens New Browser Winder
hs.hotkey.bind({"cmd","shift"}, "return"m openBrowser)
-- Hyper + ` brings up Hammerspoon console
hs.hotkey.bind(hyper, "`", function() hs.openConsole() end)
-- Ctrl+Cmd + Escape -- Sleep the computer
hs.hotkey.bind({"ctrl", "cmd"}, "escape", function() hs.caffeinate.systemSleep() end)
-- Ctrl+Shift + Escape -- Sleep the display
hs.hotkey.bind({"ctrl", "shift"}, "escape", function() os.execute("pmset displaysleepnow") end)
-- Provides a keyboard based window switcher
hs.hotkey.bind({"cmd", "alt"}, "tab", function() hs.hints.windowHints() end)
