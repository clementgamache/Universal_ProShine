dofile "database.lua"
dofile "utilities.lua"

function isMapCyclable() 
	currMap = getMapName()
	for index, value in ipairs (uncyclable_strings) do
		if string.match(currMap, value) then
			return false
		end
	end
	return true
end

function moveUniversal()


	isSubMap = false
	if has_mount and (not isMounted()) and isMapCyclable() and (not (last_map == getMapName())) then
		useItem(mount_name)
		log("Mounted " .. mount_name)
	elseif shouldGoToPokecenter() then --has to go to pokecenter
		if string.match(getMapName(), "enter") then
			useCenter()
		else
			path = getShortestPathTo("enter")
			for index, value in ipairs (move_to_cells) do
				if equalArrays(path[1], value[1]) and equalArrays(path[2], value[2]) then
					moveToCell(value[3],value[4])
					isSubMap = true
				end
			end
			if not isSubMap then
				moveToMap(path[2][1])
			end
		end
	else --can fight
		if getMapName() == hunting_region then
			hunt()
		else
			path = getShortestPathTo(hunting_region)
			for index, value in ipairs (move_to_cells) do
				if equalArrays(path[1], value[1]) and equalArrays(path[2], value[2]) then
					moveToCell(value[3],value[4])
					isSubMap = true
				end
			end
			if not isSubMap then
				moveToMap(path[2][1])
			end
		end
	end
	last_map = getMapName()
end

function setAutoConfig() 
	setMount()
	setSwiper()
	setSleeper()
end

function setMount()
	for index, value in ipairs (possible_mounts) do
		if hasItem(value) then
			has_mount = true
			mount_name = value
			return
		end
	end
	has_mount = false
end

function setSwiper()
	for index, value in ipairs (swipe_moves) do
		for i = 1, getTeamSize() do
			if hasMove(i, value) then
				use_swiper = true
				swipe_move = value
				swiper = i
				return
			end
		end
	end
	use_swiper = false
end

function setSleeper()
	for index, value in ipairs (sleep_moves) do
		for i = 1, getTeamSize() do
			if hasMove(i, value) then
				use_sleeper = true
				sleep_move = value
				sleeper = i
				return
			end
		end
	end
	use_leeper = false
end


function getShortestPathTo(regex)
	currentMap = getMapName()
	allPaths = {}
	done = false
	for index, value in ipairs (map_pairs) do
		for i = 1, 2 do
			if value[i][1] == currentMap then
				if getArrayLength(value[i]) == 5 then
					if getPlayerX() >= value[i][2] and getPlayerY() >= value[i][3] and getPlayerX() <= value[i][4] and getPlayerY() <= value[i][5] then
						
						table.insert(allPaths, {value[i]})
						visitedNodes = {value[i]}
						done = true
						break
					end
				else
					table.insert(allPaths, {value[i]})
					visitedNodes = {value[i]}
					done = true
					break
				end
			end 
		end
		if done then
			break
		end
	end
	--{{{currentMap}}}
	found = false
	idx = 0
	while not found do
		idx = idx + 1
		for index, value in ipairs (allPaths) do
			if getArrayLength(value) == idx then
				--get All connected maps to the last map
				--log("Looking for connected maps to " .. value[idx][1])
				for index2, value2 in ipairs (map_pairs) do
					for i = 1, 2 do
						local newArray
						if equalArrays(value[idx], value2[i]) and (not has_tab_value(visitedNodes, value2[3-i])) then
							--log("Found " .. value2[3-i][1])
							table.insert(visitedNodes, value2[3-i])
							newArray = getNewArray(value, value2[3-i])
							table.insert(allPaths, newArray)
							--printAllPaths(allPaths)
							if string.match(value2[3-i][1], regex) then
								finalSize = getArrayLength(allPaths)
								log("Next path:")
								for index3, value3 in ipairs (allPaths[finalSize]) do
									--an iteration is a place
									tmp1 = ""
									for index4, value4 in ipairs (value3) do
										--an iteration is a place
										tmp1 = tmp1 .. " " .. value4
									end
									tmp2 = ""
									for i = 0, index3 do
										tmp2 = tmp2 .. "   "
									end
									log(tmp2 .. tmp1)
								end
								return allPaths[finalSize]
							end
						end
					end
				end
			end
		end
		if idx > 40 then
			found = true
			log("There is an error somewhere")
		end
	end
	return {}
end


