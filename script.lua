local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

--Ability to walk on BasePlate--
game:GetService("Workspace").Baseplate.CanCollide = true

--variables--
getgenv().WalkSpeedValue = 16
getgenv().JumpPowerValue = 50
local skys = {["Orange"] = {"rbxassetid://600830446", "rbxassetid://600831635", "rbxassetid://600832720", "rbxassetid://600886090", "rbxassetid://600833862", "rbxassetid://600835177"}, 
			["Galaxy"] = {"rbxassetid://159454299", "rbxassetid://159454296", "rbxassetid://159454293", "rbxassetid://159454286", "rbxassetid://159454300", "rbxassetid://159454288"}, 
			["4K Realistic"] = {"rbxassetid://225469345", "rbxassetid://225469349", "rbxassetid://225469359", "rbxassetid://225469364", "rbxassetid://225469372", "rbxassetid://225469380"}}

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

--ChangeSkyFunction--
local LightingSky = game:GetService('Lighting').Sky
local function ChangeSky(SkyName)
	LightingSky.SkyboxBk = skys[SkyName][1]
	LightingSky.SkyboxDn = skys[SkyName][2]
	LightingSky.SkyboxFt = skys[SkyName][3]
	LightingSky.SkyboxLf = skys[SkyName][4]
	LightingSky.SkyboxRt = skys[SkyName][5]
	LightingSky.SkyboxUp = skys[SkyName][6]
end

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
     Theme = "Mocha"
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

local ChangeSky = MainPage.Dropdown({
	Text = "Change sky",
	Callback = function(Sky)
		ChangeSky(Sky)
	end,
	Options = {"Orange", "Galaxy", "4K Realistic"}
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
