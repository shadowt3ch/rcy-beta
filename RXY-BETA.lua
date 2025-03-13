-- Main UI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local URLLabel = Instance.new("TextLabel")
local TabFrame = Instance.new("Frame")
local TitleAccent = Instance.new("Frame")
local TabAccent = Instance.new("Frame")

-- Parent to PlayerGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame Properties
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- Title Bar
TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

-- Title Accent Line
TitleAccent.Parent = TitleBar
TitleAccent.Size = UDim2.new(1, 0, 0, 2)
TitleAccent.Position = UDim2.new(0, 0, 1, -2)
TitleAccent.BackgroundColor3 = Color3.fromRGB(138, 43, 226) -- Purple Line

-- Title
Title.Parent = TitleBar
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.Text = "RXY BETA  |  The Bronx  |  Delta"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

-- URL Label
URLLabel.Parent = TitleBar
URLLabel.Size = UDim2.new(0.3, -5, 1, 0)
URLLabel.Position = UDim2.new(0.7, 0, 0, 0)
URLLabel.Text = "URL: rxy.shadowt3ch.site"
URLLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
URLLabel.Font = Enum.Font.Gotham
URLLabel.TextSize = 12
URLLabel.BackgroundTransparency = 1
URLLabel.TextXAlignment = Enum.TextXAlignment.Right

-- Tab Frame
TabFrame.Parent = MainFrame
TabFrame.Size = UDim2.new(1, 0, 0, 30)
TabFrame.Position = UDim2.new(0, 0, 0, 30)
TabFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

-- Tab Accent Line
TabAccent.Parent = TabFrame
TabAccent.Size = UDim2.new(1, 0, 0, 2)
TabAccent.Position = UDim2.new(0, 0, 1, -2)
TabAccent.BackgroundColor3 = Color3.fromRGB(138, 43, 226) -- Purple Line

-- Tabs Setup
local Tabs = {"Main", "Combat", "ESP", "Players", "Farms", "Misc", "Settings"}
local ContentFrames = {}
for i, tabName in ipairs(Tabs) do
	local TabButton = Instance.new("TextButton")
	TabButton.Parent = TabFrame
	TabButton.Size = UDim2.new(0.14, -2, 1, 0)
	TabButton.Position = UDim2.new((i - 1) * 0.14, 0, 0, 0)
	TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TabButton.Text = tabName
	TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
	TabButton.Font = Enum.Font.Gotham
	TabButton.TextSize = 12

	-- Hover Effect with Purple Highlight
	TabButton.MouseEnter:Connect(function()
		TabButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
	end)
	TabButton.MouseLeave:Connect(function()
		TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	end)

	-- Content Frames
	local ContentFrame = Instance.new("Frame")
	ContentFrame.Parent = MainFrame
	ContentFrame.Size = UDim2.new(1, 0, 1, -60)
	ContentFrame.Position = UDim2.new(0, 0, 0, 60)
	ContentFrame.BackgroundTransparency = 1
	ContentFrame.Visible = (i == 1)
	ContentFrames[tabName] = ContentFrame

	-- Tab Switching
	TabButton.MouseButton1Click:Connect(function()
		for _, frame in pairs(ContentFrames) do
			frame.Visible = false
		end
		ContentFrame.Visible = true
	end)
end

