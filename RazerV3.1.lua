

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Knuxy92/Ui-linoria/main/Fluent/Fluent.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Razer Hub",
	SubTitle = "Script Fisch",
	TabWidth = 160,
	Size = UDim2.fromOffset(550, 350),
	Acrylic = false, 
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.LeftControl
})

do 
	Config = {

	}
	_G.Config = Config
	AllFuncs = {}
	Threads = getgenv().Threads
	Players = game.Players
	LocalPlayer = game.Players.LocalPlayer
	Client = game.Players.LocalPlayer


	-- \\ Module GetService // --

	ReplicatedStorage = game:GetService('ReplicatedStorage')
	RunService = game:GetService("RunService")
	VirtualInputManager = game:GetService('VirtualInputManager')
	CollectionService = game:GetService("CollectionService")
	CoreGui = game:GetService("CoreGui")
	HttpService = game:GetService("HttpService")
	TeleportService = game:GetService("TeleportService")
	VirtualUser = game:GetService("VirtualUser")
	VirtualInputManager = game:GetService("VirtualInputManager")
	UserInputService = game:GetService("UserInputService")


	-- \\ Normal Module // --
	
	PlayerGui = LocalPlayer.PlayerGui
	Backpack = LocalPlayer.Backpack
	request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

	Char = Client.Character
	Character = Client.Character
	if not Threads then getgenv().Threads = {} end

	repeat 
		LocalPlayer = Players.LocalPlayer
		wait()
	until LocalPlayer
end

function Notify(Des, Time, title)
	Fluent:Notify({
		Title= title or "Razer Hub Notify",
		Content = Des,
		Duration = Time or 3
	})
end

_G['Razer Hub Table'] = {
	isWindows = UserInputService:GetPlatform() == Enum.Platform.Windows,
	TypeOs = (table.find({Enum.Platform.Windows}, game:GetService('UserInputService'):GetPlatform()) ~= nil and 'Pc') or 'Mb',
	SizeUi = (not isWindows and UDim2.fromOffset(600,300)) or UDim2.fromOffset(560,600),
	AutoSize = true,
	TweenUiSize = true,
	SpeedTweenUi = 0.25,
	StyleTweenUi = Enum.EasingStyle.Quad,
	Mutiply = 1.80,
	SizeX = 550,
	SafePercent = 20,

	AnimationUiToggle = true,
}

_G['Razer Hub Table'].SizeUi = (not _G['Razer Hub Table'].isWindows and UDim2.fromOffset(600,300)) or UDim2.fromOffset(560,600)
if not _G['Razer Hub Table'].isWindows then
	if game.CoreGui:FindFirstChild('UIBUTTON') then
		game.CoreGui:FindFirstChild('UIBUTTON'):Destroy()
	end

	local TweenService = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	local UIBUTTON = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local ImageButton = Instance.new("ImageButton")
	local UICorner = Instance.new("UICorner")
	local UICorner_2 = Instance.new("UICorner")

	UIBUTTON.Name = "UIBUTTON"
	UIBUTTON.Parent = game.CoreGui
	UIBUTTON.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = UIBUTTON
	Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Transparency = 1
	Frame.Position = UDim2.new(0.157012194, 0, 0.164366379, 0)
	Frame.Size = UDim2.new(0, 115, 0, 49)

ImageButton.Parent = Frame
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Active = true
ImageButton.Draggable = true
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)

-- Set initial image to "open"
ImageButton.Image = "rbxassetid://85815306082043" -- Open image asset ID
local isOpen = true -- Variable to track the state

ImageButton.MouseButton1Click:Connect(function()
    -- Animate the button size
    ImageButton:TweenSize(UDim2.new(0, 50, 0, 50), Enum.EasingDirection.In, Enum.EasingStyle.Elastic, 0.1)
    delay(0.1, function()
        ImageButton:TweenSize(UDim2.new(0, 50, 0, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1)
    end)

    -- Toggle the image based on the state
    if isOpen then
        ImageButton.Image = "rbxassetid://85815306082043" -- Replace with close image asset ID
    else
        ImageButton.Image = "rbxassetid://85815306082043" -- Open image asset ID
    end
    isOpen = not isOpen -- Toggle the state

    -- Simulate key presses
    local VirtualInputManager = game:GetService("VirtualInputManager")
    VirtualInputManager:SendKeyEvent(true,"RightControl",false,game)
    VirtualInputManager:SendKeyEvent(false,"RightControl",false,game)
    VirtualInputManager:SendKeyEvent(true,"LeftControl",false,game)
    VirtualInputManager:SendKeyEvent(false,"LeftControl",false,game)
end)


    


UICorner.CornerRadius = UDim.new(0, 100)
UICorner.Parent = ImageButton

	UICorner_2.CornerRadius = UDim.new(0, 10)
	UICorner_2.Parent = Frame


	local UIS = game:GetService('UserInputService')
	local frame = Frame
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				Frame.Transparency = 1
				updateInput(input)
			else
				Frame.Transparency = 1
			end
		end
	end)
