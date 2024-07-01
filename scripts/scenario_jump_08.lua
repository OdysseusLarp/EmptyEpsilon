-- Name: Jump 08
-- Type: Odysseus
-- Description: Planet at east


require("utils.lua")
require("utils_odysseus.lua")
scenarioMap = "Map objects on load: Planet at east \nNo setup actions."
setScenarioChange(9)

function init()
	local ox =-13000
	local oy = 24000
	odysseus:setPosition(ox, oy)

	-- Add GM common functions - Order of the buttons: Sync, fleet, enemies, Scenario change, scenario specific

	local sx = -5000
	local sy = 4500
	setSpawnFleetButton(2, nil, sx, sy, 2, 2, true, "idle", 0, 2, 0, 1)

	-- Spawnwave(distance from Odysseus, enemy size)
	addGMFunction(_("Enemy", "OC - Machine - L"), function() spawnwave(4) end)
	addGMFunction(_("Enemy", "OC - Machine - Backup S"), function() spawnwave(2) end)

	-- Generate scenario map
	generateSpace(sx, sy)

	planet = setUpPlanet("P-TE95-LN71", ox+55000, oy+25000)

	for n=1, 50 do
		local r = irandom(0, 360)
		local distance = irandom(1000, 20000)
		x1 = ox-63000 + math.cos(r / 180 * math.pi) * distance
		y1 = oy-25000 + math.sin(r / 180 * math.pi) * distance
		Asteroid():setPosition(x1, y1):setSize(random(100, 500))
	end

end
