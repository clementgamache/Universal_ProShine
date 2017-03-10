dofile "database.lua"
dofile "global.lua"
dofile "utilities.lua"

function shouldGoToPokecenter()
	if use_swiper and hasMove(swiper, swipe_move) and getRemainingPowerPoints(swiper, swipe_move) < 3 then
		return true
	elseif use_sleeper and hasMove(sleeper, sleep_move) and getRemainingPowerPoints(sleeper, sleep_move) == 0 then
		return true 	
	elseif use_swiper and (not isPokemonUsable(swiper)) then
		return true
	elseif use_sleeper and (not isPokemonUsable(sleeper)) then
		return true
	elseif (not isPokemonUsable(pokemons_to_train)) then
		return true
	else
		return false
	end
end

function useCenter()
	for index, value in ipairs (fake_pokecenters) do
		if getMapName() == value[1] then 
			talkToNpcOnCell(value[2], value[3]) --on victory road
			return
		end
	end
	usePokecenter()
end


