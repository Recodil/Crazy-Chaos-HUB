local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'CHAOS Hub',
    Center = true, 
    AutoShow = true,
})

if Window then
    -- Close the existing window
    Library:Unload()
end

-- Load the new script if the window is closed
loadstring(game:HttpGet("https://raw.githubusercontent.com/Unc0dxd/Crazy-Chaos-HUB/main/test_main.lua"))()
-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'), 
    Universal = Window:AddTab('Universal'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Groupbox')

-- Get the nicknames of players
local playerNicknames = {}
for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(playerNicknames, player.Name)
end

-- Call the AddDropdown function with the player nicknames as values
LeftGroupBox:AddDropdown('MyMultiDropdown', {
    Values = playerNicknames,
    Default = 1, 
    Multi = true,
    Text = 'A dropdown',
    Tooltip = 'This is a tooltip',
})

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind

