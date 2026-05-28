local Players = game:GetService("Players")

local player = Players.LocalPlayer

local function watchFuel()
	local fuel = player:WaitForChild("Fuel", 10)
	if fuel == nil then
		warn("[DeadRails] Fuel value was not found on player")
		return
	end

	fuel:GetPropertyChangedSignal("Value"):Connect(function()
		print(string.format("[DeadRails] Fuel: %.1f", fuel.Value))
	end)
end

watchFuel()
print("[DeadRails] Client controller initialized")
