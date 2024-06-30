-- Name: Jump 14
-- Type: Odysseus
-- Description: Planet at northeast. Alien minefield at east. 

require("utils.lua")
require("utils_odysseus.lua")
scenarioMap = "Map objects on load: Planet at northeast. Alien minefield at east. \nSetup actions: Choose right fleet to spawn."

setScenarioChange(15)

function init()
	local ox =-7000
	local oy = 2000
	odysseus:setPosition(ox, oy)

	local sx = 8000
	local sy = -10500

	addGMFunction("OC - Spawn Cherry", spawnCherryOnClick)

	setSpawnFleetButton(4, "A", sx, sy, 2, 1, true, "idle", 0, 1, 0, 3)
	setSpawnFleetButton(4, "B", sx, sy, 2, 1, true, "idle", 0, 1, 0, 3)

	-- Spawnface parameters: (distance from Odysseus, enemyfleetsize)
	-- 1 = very small, 2 = small, 3 = mdium, 4 = large, 5 = massive, 6 = end fleet
	-- When distance set to 50000, it takes about 7-8 minutes enemy to reach attack range	
	addGMFunction(_("Enemy", "OC - Machine - S"), function() spawnwave(2) end)
	addGMFunction(_("Enemy", "OC - Backup M"), function() spawnwave(3) end)

	-- Generate scenario map

	planet = setUpPlanet("P-SI14-UX98", ox+30000, oy-15000,0.9)

	for n=1, 4 do
		local posx = random(-80000, -10000)
		local posy = random(-80000, 80000)
                    Nebula():setPosition(posx, posy)
	end


	essody18_launched = 0
	essody23_launched = 0
	essody36_launched = 0
	starcaller_launched = 0
  
	  odysseus_delay = 1
	  essody18_delay = 1
	  essody23_delay = 1
	  essody36_delay = 1
	  starcaller_delay = 1
  
	  odysseus_alert = 1
	  essody18_alert = 1
	  essody23_alert = 1
	  essody36_alert = 1
	  starcaller_alert = 1
  
  
  -- Plan
  
	warningZone = Zone():setColor(0,0,0)
	warningZone:setPoints(22000,-150000,
						33000,-150000,
						33000,150000,
						22000,150000)
  
	critWarningZone = Zone():setColor(50,0,0)
	critWarningZone:setPoints(33000, -150000,
						44000,-150000,
						44000,150000,
						33000,150000)
  
	dangerZone = Zone():setColor(100,0,0)
	dangerZone:setPoints(44000,-150000,
						50000,-150000,
						50000,150000,
						44000,150000)
  
	critDangerZone = Zone():setColor(150,0,0)
	critDangerZone:setPoints(50000,-150000,
						55000,-150000,
						55000,150000,
						50000,150000)
  
	deathDangerZone = Zone():setColor(200,0,0)
	deathDangerZone:setPoints(55000,-150000,
						59000,-150000,
						59000,150000,
						55000,150000)
  
	colorZone = Zone():setColor(255, 0, 0)
	colorZone:setPoints(59000,-150000,
						200000,-150000,
						200000,150000,
						59000,150000)

	  plotZ = delayChecks
  
	odysseus:addToShipLog("EVA sector scanning alarm. Anomalous radiation field detected at heading 90.", "Red")
  
  end

  function spawnCherryOnClick()
	onGMClick(function(x, y)
        onGMClick(nil)
        spawnCherry(x, y)
    end)
  end

  function spawnCherry(x, y)
	cherry = CpuShip():setCallSign("Cherry"):setFaction("Unregistered"):setTemplate("Machine Stinger"):setPosition(x, y):setCanBeDestroyed(false):orderDock(odysseus, 200, 200)
	addGMFunction("Dock Cherry", dockCherry)
