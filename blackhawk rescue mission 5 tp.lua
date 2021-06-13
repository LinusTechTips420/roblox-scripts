local lp = game.Players.LocalPlayer
local mouse = lp:GetMouse()
local tpkey1 = "j" -- Mountain
local tpkey2 = "k" -- Garage
local tpkey3 = "l" -- Coms

mouse.KeyDown:Connect(function(key)
   if key == tpkey1 then
       lp.Character:MoveTo(Vector3.new(-1892.04456, 823.450012, -4372.45947)) ---put your own cframes here
   end
   
   if key == tpkey2 then
       lp.Character:MoveTo(Vector3.new(-1702.04456, 823.450012, -4372.45947)) ---put your own cframes here
   end
   
   if key == tpkey3 then
       lp.Character:MoveTo(Vector3.new(-3511.73071, 64.1496964, 531.917114))
   end
end)