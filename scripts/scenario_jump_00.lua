-- Name: Jump 00
-- Type: Odysseus
-- Description: Jump point at northwest.

require("utils.lua")
require("utils_odysseus.lua")
scenarioMap = "Map objects on load: Jump point at northwest.\nNo setup actions."
setScenarioChange(1)


function init()
	odysseus:setLandingPadDocked(1)
	odysseus:setLandingPadDocked(2)
	odysseus:setLandingPadDocked(3)
	
    addGMFunction(_("buttonGM", "OC - Machine - S"), function() spawnwave(2) end)
	addGMFunction(_("buttonGM", "OC - Machine - Backup XS"), function() spawnwave(1) end)

	-- Generate scenario map
	-- Random asteroids and nebula
	local ox = -48000
	local oy = 37000
	odysseus:setPosition(ox,oy)
	generateSpace(ox, oy)

	--Scenario specific space objects
	local jumpPoint = CpuShip():setFaction("EOC Starfleet"):setTemplate("Jump point"):setPosition(ox-9000, oy-7500):setCallSign("Jump point - A3"):setCanBeDestroyed(true):setScannedByFaction("EOC Starfleet", true)
end

