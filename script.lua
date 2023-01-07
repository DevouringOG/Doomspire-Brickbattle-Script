local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

getgenv().SecureMode = true

Rayfield:LoadConfiguration()

local Window = Rayfield:CreateWindow({
    Name = "Doomspire Brickbattle Script",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "glhf",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = 'Teleporting', -- Create a custom folder for your hub/game
       FileName = "Hub"
    },
    })
    
    local Tab = Window:CreateTab("Teleport", 4483362458)
    local Section = Tab:CreateSection("Section RED")
    Section:Set("RED")
    
    --RED--
    local Button = Tab:CreateButton({
    Name = "RED DOWN",
    Callback = function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-130, 24, -1)
    end,
    })
    local Button = Tab:CreateButton({
    Name = "RED UP",
    Callback = function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-104, 129, 0)
    end,
    })




    local Section = Tab:CreateSection("Section GREEN")
    Section:Set("GREEN")
    --GREEN--
    local Button = Tab:CreateButton({
    Name = "GREEN DOWN",
    Callback = function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1, 24, -130)
    end,
    })
    local Button = Tab:CreateButton({
    Name = "GREEN UP",
    Callback = function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 129, -102)
    end,
    })



    local Section = Tab:CreateSection("Section BLUE")
    Section:Set("BLUE")
    --BLUE--
    local Button = Tab:CreateButton({
    Name = "BLUE DOWN",
    Callback = function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1, 24, 130)
    end,
    })
    local Button = Tab:CreateButton({
    Name = "BLUE UP",
    Callback = function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 129, 102)
    end,
    })



    local Section = Tab:CreateSection("Section YELLOW")
    Section:Set("YELLOW")
    --YELLOW--
    local Button = Tab:CreateButton({
    Name = "YELLOW DOWN",
    Callback = function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(130, 24, -1)
    end,
    })
    local Button = Tab:CreateButton({
    Name = "YELLOW UP",
    Callback = function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(104, 129, 0)
    end,
    })
