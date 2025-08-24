--# remind this will look like the old one because im kinda dumb how to make scripts

--# get services and some locals
local Player = game:GetService("Players")
local Team = game:GetService("Teams")
local Run = game:GetService("RunService") --# too lazy to delete this caller 
local Lplayer = Player.LocalPlayer

--# loop
if getgenv().repeatable == true and getgenv().check == false then
getgenv().check = true
while wait() and getgenv().repeatable == true do
for I,v in pairs(Player:GetPlayers()) do
--# get user
if v ~= Lplayer then
 --# special statement, it only applies to all players but not localplayer
local char = v.Character
if char and not v.Character:FindFirstChild("esp") then
--# order: Highlight > Billboard > Text
--# adding Highlight to Each player by if statement and for I...
local Highlight = Instance.new("Highlight")
Highlight.Name = "esp"
Highlight.Enabled = true
Highlight.FillTransparency = 0.7
Highlight.Parent = char

--# adding billboard GUI for names on head
local root = char:WaitForChild("HumanoidRootPart")
local v1 = Instance.new("BillboardGui")
v1.Name = "esph"
v1.Adornee = root
v1.Size = UDim2.new(0, 120, 0, 60)
v1.StudsOffset = Vector3.new(0, 3, 0)
v1.AlwaysOnTop = true
v1.Parent = root

--# adding names
local human = char:FindFirstChildWhichIsA("Humanoid")
local v2 = Instance.new("TextLabel")
v2.Name = "esptuah"
v2.Size = UDim2.new(1, 0, 1, 0)
v2.BackgroundTransparency = 1
v2.TextSize = 10
v2.TextScaled = false
v2.TextColor3 = Color3.new(1, 1, 1)
v2.Parent = v1

local function v3()
if human and human.Parent then
local Status = "⚪"
local Health = human.Health
local MHealth = human.MaxHealth
local per = 0
if MHealth > 0 then
per = math.floor((Health/MHealth) * 100)
else
Status = "⚪"
end

if per > 70 then
Status = "🟢"
elseif per > 40 then
Status = "🟡"
else --# changing status if.. green 80+, yellow 30>+, red 30-
Status = "🔴"
end
v2.Text = "(" .. Status .. ") | " .. "N: " ..  v.Name .. " | " .. "H: " .. math.floor(human.Health)
--# text labels
--# this thing funny because it took me about 2.30 hr
end
end

local function v3_u_v1()
if human and human.Parent then
for _,v in ipairs(Player:GetPlayers()) do
if v.Character:FindFirstChild("esp") then
highlight.FillColor = Team.TeamColor
end
end
end
end
    
human.HealthChanged:Connect(v3)
v3()

human.GetPropertyChangedSingal:Connect(v3_u_v1)
v3_u_v1()
end
end
end
end
else
print("already running, twin")
end
