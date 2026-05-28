local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.Modules.GameConfig)
local TrainConfig = require(ReplicatedStorage.Modules.TrainConfig)

local trainState = {
	Distance = 0,
	Fuel = GameConfig.StartingFuel,
	IsMoving = true,
}

local function drainFuel(deltaTime)
	if not trainState.IsMoving then
		return
	end

	trainState.Fuel = math.max(0, trainState.Fuel - GameConfig.FuelDrainPerSecond * deltaTime)

	if trainState.Fuel <= TrainConfig.MinimumFuelToMove then
		trainState.IsMoving = false
		print("[DeadRails] Train stopped: out of fuel")
	end
end

local function moveTrain(deltaTime)
	if not trainState.IsMoving then
		return
	end

	trainState.Distance += TrainConfig.BaseSpeed * deltaTime
end

RunService.Heartbeat:Connect(function(deltaTime)
	drainFuel(deltaTime)
	moveTrain(deltaTime)
end)

print("[DeadRails] Train controller initialized")