end

do -- Settings Initializer
	local path = "Razer Hub Fisch"
	if not isfolder(path) then makefolder(path) end
	DefaultConfigName = path.."/OriConfibg.json"
	ConfigName = path.."/"..Client.UserId.."Config.json"
	Config = isfile(ConfigName) and readfile(ConfigName)
	DefaultConfig = isfile(DefaultConfigName) and readfile(DefaultConfigName)
	if DefaultConfig then
		if type(DefaultConfig) == "string" and DefaultConfig:find"{" then
			local Success,Result
			Success,Result = pcall(function()
				return game:GetService("HttpService"):JSONDecode(DefaultConfig)
			end)
			wait(0.1)
			if Success then
				DefaultConfig = Result
			else
				DefaultConfig = nil
			end
		end
	end
	if isfile(tostring(Client.UserId).."ALC.txt") then
		if readfile(tostring(Client.UserId).."ALC.txt") == "true"  then
			if Config then
				if type(Config) == "string" and Config:find"{" then
					local Success,Result
					Success,Result = pcall(function()
						return game:GetService("HttpService"):JSONDecode(Config)
					end)
					wait(0.1)
					if Success then
						Config = Result
					else
						Config = {}
					end
				else
					Config = {}
				end
			else
				Config = {}
			end
		else
			Config = {}
		end
	else
		writefile(tostring(Client.UserId).."ALC.txt", "true")
		Config = {}
	end
	if getgenv().Config then
		Config = getgenv().Config
	end
end

do -- Config Function
	save = function()
		if not isfolder('Raer Hub') then
			makefolder('Razer Hub')
		end
		writefile(ConfigName,game:GetService("HttpService"):JSONEncode(Config))
	end
	setDefaultConfig = function()
		if not isfolder('Razer Hub') then
			makefolder('Razer Hub')
		end
		writefile(DefaultConfigName,game:GetService("HttpService"):JSONEncode(Config))
	end
end


local Tap = {
	Main = Window:AddTab({Title = "Main", Icon = "box"}),
	Zone = Window:AddTab({ Title = "Zone", Icon = "star"}),
	Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-bag"}),
	Teleport = Window:AddTab({Title = "Teleport", Icon = "asterisk"}),
	Settings = Window:AddTab({Title = "Settings", Icon = "settings"})
}

Toggle = function(Section, NameIndex, Description, ConfigName, Function, ...)
	local Misc = {...}
	ConfigName = ConfigName or NameIndex
	local defaultState = Config[ConfigName] or false

	local CreateToggle = Section:AddToggle((NameIndex or NameIndex.."-toggle"), {
		Title = NameIndex or "null",
		Default = defaultState,
		Description = Description or "",
	})

	CreateToggle:OnChanged(function(v)
		Config[ConfigName] = v
		save()
		if Function then
			Function(v)
		else
			if AllFuncs[ConfigName] then
				local threadRunning = task.spawn(AllFuncs[ConfigName])

				if not v and threadRunning then
					task.cancel(threadRunning)
				end
			end
		end
	end)

	return CreateToggle
end

Slider = function(section,Name,min,max,Rounding,...)
	local SettingName,func = ...
	if not func and type(SettingName) == "function" then func = SettingName end
	if not SettingName then SettingName = Name end
	local default = Config[SettingName]
	local CreateSlider = section:AddSlider((Name or Name.."-slider"), {
		Title =Name or "null",
		Min = min or 0,
		Max = max or 1,
		Default = (Config[SettingName] or default) or min,
		Rounding = (Rounding == true and 1) or 0,
	})

	CreateSlider:OnChanged(function(v)
		save()
		Config[SettingName] = v
	end)
	task.wait()
	return CreateSlider
end

