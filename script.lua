--Import UI library
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

--Ability to walk on BasePlate--
game:GetService("Workspace").Baseplate.CanCollide = true

--variables--
getgenv().WalkSpeedValue = 16
getgenv().JumpPowerValue = 50
local skys = {["Orange"] = {"rbxassetid://600830446", "rbxassetid://600831635", "rbxassetid://600832720", "rbxassetid://600886090", "rbxassetid://600833862", "rbxassetid://600835177"}, 
			["Galaxy"] = {"rbxassetid://159454299", "rbxassetid://159454296", "rbxassetid://159454293", "rbxassetid://159454286", "rbxassetid://159454300", "rbxassetid://159454288"}, 
			["4K Realistic"] = {"rbxassetid://225469345", "rbxassetid://225469349", "rbxassetid://225469359", "rbxassetid://225469364", "rbxassetid://225469372", "rbxassetid://225469380"}}
local basesBottomCFrames = {['RED'] = {-90, 3, 0},
						['GREEN'] = {0, 3, -90}, 
						['BLUE'] = {0, 3, 90}, 
						['YELLOW'] = {90, 3, 0}, 
						['MIDDLE'] = {0, 132, 0}}

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

--PlayersList--
local PlayersName = {}
for i, v in game.Players:GetChildren() do
    table.insert(PlayersName, tostring(v))
end

--GetThemesList--
local themes = {}
for i, v in game:GetService('ReplicatedStorage').Themes:GetChildren() do
	table.insert(themes, tostring(v))
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

--Tp to players
local TpPlayers = MainPage.Dropdown({
	Text = "Tp to player",
	Callback = function(PlayerName)
		game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = GetPlayerCFrame(PlayerName)
	end,
	Options = PlayersName
})

--Teleports
local Teleports = MainPage.Dropdown({
	Text = "Teleports",
	Callback = function(Base)
		game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(unpack(basesBottomCFrames[Base]))
	end,
	Options = {"RED", "GREEN", "BLUE", "YELLOW", "MIDDLE"}
})

--Walk speed
local WalkSpeedSlider = MainPage.Slider({
	Text = "WalkSpeed",
	Callback = function(Value)
		WalkSpeedValue = Value
	end,
	Min = 0,
	Max = 100,
	Def = 16
})

--Jump power
local JumpPowerSlider = MainPage.Slider({
	Text = "JumpPower",
	Callback = function(Value)
		JumpPowerValue = Value
	end,
	Min = 0,
	Max = 1000,
	Def = 50
})

--FOV
local FieldOfViewSlider = MainPage.Slider({
	Text = "FOV",
	Callback = function(Value)
		game:getService("Workspace").Camera.FieldOfView = Value
	end,
	Min = 0,
	Max = 120,
	Def = 70
})

--NoClip
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

--Change theme
local ChangeTheme = MainPage.Dropdown({
	Text = "Change Theme",
	Callback = function(Theme)
		game.Players.LocalPlayer.Theme.Value = Theme
	end,
	Options = themes
})

--Change sky 
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
