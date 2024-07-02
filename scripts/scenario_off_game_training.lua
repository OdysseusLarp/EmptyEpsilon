-- Name: Off-game training
-- Description: Odysseus training scenario to be used briefs
-- Type: Pre-Game practice

require("utils.lua")
require("utils_odysseus.lua")

function init()
	addGMFunction(_("buttonGM", "OC - Machine - XS"), function() spawnwave(1) end)
    addGMFunction(_("buttonGM", "OC - Machine - S"), function() spawnwave(2) end)


	resetScen()

	odysseus:addCustomButton("Relay", "Reset scenario", "Reset scenario", resetScen)
	addGMFunction("Reset scenario", resetScen)

end

function resetScen()

    --Clean up the current play field. Find all objects and destroy everything that is not a player.
    -- If it is a player, position him in the center of the scenario.
    for _, obj in ipairs(getAllObjects()) do
        if obj.typeName == "PlayerSpaceship" then
            obj:setPosition(0, 0)
        else
            obj:destroy()
        end
	end

    Nebula():setPosition(13657, 5143)
    Nebula():setPosition(15088, 9924)
    station = CpuShip():setTemplate("Medium station"):setCallSign("VS2"):setPosition(23148, 5093)
    CpuShip():setFaction("Corporate owned"):setTemplate("Helios Class Corvette"):setCallSign("NC3"):setPosition(15926, -7037):setWeaponStorage("Homing", 4):orderStandGround()
    Asteroid():setPosition(6574, -5741)
    Asteroid():setPosition(6667, 6019)
    Asteroid():setPosition(8704, -3889)
    Asteroid():setPosition(1852, -3148)
    Asteroid():setPosition(8333, 2778)
    Asteroid():setPosition(3981, 11481)
    Asteroid():setPosition(-6481, 10648)
    Asteroid():setPosition(12870, 15278)
    Asteroid():setPosition(15000, 9815)
    Asteroid():setPosition(17037, -5833)
    Asteroid():setPosition(15648, 4074)
    Asteroid():setPosition(26204, 5000)
    Asteroid():setPosition(12593, -9444)
    Asteroid():setPosition(5278, -18889)
    Asteroid():setPosition(-3241, -12963)
    Asteroid():setPosition(4352, -11389)
    Asteroid():setPosition(19352, -14630)
    Asteroid():setPosition(17500, -27315)
    Asteroid():setPosition(-4259, 17315)
    Asteroid():setPosition(9074, 18796)
    Asteroid():setPosition(27593, -28796)
    CpuShip():setFaction("Machines"):setTemplate("Machine Predator"):setCallSign("CV5"):setPosition(45370, -18845):orderStandGround()
    CpuShip():setFaction("Machines"):setTemplate("Machine Stinger"):setCallSign("CSS6"):setPosition(45056, -14553):orderStandGround()
    heading = tostring(math.floor(angleHeading(odysseus, station)))
    odysseus:addToShipLog(string.format(_("shipLog", "EVA sector scanner alarm. Unknown radiosignal detected from heading %d."), heading), "Red")


end
