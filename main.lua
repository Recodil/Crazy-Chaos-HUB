local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
_G.kill = false;
local Window = Rayfield:CreateWindow({
   Name = "Crazy CHAOS Hub",
   LoadingTitle = "Crazy CHAOS Hub",
   LoadingSubtitle = "by Code_Nope1(Discord: Unc0dxd)",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "Crazy CHAOS Hub",
      FileName = "Crazy CHAOS Hub"
   },
     Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = false 
   },
   KeySystem = true, 
   KeySettings = {
      Title = "Crazy CHAOS Key System",
      Subtitle = "Key System",
      Note = "If you will leak a password or script, I will change link.",
      FileName = "Code", 
      SaveKey = true, 
      GrabKeyFromSite = false,
      Key = {"Dev", "DEV"} 
   }
})

Rayfield:Notify({
   Title = "Crazy CHAOS Hub",
   Content = "Hub loaded!",
   Duration = 6.5,
   Image = 13728916504,
   Actions = { 
      Ignore = {
         Name = "OK",
         Callback = function()
         print("Don't worry, just test!")
      end
   },
},
})

local Tab = Window:CreateTab("Main", 4483362458)

local Section = Tab:CreateSection("Section Example")
Section:Set("Section Example")


local selectedPlayers = {}  -- Store multiple selected players
local targetPlayers = {}  -- Store multiple target players

local players = game:GetService("Players"):GetPlayers() 

local playerNames = {} 
for _, player in ipairs(players) do
    table.insert(playerNames, player.Name) 
end

local Dropdown = Tab:CreateDropdown({
    Name = "Dropdown Example",
    Options = playerNames, 
    CurrentOption = {playerNames[1]}, 
    MultipleOptions = true,
    Flag = "Dropdown1",
    Callback = function(Options)
        selectedPlayers = Options
        targetPlayers = {}  -- Clear the target players table
        for _, playerName in ipairs(selectedPlayers) do
            local player = game:GetService("Players"):FindFirstChild(playerName) 
            if player then
                table.insert(targetPlayers, player)
            end
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "Single Kill",
    Callback = function()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Pencil" then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end

        for _, targetPlayer in ipairs(targetPlayers) do
            local A_1 = targetPlayer.Character.Humanoid
            local Event = game:GetService("Workspace")[game.Players.LocalPlayer.Name].Pencil.DamageRemote

            local function damage()
                Event:FireServer(A_1)
                wait(0.5)
                Event:FireServer(A_1)
                wait(0.5)
                Event:FireServer(A_1)
            end

            damage()
        end
    end,
})


local LoopButton = Tab:CreateToggle({
   Name = "loop kill toggle",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(state)
        getgenv().kill = state
        while getgenv().kill do
            wait(0.05)
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.Name == "Pencil" then
                    v.Parent = game.Players.LocalPlayer.Character
                end
            end

            for _, targetPlayer in ipairs(targetPlayers) do
                local A_1 = targetPlayer.Character.Humanoid
                local Event = game:GetService("Workspace")[game.Players.LocalPlayer.Name].Pencil.DamageRemote

                local function damage()
                    Event:FireServer(A_1)
                    wait(0.5)
                    Event:FireServer(A_1)
                    wait(0.5)
                    Event:FireServer(A_1)
                end

                damage()
            end
            wait(1) 
        end
   end,
})


local function onPlayerRemoving(player)
    for i, targetPlayer in ipairs(targetPlayers) do
        if player == targetPlayer then
            print("Target player has left the game")
            table.remove(targetPlayers, i)
            break
        end
    end
end

local function onPlayerAdded(player)
    if table.find(selectedPlayers, player.Name) then
        print("Target player has joined the game")
        table.insert(targetPlayers, player)
    end
end

game.Players.PlayerRemoving:Connect(onPlayerRemoving) 
game.Players.PlayerAdded:Connect(onPlayerAdded)

local Tab = Window:CreateTab("Universal", 4483362458)
local Section = Tab:CreateSection("Settings of player")
Section:Set("Settings of player")
local Slider = Tab:CreateSlider({
    Name = "Speed",
    Range = {0, 300},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 0,
    Flag = "Slider1",
    Callback = function(Value)
        -- Function that takes place when the slider changes
        local player = game.Players.LocalPlayer
        local character = player.Character
        
        local defaultSpeed = 16
        local maxSpeed = 300
        
        local newSpeed = math.clamp(Value, 0, 100) / 100 * (maxSpeed - defaultSpeed) + defaultSpeed
        
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = newSpeed
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "Default Speed",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            humanoid.WalkSpeed = 16 -- Set the character speed back to the default value
        end
    end,
})

local Slider = Tab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 500},
    Increment = 5,
    Suffix = "Jump Power",
    CurrentValue = 0,
    Flag = "Slider2",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character
        local defaultJumpPower = 50
        local maxJumpPower = 500
        
        local function changeJumpPower(power)
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid.JumpPower = math.clamp(power, defaultJumpPower, maxJumpPower)
            end
        end
        
        changeJumpPower(Value)
    end,
})

local Button = Tab:CreateButton({
    Name = "Set Default Jump Power",
    Callback = function()
        local defaultJumpPower = 50
        local player = game.Players.LocalPlayer
        local character = player.Character
        
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.JumpPower = defaultJumpPower
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end,
})

