-- Name: Odysseus utils
-- Modified and simplified the functions by Mikko B, Ria B, Ville M

--Functions to set up next scenario
require("utils_odysseus_scenariochange.lua")

-- Functions to spawn enemies
require("utils_odysseus_spawnenemy.lua")

--Functions and logic to spawn different kind friendly fleet combinations
require("utils_odysseus_spawnfleet.lua")

-- Orders for the fleet
require("utils_odysseus_fleet_orders.lua")

--Functions and logic to spawn and dock fighters and starcaller
require("utils_odysseus_spawnplayerships.lua")

-- Generating machine callsigns
require("generate_call_sign_scenario_utility.lua")

-- Generating space objects for Odysseus
require("utils_odysseus_generatespace.lua")

-- spawn the ESS Odysseus
local orotation = irandom(0, 360)
odysseus = PlayerSpaceship():setFaction("EOC Starfleet"):setTemplate("Helios Corvette"):setCallSign("ESS Odysseus"):setPosition(0, 0):commandTargetRotation(orotation):setHeading(orotation+90):setCanBeDestroyed(false)
odysseus:setCanSelfDestruct(false)

addGMFunction(_("buttonGM", "Sync fighter status"), function() sync_buttons() end)

--Sets suffix index for generating npc ship callsigns. Resets for every scenario
suffix_index = 100



function setUpLaunchmissionButtons(minutes, lx, ly)
	local travelDistance = math.floor(minutes*3000)

	local buttonTextArrival45 = string.format(("Launch LC45 - %d"), minutes)
	local buttonTextArrival79 = string.format(("Launch LC79 - %d"), minutes)
	local buttontTextDepart45 = string.format(("Return LC45 - %d"), minutes)
	local buttontTextDepart79 = string.format(("Return LC79 - %d"), minutes)

	local buttonTextDock45 = string.format(("Dock LC45"))
	local buttonTextDock79 = string.format(("Dock LC79"))

	travelStage45 = "docked"
	addGMFunction(_("buttonGM", buttonTextArrival45), function() launchLandmission("essodylc45") end)
	travelStage79 = "docked"
	addGMFunction(_("buttonGM", buttonTextArrival79), function() launchLandmission("essodylc79") end)

	local ox, oy = odysseus:getPosition()
	local lcAngle = angleHeading(ox, oy, lx, ly)

	local dx, dy = vectorFromAngle(lcAngle, travelDistance, true)
	dx = math.floor(dx)
	dy = math.floor(dy)


	function launchLandmission(ship)
			
		local x1 = ox-500
		local y1 = oy+500

		if ship == "essodylc45" then
			if travelStage45 == "docked" then
				essodylc45 = CpuShip():setCallSign("ESSODYLC-45"):setTemplate("Aurora Class Landing Craft"):setScannedByFaction("EOC Starfleet"):setFaction("EOC_Starfleet"):setPosition(x1, y1):setCanBeDestroyed(false)
			end
			essodylc45:orderFlyTowards(dx, dy)
			travelStage45 = "departing"
			removeGMFunction(buttonTextArrival45)
		end

		if ship == "essodylc79" then
			if travelStage79 == "docked" then
				essodylc79 = CpuShip():setCallSign("ESSODYLC-79"):setTemplate("Aurora Class Landing Craft"):setScannedByFaction("EOC Starfleet"):setFaction("EOC_Starfleet"):setPosition(x1, y1):setCanBeDestroyed(false)
			end
			essodylc79:orderFlyTowards(dx, dy)
			travelStage79 = "departing"
			removeGMFunction(buttonTextArrival79)
		end


		checkFlightStatus(ship)

	end

	function checkFlightStatus(ship, delta)
		if ship == "essodylc45" then
			if travelStage45 == "departing" then
				local targetDistance = math.floor(distance(essodylc45, dx, dy))
				if targetDistance < 200 then
					travelStage45 = "landmission"
					essodylc45:orderIdle()
					addGMFunction(_("buttonGM", buttontTextDepart45), function() returnLandmission(ship) end)
				end
			end
			if travelStage45 == "arrival" then
				local targetDistance = distance(essodylc45, dx, dy)
				if targetDistance < 500 then
					travelStage45 = "home"
					essodylc45:orderIdle()
					addGMFunction(_("buttonGM", buttontTextArrival45), function() launchLandmission(ship) end)
					addGMFunction(_("buttonGM", buttonTextDock45), function() docktransport(ship) end)
				end
			end
		end
		if ship == "essodylc79" then
			if travelStage79 == "departing" then
				local targetDistance = distance(essodylc79, dx, dy)
				if targetDistance < 200 then
					travelStage79 = "landmission"
					essodylc79:orderIdle()
					addGMFunction(_("buttonGM", buttontTextDepart45), function() returnLandmission(ship) end)
				end
			end
			if travelStage79 == "arrival" then
				local targetDistance = distance(essodylc79, dx, dy)
				if targetDistance < 500 then
					travelStage79 = "home"
					essodylc79:orderIdle()
					addGMFunction(_("buttonGM", buttontTextArrival45), function() launchLandmission(ship) end)
					addGMFunction(_("buttonGM", buttonTextDock45), function() docktransport(ship) end)
				end
			end
		end

	end

	function docktransport(ship)
		if ship == "essodylc45" then
			removeGMFunction(buttonTextDock45)
			essodylc45:destroy()
		end
		if ship == "essodylc79" then
			removeGMFunction(buttonTextDock45)
			essodylc79:destroy()
		end

	end

	function returnLandmission(ship)
		local x, y = odysseus:getPosition()
		if ship == "essodylc45" then
			travelStage45 = "arrival"
			essodylc45:orderFlyTowards(x, y)
			removeGMFunction(buttontTextDepart45)
		end
		if ship == "essodylc79" then
			travelStage79 = "arrival"
			essodylc79:orderFlyTowards(x, y)
			removeGMFunction(buttontTextDepart79)
		end
	end

	function update(delta)

		if delta == 0 then
			return
		end

		if travelStage45 == "departing" or travelStage45 == "arrival" or travelStage79 == "departing" or travelStage79 == "arrival" then
			checkFlightStatus(ship, delta)
		end

	end
	starcaller:addCustomMessage("Helms", "Distance too far. Docking cancelled.", "Distance too far. Docking cancelled.")
