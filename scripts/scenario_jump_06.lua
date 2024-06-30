-- Name: Jump 06
-- Type: Odysseus
-- Description: Planet at northeast


require("utils.lua")
require("utils_odysseus.lua")
scenarioMap = "Map objects on load: Planet at northeast \nNo setup actions."
setScenarioChange(7)


function init()
	
	local ox =-20000
	local oy = -35000
	odysseus:setPosition(ox, oy)

	local sx = -5000
	local sy = -7500
	setSpawnFleetButton(2, nil, sx, sy, 2, 1, true, "idle", 0, 3, 0, 3)


	-- Spawnface parameters: (distance from Odysseus, enemyfleetsize)
	-- 1 = very small, 2 = small, 3 = mdium, 4 = large, 5 = massive, 6 = end fleet
	-- When distance set to 50000, it takes about 7-8 minutes enemy to reach attack range	
	addGMFunction(_("Enemy", "OC - Machine - M"), function() spawnwave(3) end)
	addGMFunction(_("Enemy", "OC - Machine - Backup S"), function() spawnwave(2) end)
	
	-- Generate scenario map
	generateSpace(sx, sy)

		-- Planet
		planet = setUpPlanet("P-TE49-HE75", ox+20000, oy-25000, 0.8)


end