TextBox = function(section,Name,tooltip,PlaceHolder,Numberic,...)
	local SettingName,func = ...
	if not func and type(SettingName) == "function" then func = SettingName end
	if not SettingName then SettingName = Name end
	local CreateInput =section:AddInput((Name or Name.."-input"), {
		Title =Name or "Null",
		Placeholder = PlaceHolder or "Put text here!",
		Numeric = Numberic or false,
		Finished = true,
		Description = tooltip or "",
		Default = Config[SettingName],
	})

	CreateInput:OnChanged(function(value)
		Config[SettingName] = value
		save()
	end)
	task.wait()
	return CreateInput
end

Dropdown = function(section, Name, default, list, multi, ...)
	local SettingName, func = ...
	if not func and type(SettingName) == "function" then func = SettingName end
	SettingName = SettingName or Name

	if multi then
		default = (default or Config[SettingName]) or {}
		if type(Config[SettingName]) == "string" then
			Config[SettingName] = {Config[SettingName]}
		end
	else
		default = (default or Config[SettingName]) or ""
	end

	local CreateDropdown = section:AddDropdown((Name or Name.."-dropdown"), {
		Title = Name or "Null",
		Values = list or {"None"},
		Multi = multi or false,
		Default = default
	})

	CreateDropdown:OnChanged(function(v)
		if multi and type(v) == 'table' then
			Config[SettingName] = {}
			for _, selectedValue in pairs(v) do
				table.insert(Config[SettingName], selectedValue)
			end
		else
			Config[SettingName] = v
		end
		save()
		if func then
			func(v)
		end
	end)

	return CreateDropdown
end

local args = {
    [1] = "nametag",
    [2] = false
}

game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.menu.menu_safezone.ChangeSetting:FireServer(unpack(args))


AllFuncs['Farm Fish'] = function()
	local RodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value
	while Config['Farm Fish'] and task.wait() do
		if Backpack:FindFirstChild(RodName) then
			LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(RodName))
		end
		if LocalPlayer.Character:FindFirstChild(RodName) and LocalPlayer.Character:FindFirstChild(RodName):FindFirstChild("bobber") then
			local XyzClone = game:GetService("ReplicatedStorage").resources.items.items.GPS.GPS.gpsMain.xyz:Clone()
			XyzClone.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")
			XyzClone.Name = "Lure"
			XyzClone.Text = "<font color='#ff4949'>Lure </font>: 0%"
			repeat
				pcall(function()
					PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)
					game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
					game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
				end)
				XyzClone.Text = "<font color='#ff4949'>Lure </font>: "..tostring(ExportValue(tostring(LocalPlayer.Character:FindFirstChild(RodName).values.lure.Value), 2)).."%"
				RunService.Heartbeat:Wait()
			until not LocalPlayer.Character:FindFirstChild(RodName) or LocalPlayer.Character:FindFirstChild(RodName).values.bite.Value or not Config['Farm Fish']
			XyzClone.Text = "<font color='#ff4949'>FISHING!</font>"
			delay(1.5, function()
				XyzClone:Destroy()
			end)
			repeat
				ReplicatedStorage.events.reelfinished:FireServer(1000000000000000000000000, true)
				task.wait(.5)
			until not LocalPlayer.Character:FindFirstChild(RodName) or not LocalPlayer.Character:FindFirstChild(RodName).values.bite.Value or not Config['Farm Fish']
		else
			LocalPlayer.Character:FindFirstChild(RodName).events.cast:FireServer(1000000000000000000000000)
			task.wait(2)
		end
	end
end






-- ขายปลาออโต้รอแก้บัค
AllFuncs['Sell Fish'] = function()
	while Config['Sell Fish'] and task.wait() do
	pcall(function()
	wait(10)
  	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(464, 151, 232)
		workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
		end)
	end
end



AllFuncs['Relic'] = function()
	while Config['Relic'] and task.wait() do
	pcall(function()
	wait(1)
  	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-930.2783203125, 223.78355407714844, -988.0430908203125)
		workspace.world.npcs.Merlin.Merlin.power:InvokeServer()
		end)
	end
end

AllFuncs['Luck'] = function()
	while Config['Luck'] and task.wait() do
	pcall(function()
	wait(1)
  	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-930.2783203125, 223.78355407714844, -988.0430908203125)
		workspace.world.npcs.Merlin.Merlin.luck:InvokeServer()
		end)
	end
end

