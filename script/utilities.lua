

function equalArrays(array1, array2)
	local ty1 = type(array1)
	local ty2 = type(array2)
	if ty1 ~= ty2 then return false end
	local size1 = getArrayLength(array1)
	local size2 = getArrayLength(array1)
	if size1 ~= size2 then return false end
	for index, value in ipairs (array1) do
		if array1[index] ~= array2[index] then
			return false
		end
	end
	return true
end

function has_value (tab, val)
	for index, value in ipairs (tab) do
		if value == val then
			return true
		end
	end
	return false
end

function has_tab_value (tab, val)
	for index, value in ipairs (tab) do
		if equalArrays(value, val) then
			return true
		end
	end
	return false
end

function getArrayLength(array)
	arrayLength = 0
	for _ in pairs(array) do arrayLength = arrayLength + 1 end
	return arrayLength
end

function getNewArray(oldArray, objectToAdd)
	local newArray = {}
	for index, value in ipairs (oldArray) do
		table.insert(newArray, value)
	end
	table.insert(newArray, objectToAdd)
	return newArray
end