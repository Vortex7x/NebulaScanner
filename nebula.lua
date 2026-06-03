-- NEBULA SCANNER V3.0 - Delta Executor Edition
-- جميع المشاكل السابقة تم إصلاحها

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

--==================================================================================
--                          إنشاء الواجهة الرئيسية
--==================================================================================

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NebulaScanner"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- الإطار الرئيسي
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 550)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSize = 0
MainFrame.Parent = screenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = MainFrame

-- شريط العنوان
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.BackgroundTransparency = 0.9
TitleBar.BorderSize = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

-- عنوان
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "NEBULA SCANNER V3.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = TitleBar

-- زر الإغلاق
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -42, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.BackgroundTransparency = 0.3
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.BorderSize = 0
CloseBtn.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- زر بدء المسح
local ScanBtn = Instance.new("TextButton")
ScanBtn.Size = UDim2.new(0, 280, 0, 50)
ScanBtn.Position = UDim2.new(0.5, -140, 0, 80)
ScanBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScanBtn.BackgroundTransparency = 0.85
ScanBtn.Text = "▶ START SCANNING ◀"
ScanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ScanBtn.TextSize = 18
ScanBtn.Font = Enum.Font.SourceSansBold
ScanBtn.BorderSize = 0
ScanBtn.Parent = MainFrame

local ScanCorner = Instance.new("UICorner")
ScanCorner.CornerRadius = UDim.new(0, 25)
ScanCorner.Parent = ScanBtn

-- قائمة الثغرات (ستظهر عند الضغط)
local VulnList = Instance.new("ScrollingFrame")
VulnList.Size = UDim2.new(0, 440, 0, 250)
VulnList.Position = UDim2.new(0.5, -220, 0, 150)
VulnList.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
VulnList.BackgroundTransparency = 0.5
VulnList.BorderSize = 0
VulnList.CanvasSize = UDim2.new(0, 0, 0, 0)
VulnList.ScrollBarThickness = 4
VulnList.Visible = false
VulnList.Parent = MainFrame

local VulnCorner = Instance.new("UICorner")
VulnCorner.CornerRadius = UDim.new(0, 10)
VulnCorner.Parent = VulnList

-- الثغرات الوهمية
local fakeVulns = {
    "CVE-2024-001: Remote Injection",
    "CVE-2024-002: Memory Leak",
    "CVE-2024-003: Admin Panel Bypass",
    "CVE-2024-004: Teleport Exploit",
    "CVE-2024-005: Data Interception",
    "CVE-2024-006: AntiCheat Bypass"
}

-- زر المسح
ScanBtn.MouseButton1Click:Connect(function()
    -- إظهار القائمة وتفريغها
    for _, child in pairs(VulnList:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    
    VulnList.Visible = true
    ScanBtn.Text = "🔍 SCANNING... 🔍"
    
    for i, vuln in ipairs(fakeVulns) do
        local vulnLabel = Instance.new("TextLabel")
        vulnLabel.Size = UDim2.new(1, -20, 0, 30)
        vulnLabel.Position = UDim2.new(0, 10, 0, (i-1) * 35 + 10)
        vulnLabel.BackgroundTransparency = 1
        vulnLabel.Text = "🔴 " .. vuln
        vulnLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        vulnLabel.TextSize = 14
        vulnLabel.Font = Enum.Font.Code
        vulnLabel.TextXAlignment = Enum.TextXAlignment.Left
        vulnLabel.Parent = VulnList
        task.wait(0.3)
    end
    
    VulnList.CanvasSize = UDim2.new(0, 0, 0, #fakeVulns * 35 + 20)
    ScanBtn.Text = "▶ START SCANNING ◀"
end)

-- إغلاق
CloseBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- جعل النافذة قابلة للسحب
local dragging = false
local dragStart = nil
local startPos = nil

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print("NEBULA SCANNER V3.0 - LOADED SUCCESSFULLY")