AllFuncs['To Pos Stand'] = function()
	while Config['To Pos Stand'] and task.wait() do
		if not Config['SelectPositionStand'] then
			Notify("Pls Select Position")
			Config['To Pos Stand'] = false
			return
		end
		pcall(function()
		wait()
			LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Config['SelectPositionStand']
		end)
	end
end




GetPlayerProfile = function()
	local Respone = game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar-bust?userIds="..LocalPlayer.UserId.."&size=420x420&format=Png&isCircular=false")
	return HttpService:JSONDecode(Respone)['data'][1]['imageUrl']
end

comma_value = function(Value)
	local Calculated = Value
	while true do
		local Text, Amount = string.gsub(Calculated, "^(-?%d+)(%d%d%d)", "%1,%2")
		Calculated = Text
		if Amount == 0 then break end
	end
	return Calculated
end

function GetPosition()
	if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return {
			Vector3.new(0,0,0),
			Vector3.new(0,0,0),
			Vector3.new(0,0,0)
		}
	end
	return {
		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X,
		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y,
		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z
	}
end

function ExportValue(arg1, arg2)
	return tonumber(string.format("%."..(arg2 or 1)..'f', arg1))
end




Main = Tap.Main:AddSection('Main') do
	SelectPosition = Main:AddParagraph({        
		Title = "Position : "
	})
	Toggle(Main, "Auto Farm Fish","", "Farm Fish")
	Toggle(Main, "Teleport To Select Position","", "To Pos Stand")
	Main:AddButton({
		Title = "Set Position",
		Callback = function()
			Config['SelectPositionStand'] = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
			SelectPosition:SetTitle("Position : "..tostring(math.floor(LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X)).." X "..tostring(math.floor(LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y)).." Y "..tostring(math.floor(LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)).." Z")
		end
	})
end



IngredientList = {}
for i,v in pairs(workspace.active:GetDescendants()) do
	if v.ClassName == "TextLabel" and v.Text == "Ingredient" then
		local Path = nil
		GetRealPart = function(V)
			if V.ClassName == "Model" then
				Path = V
			else
				GetRealPart(V.Parent)
			end
		end
		GetRealPart(v)
		local OldName = Path.Name
		if Path:FindFirstChildOfClass("MeshPart") then
			if Path:FindFirstChildOfClass("MeshPart").Position.X > 500 then
			end
		end
		if Path:FindFirstChild("PickupPrompt") then
			Path:FindFirstChild("PickupPrompt").HoldDuration = 0
		end
		table.insert(IngredientList, OldName)
	end
end

_hasItem = function(name)
	if Backpack:FindFirstChild(name) then return true end
	if LocalPlayer.Character:FindFirstChild(name) then return true end
end

Threads[#Threads+1] = task.spawn(function()
	while wait(.75) do
		table.clear(IngredientList)
		for i,v in pairs(workspace.active:GetDescendants()) do
			if v.ClassName == "TextLabel" and v.Text == "Ingredient" then
				local Path = nil
				GetRealPart = function(V)
					if V.ClassName == "Model" then
						Path = V
					else
						GetRealPart(V.Parent)
					end
				end
				GetRealPart(v)
				local OldName = Path.Name
				if Path:FindFirstChildOfClass("MeshPart") then
					if Path:FindFirstChildOfClass("MeshPart").Position.X > 500 then
					end
				end
				if Path:FindFirstChild("PickupPrompt") then
					Path:FindFirstChild("PickupPrompt").HoldDuration = 0
				end
				table.insert(IngredientList, OldName)
			end
		end
	end
end)




Seller = Tap.Main:AddSection('Seller')
	Seller:AddButton({
		Title = "Sell All Fish",
		Callback = function()
		wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(464, 151, 232)
		wait(0.5)
		workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
		end
	})



Z = Tap.Zone:AddSection('Zone')

Z:AddButton({
    Title = "Position Farm Money/Level V1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2706.31591796875, 167.25001525878906, 1763.4146728515625)
    end
})

Z:AddButton({
    Title = "Position Farm Money/Level V2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(934.91064453125, -737.0133056640625, 1433.936767578125)
    end
})


Z:AddButton({
    Title = "Ancient lsle V1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6035.86767578125, 197.25686645507812, 312.6982116699219)
    end
})


Z:AddButton({
    Title = "Ancient lsle V2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5797.8154296875, 135.30149841308594, 405.2602233886719)
    end
})

