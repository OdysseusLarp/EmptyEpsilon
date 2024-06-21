function setScenarioChange(nextScenario)

	if nextScenario == 1 then
		scenarioLua = "scenario_jump_01.lua"
	elseif nextScenario == 2 then
		scenarioLua = "scenario_jump_02.lua"
	elseif nextScenario == 3 then
		scenarioLua = "scenario_jump_03.lua"
	elseif nextScenario == 4 then
		scenarioLua = "scenario_jump_04.lua"
	elseif nextScenario == 5 then
		scenarioLua = "scenario_jump_05.lua"
	elseif nextScenario == 6 then
		scenarioLua = "scenario_jump_06.lua"
	elseif nextScenario == 7 then
		scenarioLua = "scenario_jump_07.lua"
	elseif nextScenario == 8 then
		scenarioLua = "scenario_jump_08.lua"
	elseif nextScenario == 9 then
		scenarioLua = "scenario_jump_09.lua"
	elseif nextScenario == 10 then
		scenarioLua = "scenario_jump_10.lua"
	elseif nextScenario == 11 then
		scenarioLua = "scenario_jump_11.lua"
	elseif nextScenario == 12 then
		scenarioLua = "scenario_jump_12.lua"
	elseif nextScenario == 13 then
		scenarioLua = "scenario_jump_13.lua"
	elseif nextScenario == 14 then
		scenarioLua = "scenario_jump_14.lua"
	elseif nextScenario == 15 then
		scenarioLua = "scenario_jump_15.lua"
	elseif nextScenario == 16 then
		scenarioLua = "scenario_jump_16.lua"
	elseif nextScenario == 17 then
		scenarioLua = "scenario_jump_17.lua"
	elseif nextScenario == 18 then
		scenarioLua = "scenario_jump_18.lua"
	end
	scenarioButtonText = "Load scenario " .. nextScenario
	setChangeButton(scenarioButtonText, scenarioLua)
	addGMFunction(_("buttonGM", "Sync fighter status"), function() sync_buttons() end)

end

function setChangeButton(scenarioButtonText, scenarioLua)
	addGMFunction(
		_("Scenario", scenarioButtonText), function()
		--Remove the button to set up next scenario
		setCancelChangeButton(scenarioButtonText, scenarioLua)
		setConfirmChangeButton(scenarioButtonText, scenarioLua)
		end)
end

function setCancelChangeButton(scenarioButtonText, scenarioLua)
	addGMFunction(
		_("Scenario", "Cancel load"),function()
		--Remove buttons when changeled
		removeGMFunction("Confirm load")
		removeGMFunction("Cancel load")
	end)
end

function setConfirmChangeButton(scenarioButtonText, scenarioLua)
	addGMFunction(
		_("Scenario", "Confirm load"),function()
		removeGMFunction("Confirm load")
		setScenario(scenarioLua)
	end)
end

function changeScenarioCancel(scenarioButtonText, scenarioLua)
	removeGMFunction("Confirm load")
		removeGMFunction("Cancel load")
	addGMFunction(scenarioButtonText, changeScenarioPrep)
end