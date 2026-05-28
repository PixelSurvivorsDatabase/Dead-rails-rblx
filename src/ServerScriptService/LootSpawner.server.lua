local lootFolder = Instance.new("Folder")
lootFolder.Name = "Loot"
lootFolder.Parent = workspace

local function createLoot(name, position, valueType, amount)
	local loot = Instance.new("Part")
	loot.Name = name
	loot.Size = Vector3.new(2, 2, 2)
	loot.Position = position
	loot.Anchored = true
	loot.Parent = lootFolder

	loot:SetAttribute("ValueType", valueType)
	loot:SetAttribute("Amount", amount)

	return loot
end

createLoot("FuelCan", Vector3.new(8, 3, 20), "Fuel", 25)
createLoot("CashBag", Vector3.new(-8, 3, 25), "Money", 15)

print("[DeadRails] Starter loot spawned")
