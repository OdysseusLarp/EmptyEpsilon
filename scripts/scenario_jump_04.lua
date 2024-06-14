-- Name: Jump 04
-- Type: Odysseus
-- Description: Onload: Odysseus, random asteroids. EOC fleet.
require("utils.lua")
require("utils_odysseus.lua")


function init()
	-- Add GM common functions - Order of the buttons: Sync, fleet, enemies, Scenario change, scenario specific

	local sx = 5000
	local sy = -4500
	setSpawnFleetButton("Friendly 1", 1, sx, sy, 2, 1, true)

	-- Spawnface parameters: (distance from Odysseus, enemyfleetsize)
	-- 1 = very small, 2 = small, 3 = mdium, 4 = large, 5 = massive, 6 = end fleet
	-- When distance set to 50000, it takes about 7-8 minutes enemy to reach attack range	
    addGMFunction(_("Enemy", "Enemy - Large"), function() spawnwave(4) end)
	addGMFunction(_("Enemy", "Enemy - Backup - Very small"), function() spawnwave(1) end)


	setScenarioChange('Change scenario - 05', "scenario_jump_05.lua")

	addGMFunction("Destroy ESS vulture", confirm_vulture)

	-- Generate scenario map
	generateSpace(sx, sy)

end

function confirm_vulture()
	removeGMFunction("Destroy ESS vulture")
	addGMFunction("Cancel destruction", cancel_vulture)
	addGMFunction("Confirm destruction", destroy_vulture)

end

function cancel_vulture()
	addGMFunction("Destroy ESS vulture", confirm_vulture)
	removeGMFunction("Cancel destruction")
	removeGMFunction("Confirm destruction")
end

function destroy_vulture()
	vulture:destroy()
	removeGMFunction("Cancel destruction")
	removeGMFunction("Confirm destruction")
  odysseus:addToShipLog("EVA long range scanning results. OSS Vulture left from scanner range. No jump detected.", "Red")
end
