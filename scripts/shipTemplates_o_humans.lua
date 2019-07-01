
-- Fighter
template = ShipTemplate():setName("Fighter F975"):setClass("Starfighter", "Interceptor"):setModel("eoc_fighter")
template:setRadarTrace("radar_fighter.png")
--             Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30, 0, 1200.0, 2.0, 30)
template:setHull(200)
template:setShields(400)
template:setSpeed(80, 20, 40)
template:setCombatManeuver(600, 150)
template:setWarpSpeed(0)
template:setJumpDrive(false)
template:setCloaking(false)
template:setEnergyStorage(400)
template:setTubes(2, 10.0) -- Amount of torpedo tubes, loading time
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setWeaponStorage("Homing", 250)




-- Scoutship

template = ShipTemplate():setName("Scoutship S342"):setClass("Frigate", "Cruiser"):setModel("eoc_frigate")
template:setRadarTrace("radar_cruiser")
template:setHull(300)
template:setShields(500, 500, 500, 500)
template:setSpeed(20, 5, 5)
template:setBeamWeapon(0, 90, -15, 1200, 8, 6)
template:setBeamWeapon(1, 90,  15, 1200, 8, 6)
template:setTubes(2, 60.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 6)
template:setTubeDirection(0, -1)
template:setTubeDirection(1,  1)
template:setWarpSpeed(0)
template:setJumpDrive(false)


template = ShipTemplate():setName("Scoutship S835"):setClass("Frigate", "Cruiser"):setModel("eoc_frigate")
template:setRadarTrace("radar_cruiser")
template:setShields(500, 500, 500, 500)
template:setBeamWeapon(0, 90, 0, 1200, 8, 6)
template:setHull(400)
template:setSpeed(20, 5, 10)
template:setCombatManeuver(400, 250)
template:setTubes(2, 10.0)
template:setTubeDirection(0, -1)
template:setTubeDirection(1,  1)
template:setWeaponStorage("Homing", 10)
template:setWeaponStorage("EMP", 3)
template:setWarpSpeed(0)
template:setJumpDrive(false)

-- Cargoship

template = ShipTemplate():setName("Cargoship T842"):setClass("Frigate", "Cruiser"):setModel("eoc_frigate")
template:setRadarTrace("radar_cruiser")
template:setHull(700)
template:setShields(500, 500, 500, 500)
template:setSpeed(15, 5, 5)
template:setBeamWeapon(0, 90, -15, 1200, 8, 6)
template:setBeamWeapon(1, 90,  15, 1200, 8, 6)
template:setTubes(2, 60.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 6)
template:setTubeDirection(0, -1)
template:setTubeDirection(1,  1)
template:setWarpSpeed(0)
template:setJumpDrive(false)

-- Cruiser
template = ShipTemplate():setName("Cruiser C753"):setClass("Corvette", "Destroyer"):setModel("eoc_frigate")
template:setRadarTrace("radar_transport.png")
template:setHull(400)
template:setShields(500, 500, 500, 500)
template:setSpeed(15, 4, 5)
template:setBeam(0, 40, -5, 1200.0, 6.0, 6)
template:setBeam(1, 40, 5, 1200.0, 6.0, 6)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, -45)
template:setTubeDirection(3, 45)
template:setTubeDirection(4, -180)
template:setTubeDirection(5, 180)
template:setWeaponStorage("Homing", 500)
template:setWeaponStorage("EMP", 500)
template:setWarpSpeed(0)
template:setJumpDrive(false)


--Corvette
template = ShipTemplate():setName("Corvette C754"):setClass("Corvette", "Destroyer"):setModel("small_frigate_5")
template:setRadarTrace("radar_transport.png")
template:setHull(300)
template:setShields(300, 300, 300, 300)
template:setSpeed(10, 6, 6)
template:setBeam(0, 40,-5, 1000.0, 6.0, 6)
template:setBeam(1, 40, 5, 1000.0, 6.0, 6)
-- template:setDefaultAI('missilevolley')
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, -45)
template:setTubeDirection(3, 45)
template:setTubeDirection(4, -180)
template:setTubeDirection(5, 180)
template:setWeaponStorage("Homing", 500)
template:setWeaponStorage("EMP", 500)
template:setWarpSpeed(0)
template:setJumpDrive(false)


template = ShipTemplate():setName("Corvette C348"):setClass("Corvette", "Destroyer"):setModel("small_frigate_5")
template:setRadarTrace("radar_transport.png")
template:setHull(500)
template:setShields(500, 500, 500, 500)
template:setSpeed(10, 6, 6)
template:setBeam(0, 40,-5, 1000.0, 6.0, 6)
template:setBeam(1, 40, 5, 1000.0, 6.0, 6)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, -45)
template:setTubeDirection(3, 45)
template:setTubeDirection(4, -180)
template:setTubeDirection(5, 180)
template:setWeaponStorage("Homing", 500)
template:setWeaponStorage("EMP", 500)
template:setWarpSpeed(0)
template:setJumpDrive(false)



template = ShipTemplate():setName("Cruiser C243"):setClass("Corvette", "Destroyer"):setModel("small_frigate_5")
template:setRadarTrace("radar_transport.png")
template:setHull(500)
template:setShields(500, 500, 500, 500)
template:setSpeed(10, 4, 5)
-- template:setDefaultAI('missilevolley')
template:setBeam(0, 40,-5, 1000.0, 6.0, 6)
template:setBeam(1, 40, 5, 1000.0, 6.0, 6)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, -45)
template:setTubeDirection(3, 45)
template:setTubeDirection(4, -180)
template:setTubeDirection(5, 180)
template:setWeaponStorage("Homing", 500)
template:setWeaponStorage("EMP", 500)
template:setWarpSpeed(0)
template:setJumpDrive(false)


--BattleCruiser
template = ShipTemplate():setName("Battlecruiser B952"):setClass("Corvette", "Freighters"):setModel("battleship_destroyer_4_upgraded")
template:setRadarTrace("radar_battleship.png")
template:setHull(800)
template:setShields(500, 500, 500, 500, 500, 500, 500, 500)
template:setSpeed(5, 3, 5)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 60, -10, 2000.0, 8.0, 11)
template:setBeam(1, 60,  10, 2000.0, 8.0, 11)
template:setBeam(2, 60, -20, 1500.0, 8.0, 11)
template:setBeam(3, 60,  20, 1500.0, 8.0, 11)
template:setTubes(2, 10.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 200)
template:setWeaponStorage("EMP", 40)
template:weaponTubeDisallowMissle(1, "EMP")
-- template:setDefaultAI('missilevolley')
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, -45)
template:setTubeDirection(3, 45)
template:setTubeDirection(4, -180)
template:setTubeDirection(5, 180)
template:setWeaponStorage("Homing", 500)
template:setWeaponStorage("EMP", 500)
template:setWarpSpeed(0)
template:setJumpDrive(false)


-- Space station
template = ShipTemplate():setName("Medium station"):setModel("space_station_2")
template:setRadarTrace("radartrace_mediumstation.png")
template:setSpeed(0, 0, 0)
template:setDockClasses("Starfighter")
template:setHull(400)
template:setShields(800)
