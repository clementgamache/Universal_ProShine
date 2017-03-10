
name = "Versatile Pokemon Catcher"
Author = "Clement Gamache"
Description = "It will catch the pokemon of your choice in a given zone. It uses the Super Fang move to split the HP of the opponent by two. log base 2 of HP is the number of Super Fang to use to get the HP of the wild Pokemon to 1HP. This is not good for catching Abras..."

dofile "battle.lua"
dofile "global.lua"
dofile "pokecenter.lua"
dofile "moving.lua"



name = "Versatile Pokemon Catcher"
Author = "Clement Gamache"
Description = "It will catch the pokemon of your choice in a given zone. It uses the Super Fang move to split the HP of the opponent by two. log base 2 of HP is the number of Super Fang to use to get the HP of the wild Pokemon to 1HP. This is not good for catching Abras..."

function onStart()
	
	sleeper = 4
	swiper = 4
	sleep_move = "Spore"
	swipe_move = "Super Fang"
	use_swiper = true
	use_sleeper = false
	training = false
	pokemons_to_train = 1
	hunting_region = "Route 10"
	has_mount = true
	mount_name = "Bicycle"

	pokemon_names = {"Heracross", "Yanma", "Cubone", "Snubbull", "Slakoth", "Snorlax", "Larvitar", "Squirtle", "Budew", "Dratini", "Charmander", "Magmar"}

	setPath()
	
end

function onPathAction()
	moveUniversal()
end

function onBattleAction()
	
	return battle()
end










