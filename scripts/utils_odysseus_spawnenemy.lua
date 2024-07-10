
-- Name: Odysseus utils
-- Created by Ria B for Odysseus 2024

-- Enemy spawner
function spawnwave(size, orders, tx, ty)
    onGMClick(function(x, y)
        onGMClick(nil)
        spawn_wave(x, y, size, orders, tx, ty)
    end)

end


function spawn_wave(x, y, size, orders, tx, ty)
    local heading = tostring(math.floor(angleHeading(odysseus, x, y)))
    odysseus:addToShipLog(string.format(_("shipLog", "EVA sector scanner alarm. Multiple incoming jumps detected bearing %d. Unidentified vessels."), heading), "Red")

    --Defines the random distance min-max length where the enemies are spawn from the point clicked on the map
    distanceMin = 1000;
    distanceMax = 5000;
    if size == 1 then
        distanceMax = 5000;
    end
    if size == 2 then
        distanceMax = 5000;
    end
    if size == 3 then
        distanceMax = 10000;
    end
    if size == 4 then
        distanceMax = 30000;
    end
    if size == 5 then
        distanceMax = 35000;
    end
    -- Mother's size is so huge, that it needs space in the middle, mother is spawn in the exact coordinates
    if size == 6 then
        distanceMin = 7500;
        distanceMax = 50000;
    end
    
    --Spawn predator
    if size == 1 then
        pMin = 3
        pMax = 5
    end
    if size == 2 then
        pMin = 6
        pMax = 10
    end
    if size == 3 then
        pMin = 10
        pMax = 15
    end
    if size == 4 then
        pMin = 15
        pMax = 20
    end
    if size == 5 then
        pMin = 20
        pMax = 30
    end
    if size == 6 then
        pMin = 20
        pMax = 30
    end

    pc = irandom(pMin, pMax)
    for n=1, pc do
        local r = irandom(0, 360)
        local distance = random(distanceMin, distanceMax)
        x1 = x + math.cos(r / 180 * math.pi) * distance
        y1 = y + math.sin(r / 180 * math.pi) * distance
        local machine = CpuShip():setCallSign(generateCallSign("UNREC-", nil)):setFaction("Machines"):setTemplate("Machine Predator"):setPosition(x1, y1)
        if orders == "target" then
            machine:orderDefendLocation(tx,ty)
        elseif orders == "idle" then
            machine:orderIdle()
        elseif orders == "boarding" then
            machine:orderAttack(odysseus)
        else 
            machine:orderRoaming(x, y)
        end
    end

    --Spawn Stinger
    --Very small 
    if size == 1 then
        sMin = 1
        sMax = 2
    end
    -- Small
    if size == 2 then
        sMin = 2
        sMax = 4
    end
    -- Medium
    if size == 3 then
        sMin = 4
        sMax = 6
    end
    -- Large
    if size == 4 then
        sMin = 6
        sMax = 10
    end
    -- Massive or End
    if size == 5 then
        sMin = 10
        sMax = 15
    end
    if size == 6 then
        sMin = 30
        sMax = 40
    end

    sc = irandom(sMin, sMax)
    for n=1, sc do
        local r = irandom(0, 360)
        local distance = irandom(distanceMin, distanceMax)
        x1 = x + math.cos(r / 180 * math.pi) * distance
        y1 = y + math.sin(r / 180 * math.pi) * distance
        test = math.cos(r / 180 * math.pi) * distance

        local machine = CpuShip():setCallSign(generateCallSign("UNREC-", nil)):setFaction("Machines"):setTemplate("Machine Stinger"):setPosition(x1, y1)
        if orders == "target" then
            machine:orderDefendLocation(tx,ty)
        elseif orders == "idle" then
            machine:orderIdle()
        elseif orders == "boarding" then
            machine:orderAttack(odysseus)
        else 
            machine:orderRoaming(x, y)
        end
    end

    --Spawn Reaper
    if size == 4 or size == 5 or size == 6 then
        if size == 4 then
            rMin = 2
            rMax = 3
            distanceMax = 20000;
        end
        if size == 5  then 
            rMin = 4
            rMax = 8
            distanceMax = 30000;
        end
        if size == 6 then
            rMin = 10
            rMax = 20
            distanceMax = 40000;
        end
        --randomize Reaper count
        rc = irandom(rMin, rMax)
        for n=1, rc do
            local r = irandom(0, 360)
            local distance = random(distanceMin, distanceMax)
            x1 = x + math.cos(r / 180 * math.pi) * distance
            y1 = y + math.sin(r / 180 * math.pi) * distance    
            local machine = CpuShip():setCallSign(generateCallSign("UNREC-", nil)):setFaction("Machines"):setTemplate("Machine Reaper"):setPosition(x1, y1)
            if orders == "target" then
                machine:orderDefendLocation(tx,ty)
            else 
                if orders == "idle" then
                    machine:orderIdle()
                else 
                    machine:orderRoaming(x, y)
                end
            end
        end
    end

    --Spawn mothership
    if size == 6 then
        local lox, loy = odysseus:getPosition()
        setMotherHeading = true
        motherHeadingValue = angleHeading(x,y, lox,loy)
        motherSpawnHeading = motherHeadingValue - 90
        mother = CpuShip():setCallSign(generateCallSign("UNREC-", nil)):setFaction("Machines"):setHeading(motherSpawnHeading):setTemplate("Machine Mothership"):setPosition(x, y):setScanned(true):orderAttack(odysseus)
        removeGMFunction("OC - Machine - XL + Mother")
    end
end

function motherHeading()
    local currentHeadingValue = mother:getHeading()

    if mother:isValid() == false then
        setMotherHeading = false
    end

    if currentHeadingValue <= motherHeadingValue+10 and currentHeadingValue >= motherHeadingValue-10 then
        mother:orderIdle()
        setMotherHeading = false
        addGMFunction(_("Enemy", "Launch destruction"), function() cleanup_confirm() end)

    end
end