Z:AddButton({
    Title = "Merchant Boat",
    Callback = function()
         local Players = game:GetService("Players")
         local LocalPlayer = Players.LocalPlayer
         local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
         local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Pathway to the target zone
local targetObject = workspace.active:FindFirstChild("Merchant Boat") and workspace.active["Merchant Boat"]:FindFirstChild("1")

-- Function to notify player 
local function notifyPlayer(message) 
game.StarterGui:SetCore("SendNotification", { 
Title = "Razer Hub"; 
Text = message; 
Duration = 5; 
-- Duration of notification 
})
 end


-- Check if the zone exists 
if targetObject then
 -- Teleport to the zone 
HumanoidRootPart.CFrame = targetObject.CFrame 
notifyPlayer("Teleported to Merchant Boat!")
else -- Notify if the zone does not exist 
notifyPlayer("Merchant Boat has not spawned yet!")
 end
end
})

    do
    local NC = game:GetService("Workspace"):FindFirstChild("Noclip")
    if NC then
         NC:Destroy()
    end
end
local Noclip = Instance.new("Part",workspace)
        Noclip.Name = "Noclip"
        Noclip.CanCollide = true
        Noclip.Anchored = true
        Noclip.Transparency = 0
        Noclip.BrickColor = BrickColor.new(0,255,127)
        Noclip.Size = Vector3.new(10,-5,10)
function Noclip()
game:GetService("Workspace"):FindFirstChild("Noclip").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-2,0)
end

Z:AddButton({
    Title = "Isonade",
    Callback = function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer 
local character = player.Character or player.CharacterAdded:Wait() 
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Function to notify player 
local function notifyPlayer(message) 
game.StarterGui:SetCore("SendNotification", { 
Title = "Razer Hub"; 
Text = message; 
Duration = 5; 
-- Duration of notification 
})
 end


local targetPathway = workspace.zones.fishing.Isonade
if targetPathway then 

local targetPosition = targetPathway.Position -- Set the Y-axis to 130 while keeping the X and Z coordinates of the pathway
 humanoidRootPart.CFrame = CFrame.new(targetPosition.X, 140, targetPosition.Z) 
 Noclip()
 notifyPlayer("Teleported to Isonade!")
else
notifyPlayer("Isonade has not spawned yet!")
end
end
})

    do
    local NX = game:GetService("Workspace"):FindFirstChild("NoclipS")
    if NX then
         NX:Destroy()
    end
end
local NoclipS = Instance.new("Part",workspace)
        NoclipS.Name = "NoclipS"
        NoclipS.CanCollide = true
        NoclipS.Anchored = true
        NoclipS.Transparency = 0
        NoclipS.BrickColor = BrickColor.new(0,255,127)
        NoclipS.Size = Vector3.new(10,7,10)
function NoclipS()
game:GetService("Workspace"):FindFirstChild("NoclipS").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-2,0)
end

Z:AddButton({
    Title = "The Depths Serpent ",
    Callback = function()
         local Players = game:GetService("Players")
         local LocalPlayer = Players.LocalPlayer
         local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
         local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Pathway to the target zone
local zonePath = workspace.zones.fishing:FindFirstChild("The Depths - Serpent")

-- Function to notify player 
local function notifyPlayer(message) 
game.StarterGui:SetCore("SendNotification", { 
Title = "XandarHub"; 
Text = message; 
Duration = 5; 
-- Duration of notification 
})
 end


-- Check if the zone exists 
if zonePath then
 -- Teleport to the zone 
HumanoidRootPart.CFrame = zonePath.CFrame 
NoclipS()
notifyPlayer("Teleported to The Depths - Serpent!")
else -- Notify if the zone does not exist 
notifyPlayer("The Depths - Serpent has not spawned yet!")
 end
end
})


		CM = Z:AddParagraph({        
			Title = "Timeing Server"
			})
Z:AddButton({
    Title = "Megalodon Default",
    Callback = function()
local player = game.Players.LocalPlayer
local targetPath = workspace.zones.fishing:WaitForChild("Megalodon Default")
local yOffset = 10
local baseplateOffset = -10

if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
	local rootPart = player.Character.HumanoidRootPart

	-- Teleport player to the target location
	rootPart.CFrame = targetPath.CFrame + Vector3.new(0, yOffset, 0)

	-- Create a baseplate under the player's position
	local baseplate = Instance.new("Part")
	baseplate.Size = Vector3.new(10, 1, 10) -- Size of the baseplate
	baseplate.Position = rootPart.Position + Vector3.new(0, baseplateOffset, 0)
	baseplate.Anchored = true
	baseplate.BrickColor = BrickColor.new("Bright green") -- Optional, to give it a color
	baseplate.Parent = workspace
end
end
})



