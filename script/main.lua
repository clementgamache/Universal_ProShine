
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
	
	
	training = true
	catching = true
	pokemons_to_train = 4
	hunting_region = "Mt. Moon 1F"
	max_level = 21

	pokemon_names = {"Snorlax", "Larvitar", "Squirtle", "Budew", "Dratini", "Charmander", "Magmar", "Electabuzz"}

	
	setAutoConfig()
	
end

function onPathAction()
	moveUniversal()
end

function onBattleAction()
	
	return battle()
end










