local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local EnemyConfig = require(ReplicatedStorage.Modules.EnemyConfig)

local activeEnemies = {}

local function removeDestroyedEnemies()
	for index = #activeEnemies, 1, -1 do
		local enemy = activeEnemies[index]
		if enemy == nil or enemy.Parent == nil then
			table.remove(activeEnemies, index)
		end
	end
end

local function spawnBasicEnemy()
	removeDestroyedEnemies()

	if #activeEnemies >= EnemyConfig.MaxActiveEnemies then
		return
	end

	local enemy = Instance.new("Model")
	enemy.Name = "BasicWalker"

	local body = Instance.new("Part")
	body.Name = "Body"
	body.Size = Vector3.new(3, 5, 2)
	body.Position = Vector3.new(math.random(-40, 40), 5, math.random(40, 80))
	body.Anchored = false
	body.Parent = enemy

	local humanoid = Instance.new("Humanoid")
	humanoid.MaxHealth = EnemyConfig.BasicWalker.Health
	humanoid.Health = EnemyConfig.BasicWalker.Health
	humanoid.WalkSpeed = EnemyConfig.BasicWalker.WalkSpeed
	humanoid.Parent = enemy

	enemy.PrimaryPart = body
	enemy.Parent = workspace
	table.insert(activeEnemies, enemy)
end

while true do
	task.wait(EnemyConfig.SpawnIntervalSeconds)
	spawnBasicEnemy()
end
