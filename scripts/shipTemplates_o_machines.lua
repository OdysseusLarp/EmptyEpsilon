template = ShipTemplate():setName("Machine Fighter"):setClass("Fighter", "Interceptor"):setModel("dark_fighter_6")
template:setRadarTrace("radar_fighter.png")
template:setHull(100)
template:setShields(80)
template:setSpeed(35, 15, 20)
template:setCombatManeuver(600, 0)
template:setBeam(0, 30, 5, 900.0, 4.0, 2.5)
template:setBeam(1, 30,-5, 900.0, 4.0, 2.5)
template:setEnergyStorage(400)
template:setDefaultAI('fighter')


template = ShipTemplate():setName("Machine Cruiser"):setClass("Corvette", "Destroyer"):setModel("LightCorvetteGrey")
template:setRadarTrace("radar_transport.png")
template:setHull(50)
template:setShields(50, 50)
template:setSpeed(15, 4, 5)
template:setBeam(0, 40, 170, 1200.0, 6.0, 6)
template:setBeam(1, 40, 190, 1200.0, 6.0, 6)
template:setDefaultAI('missilevolley')



template = ShipTemplate():setName("Machine Unknown"):setClass("Dreadnaught", "Odin"):setModel("space_station_2")
template:setRadarTrace("radar_dread.png")
template:setJumpDrive(true)
template:setTubes(16, 3.0)
template:setWeaponStorage("Homing", 1000)
for n=0,15 do
    template:setBeamWeapon(n, 90,  n * 22.5, 3200, 3, 10)
    template:setTubeDirection(n, n * 22.5)
end
template:setHull(2000)
template:setShields(1200, 1200, 1200, 1200, 1200, 1200)
template:setSpeed(0, 1, 0)