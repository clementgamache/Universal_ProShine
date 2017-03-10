
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
				useItem("Super Rod")
			else
				moveToCell(value[2], value[3])
				return
			end 
		end
	end
	moveToGrass()

end

function shouldCatch()
	if not catching then
		return false
	if has_value(pokemon_names, getOpponentName()) then
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
	if getPokemonLevel(1) > 97 then 
		fatal("level 99")
	end
	if shouldCatch() then
        if getOpponentHealth() > 6 and canUseMove(swiper, swipe_move) and use_swiper then
			if getActivePokemonNumber() == swiper and canUseMove(swiper, swipe_move) then
				return useMove(swipe_move) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
			else
				return sendPokemon(swiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
			end
		elseif (not (getOpponentStatus() == "SLEEP")) and canUseMove(sleeper, sleep_move) and use_swiper then
			if getActivePokemonNumber() == sleeper and canUseMove(sleeper, sleep_move) then
				return useMove(sleep_move) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
			else 
				return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
			end
		else
			return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run() or sendUsablePokemon()
		end
	else
		
		return (training and (attack() or sendUsablePokemon())or run()) or run() or sendUsablePokemon()
	end
end



