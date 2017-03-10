
name = "Versatile Pokemon Catcher"
Author = "Clement Gamache"
Description = "It will catch the pokemon of your choice in a given zone. It uses the Super Fang move to split the HP of the opponent by two. log base 2 of HP is the number of Super Fang to use to get the HP of the wild Pokemon to 1HP. This is not good for catching Abras..."

dofile "battle.lua"
dofile "global.lua"
dofile "pokecenter.lua"
dofile "moving.lua"
dofile "utilities.lua"



name = "Versatile Pokemon Catcher"
Author = "Clement Gamache"
Description = "It will catch the pokemon of your choice in a given zone. It uses the Super Fang move to split the HP of the opponent by two. log base 2 of HP is the number of Super Fang to use to get the HP of the wild Pokemon to 1HP. This is not good for catching Abras..."

function onStart()
	

	pokemon_names = {}
	

	sleeper = 1
	swiper = 1
	sleep_move = "Spore"
	swipe_move = "False Swipe"
	use_swiper = true
	use_sleeper = true
	training = false
	catching = false
	pokemons_to_train = 1
	hunting_region = "Route 4"
	
	setMount()
end


function printAllPaths(allPaths)
	log("Printing all paths")
	for index, value in ipairs (allPaths) do
		log("Path " .. index)
		--an iteration is a path
		for index2, value2 in ipairs (value) do
			--an iteration is a place
			log(value2[1])
		end
	end
end

function onPathAction()
	moveUniversal()
end

function onBattleAction()
	
	return battle()
end
