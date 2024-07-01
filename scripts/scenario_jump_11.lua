-- Name: Jump 11
-- Type: Odysseus
-- Description: No objects of interest.

require("utils.lua")
require("utils_odysseus.lua")
scenarioMap = "Map objects on load: No objects of interest. \nNo setup actions."

setScenarioChange(12)


function init()
	local ox =28000
	local oy =-30000
	odysseus:setPosition(ox, oy)

	local sx = -5000
	local sy = 4500
	setSpawnFleetButton(3, nil, sx, sy, 2, 1, true, "idle", 0, 3, 0, 3)

	-- Spawnface parameters: (distance from Odysseus, enemyfleetsize)
	-- 1 = very small, 2 = small, 3 = mdium, 4 = large, 5 = massive, 6 = end fleet
	-- When distance set to 50000, it takes about 7-8 minutes enemy to reach attack range	
	addGMFunction(_("Enemy", "OC - Machine - M"), function() spawnwave(3) end)
	addGMFunction(_("Enemy", "OC - Machine - Backup S"), function() spawnwave(2) end)


	generateSpace(sx, sy)

	for n=1, 50 do
		local r = irandom(0, 360)
		local distance = irandom(1000, 20000)
		x1 = ox+63000 + math.cos(r / 180 * math.pi) * distance
		y1 = oy-25000 + math.sin(r / 180 * math.pi) * distance
		Asteroid():setPosition(x1, y1):setSize(random(100, 500))
	end

end
