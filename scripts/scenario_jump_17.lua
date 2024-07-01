-- Name: Jump 17
-- Type: Odysseus
-- Description: Planet at east

require("utils.lua")
require("utils_odysseus.lua")
scenarioMap = "Map objects on load: Planet at east \nSetup actions: Choose right fleet to spawn."
setScenarioChange(18)

function init()

	local sx = 10000
	local sy = -15500
	setSpawnFleetButton(4, "A", sx, sy, 2, 3, true, "idle", 0, 1, 0, 3)
	setSpawnFleetButton(4, "B", sx, sy, 2, 3, true, "idle", 0, 1, 0, 3)

	
	-- Spawnface parameters: (distance from Odysseus, enemyfleetsize)
	-- 1 = very small, 2 = small, 3 = mdium, 4 = large, 5 = massive, 6 = end fleet
	-- When distance set to 50000, it takes about 7-8 minutes enemy to reach attack range	
	addGMFunction(_("Enemy", "OC - Machine - XL"), function() spawnwave(5) end)
	addGMFunction(_("Enemy", "OC - Machine - Boarding"), function() spawnwave(1, "boarding") end)
	addGMFunction(_("Enemy", "OC - Backup M"), function() spawnwave(3) end)
	addGMFunction("Destroy ESS Valkyrie", confirm_valkyrie)

  	-- Generate scenario map
      generateSpace(sx, sy)


	  planet = setUpPlanet("P-LA05-WE50", 105000, 25000, 0.8)
	  

	
end

