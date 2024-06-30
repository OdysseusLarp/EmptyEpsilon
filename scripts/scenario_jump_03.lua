-- Name: Jump 03
-- Type: Odysseus
-- Description:Planet Velian at southeast 

require("utils.lua")
require("utils_odysseus.lua")
scenarioMap = "Map objects on load: Planet Velian at southeast \nNo setup actions."
setScenarioChange(4)

function init()

	local ox = 10000
	local oy = -15000
	odysseus:setPosition(ox, oy)	

	--Relative coordinates counted from Odysseus for Aurora spawn point 
	local sx = -80000 
	local sy = -30000

	-- fleet number, fleet variation, sx, sy, fleet ship distances while in formation, fleet spawn chaos factor, reveal call signs at spawn, orders at spawn, delayJumpInMin, delayJumpInMax, delayJumpOutMin, delayJumpOutMax
	setSpawnFleetButton(1, nil, sx, sy, 2, 1, false, "formation", 0, 0, 0, 3)
	
	-- Spawnface parameters: (enemyfleetsize)
	-- 1 = very small, 2 = small, 3 = mdium, 4 = large, 5 = massive, 6 = end fleet
    addGMFunction(_("buttonGM", "OC - Machine - M"), function() spawnwave(3) end)
	addGMFunction(_("buttonGM", "OC - Machine - Backup XS"), function() spawnwave(1) end)

	-- Generate scenario map
	generateSpace(sx, sy)

	local lx = ox + 65000
	local ly = oy + 35000

	--SetUpPlanet clears all objects under the planet and adds the planet to the location
	--setUpPlanet("name", x, y, plane offset modifier)
	local velian = setUpPlanet("Velian", lx, ly, 0.9)

end


