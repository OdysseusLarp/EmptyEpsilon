template = ShipTemplate():setName("Machine Predator"):setClass("Machine", "Predator"):setModel("machine_predator")
template:setRadarTrace("machine_predator.png")
template:setHull(30)
template:setShields(30)
template:setSpeed(80, 8, 20)
template:setWarpSpeed(0)
template:setJumpDrive(false)
template:setCloaking(false)
template:setCombatManeuver(600, 0)
template:setBeam(0, 30, 0, 800.0, 2.0, 4)
template:setEnergyStorage(400)
template:setDefaultAI('fighter')
template:setTubes(1, 12.0) -- Amount of torpedo tubes, loading time
template:setTubeDirection(0, 0)
template:setWeaponStorage("Homing", 250)
template:hidden()

template = ShipTemplate():setName("Machine Stinger"):setClass("Machine", "Stringer"):setModel("machine_stinger")
template:setRadarTrace("machine_stinger.png")
template:setHull(300)
template:setShields(250, 250)
template:setSpeed(50, 2, 4)
template:setWarpSpeed(0)
template:setJumpDrive(false)
template:setCloaking(false)
template:setBeam(0, 30, 10, 1500.0, 6.0, 10)
template:setBeam(1, 30, -10, 1500.0, 6.0, 10)
template:setBeam(2, 30, -140, 1200.0, 6.0, 5)
template:setBeam(3, 30, 140, 1200.0, 6.0, 5)
-- template:setDefaultAI('missilevolley')
template:setTubes(5, 10.0) -- Amount of torpedo tubes, and loading time of the tubes.
template:setTubeDirection(0, 0)
template:setTubeDirection(1, -45)
template:setTubeDirection(2, 45)
template:setTubeDirection(3, 160)
template:setTubeDirection(4, -160)
template:setWeaponStorage("Homing", 40)
template:setWeaponStorage("EMP", 40)
template:hidden()

template = ShipTemplate():setName("Machine Reaper"):setClass("Machine", "Reaper"):setModel("machine_reaper")
template:setRadarTrace("machine_reaper.png")
template:setHull(2500)
template:setShields(1800, 1800, 1800, 1800)
template:setSpeed(30, 1, 3)
template:setWarpSpeed(0)
template:setJumpDrive(false)
template:setCloaking(false)
template:setBeam(0, 10, 0, 3000.0, 6.0, 50)
template:setBeam(1, 30, 15, 1500.0, 6.0, 30)
template:setBeam(2, 30, -15, 1500.0, 6.0, 30)
template:setBeam(3, 40, -140, 1200.0, 6.0, 15)
template:setBeam(4, 40, 140, 1200.0, 6.0, 15)
template:setBeam(5, 30, 180, 1000.0, 6.0, 10)
-- template:setDefaultAI('missilevolley')
template:setTubes(10, 4.0) -- Amount of torpedo tubes, and loading time of the tubes.
template:setTubeDirection(0, 5)
template:setTubeDirection(1, -5)
template:setTubeDirection(2, -15)
template:setTubeDirection(3, 15)
template:setTubeDirection(4, -45)
template:setTubeDirection(5, 45)
template:setTubeDirection(6, -90)
template:setTubeDirection(7, 90)
template:setTubeDirection(8, -120)
template:setTubeDirection(9, 120)
template:setWeaponStorage("Homing", 500)
template:setWeaponStorage("EMP", 20)
template:hidden()




template = ShipTemplate():setName("Machine Mothership"):setClass("Machine", "Mothership"):setModel("machine_mother")
template:setRadarTrace("machine_mothership.png")
template:setJumpDrive(true)
template:setTubes(16, 3.0)
template:setWeaponStorage("Homing", 1000)
for n=0,15 do
    template:setBeamWeapon(n, 90,  n * 22.5, 3200, 3, 10)
    template:setTubeDirection(n, n * 22.5)
end
template:setHull(8000)
template:setShields(2500, 2500, 2500, 2500, 2500, 2500)
template:setSpeed(5, 1, 1)
template:setWarpSpeed(0)
template:setJumpDrive(false)
template:setCloaking(false)
template:hidden()