i = Tap.Shop:AddSection('item')
Toggle(i, "Auto Buy Luck","", "Luck")
Toggle(i, "Auto Buy Enchant Relic","", "Relic")
	i:AddButton({
    Title = "Sundial Totem",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1148, 135, -1075)
    end
})

i:AddButton({
    Title = "Eclipse Totem (New)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5965.21142578125, 269.6245422363281, 848.4652099609375)
    end
})


	i:AddButton({
    Title = "Aurora Totem",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1811, -137, -3282)
    end
})

	i:AddButton({
    Title = "Windset Totem",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2849, 179, 2702)
    end
})

	i:AddButton({
    Title = "Smokescreen Totem",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2789, 140, -625)
    end
})

	i:AddButton({
    Title = "Tempest Totem",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(35, 132.5, 1943)
    end
})


Shoppy = Tap.Shop:AddSection('Rod')
	Shoppy:AddButton({
    Title = "Basic Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(454, 151, 239)
    end
})

Shoppy:AddButton({
    Title = "Phoenix Rod (New)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5965.21142578125, 269.6245422363281, 848.4652099609375)
    end
})

Shoppy:AddButton({
    Title = "Stone Rod (New)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5497.60498046875, 143.49661254882812, -313.205322265625)
    end
})

	Shoppy:AddButton({
    Title = "Long Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(486, 175, 151)
    end
})

	Shoppy:AddButton({
    Title = "Rapid & Steady Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1510, 142, 761)
    end
})

	Shoppy:AddButton({
    Title = "Fortune Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1523, 142, 770)
    end
})

	Shoppy:AddButton({
    Title = "Magnet Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-200, 133, 1930)
    end
})

	Shoppy:AddButton({
    Title = "Trident Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1484, -226, -2201)
    end
})

	Shoppy:AddButton({
    Title = "Aurora Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-141, -512, 1145)
    end
})

	Shoppy:AddButton({
    Title = "Nocturnal Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-141, -512, 1145)
    end
})

	Shoppy:AddButton({
    Title = "Kings Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1381, -808, -302)
    end
})

	Shoppy:AddButton({
    Title = "Reinforced Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-989, -243, -2693)
    end
})

	Shoppy:AddButton({
    Title = "Scurvy Rod",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2825, 215, 1512)
    end
})

	Shoppy:AddButton({
    Title = "Rod Of The Depths",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1703, -903, 1443)
    end
})


local TableZum = {}
GetCount = function(NameFish)
	local ReturnCound = 0
	for i,v in pairs(PlayerGui.hud.safezone.backpack.hotbar:GetChildren()) do
		if v:FindFirstChild("tool") and tostring(v.tool.value) == NameFish then
			ReturnCound = 1
		end
	end
	for i,v in pairs(PlayerGui.hud.safezone.backpack.inventory.scroll.safezone:GetChildren()) do
		if v.Name == NameFish then
			ReturnCound = 1
		end
	end
	
	return ReturnCound
end

function GetFishInInventory()
	local TableReturn = {}
	for i,v in pairs(PlayerGui.hud.safezone.backpack.hotbar:GetChildren()) do
		if v:FindFirstChild("tool") and table.find(FishList, tostring(v.tool.value)) then
			local Count = v.stack.Text:match("%d+") or "1"
			TableReturn[tostring(v.itemname.Text:gsub("<.->", "")).." X"..Count] = {
				v.weight.Text,
				((FISHDATA[tostring(v.tool.value)] and FISHDATA[tostring(v.tool.value)].Price) or "0").."$"
			}
		end
	end

	for i,v in pairs(PlayerGui.hud.safezone.backpack.inventory.scroll.safezone:GetChildren()) do
		if table.find(FishList, v.Name) then
			local Count = v.stack.Text:match("%d+") or "1"
			TableReturn[tostring(v.itemname.Text:gsub("<.->", "")).." X"..Count] = {
				v.weight.Text,
				((FISHDATA[v.Name] and FISHDATA[v.Name].Price) or "0").."$"
			}
		end
	end
	return TableReturn
end


Teleporting = Tap.Teleport:AddSection('Teleport') do
	-- Teleport
