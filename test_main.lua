local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Consistt/Ui/main/UnLeaked"))()


library.rank = "Developer"
local Wm = library:Watermark("xsx example | v" .. library.version ..  " | " .. library:GetUsername() .. " | rank: " .. library.rank)
local FpsWm = Wm:AddWatermark("fps: " .. library.fps)
coroutine.wrap(function()
    while wait(.75) do
        FpsWm:Text("fps: " .. library.fps)
    end
end)()

-- Function to set the user's rank
local function setUserRank(username, rank)
    library.rank = rank
end

-- Function to set the user's private rank
local function setPrivateRank()
    -- Replace 'private' with the desired private rank
    setUserRank(library:GetUsername(), "private")
end

-- Get the user's username and rank
local username = library:GetUsername()
local userRank = library.rank

-- Define the URLs for the loadstrings
local mainLoadstringURL = "https://example.com/main_loadstring.lua"
local developerLoadstringURL = "https://example.com/developer_loadstring.lua"

-- Check if the user is one of the specified names and set the rank to "Developer"
if username == "Code_Nope1" or username == "70698a77600" then
    setUserRank(username, "Developer")
    userRank = "Developer" -- Update the userRank variable after setting
end

-- Check if the user has the rank "Developer" or set a private rank for users below it
if userRank == "Developer" then
    -- Automatically activate the Developer loadstring
    loadstring(game:HttpGet(developerLoadstringURL))()
else
    -- Set a private rank for users below "Developer" rank
    setPrivateRank()

    -- Activate the main loadstring for users with private rank
    loadstring(game:HttpGet(mainLoadstringURL))()
end


local Notif = library:InitNotifications()

local LoadingXSX = Notif:Notify("Loading Crazy Chaos Hub, please be patient.", 5, "information") 

library.title = "CHAOS Hub"

library:Introduction()
wait(1)
local Init = library:Init()

local Tab1 = Init:NewTab("Main")

local Section1 = Tab1:NewSection("Panel")

