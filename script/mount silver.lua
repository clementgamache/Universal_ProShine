
name = "Versatile Pokemon Catcher"
Author = "Clement Gamache"
Description = "It will catch the pokemon of your choice while training"

dofile "battle.lua"
dofile "config.lua"
dofile "pokecenter.lua"
dofile "moving.lua"




function onBattleAction()
	
	return battle()
end


function moveAllPath()
	
	used_mean_look = false
	if getMapName() == "Mt. Silver Pokecenter" then
		moveToMap("Mt. Silver Exterior")
	elseif getMapName() == "Mt. Silver Exterior" then
		moveToMap("Mt. Silver 1F")
	elseif getMapName() == "Mt. Silver 1F" then
		moveToMap("Mt. Silver Lower Mountainside")
	elseif getMapName() == "Mt. Silver Lower Mountainside" then
		if not isMounted() then
			useItem("Bicycle")
			return
		end
		moveToGrass()
	end
	
end

function moveReversePath()
	
	if getMapName() == "Mt. Silver Lower Mountainside" then
		moveToCell(22, 34)
	elseif getMapName() == "Mt. Silver 1F" then
		moveToMap("Mt. Silver Exterior")
		 
	elseif getMapName() == "Mt. Silver Exterior" then
		moveToMap("Mt. Silver Pokecenter")
	elseif getMapName() == "Mt. Silver Pokecenter" then
		useCenter()
	end
	
end


function onPathAction()

	if  not shouldGoToPokecenter() then
		moveAllPath()
	else
		moveReversePath()
	end
end