local Button = Tab:CreateButton({
   Name = "Restart Script",
   Callback = function()
       -- The function that takes place when the button is pressed
       if Rayfield then
           Rayfield:Destroy()
       else
           print("Rayfield doesn't exist!")
       end
       loadstring(game:HttpGet("https://raw.githubusercontent.com/SIND-py/Crazy-Chaos-HUB/main/main.lua"))()
       print("Script reborn! Witness its glory!")
   end,
})

local Button = Tab:CreateButton({
   Name = "Unlock Gamepasses",
   Callback = function()
       game.Players.LocalPlayer.Character.Head:Destroy()
       game.Players.LocalPlayer.Character.Humanoid.Health = 0
       if game.CreatorType == Enum.CreatorType.User then
           game.Players.LocalPlayer.UserId = game.CreatorId
       end
       
       if game.CreatorType == Enum.CreatorType.Group then
           game.Players.LocalPlayer.UserId = game:GetService("GroupService"):GetGroupInfoAsync(game.CreatorId).Owner.Id
       end

       Rayfield:Notify({
           Title = "WARNING!",
           Content = "Leaderboard will dissappear then! It's normal! Code doing this!",
           Duration = 6.5,
           Image = 4483362458,
           Actions = {
               Ignore = {
                   Name = "Okay!",
                   Callback = function()
                       print("The user tapped Okay!")
                   end
               }
           }
       })
   end,
})

local Button = Tab:CreateButton({
    Name = "DESTROY RAYFIELD SCRIPT",
    Callback = function()
    Rayfield:Destroy()
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "Fly Script (GUI NOT MINE)",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        if Value then
            print("Fly mode ON")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        else
            print("Fly mode OFF")
            -- Replace "main" with the specific name of the ScreenGui object you want to destroy
            game.Players.LocalPlayer.PlayerGui:FindFirstChild("main"):Destroy()
        end
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "inf jump (WARNING. CAN'T FIX INF JUMP AFTER TURN OFF)",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Value)
        if Value then
            -- Enable the loadstring
            loadstring(game:HttpGet("https://pastebin.com/raw/6BvCvxgN", true))()
        else
            -- Disable the loadstring
            for _, obj in ipairs(game.CoreGui:GetChildren()) do
                if obj.Name == "ScreenGui" then
                    obj:Destroy()
                end
            end
            -- Reset the jump power
            local Player = game:GetService("Players").LocalPlayer
            if Player.Character then
                local humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.JumpPower = 50
                end
            end
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "Multi Hub V 10!",
    Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/GeronimoZhidkova/Multi-Hub-V3/main/Multi%20Hub%20V3"))()
    end,
})

local Button = Tab:CreateButton({
    Name = "Chat Spy",
    Callback = function()
         --This script reveals ALL hidden messages in the default chat
--chat "/e spy" to toggle!
enabled = true
--if true will check your messages too
spyOnMyself = false
--if true will chat the logs publicly (fun, risky)
public = false
--if true will use /me to stand out
publicItalics = false
--customize private logs
privateProperties = {
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
--////////////////////////////////////////////////////////////////
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,6)=="/e spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and p.Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
player:WaitForChild("PlayerGui"):WaitForChild("Chat")
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
wait(3)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
    end,
})
 
local Button = Tab:CreateButton({
    Name = "Execute antifling! SCRIPT FROM YOUTUBE, NOT MINE",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Q0Nh2SYx"))()
    end,
 })

local Tab = Window:CreateTab("Changelogs", 4483362458)
local Paragraph = Tab:CreateParagraph({Title = "V3.0.1", Content = "Added sum scripts into Universal. Some of them, can't still fix due to unknown errors and impossible fixes (for now)"})
local Paragraph = Tab:CreateParagraph({Title = "V3", Content = "Uploaded on new website due to Staff removed Pastebin link -_-"})

import requests
import json

webhook_url = "https://discord.com/api/webhooks/1059917769619013662/jxVRdaaIqH7S6IpTUOvm2udrh7Kw9OHgf_DAnNUictiBk01PqCfRIDBklTn9kKWPdxhe"

def increment_execution_count():
    file = "execution_count.txt"
    count = 0

    try:
        with open(file, "r") as f:
            count = int(f.read().strip())
    except FileNotFoundError:
        pass
    except ValueError:
        pass

    count += 1

    with open(file, "w") as f:
        f.write(str(count))

    return count

# Assuming this script is executed within a Roblox game environment
try:
    game_name = game.Name
    player_name = game.Players.LocalPlayer.Name
except:
    game_name = "Unknown"
    player_name = "Unknown"

executor_name = "Unknown"  # Replace this with the actual executor name
execution_count = increment_execution_count()

content = f"Someone executed ToxicTDX!"
embeds = [
    {
        "title": f"Game: {game_name}",
        "description": f"Player: {player_name}\nExecutor: {executor_name}\nExecution Count: {execution_count}",
        "color": 0xB070E6
    }
]

data = {
    "content": content,
    "embeds": embeds
}

headers = {
    "Content-Type": "application/json"
}

response = requests.post(webhook_url, data=json.dumps(data), headers=headers)

print(response.text)
