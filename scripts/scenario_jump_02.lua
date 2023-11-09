-- Name: Jump 02
-- Type: Odysseus
-- Description: Onload: Odysseus, random asteroids.

require("utils.lua")
require("utils_odysseus.lua")

function init()

  for n=1,100 do
    Asteroid():setPosition(random(-100000, 100000), random(-100000, 100000)):setSize(random(100, 500))
    VisualAsteroid():setPosition(random(-100000, 190000), random(-100000, 100000)):setSize(random(100, 500))
  end
	addGMFunction("Change scenario to 03", changeScenarioPrep)
end

function changeScenarioPrep()

	removeGMFunction("Change scenario to 03")
	addGMFunction("Cancel change", changeScenarioCancel)
	addGMFunction("Confirm change", changeScenario)

end

function changeScenarioCancel()
	removeGMFunction("Confirm change")
		removeGMFunction("Cancel change")
	addGMFunction("Change scenario to 03", changeScenarioPrep)

end

function changeScenario()

	setScenario("scenario_jump_03.lua", "Null")

end
