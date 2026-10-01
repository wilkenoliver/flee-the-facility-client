-- Xct Hub — Studio Edition
-- LocalScript: StarterPlayer > StarterPlayerScripts
-- Requer ReplicatedStorage/XctHub/Config (ModuleScript).

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local config = require(ReplicatedStorage:WaitForChild("XctHub"):WaitForChild("Config"))

local gui = Instance.new("ScreenGui")
gui.Name = "XctHubStudio"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local toggle = Instance.new("TextButton")
toggle.Name = "Toggle"
toggle.Size = UDim2.fromOffset(110, 34)
toggle.Position = UDim2.fromOffset(16, 16)
toggle.BackgroundColor3 = config.Accent
toggle.TextColor3 = config.Text
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 14
toggle.Text = config.Name
toggle.Parent = gui
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 8)

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.Size = UDim2.fromOffset(270, 130)
panel.Position = UDim2.fromOffset(16, 58)
panel.BackgroundColor3 = config.Background
panel.Visible = true
panel.Parent = gui
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 30)
title.Position = UDim2.fromOffset(10, 8)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = config.Text
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Text = config.Name .. " | " .. config.Subtitle
title.Parent = panel

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 65)
status.Position = UDim2.fromOffset(10, 44)
status.BackgroundTransparency = 1
status.TextXAlignment = Enum.TextXAlignment.Left
status.TextYAlignment = Enum.TextYAlignment.Top
status.TextWrapped = true
status.TextColor3 = config.Text
status.Font = Enum.Font.Gotham
status.TextSize = 13
status.Parent = panel

local function refresh()
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        status.Text = ("Jogador: %s\nVida: %d / %d\nEstado: %s"):format(
            player.Name,
            math.floor(humanoid.Health),
            math.floor(humanoid.MaxHealth),
            humanoid:GetState().Name
        )
    else
        status.Text = "Jogador: " .. player.Name .. "\nPersonagem carregando..."
    end
end

toggle.MouseButton1Click:Connect(function()
    panel.Visible = not panel.Visible
end)

player.CharacterAdded:Connect(function()
    task.wait(0.2)
    refresh()
end)

task.spawn(function()
    while gui.Parent do
        refresh()
        task.wait(config.RefreshSeconds)
    end
end)
