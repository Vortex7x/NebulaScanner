local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

wait(1)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TestGui"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSize = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "اختر زر"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0, 200, 0, 50)
button1.Position = UDim2.new(0.5, -100, 0, 80)
button1.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
button1.Text = "زر رقم 1"
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.TextSize = 18
button1.Font = Enum.Font.SourceSansBold
button1.BorderSize = 0
button1.Parent = mainFrame

local btnCorner1 = Instance.new("UICorner")
btnCorner1.CornerRadius = UDim.new(0, 10)
btnCorner1.Parent = button1

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 200, 0, 50)
button2.Position = UDim2.new(0.5, -100, 0, 160)
button2.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
button2.Text = "زر رقم 2"
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.TextSize = 18
button2.Font = Enum.Font.SourceSansBold
button2.BorderSize = 0
button2.Parent = mainFrame

local btnCorner2 = Instance.new("UICorner")
btnCorner2.CornerRadius = UDim.new(0, 10)
btnCorner2.Parent = button2

local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0, 200, 0, 50)
button3.Position = UDim2.new(0.5, -100, 0, 240)
button3.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
button3.Text = "زر رقم 3"
button3.TextColor3 = Color3.fromRGB(255, 255, 255)
button3.TextSize = 18
button3.Font = Enum.Font.SourceSansBold
button3.BorderSize = 0
button3.Parent = mainFrame

local btnCorner3 = Instance.new("UICorner")
btnCorner3.CornerRadius = UDim.new(0, 10)
btnCorner3.Parent = button3

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.BorderSize = 0
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

button1.MouseButton1Click:Connect(function()
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 200, 0, 30)
    notif.Position = UDim2.new(0.5, -100, 0.7, 0)
    notif.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notif.BackgroundTransparency = 0.5
    notif.Text = "ضغطت على زر 1"
    notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    notif.TextSize = 14
    notif.Font = Enum.Font.SourceSans
    notif.Parent = screenGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 8)
    notifCorner.Parent = notif
    
    wait(1.5)
    notif:Destroy()
end)

button2.MouseButton1Click:Connect(function()
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 250, 0, 30)
    notif.Position = UDim2.new(0.5, -125, 0.7, 0)
    notif.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notif.BackgroundTransparency = 0.5
    notif.Text = "اسمك: " .. LocalPlayer.Name
    notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    notif.TextSize = 14
    notif.Font = Enum.Font.SourceSans
    notif.Parent = screenGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 8)
    notifCorner.Parent = notif
    
    wait(1.5)
    notif:Destroy()
end)

button3.MouseButton1Click:Connect(function()
    local playerCount = #Players:GetPlayers()
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 250, 0, 30)
    notif.Position = UDim2.new(0.5, -125, 0.7, 0)
    notif.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notif.BackgroundTransparency = 0.5
    notif.Text = "عدد اللاعبين: " .. playerCount
    notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    notif.TextSize = 14
    notif.Font = Enum.Font.SourceSans
    notif.Parent = screenGui
    
    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 8)
    notifCorner.Parent = notif
    
    wait(1.5)
    notif:Destroy()
end)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

print("القائمة جاهزة - 3 أزرار")
