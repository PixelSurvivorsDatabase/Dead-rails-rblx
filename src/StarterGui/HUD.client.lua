local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DeadRailsHUD"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local fuelLabel = Instance.new("TextLabel")
fuelLabel.Name = "FuelLabel"
fuelLabel.Size = UDim2.fromOffset(220, 40)
fuelLabel.Position = UDim2.fromOffset(20, 20)
fuelLabel.BackgroundTransparency = 0.25
fuelLabel.TextScaled = true
fuelLabel.Text = "Fuel: loading..."
fuelLabel.Parent = screenGui

local moneyLabel = Instance.new("TextLabel")
moneyLabel.Name = "MoneyLabel"
moneyLabel.Size = UDim2.fromOffset(220, 40)
moneyLabel.Position = UDim2.fromOffset(20, 70)
moneyLabel.BackgroundTransparency = 0.25
moneyLabel.TextScaled = true
moneyLabel.Text = "Money: loading..."
moneyLabel.Parent = screenGui

local function updateFuel()
	local fuel = player:FindFirstChild("Fuel")
	fuelLabel.Text = fuel and string.format("Fuel: %.1f", fuel.Value) or "Fuel: ?"
end

local function updateMoney()
	local leaderstats = player:FindFirstChild("leaderstats")
	local money = leaderstats and leaderstats:FindFirstChild("Money")
	moneyLabel.Text = money and string.format("Money: %d", money.Value) or "Money: ?"
end

local fuel = player:WaitForChild("Fuel", 10)
if fuel then
	fuel:GetPropertyChangedSignal("Value"):Connect(updateFuel)
end

local leaderstats = player:WaitForChild("leaderstats", 10)
if leaderstats then
	local money = leaderstats:WaitForChild("Money", 10)
	if money then
		money:GetPropertyChangedSignal("Value"):Connect(updateMoney)
	end
end

updateFuel()
updateMoney()
