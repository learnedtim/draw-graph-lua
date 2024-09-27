stepMultiplierX = 0.003
stepMultiplierY = 0.005
lineInset = 0.021
function drawGraph(obj, offset, width, stepX, stepY, base, ...)
	local points = {...}
	local resultingParts = {}
	local stepX = stepX * stepMultiplierX
	local stepY = stepY * stepMultiplierY
	local rootOffsetCFrame = CFrame.new((obj.Size.X/2)-(offset*stepMultiplierX), (obj.Size.Y/2), -lineInset)
	local function adjustPos(part, x, y)
		part.CFrame = obj.CFrame:ToWorldSpace(rootOffsetCFrame * CFrame.new(x*-stepX, y*-stepY, 0))
	end
	
	for x, y in ipairs(points) do
		local pnt1x = x
		local pnt1y = y
		local pnt2x = x + 1
		local pnt2y = if points[x + 1] ~= nil then points[x + 1] else base
		
		local pnt1Vector = Vector2.new(pnt1x*stepX, pnt1y*stepY)
		local pnt2Vector = Vector2.new(pnt2x*stepX, pnt2y*stepY)
		print(pnt1x)
		print(pnt1y)
		print(pnt2x)
		print(pnt2y)
		print('--')
		print(pnt1Vector)
		print(pnt2Vector)
		print('------------')
		
		local part2 = Instance.new('Part')
		part2.Parent = obj
		part2.Anchored = true
		part2.Material = 'Neon'
		part2.Color = Color3.new(1, 0, 0)
		part2.Transparency = 1
		adjustPos(part2, pnt1x, pnt1y)
		part2.Size = Vector3.new(0.03, 0.03, 0.05) -- y-value is length, x is width
		
		local part = Instance.new('Part')
		part.Parent = obj
		part.Anchored = true
		part.Material = 'Neon'
		part.Transparency = 0.6
		part.Color = Color3.new(0, 0.835294, 0.388235)
		adjustPos(part, (pnt1x + pnt2x)/2, (pnt1y + pnt2y)/2)
		part.Size = Vector3.new(0.03, (pnt2Vector - pnt1Vector).Magnitude, 0.01) -- y-value is length, x is width
		part.CFrame = CFrame.lookAt(part.CFrame.Position, part2.Position)
		part.CFrame = part.CFrame * CFrame.Angles(math.rad(90),0,0)
		part.CFrame = part.CFrame * CFrame.new(-lineInset,0,0)
		table.insert(resultingParts, part)
	end
	
	-- union
	print('unioning')
	print(resultingParts)
	local firstPart = resultingParts[1]
	print(firstPart)
	table.remove(resultingParts, 1)
	print(firstPart)
	firstPart:UnionAsync(resultingParts, nil, Enum.RenderFidelity.Performance)
	print('done')
end
drawGraph(script.Parent, 0, 1, 2, 2, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19)
drawGraph(script.Parent, 490, 1, 2, 2, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19, 21, 20, 20, 19, 20, 20, 20, 19, 20, 20, 20, 21, 20, 20, 20, 20, 19, 20, 21, 22, 10, 26, 20, 18, 16, 17, 19, 20, 20, 21, 20, 19)
