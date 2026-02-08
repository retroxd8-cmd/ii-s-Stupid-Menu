	local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local ASSET_ID = "rbxassetid://79364212887891"
local NEON_ORANGE = Color3.fromRGB(255, 140, 0)

local function giveUI(player)
	local playerGui = player:WaitForChild("PlayerGui", 15)
	if not playerGui then return end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "StackedTextUI"
	screenGui.IgnoreGuiInset = true
	screenGui.Parent = playerGui

	-- Main Container (Static - does not rotate)
	local mainFrame = Instance.new("Frame")
	mainFrame.Size = UDim2.new(0, 300, 0, 100)
	mainFrame.Position = UDim2.new(1, -20, 1, -20)
	mainFrame.AnchorPoint = Vector2.new(1, 1)
	mainFrame.BackgroundTransparency = 1
	mainFrame.Parent = screenGui

	-- The Image (This is the only part that rotates)
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Size = UDim2.new(0, 80, 0, 80)
	imageLabel.Position = UDim2.new(1, 0, 0.5, 0)
	imageLabel.AnchorPoint = Vector2.new(1, 0.5)
	imageLabel.Image = ASSET_ID
	imageLabel.ImageColor3 = NEON_ORANGE
	imageLabel.BackgroundTransparency = 1
	imageLabel.Parent = mainFrame

	-- Text Container (Holds the two layers of text)
	local textGroup = Instance.new("Frame")
	textGroup.Size = UDim2.new(0, 180, 0, 80)
	textGroup.Position = UDim2.new(1, -90, 0.5, 0)
	textGroup.AnchorPoint = Vector2.new(1, 0.5)
	textGroup.BackgroundTransparency = 1
	textGroup.Parent = mainFrame

	-- Layer 1 (Top Text)
	local topText = Instance.new("TextLabel")
	topText.Text = "ii's Stupid Menu"
	topText.Font = Enum.Font.GothamBold
	topText.TextSize = 24
	topText.TextColor3 = NEON_ORANGE
	topText.TextXAlignment = Enum.TextXAlignment.Right
	topText.Size = UDim2.new(1, 0, 0.5, 0)
	topText.Position = UDim2.new(0, 0, 0, 5)
	topText.BackgroundTransparency = 1
	topText.Parent = textGroup

	-- Layer 2 (Bottom Text)
	local bottomText = Instance.new("TextLabel")
	bottomText.Text = "V1 Alpha"	bottomText.Font = Enum.Font.GothamBold
	bottomText.TextSize = 18 -- Slightly smaller for a "layered" look
	bottomText.TextColor3 = NEON_ORANGE
	bottomText.TextXAlignment = Enum.TextXAlignment.Right
	bottomText.Size = UDim2.new(1, 0, 0.5, 0)
	bottomText.Position = UDim2.new(0, 0, 0.5, -0.5)
	bottomText.BackgroundTransparency = 1
	bottomText.Parent = textGroup

	-- Animation: Only the Image rotates
	imageLabel.Rotation = -12
	local tweenInfo = TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
	TweenService:Create(imageLabel, tweenInfo, {Rotation = 12}):Play()
end

Players.PlayerAdded:Connect(giveUI)
for _, player in pairs(Players:GetPlayers()) do
	giveUI(player)
end
