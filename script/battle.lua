
dofile "global.lua"
dofile "utilities.lua"

function hunt()
	for index, value in ipairs (surf_regions) do
		if value == hunting_region then
			moveToWater()
			return
		end
	end
	for index, value in ipairs (rectangle_regions) do
		if value[1] == hunting_region then
			moveToRectangle(value[2], value[3], value[4], value[5])
			return
		end
	end
	for index, value in ipairs (fish_regions) do
		if value[1] == hunting_region then
			
			if getPlayerX() == value[2] and getPlayerY() == value[3] then
				useItem(fishing_rod)
				return
			else
				moveToCell(value[2], value[3])
				return
			end 
		end
	end
	moveToGrass()

end

function shouldCatch()
	if (not hasItem("Pokeball")) and (not hasItem("Great Ball")) and (not hasItem("Ultra Ball")) then
		log("No more Pokeball")
		return false
	elseif not catching then
		return false
	elseif has_value(pokemon_names, getOpponentName()) then
		return true
	elseif isOpponentShiny() then
		return true
	elseif has_value(blacklist, getOpponentName()) then
		return false
	elseif not isAlreadyCaught() then
		return true
	else
		return false
	end
end

function canUseMove(num, move)
	return hasMove(num, move) and getRemainingPowerPoints(num, move) 
end

function battle()
	for i = 1, pokemons_to_train do
		if getPokemonLevel(i) >= max_level then 
			fatal("level " .. max_level)
		end
	end
	if shouldCatch() then
        if use_swiper and getOpponentHealth() > 6 and canUseMove(swiper, swipe_move) then
			if getActivePokemonNumber() == swiper and canUseMove(swiper, swipe_move) then
				return useMove(swipe_move) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
			else
				return sendPokemon(swiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
			end
		elseif use_sleeper and (not (getOpponentStatus() == "SLEEP")) and canUseMove(sleeper, sleep_move) then
			if getActivePokemonNumber() == sleeper and canUseMove(sleeper, sleep_move) then
				return useMove(sleep_move) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
			else 
				return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
			end
		else
			return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
		end
	elseif getMapName() == hunting_region then	
		return (training and (attack() or sendUsablePokemon())or run()) or run() or sendUsablePokemon()
	else
		return run() or attack() or sendUsablePokemon()
	end
end



