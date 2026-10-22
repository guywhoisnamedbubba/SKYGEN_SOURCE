local SOURCE = {
}
local TRAITS = {
}
local randomvalues = {
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
}
code = [[]]
print(code)
local loadstring = require(workspace.Model.SKYGEN.CORE.gen.Ls)
local exe,fail = loadstring(code)
exe()
