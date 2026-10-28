-- ============================================
-- VHAN - STEAL AN EGG SCRIPT
-- ============================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Hapus GUI lama jika ada agar tidak menumpuk
if LocalPlayer.PlayerGui:FindFirstChild("VhanHub") then
    LocalPlayer.PlayerGui.VhanHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VhanHub"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Jendela Utama
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 240)
MainFrame.Active = true
MainFrame.Draggable = true

-- Bar Judul dengan Logo [ Vh ]
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(138, 43, 226) -- Warna Ungu Keren
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BorderSizePixel = 0

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.Font = Enum.Font.SourceSansBold
TitleText.Text = " [ Vh ] - Vhan (Steal an Egg)"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 15
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Tombol 1: Teleport ke Sarang/Telur
local TeleportBtn = Instance.new("TextButton")
TeleportBtn.Parent = MainFrame
TeleportBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TeleportBtn.Position = UDim2.new(0.05, 0, 0.23, 0)
TeleportBtn.Size = UDim2.new(0.9, 0, 0, 38)
TeleportBtn.Font = Enum.Font.SourceSans
TeleportBtn.Text = "⚡ Teleport ke Sarang"
TeleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportBtn.TextSize = 14

-- Tombol 2: Speed Boost (Lari Cepat)
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Parent = MainFrame
SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBtn.Position = UDim2.new(0.05, 0, 0.44, 0)
SpeedBtn.Size = UDim2.new(0.9, 0, 0, 38)
SpeedBtn.Font = Enum.Font.SourceSans
SpeedBtn.Text = "🏃 Speed Boost (OFF)"
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.TextSize = 14

-- Tombol 3: Auto Steal Simulator
local AutoStealBtn = Instance.new("TextButton")
AutoStealBtn.Parent = MainFrame
AutoStealBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AutoStealBtn.Position = UDim2.new(0.05, 0, 0.65, 0)
AutoStealBtn.Size = UDim2.new(0.9, 0, 0, 38)
AutoStealBtn.Font = Enum.Font.SourceSans
AutoStealBtn.Text = "🥚 Auto Steal Egg (OFF)"
AutoStealBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoStealBtn.TextSize = 14

-- Tombol Close (Tutup Menu)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
CloseBtn.Position = UDim2.new(0.05, 0, 0.85, 0)
CloseBtn.Size = UDim2.new(0.9, 0, 0, 28)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Text = "Tutup Menu"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 13

-- Fungsi Tombol-tombol
TeleportBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(0, 50, 0)
        print("Vhan: Berhasil Teleport!")
    end
end)

local speedOn = false
SpeedBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local human = char:FindFirstChildOfClass("Humanoid")
    speedOn = not speedOn
    if human then
        if speedOn then
            human.WalkSpeed = 60
            SpeedBtn.Text = "🏃 Speed Boost (ON)"
            SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
        else
            human.WalkSpeed = 16
            SpeedBtn.Text = "🏃 Speed Boost (OFF)"
            SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end
end)

local autoStealOn = false
AutoStealBtn.MouseButton1Click:Connect(function()
    autoStealOn = not autoStealOn
    if autoStealOn then
        AutoStealBtn.Text = "🥚 Auto Steal Egg (ON)"
        AutoStealBtn.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
        print("Vhan: Auto Steal diaktifkan!")
    else
        AutoStealBtn.Text = "🥚 Auto Steal Egg (OFF)"
        AutoStealBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        print("Vhan: Auto Steal dimatikan!")
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("Vhan Script Berhasil Dimuat!")