end

-- Button synchronizer
function sync_buttons()
	removeGMFunction("Allow ESSODY18")
	removeGMFunction("Allow ESSODY23")
	removeGMFunction("Allow ESSODY36")
	removeGMFunction("Allow STARCALLER")
	odysseus:removeCustom("launch_pad_1")
	odysseus:removeCustom("launch_pad_2")
	odysseus:removeCustom("launch_pad_3")
	odysseus:removeCustom("launch_pad_4")
	
	if odysseus:isLandingPadDestroyed(1) then
		addGMFunction("Allow ESSODY18", allow_essody18)
	end
	if odysseus:isLandingPadDestroyed(2) then
		addGMFunction("Allow ESSODY23", allow_essody23)
	end
	if odysseus:isLandingPadDestroyed(3) then
		addGMFunction("Allow ESSODY36", allow_essody36)
	end
	if odysseus:isLandingPadDestroyed(4) then
		addGMFunction("Allow STARCALLER", allow_starcaller)
	end

	if odysseus:isLandingPadDocked(1) then
		odysseus:addCustomButton("Relay", "launch_pad_1", "Launch ESSODY18", launch_essody18)
	end
	if odysseus:isLandingPadDocked(2) then
		odysseus:addCustomButton("Relay", "launch_pad_2", "Launch ESSODY23", launch_essody23)
	end
	if odysseus:isLandingPadDocked(3) then
		odysseus:addCustomButton("Relay", "launch_pad_3", "Launch ESSODY36", launch_essody36)
	end
	if odysseus:isLandingPadDocked(4) then
		odysseus:addCustomButton("Relay", "launch_pad_4", "Launch STARCALLER", launch_starcaller)
	end
end
