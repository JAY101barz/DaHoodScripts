-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Colortogle = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local FPS = Instance.new("TextBox")
local UICorner_4 = Instance.new("UICorner")
local TextButton_2 = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TextButton_3 = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local TextButton_4 = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.296791434, 0, 0.320634931, 0)
Frame.Size = UDim2.new(0, 315, 0, 198)

UICorner.Parent = Frame

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton.Position = UDim2.new(0.0603174567, 0, 0.25757575, 0)
TextButton.Size = UDim2.new(0, 118, 0, 29)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Detener Renderizado"
TextButton.TextColor3 = Color3.fromRGB(168, 168, 168)
TextButton.TextSize = 14.000

UICorner_2.Parent = TextButton

Colortogle.Name = "Colortogle"
Colortogle.Parent = TextButton
Colortogle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Colortogle.Position = UDim2.new(0, 0, 1, 0)
Colortogle.Size = UDim2.new(0, 118, 0, 6)

UICorner_3.Parent = Colortogle

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.18095237, 0, 5.12227416e-09, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.Arcade
TextLabel.Text = "AutoFarm Control Panel"
TextLabel.TextColor3 = Color3.fromRGB(190, 190, 190)
TextLabel.TextSize = 24.000

FPS.Name = "FPS"
FPS.Parent = Frame
FPS.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
FPS.Position = UDim2.new(0.0603174604, 0, 0.49494949, 0)
FPS.Size = UDim2.new(0, 118, 0, 32)
FPS.Font = Enum.Font.SourceSans
FPS.PlaceholderText = "FPS Limit"
FPS.Text = ""
FPS.TextColor3 = Color3.fromRGB(0, 0, 0)
FPS.TextSize = 15.000
FPS.TextWrapped = true

UICorner_4.Parent = FPS

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_2.Position = UDim2.new(0.0603174567, 0, 0.722222209, 0)
TextButton_2.Size = UDim2.new(0, 118, 0, 29)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "Limitar FPS"
TextButton_2.TextColor3 = Color3.fromRGB(168, 168, 168)
TextButton_2.TextSize = 14.000

UICorner_5.Parent = TextButton_2

TextButton_3.Parent = Frame
TextButton_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_3.Position = UDim2.new(0.536507964, 0, 0.722222209, 0)
TextButton_3.Size = UDim2.new(0, 118, 0, 29)
TextButton_3.Font = Enum.Font.SourceSans
TextButton_3.Text = "Low GFX"
TextButton_3.TextColor3 = Color3.fromRGB(168, 168, 168)
TextButton_3.TextSize = 14.000

UICorner_6.Parent = TextButton_3

TextButton_4.Parent = Frame
TextButton_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_4.Position = UDim2.new(0.536507964, 0, 0.5, 0)
TextButton_4.Size = UDim2.new(0, 118, 0, 29)
TextButton_4.Font = Enum.Font.SourceSans
TextButton_4.Text = "Destroy Map"
TextButton_4.TextColor3 = Color3.fromRGB(168, 168, 168)
TextButton_4.TextSize = 14.000

UICorner_7.Parent = TextButton_4

-- Scripts:

local function DVQUXCY_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local button = script.Parent
	local color = script.Parent.Colortogle
	local green = Color3.new(0, 0.666667, 0)
	local red = Color3.new(0.666667, 0, 0)
	
	
	button.MouseButton1Click:Connect(function()
		if color.BackgroundColor3 == red then
			color.BackgroundColor3 = green
			game:GetService("RunService"):Set3dRenderingEnabled(false)
			
		else
			color.BackgroundColor3 = red
			game:GetService("RunService"):Set3dRenderingEnabled(true)
		end
		
	end)
end
coroutine.wrap(DVQUXCY_fake_script)()
local function DUGWDFL_fake_script() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)

	local button = script.Parent
	
	
	
	
	button.MouseButton1Click:Connect(function()
		
			setfpscap(tonumber(script.Parent.Parent.FPS.Text))
			
	end)
end
coroutine.wrap(DUGWDFL_fake_script)()
local function NTLEW_fake_script() -- TextButton_3.LocalScript 
	local script = Instance.new('LocalScript', TextButton_3)

	local button = script.Parent
	local value = script.Parent.Parent.FPS.Text
	
	
	
	button.MouseButton1Click:Connect(function()
		local a = game
		local b = a.Workspace
		local c = a.Lighting
		local d = b.Terrain
		d.WaterWaveSize = 0
		d.WaterWaveSpeed = 0
		d.WaterReflectance = 0
		d.WaterTransparency = 0
		c.GlobalShadows = false
		c.FogEnd = 9e9
		c.Brightness = 0
		settings().Rendering.QualityLevel = "Level01"
		for e, f in pairs(a:GetDescendants()) do
			if f:IsA("Part") or f:IsA("Union") or f:IsA("CornerWedgePart") or f:IsA("TrussPart") then
				f.Material = "Plastic"
				f.Reflectance = 0
			elseif f:IsA("Decal") or f:IsA("Texture") then
				f.Transparency = 0
			elseif f:IsA("ParticleEmitter") or f:IsA("Trail") then
				f.Lifetime = NumberRange.new(0)
			elseif f:IsA("Explosion") then
				f.BlastPressure = 0
				f.BlastRadius = 0
			elseif f:IsA("Fire") or f:IsA("SpotLight") or f:IsA("Smoke") or f:IsA("Sparkles") then
				f.Enabled = false
			elseif f:IsA("MeshPart") then
				f.Material = "Plastic"
				f.Reflectance = 0
				f.TextureID = 10385902758728957
			end
		end
		for e, g in pairs(c:GetChildren()) do
			if
				g:IsA("BlurEffect") or g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or
				g:IsA("DepthOfFieldEffect")
			then
				g.Enabled = false
			end
		end
		sethiddenproperty(game.Lighting, "Technology", "Compatibility")
	end)
end
coroutine.wrap(NTLEW_fake_script)()
local function PAYNQ_fake_script() -- TextButton_4.LocalScript 
	local script = Instance.new('LocalScript', TextButton_4)

	local button = script.Parent
	local value = script.Parent.Parent.FPS.Text
	
	
	
	button.MouseButton1Click:Connect(function()
		game.Workspace.MAP:Destroy()
	end)
end
coroutine.wrap(PAYNQ_fake_script)()
local function SOHQNVE_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
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
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(SOHQNVE_fake_script)()
