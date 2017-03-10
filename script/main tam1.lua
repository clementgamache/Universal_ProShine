
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
	
	sleeper = 1
	swiper = 1
	sleep_move = "Spore"
	swipe_move = "False Swipe"
	use_swiper = true
	use_sleeper = true
	training = true
	catching = true
	pokemons_to_train = 1
	hunting_region = "Vermilion City"

	pokemon_names = {"Pidgeotto", "Heracross", "Yanma", "Cubone", "Snubbull", "Slakoth", "Snorlax", "Growlithe", "Larvitar", "Squirtle", "Budew", "Dratini", "Charmander", "Magmar"}

	setMount()
	
end

function onPathAction()
	moveUniversal()
end

function onBattleAction()
	
	return battle()
end