end

  function dockCherry()
	removeGMFunction("Dock Cherry")
	cherry:destroy()
  end
  

  function delayChecks(delta)
  
	  if odysseus_alert < 1 then
		  launchShipAlert(odysseus)
		  odysseus_alert = 15
	  else
		  odysseus_alert = odysseus_alert - delta
	  end
	  if odysseus_delay < 1 then
		  zoneChecks(odysseus)
		  odysseus_delay = 4
	  else
		  odysseus_delay = odysseus_delay - delta
	  end
  
  
	if essody18_launched == 1 then
		if essody18_alert < 1 then
			launchShipAlert(essody18)
			essody18_alert = 15
		else
			essody18_alert = essody18_alert - delta
		end
		  if essody18_delay < 1 then
			  zoneChecks(essody18)
			  essody18_delay = 4
		  else
			  essody18_delay = essody18_delay - delta
		  end
	end
  
	if essody23_launched == 1 then
		  if essody23_alert < 1 then
			  launchShipAlert(essody23)
			  essody23_alert = 15
		  else
			  essody23_alert = essody23_alert - delta
		  end
  
		  if essody23_delay < 1 then
			  zoneChecks(essody23)
			  essody23_delay = 4
		  else
			  essody23_delay = essody23_delay - delta
		  end
	end
  
	if essody36_launched == 1 then
		  if essody36_alert < 1 then
			  launchShipAlert(essody36)
			  essody36_alert = 15
		  else
			  essody36_alert = essody36_alert - delta
		  end
  
		  if essody36_delay < 1 then
			  zoneChecks(essody36)
			  essody36_delay = 4
		  else
			  essody36_delay = essody36_delay - delta
		  end
	end
  
	if starcaller_launched == 1 then
		  if starcaller_alert < 1 then
			  launchShipAlert(starcaller)
			  starcaller_alert = 15
		  else
			  starcaller_alert = starcaller_alert - delta
		  end
  
		  if starcaller_delay < 1 then
			  zoneChecks(starcaller)
			  starcaller_delay = 4
		  else
			  starcaller_delay = starcaller_delay - delta
		  end
	end
  
  end

  function zoneChecks(ship)
  
	  if dangerZone:isInside(ship) then
		  for n=1,4 do
			  dropHealth(ship)
		  end
	  end
	  if critDangerZone:isInside(ship) then
		  for n=1,8 do
			  dropHealth(ship)
		  end
	  end
	  if deathDangerZone:isInside(ship) then
		  for n=1,16 do
			  dropHealth(ship)
		  end
	  end
  
  end
  
  function launchShipAlert(ship)
		  if warningZone:isInside(ship) then
			  ship:addToShipLog("EVA scanning results. Space radiation level elevated.", "Blue")
		  end
		  if critWarningZone:isInside(ship) then
			  alertLevel = ship:getAlertLevel()
  
			  if alertLevel == "Normal" then
				  ship:commandSetAlertLevel("yellow")
			  end
  
			  ship:addToShipLog("EVA scanning results. Space radiation level critical.", "Yellow")
		  end
		  if colorZone:isInside(ship)	then
		  alertLevel = ship:getAlertLevel()
  
			  if alertLevel == "Normal" then
				  ship:commandSetAlertLevel("red")
			  end
  
			  ship:addToShipLog("EVA scanning results. Space radiation level lethal.", "Red")
		  end
  end
  
  function dropHealth(ship)
					  systemHit = math.random(1,7)
				  if systemHit == 1 then
					  ship:setSystemHealth("reactor", ship:getSystemHealth("reactor")*.99)
				  elseif systemHit == 2 then
					  ship:setSystemHealth("beamweapons", ship:getSystemHealth("beamweapons")*.99)
				  elseif systemHit == 3 then
					  ship:setSystemHealth("maneuver", ship:getSystemHealth("maneuver")*.99)
				  elseif systemHit == 4 then
					  ship:setSystemHealth("missilesystem", ship:getSystemHealth("missilesystem")*.99)
				  elseif systemHit == 5 then
					  ship:setSystemHealth("frontshield", ship:getSystemHealth("frontshield")*.99)
				  elseif systemHit == 6 then
					  ship:setSystemHealth("impulse", ship:getSystemHealth("impulse")*.99)
				  else
					  ship:setSystemHealth("rearshield", ship:getSystemHealth("rearshield")*.99)
				  end
  
  
  end
  