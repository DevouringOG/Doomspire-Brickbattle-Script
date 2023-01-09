local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

--DestroyKillPlate--
game:GetService('Workspace').Kill:Destroy()

--variables--
getgenv().WalkSpeedValue = 16
getgenv().JumpPowerValue = 50

--NoClipFunction--
local function onTouched(part)
    if _G.Noclip == true then
        part.CanCollide = false
        wait(3)
        part.CanCollide = true
    end
end

--GetCFrameFunction--

local function GetPlayerCFrame(PlayerName) return game:GetService("Workspace")[PlayerName].HumanoidRootPart.CFrame end

--Players list--
getgenv().PlayersName = {}

for i, v in game.Players:GetChildren() do
    table.insert(PlayersName, tostring(v))
end

--UI--
local UI = Material.Load({
     Title = "Getting Started",
     Style = 1,
     SizeX = 400,
     SizeY = 500,
     Theme = "Dark"
})

local MainPage = UI.New({
	Title = "Main"
})

local TpPlayers = MainPage.Dropdown({
	Text = "Tp to player",
	Callback = function(PlayerName)
		game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = GetPlayerCFrame(PlayerName)
	end,
	Options = PlayersName
})

local WalkSpeedSlider = MainPage.Slider({
	Text = "WalkSpeed",
	Callback = function(Value)
		WalkSpeedValue = Value
	end,
	Min = 0,
	Max = 100,
	Def = 16
})

local JumpPowerSlider = MainPage.Slider({
	Text = "JumpPower",
	Callback = function(Value)
		JumpPowerValue = Value
	end,
	Min = 0,
	Max = 1000,
	Def = 50
})

local NoClipToggle = MainPage.Toggle({
	Text = "NoClip",
	Callback = function(Value)
		_G.Noclip = Value
        if game.Players.LocalPlayer.Character:WaitForChild("Head") then
            game.Players.LocalPlayer.Character:WaitForChild("Head").Touched:Connect(onTouched)
		end
	end,
	Enabled = false
})




--ChangeWalkSpeed--
spawn(function()
            while wait(0.1) do
                if game.Players.LocalPlayer.Character:findFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character:findFirstChild("Humanoid").WalkSpeed = WalkSpeedValue
                end
            end
        end)

--ChangeJumpPower--
spawn(function()
            while wait(0.1) do
                if game.Players.LocalPlayer.Character:findFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character:findFirstChild("Humanoid").JumpPower = JumpPowerValue
                end
            end
        end)
