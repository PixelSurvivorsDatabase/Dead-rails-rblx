local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Modules.GameConfig)

local function createLeaderstats(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = GameConfig.StartingMoney
	money.Parent = leaderstats

	local fuel = Instance.new("NumberValue")
	fuel.Name = "Fuel"
	fuel.Value = GameConfig.StartingFuel
	fuel.Parent = player
end

Players.PlayerAdded:Connect(createLeaderstats)

for _, player in Players:GetPlayers() do
	createLeaderstats(player)
end

print("[DeadRails] Main server initialized")
