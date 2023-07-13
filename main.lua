local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
_G.kill = false;
local Window = Rayfield:CreateWindow({
   Name = "Crazy CHAOS Hub",
   LoadingTitle = "Crazy CHAOS Hub",
   LoadingSubtitle = "by Code_Nope1(Discord: Unc0dxd)",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Crazy CHAOS Hub",
      FileName = "Crazy CHAOS Hub"
   },
     Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
   KeySystem = true, 
   KeySettings = {
      Title = "Crazy CHAOS Key System",
      Subtitle = "Key System",
      Note = "If you will leak a password or script, I will change link.",
      FileName = "Code", 
      SaveKey = true, 
      GrabKeyFromSite = false,
      Key = {"test", "TEST", "TeSt", "0000"} 
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

local Tab = Window:CreateTab("Changelogs", 4483362458)
local Paragraph = Tab:CreateParagraph({Title = "V3", Content = "Uploaded on new website due to Staff removed Pastebin link -_-"})
