-- Name: Jump 01
-- Type: Odysseus
-- Description: Space station Solaris 7 at Northwest inside of nebula

require("utils.lua")
require("utils_odysseus.lua")
scenarioMap = "Map objects on load: Space station Solaris 7 at Northwest inside of nebula. \nNo setup actions."
setScenarioChange(2)

function init()
	addGMFunction(_("buttonGM", "OC - Machine - S"), function() spawnwave(2) end)
	addGMFunction(_("buttonGM", "OC - Machine - Backup XS"), function() spawnwave(1) end)

	local ox =10000
	local oy = 15000
	odysseus:setPosition(ox, oy)

	local r = 220
	local distance = 54000
	fx = math.floor(ox + math.cos(r / 180 * math.pi) * distance)
	fy = math.floor(oy + math.sin(r / 180 * math.pi) * distance)

	
	-- Generate scenario map
	-- Station generation location
	-- FX and FY parameters which to avoid when creating random space
	generateSpace(fx, fy)

	for n=1, 50 do
		local r = irandom(0, 360)
		local distance = irandom(1000, 20000)
		x1 = ox+63000 + math.cos(r / 180 * math.pi) * distance
		y1 = oy-25000 + math.sin(r / 180 * math.pi) * distance
		Asteroid():setPosition(x1, y1):setSize(random(100, 500))
	end


	Nebula():setPosition(fx+2000, fy-1000)
	local station = SpaceStation():setFaction("EOC Starfleet"):setTemplate("Medium station"):setCallSign("Solaris 7"):setPosition(fx, fy)

end
