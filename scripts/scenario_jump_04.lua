-- Name: Jump 04
-- Type: Odysseus
-- Description: No objects of interest.

require("utils.lua")
require("utils_odysseus.lua")
scenarioMap = "Map objects on load: No objects of interest. \nNo setup actions."
setScenarioChange(5)

function init()
	
	local ox = 2000
	local oy = -7000
	odysseus:setPosition(ox, oy)
	
	--Relative coordinates counted from Odysseus for Aurora spawn point 
	local sx = 5000
	local sy = 4500

	-- Button name, fleet number, fleet variation, sx, sy, fleet ship distances while in formation, fleet spawn chaos factor, reveal call signs at spawn, orders at spawn, delayJumpInMin, delayJumpInMax, delayJumpOutMin, delayJumpOutMax
	setSpawnFleetButton(1, nil , sx, sy, 2, 1, true, "formation", 0, 3, 0, 1)


	-- Spawnface parameters: (distance from Odysseus, enemyfleetsize)
	-- 1 = very small, 2 = small, 3 = mdium, 4 = large, 5 = massive, 6 = end fleet
	-- When distance set to 50000, it takes about 7-8 minutes enemy to reach attack range	


    addGMFunction(_("Enemy", "OC - Machine - S"), function() spawnwave(2) end)
	addGMFunction(_("Enemy", "OC - Machine - Backup XS"), function() spawnwave(1) end)

	addGMFunction("Destroy OSS Vulture", confirm_vulture)


	-- Generate scenario map
	generateSpace(sx, sy)

	for n=1, 50 do
		local r = irandom(0, 360)
		local distance = irandom(1000, 20000)
		x1 = ox+63000 + math.cos(r / 180 * math.pi) * distance
		y1 = oy+25000 + math.sin(r / 180 * math.pi) * distance
		Asteroid():setPosition(x1, y1):setSize(random(100, 500))
	end

end