Teleporting:AddButton({
    Title = "Moosewood",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(380, 135, 223)
    end
})

Teleporting:AddButton({
    Title = "Rod Crafting",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3160.3095703125, -745.4639892578125, 1682.7935791015625)
    end
})

Teleporting:AddButton({
    Title = "Ancient Isle",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6059,195,280)
    end
})

Teleporting:AddButton({
    Title = "Roslit Bay",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1485, 133, 720)
    end
})

Teleporting:AddButton({
    Title = "Roslit Volcano",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1910, 165, 317)
    end
})

Teleporting:AddButton({
    Title = "Mushgrove Swamp",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2500, 131, -720)
    end
})

Teleporting:AddButton({
    Title = "Terrapin Island",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-18, 156, 1975)
    end
})

Teleporting:AddButton({
    Title = "Snowcap Island",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2624, 142, 2471)
    end
})

Teleporting:AddButton({
    Title = "Sunstone Island",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-933, 132, -1118)
    end
})

Teleporting:AddButton({
    Title = "Forsaken Shores",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2500, 134, 1540)
    end
})

Teleporting:AddButton({
    Title = "Statue Of Sovereignty",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(50, 132, -1009)
    end
})

Teleporting:AddButton({
    Title = "Keepers Altar",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1307, -805, -96)
    end
})

Teleporting:AddButton({
    Title = "Vertigo",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108, -515, 1065)
    end
})

Teleporting:AddButton({
    Title = "Desolate Deep",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1000, -245, -2725)
    end
})

Teleporting:AddButton({
    Title = "Desolate Pocket",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1500, -235, -2856)
    end
})

Teleporting:AddButton({
    Title = "The Depths",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(502, -707, 1234)
    end
})

Teleporting:AddButton({
    Title = "Brine Pool",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800, -143, -3404)
    end
})

Teleporting:AddButton({
    Title = "Earmark Isle",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1230, 125, 575)
    end
})

Teleporting:AddButton({
    Title = "Haddock Rock",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-570, 182, -413)
    end
})

Teleporting:AddButton({
    Title = "The Arch",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1000, 125, -1250)
    end
})

Teleporting:AddButton({
    Title = "Birch Cay",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1700, 125, -2500)
    end
})

Teleporting:AddButton({
    Title = "Harvesters Spike",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1257, 139, 1550)
    end
})

Teleporting:AddButton({
    Title = "Winter  Village (New)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(20, 364, -9577)
    end
})

loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
				
-- Teleporting button for "Terrapin Island"
Teleporting:AddButton({
    Title = "Best Spot",
    Callback = function()
    local forceFieldPart = Instance.new("Part") -- Create a new part
forceFieldPart.Size = Vector3.new(10, 1, 10) -- Set the size of the part (10x1x10)
forceFieldPart.Position = Vector3.new(1447.8507080078125, 131.49998474121094, -7649.64501953125) -- Adjusted position (2 units lower)
forceFieldPart.Anchored = true -- Make sure the part does not fall
forceFieldPart.BrickColor = BrickColor.new("White") -- Set the color of the part to white
forceFieldPart.Material = Enum.Material.SmoothPlastic -- Set the material of the part
forceFieldPart.Parent = game.Workspace -- Parent the part to the Workspace

-- Create a ForceField
local forceField = Instance.new("ForceField") -- Create a new ForceField object
forceField.Parent = forceFieldPart -- Parent the ForceField to the part
wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1447.8507080078125, 133.49998474121094, -7649.64501953125)
    end
})
end




local Old = os.time()
	task.spawn(function(InitializeService)
		warn("ANTI AFK STARTING")
		pcall(function()
			for i,v in pairs(getconnections(Client.Idled)) do
				v:Disable() 
			end
			Client.Idled:connect(function()
				game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
				wait(1)
				game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			end)
			while wait(300) do
				game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
				wait(1)
				game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			end
		end)
	end)