-- Add Content for Each Tab
local function createTabContent(tabName, ContentFrame)
	if tabName == "Main" then
		-- Main Tab Content
		-- Main Tab UI Elements
		local mainFrame = Instance.new("Frame")
		mainFrame.Parent = ContentFrame
		mainFrame.Size = UDim2.new(1, 0, 1, 0)
		mainFrame.BackgroundTransparency = 1

		-- Welcome Message
		local welcomeLabel = Instance.new("TextLabel")
		welcomeLabel.Parent = mainFrame
		welcomeLabel.Size = UDim2.new(1, 0, 0.1, 0)
		welcomeLabel.Position = UDim2.new(0, 0, 0, 0)
		welcomeLabel.Text = "Welcome to the RXY Beta!"
		welcomeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		welcomeLabel.Font = Enum.Font.GothamBold
		welcomeLabel.TextSize = 20
		welcomeLabel.BackgroundTransparency = 1
		welcomeLabel.TextXAlignment = Enum.TextXAlignment.Center

		-- Status Indicator
		local statusLabel = Instance.new("TextLabel")
		statusLabel.Parent = mainFrame
		statusLabel.Size = UDim2.new(1, 0, 0.08, 0)
		statusLabel.Position = UDim2.new(0, 0, 0.1, 0)
		statusLabel.Text = "Status: BETA"
		statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
		statusLabel.Font = Enum.Font.Gotham
		statusLabel.TextSize = 16
		statusLabel.BackgroundTransparency = 1
		statusLabel.TextXAlignment = Enum.TextXAlignment.Center

		-- Latest Updates Section
		local updatesTitle = Instance.new("TextLabel")
		updatesTitle.Parent = mainFrame
		updatesTitle.Size = UDim2.new(1, 0, 0.06, 0)
		updatesTitle.Position = UDim2.new(0, 0, 0.2, 0)
		updatesTitle.Text = "Latest Updates:"
		updatesTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
		updatesTitle.Font = Enum.Font.GothamBold
		updatesTitle.TextSize = 18
		updatesTitle.BackgroundTransparency = 1
		updatesTitle.TextXAlignment = Enum.TextXAlignment.Center

		local updatesText = Instance.new("TextLabel")
		updatesText.Parent = mainFrame
		updatesText.Size = UDim2.new(1, 0, 0.12, 0)
		updatesText.Position = UDim2.new(0, 0, 0.26, 0)
		updatesText.Text = "- Bug fixes\n- Improved UI\n- Added new cheats!"
		updatesText.TextColor3 = Color3.fromRGB(200, 200, 200)
		updatesText.Font = Enum.Font.Gotham
		updatesText.TextSize = 14
		updatesText.BackgroundTransparency = 1
		updatesText.TextXAlignment = Enum.TextXAlignment.Center

		-- Credits Section
		local creditsTitle = Instance.new("TextLabel")
		creditsTitle.Parent = mainFrame
		creditsTitle.Size = UDim2.new(1, 0, 0.06, 0)
		creditsTitle.Position = UDim2.new(0, 0, 0.4, 0)
		creditsTitle.Text = "Credits:"
		creditsTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
		creditsTitle.Font = Enum.Font.GothamBold
		creditsTitle.TextSize = 18
		creditsTitle.BackgroundTransparency = 1
		creditsTitle.TextXAlignment = Enum.TextXAlignment.Center

		local creditsText = Instance.new("TextLabel")
		creditsText.Parent = mainFrame
		creditsText.Size = UDim2.new(1, 0, 0.12, 0)
		creditsText.Position = UDim2.new(0, 0, 0.46, 0)
		creditsText.Text = "Developer: ShadowT3ch\nSpecial thanks: Community"
		creditsText.TextColor3 = Color3.fromRGB(200, 200, 200)
		creditsText.Font = Enum.Font.Gotham
		creditsText.TextSize = 14
		creditsText.BackgroundTransparency = 1
		creditsText.TextXAlignment = Enum.TextXAlignment.Center

		-- Discord Invite Button
		local discordButton = Instance.new("TextButton")
		discordButton.Parent = mainFrame
		discordButton.Size = UDim2.new(0.6, 0, 0.1, 0)
		discordButton.Position = UDim2.new(0.2, 0, 0.6, 0)
		discordButton.Text = "Join Our Discord"
		discordButton.TextColor3 = Color3.fromRGB(200, 200, 200)
		discordButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		discordButton.Font = Enum.Font.GothamBold
		discordButton.TextSize = 16
		discordButton.MouseButton1Click:Connect(function()
			setclipboard("https://discord.gg/hpeSvjypEK") -- Replace with actual invite link
			print("Discord link copied to clipboard!")
		end)
	elseif tabName == "Combat" then
		-- Combat Tab: Toggle Aimbot, Auto Fire, etc.
		-- Aimbot Toggle
		local aimbotToggle = Instance.new("TextButton")
		aimbotToggle.Parent = ContentFrame
		aimbotToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		aimbotToggle.Position = UDim2.new(0.1, 0, 0.1, 0)
		aimbotToggle.Text = "Toggle Aimbot"
		aimbotToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		aimbotToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		aimbotToggle.Font = Enum.Font.Gotham
		aimbotToggle.TextSize = 14
		aimbotToggle.MouseButton1Click:Connect(function()
			print("Aimbot Toggled")
			-- Code to toggle aimbot here
		end)

		-- Auto Fire Toggle
		local autoFireToggle = Instance.new("TextButton")
		autoFireToggle.Parent = ContentFrame
		autoFireToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		autoFireToggle.Position = UDim2.new(0.1, 0, 0.3, 0)
		autoFireToggle.Text = "Toggle Auto Fire"
		autoFireToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		autoFireToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		autoFireToggle.Font = Enum.Font.Gotham
		autoFireToggle.TextSize = 14
		autoFireToggle.MouseButton1Click:Connect(function()
			print("Auto Fire Toggled")
			-- Code to toggle auto fire here
		end)

		-- Recoil Toggle
		local recoilToggle = Instance.new("TextButton")
		recoilToggle.Parent = ContentFrame
		recoilToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		recoilToggle.Position = UDim2.new(0.1, 0, 0.5, 0)
		recoilToggle.Text = "Toggle Recoil"
		recoilToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		recoilToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		recoilToggle.Font = Enum.Font.Gotham
		recoilToggle.TextSize = 14
		recoilToggle.MouseButton1Click:Connect(function()
			print("Recoil Toggled")
			-- Code to toggle recoil here
		end)
	elseif tabName == "ESP" then
		-- ESP Tab: Toggle ESP and Tracers
		-- Toggle ESP
		local espToggle = Instance.new("TextButton")
		espToggle.Parent = ContentFrame
		espToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		espToggle.Position = UDim2.new(0.1, 0, 0.1, 0)
		espToggle.Text = "Toggle ESP"
		espToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		espToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		espToggle.Font = Enum.Font.Gotham
		espToggle.TextSize = 14
		espToggle.MouseButton1Click:Connect(function()
			print("ESP Toggled")
			-- Code to toggle ESP here
		end)

		-- Toggle Box ESP
		local boxToggle = Instance.new("TextButton")
		boxToggle.Parent = ContentFrame
		boxToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		boxToggle.Position = UDim2.new(0.1, 0, 0.3, 0)
		boxToggle.Text = "Toggle Box ESP"
		boxToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		boxToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		boxToggle.Font = Enum.Font.Gotham
		boxToggle.TextSize = 14
		boxToggle.MouseButton1Click:Connect(function()
			print("Box ESP Toggled")
			-- Code to toggle box ESP here
		end)

		-- Toggle Name ESP
		local nameToggle = Instance.new("TextButton")
		nameToggle.Parent = ContentFrame
		nameToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		nameToggle.Position = UDim2.new(0.1, 0, 0.5, 0)
		nameToggle.Text = "Toggle Name ESP"
		nameToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		nameToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		nameToggle.Font = Enum.Font.Gotham
		nameToggle.TextSize = 14
		nameToggle.MouseButton1Click:Connect(function()
			print("Name ESP Toggled")
			-- Code to toggle name ESP here
		end)

		-- Toggle Distance ESP
		local distanceToggle = Instance.new("TextButton")
		distanceToggle.Parent = ContentFrame
		distanceToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		distanceToggle.Position = UDim2.new(0.1, 0, 0.7, 0)
		distanceToggle.Text = "Toggle Distance ESP"
		distanceToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		distanceToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		distanceToggle.Font = Enum.Font.Gotham
		distanceToggle.TextSize = 14
		distanceToggle.MouseButton1Click:Connect(function()
			print("Distance ESP Toggled")
			-- Code to toggle distance ESP here
		end)
	elseif tabName == "Players" then
		-- Players Tab: Teleport to players, etc.
		-- Teleport to Player Button
		local teleportToPlayerButton = Instance.new("TextButton")
		teleportToPlayerButton.Parent = ContentFrame
		teleportToPlayerButton.Size = UDim2.new(0.8, 0, 0.1, 0)
		teleportToPlayerButton.Position = UDim2.new(0.1, 0, 0.1, 0)
		teleportToPlayerButton.Text = "Teleport to Player"
		teleportToPlayerButton.TextColor3 = Color3.fromRGB(200, 200, 200)
		teleportToPlayerButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		teleportToPlayerButton.Font = Enum.Font.Gotham
		teleportToPlayerButton.TextSize = 14
		teleportToPlayerButton.MouseButton1Click:Connect(function()
			print("Teleporting to player...")
			-- Add teleport logic here
		end)

		-- No-Clip Toggle
		local noClipToggle = Instance.new("TextButton")
		noClipToggle.Parent = ContentFrame
		noClipToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		noClipToggle.Position = UDim2.new(0.1, 0, 0.3, 0)
		noClipToggle.Text = "Toggle No-Clip"
		noClipToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		noClipToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		noClipToggle.Font = Enum.Font.Gotham
		noClipToggle.TextSize = 14
		noClipToggle.MouseButton1Click:Connect(function()
			print("No-Clip Toggled")
			-- Code to toggle no-clip here
		end)

		-- View Player Data
		local viewPlayerDataButton = Instance.new("TextButton")
		viewPlayerDataButton.Parent = ContentFrame
		viewPlayerDataButton.Size = UDim2.new(0.8, 0, 0.1, 0)
		viewPlayerDataButton.Position = UDim2.new(0.1, 0, 0.5, 0)
		viewPlayerDataButton.Text = "View Player Data"
		viewPlayerDataButton.TextColor3 = Color3.fromRGB(200, 200, 200)
		viewPlayerDataButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		viewPlayerDataButton.Font = Enum.Font.Gotham
		viewPlayerDataButton.TextSize = 14
		viewPlayerDataButton.MouseButton1Click:Connect(function()
			print("Viewing Player Data...")
			-- Add player data viewing logic here
		end)
	elseif tabName == "Farms" then
		-- Farms Tab: Set up farm-related features
		-- Start Farming Button
		local farmStartButton = Instance.new("TextButton")
		farmStartButton.Parent = ContentFrame
		farmStartButton.Size = UDim2.new(0.8, 0, 0.1, 0)
		farmStartButton.Position = UDim2.new(0.1, 0, 0.1, 0)
		farmStartButton.Text = "Start Farming"
		farmStartButton.TextColor3 = Color3.fromRGB(200, 200, 200)
		farmStartButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		farmStartButton.Font = Enum.Font.Gotham
		farmStartButton.TextSize = 14
		farmStartButton.MouseButton1Click:Connect(function()
			print("Farming started!")
			-- Code to start farming here
		end)

		-- Stop Farming Button
		local farmStopButton = Instance.new("TextButton")
		farmStopButton.Parent = ContentFrame
		farmStopButton.Size = UDim2.new(0.8, 0, 0.1, 0)
		farmStopButton.Position = UDim2.new(0.1, 0, 0.3, 0)
		farmStopButton.Text = "Stop Farming"
		farmStopButton.TextColor3 = Color3.fromRGB(200, 200, 200)
		farmStopButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		farmStopButton.Font = Enum.Font.Gotham
		farmStopButton.TextSize = 14
		farmStopButton.MouseButton1Click:Connect(function()
			print("Farming stopped!")
			-- Code to stop farming here
		end)

		-- Auto Collect Toggle
		local autoCollectToggle = Instance.new("TextButton")
		autoCollectToggle.Parent = ContentFrame
		autoCollectToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		autoCollectToggle.Position = UDim2.new(0.1, 0, 0.5, 0)
		autoCollectToggle.Text = "Toggle Auto Collect"
		autoCollectToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		autoCollectToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		autoCollectToggle.Font = Enum.Font.Gotham
		autoCollectToggle.TextSize = 14
		autoCollectToggle.MouseButton1Click:Connect(function()
			print("Auto Collect Toggled")
			-- Code to toggle auto collect here
		end)
	elseif tabName == "Misc" then
		-- Misc Tab: Settings, color changers, etc.
		-- Change Walk Speed
		local walkSpeedSlider = Instance.new("TextButton")
		walkSpeedSlider.Parent = ContentFrame
		walkSpeedSlider.Size = UDim2.new(0.8, 0, 0.1, 0)
		walkSpeedSlider.Position = UDim2.new(0.1, 0, 0.1, 0)
		walkSpeedSlider.Text = "Change Walk Speed"
		walkSpeedSlider.TextColor3 = Color3.fromRGB(200, 200, 200)
		walkSpeedSlider.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		walkSpeedSlider.Font = Enum.Font.Gotham
		walkSpeedSlider.TextSize = 14
		walkSpeedSlider.MouseButton1Click:Connect(function()
			print("Walk speed adjusted!")
			-- Code to change walk speed here
		end)

		-- Change Jump Power
		local jumpPowerSlider = Instance.new("TextButton")
		jumpPowerSlider.Parent = ContentFrame
		jumpPowerSlider.Size = UDim2.new(0.8, 0, 0.1, 0)
		jumpPowerSlider.Position = UDim2.new(0.1, 0, 0.3, 0)
		jumpPowerSlider.Text = "Change Jump Power"
		jumpPowerSlider.TextColor3 = Color3.fromRGB(200, 200, 200)
		jumpPowerSlider.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		jumpPowerSlider.Font = Enum.Font.Gotham
		jumpPowerSlider.TextSize = 14
		jumpPowerSlider.MouseButton1Click:Connect(function()
			print("Jump power adjusted!")
			-- Code to change jump power here
		end)

		-- Toggle Fog Circle
		local fogCircleToggle = Instance.new("TextButton")
		fogCircleToggle.Parent = ContentFrame
		fogCircleToggle.Size = UDim2.new(0.8, 0, 0.1, 0)
		fogCircleToggle.Position = UDim2.new(0.1, 0, 0.5, 0)
		fogCircleToggle.Text = "Toggle Fog Circle"
		fogCircleToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
		fogCircleToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		fogCircleToggle.Font = Enum.Font.Gotham
		fogCircleToggle.TextSize = 14
		fogCircleToggle.MouseButton1Click:Connect(function()
			print("Fog Circle Toggled")
			-- Code to toggle fog circle here
		end)
	elseif tabName == "Settings" then
		-- Settings Tab: Add any settings or configurations
		local settingsText = Instance.new("TextLabel")
		settingsText.Parent = ContentFrame
		settingsText.Size = UDim2.new(1, 0, 0.2, 0)
		settingsText.Text = "Settings options are currently unavailable."
		settingsText.TextColor3 = Color3.fromRGB(200, 200, 200)
		settingsText.Font = Enum.Font.Gotham
		settingsText.TextSize = 14
		settingsText.BackgroundTransparency = 1
		settingsText.TextXAlignment = Enum.TextXAlignment.Center
	end
end

-- Create Content for All Tabs
for _, tabName in pairs(Tabs) do
	local ContentFrame = ContentFrames[tabName]
	createTabContent(tabName, ContentFrame)
end
