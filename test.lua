local randomvalues = {
  isanchored = true,
  doescrash = false,
  doesdamage = false, -- set to true if doescrash is true, sometimes just normal damager
  damage = 0, -- damage
  hasStepped = false, -- for entity loop ig
  hasWTWD = false,
  WTWDnumber = 0, -- number for while task wait do.
  doesChase = false, -- if it chases or not, speed will be put around the top of the code if so.
  chaseType = nil, -- if its chasing, its a string.
  HasPolygons = false,
  PolyC1 = nil, -- poly start color
  PolyC2 = nil, -- poly end color
  PolySizeMI = 0,
  PolySizeMA = 0,
  PolyCount = 0,
  MovementSpeed = 0,
}
local layers = {
  "Colorbox","Glitchbox","Redbox","Gallbox","Dynamicbox","Voidbox","PerilZone","PolygonZone"
}
local randomlayer = layers[math.random(1,#layers)]
local name = ""
if math.random(1,4) == 4 then
  randomvalues.isanchored = false
else
  randomvalues.isanchored = true
end
local typeofchase = "Constant"
if math.random(1,2) == 2 then
  typeofchase = "Step
end
if math.random(1,64) == 64 then
  randomvalues.doescrash = true
  randomvalues.doesdamage = true
  randomvalues.damage = Random.new():NextNumber(10,75)
  randomvalues.hasStepped = true
  randomvalues.doesChase = true
  randomvalues.chaseType = typeofchase
  randomvalues.MovementSpeed = Random.new():NextNumber(20,60)
  randomvalues.PolyCount = math.random(8,32)
  randomvalues.PolySizeMI = math.random(2,16),
  randomvalues.PolySizeMA = math.random(2,16),
  if randomlayer == "Colorbox" then
      local c1 = Color3.FromRGB(255,0,0)
      local c1r = math.random(1,3)
      if c1r == 2 then
        c1 = Color3.FromRGB(0,255,0)
      elseif c1r == 3 then
        c1 = Color3.FromRGB(0,0,255)
      end
      local c2 = Color3.FromRGB(255,0,0)
      local c2r = math.random(1,3)
      if c2r == 2 then
        c2 = Color3.FromRGB(0,255,0)
      elseif c1r == 3 then
        c2 = Color3.FromRGB(0,0,255)
      end
      randomvalues.PolyC1 = c1
      randomvalues.PolyC2 = c2
  elseif randomlayer == "Glitchbox" then
    randomvalues.PolyC1 = Color3.FromRGB(0,0,0)
      randomvalues.PolyC2 = Color3.FromRGB(127,127,127)
    elseif randomlayer == "Redbox" then
    randomvalues.PolyC1 = Color3.FromRGB(100,0,0)
      randomvalues.PolyC2 = Color3.FromRGB(150,0,0)
  end
end



code = [[local entity = Instance.new("Model",workspace)
entity:SetAttribute("iscontained",false)
entity:SetAttribute("chance",math.random(4,20))
entity:SetAttribute("speed",0)
entity:SetAttribute("spawndist",Random.new():NextNumber(500,16384))
local main = Instance.new("Part",entity)
main.Transparency = 1
main.Size = Vector3.new(4,4,4)
main.Anchored = ]]..randomvalues.isanchored..[[ 
entity.Name = "]]..name..[["
  entity.ChildRemoved:Connect(function()
	if entity.Parent.Name ~= "active entities" then
		script.Parent:Destroy()
	end
end)
]]
if randomvalues.doesChase then
    code ..= [[local speed = entity:GetAttribute("speed")
    function getclosest()
	local dist = math.huge
	local target = nil
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v
			and v.Character
			and v.Character:FindFirstChildWhichIsA("Humanoid") 
			and v.Character:FindFirstChildWhichIsA("Humanoid").Health > 0
			and v.Character:FindFirstChildWhichIsA("Humanoid").RootPart then
			local mag = (main.Position - v.Character:FindFirstChildWhichIsA("Humanoid").RootPart.Position).Magnitude
			if mag <= dist then
				dist = mag
				target = v.Character:FindFirstChildWhichIsA("Humanoid").RootPart
			end
		end
	end
	return target
end
    ]]
end
print(code)
local loadstring = require(workspace.Model.SKYGEN.CORE.gen.Ls)
local execute,failure = loadstring(code)
execute()