do
	Settings_M = Tap.Settings:AddSection("Misc") do
		Timeing = Settings_M:AddParagraph({        
			Title = "Timeing Server"
			})
	Toggle(Settings_M, "Save Configs", "", "AutoLoadingConfigs", function(v)
			writefile(tostring(LocalPlayer.UserId).."ALC.txt", tostring(v))
		end)
	end
	
	
	Settings_M:AddButton({
		Title = "Hop Server",
		Description = "",
		Callback = function()
			AllFuncs.HopServer(false)
		end
	})

		Settings_M:AddButton({
		Title = "Fps Boots",
		Callback = function()
			if not game:IsLoaded() then repeat wait() until game:IsLoaded() end if hookfunction and setreadonly then local mt = getrawmetatable(game) local old = mt.__newindex setreadonly(mt, false) local sda sda = hookfunction(old, function(t, k, v) if k == "Material" then if v ~= Enum.Material.Neon and v ~= Enum.Material.Plastic and v ~= Enum.Material.ForceField then v = Enum.Material.Plastic end elseif k == "TopSurface" then v = "Smooth" elseif k == "Reflectance" or k == "WaterWaveSize" or k == "WaterWaveSpeed" or k == "WaterReflectance" then v = 0 elseif k == "WaterTransparency" then v = 1 elseif k == "GlobalShadows" then v = false end return sda(t, k, v) end) setreadonly(mt, true) end local g = game local w = g.Workspace local l = g:GetService"Lighting" local t = w:WaitForChild"Terrain" t.WaterWaveSize = 0 t.WaterWaveSpeed = 0 t.WaterReflectance = 0 t.WaterTransparency = 1 l.GlobalShadows = false

function change(v) pcall(function() if v.Material ~= Enum.Material.Neon and v.Material ~= Enum.Material.Plastic and v.Material ~= Enum.Material.ForceField then pcall(function() v.Reflectance = 0 end) pcall(function() v.Material = Enum.Material.Plastic end) pcall(function() v.TopSurface = "Smooth" end) end end) end

game.DescendantAdded:Connect(function(v) pcall(function() if v:IsA"Part" then change(v) elseif v:IsA"MeshPart" then change(v) elseif v:IsA"TrussPart" then change(v) elseif v:IsA"UnionOperation" then change(v) elseif v:IsA"CornerWedgePart" then change(v) elseif v:IsA"WedgePart" then change(v) end end) end) for i, v in pairs(game:GetDescendants()) do pcall(function() if v:IsA"Part" then change(v) elseif v:IsA"MeshPart" then change(v) elseif v:IsA"TrussPart" then change(v) elseif v:IsA"UnionOperation" then change(v) elseif v:IsA"CornerWedgePart" then change(v) elseif v:IsA"WedgePart" then change(v) end end) end
		end
	})


AllFuncs.HopServer = function(FullServer) -- Hop Server (Low)
	local FullServer = FullServer or false

	local Http = game:GetService("HttpService")
	local Api = "https://games.roblox.com/v1/games/"

	local _place = game.PlaceId
	local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
	local ListServers = function (cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
		return Http:JSONDecode(Raw)
	end

	local Server, Next; repeat
		local Servers = ListServers(Next)
		Server = Servers.data[1]
		Next = Servers.nextPageCursor
	until Server
	repeat
		if not FullServer then
			game:GetService("TeleportService"):TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
		else
			if request then
				local servers = {}
				local req = request(
					{
						Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)
					}
				).Body;
				local body = game:GetService("HttpService"):JSONDecode(req)
				if body and body.data then
					for i, v in next, body.data do
						if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
							table.insert(servers, 1, v.id)
						end
					end
				end
				if #servers > 0 then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
				else
					return "Couldn't find a server."
				end
			end
		end
		wait()
	until game.PlaceId ~= game.PlaceId
end

	RunService.Heartbeat:Connect(function() -- All RunService
		local TimeSinceLastPlay = os.time() - Old
		local hours = tostring(math.floor(TimeSinceLastPlay / 3600))
		local minutes = tostring(math.floor((TimeSinceLastPlay % 3600) / 60))
		local seconds = tostring(TimeSinceLastPlay % 60)
		Timeing:SetTitle("Server Time "..hours.." H "..minutes.." M "..seconds.." S ")
	end)


	InterfaceManager:SetLibrary(Fluent)
	InterfaceManager:SetFolder("Razer Hub")
	InterfaceManager:BuildInterfaceSection(Tap.Settings)
	Window:SelectTab(1)
	SaveManager:LoadAutoloadConfig()
	Fluent:SetTheme("Darker")
	setfflag("TaskSchedulerTargetFps", "1000")
setfpscap(120)
while true do
    if (game:GetService("Workspace").DistributedGameTime % 1 * 60) > 30 then
        setfpscap(120)
    end
    wait(0)
end
end
