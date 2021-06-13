if game.PlaceId ~= 2317712696 then

    game:Shutdown()

end



if getgenv().TSLoaded then

	local ReplicatedStorage = game:GetService("ReplicatedStorage");

	local ModLoad = require(ReplicatedStorage.Modules.Load);

	local UIHandler = ModLoad("UIHandler")

	UIHandler:GiveNotification({

		text = "ThisStuff is already loaded!",

		textcolor = "Red",

		center = true

	});

	return;

end



local Exploit = (syn and not is_sirhurt_closure and not pebc_execute and "Synapse")



if Exploit == "Synapse" then

    for i, v in pairs(getconnections(game:GetService("ScriptContext").Error)) do

        v:Disable()

        game:GetService("ScriptContext").Error:Connect(function(...)

            local Arguments = {...}

            local Data, Data2 = pcall(function()

                return Arguments[3].Name

            end)

            if Data == false then

                return;

            end

            v:Fire(...)

        end)

    end

end



--//



local Core = {

    ["WeaponsStorage"] = {},

    ["Weapons"] = {},

    ["Ambient"] = game:GetService("Lighting").Ambient,

    ["FireworkLaunch"] = {

        Vector3.new(1040, 171, -876),

        Vector3.new(948, 171, -966),

        Vector3.new(963, 171, -1071),

        Vector3.new(1835.715, 239.552, -1638.619),

        Vector3.new(641.765, 69.379, -809.071),

        Vector3.new(589.765, 45.379, -505.071),

        Vector3.new(366.765, 45.379, -717.071),

        Vector3.new(-308.91, 160.717, -632.784),

        Vector3.new(893, 105.541, -2316),

        Vector3.new(-781, 90.852, 502),

        Vector3.new(-235, 100.516, 565),

        Vector3.new(242.834, 176.5, 174.759),

        Vector3.new(480, 126.5, 449),

        Vector3.new(-1354, 206.338, -1529),

        Vector3.new(1695.129, 404.78, 1440.797),

        Vector3.new(519.44, 136.704, 1747.772),

        Vector3.new(-80, 122.5, 1517),

        workspace["WORKSPACE_Interactables"]["LaGrande Riverboat"].Engine.Smokestacks.smokestacktop.Position,

        Vector3.new(-1369.706, 157.491, 1957.17),

        Vector3.new(-366.106, 76.092, -1833.756),

        Vector3.new(-1896, 122.8, -430)

    },

    HealthValues = {

        Bison = 150,

        Cow = 100,

        Bear = 200,

        Gator = 200,

        Deer = 50

    }

}

local Client = {

    Other = {},

    BreakableGlass = {},

    Keybinds = {}

}

local Settings = {

    ESP = {},

    Aimbot = {

        CheckWorldDistance = true

    },

    Keybinds = {}

}

local Utils = {}



local Players = game:GetService("Players")

local LocalPlayer = game:GetService("Players").LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local UserInputService = game:GetService("UserInputService")

local GuiService = game:GetService("GuiService")

local Mouse = LocalPlayer:GetMouse()

local ClientNetwork = getupvalue(require(ReplicatedStorage.Modules.Load)("GunItem").CanShoot, 1)

local LocalRepChar = ClientNetwork.RepCharHandler:GetRepChar(game:GetService("Players").LocalPlayer);

local CurrentCamera = workspace.CurrentCamera



local Library = loadstring(game:HttpGet("https://cdn.thisstuff.xyz/Api/Library/Main2", true))()

local ESPLibrary = loadstring(game:HttpGet("https://cdn.thisstuff.xyz/Api/ESP", true))()

local JSON = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoTwistedHere/Storage/main/Other/JSONWithUserdata", true))()

local Window = Library:AddWindow("The Wild West - ThisStuff.xyz", {

    min_size = Vector2.new(680, 500),

    toggle_key = Enum.KeyCode.RightControl,

    can_resize = true,

    main_color = Color3.fromRGB(41, 74, 122)

})

local GunCheats = Window:AddTab("Gun Cheats")

local CharacterCheats = Window:AddTab("Character Cheats")

local AnimalCheats = Window:AddTab("Animal Cheats")

local ESP = Window:AddTab("Esp")

local Aimbot = Window:AddTab("Aimbot")

local Miscellaneous = Window:AddTab("Misc")

local Keybinds = Window:AddTab("Keybinds")

local SettingsT = Window:AddTab("Settings")



--//



do

    local Success, Response = pcall(function()

        return JSON:Decode(readfile("ThisStuff_2317712696.json"))

    end)



    if Success and type(Response) == "table" then

        for i, v in pairs(Response) do

            Settings[i] = v

        end

    end

end



local function deepCopy(original) --// Thank you roblox

	local copy = {}

	for k, v in pairs(original) do

		if type(v) == "table" then

			v = deepCopy(v)

		end

		copy[k] = v

	end

	return copy

end



if Settings.IESP then

    Settings.LightningTree_ESP = Settings.IESP.LTEnabled

    Settings.IESP = nil

end



do



    for i,v in pairs(getconnections(game:GetService("Lighting").Changed)) do 

        v:Disable()

        game:GetService("Lighting").Changed:Connect(function()

            if game:GetService("Lighting").Ambient ~= Color3.fromRGB(255, 255, 255) and game:GetService("Lighting").Ambient ~= Core.Ambient then

                Core.Ambient = game:GetService("Lighting").Ambient

            end

        end)

    end



    for i,v in next, ClientNetwork.PlayerCharacter do

        if type(v) == "function" and getinfo(v).name ~= "" then

            Core[getinfo(v).name] = v

        end

    end



    for i, v in next, getgc(true) do

        if type(v) == "table" and rawget(v, "BaseRecoil") then

            Core["WeaponsStorage"][i] = deepCopy(v)

            Core["Weapons"][i] = v

        end

    end



    for i,v in next, getupvalues(ClientNetwork.BreakableGlass.GetBreakableGlass, 1)[1] do

        if type(v) == "table" and rawget(v, "Id") then

            Client.BreakableGlass[i] = v

        end

    end



    Core["FireServer"] = ClientNetwork.Network.FireServer

    Core["CanRoll"] = ClientNetwork.PlayerCharacter.CanRoll

    Core["StopRoll"] = ClientNetwork.PlayerCharacter.StopRoll

    Core["AnimalRiding"] = ClientNetwork.AnimalRiding.GetRidingAnimal()

    Core["Animal-Ragdoll"] = ClientNetwork.Animal.Ragdoll

    Core["GetHorseBackAccMod"] = ClientNetwork.ProjectileHandler.GetHorseBackAccMod

    Core["CanShoot"] = ClientNetwork.GunItem.CanShoot

end



ESPLibrary.Overrides.GetColor = function(Character)

    local Player = Players:GetPlayerFromCharacter(Character)

    if Player and Player.TeamColor then

        return Settings.ESP.Team and Color3.fromRGB(Player.TeamColor.Color.R*255, Player.TeamColor.Color.G*255, Player.TeamColor.Color.B*255) or (Settings.ESP.Color or Color3.fromRGB(255, 255, 255))

    end

    return Settings.ESP.Color or Color3.fromRGB(255, 255, 255)

end



--//



if Exploit == "Synapse" then

    local Circle = Drawing.new("Circle")

    Circle.Visible = Settings.Aimbot.Visible or false

    Circle.Color = Settings.Aimbot.Color or Color3.fromRGB(255, 255, 255)

    Circle.Thickness = Settings.Aimbot.Thickness or 2

    Circle.Filled = Settings.Aimbot.Filled or false

    Circle.Radius = Settings.Aimbot.Radius or 100

    Circle.NumSides = Settings.Aimbot.NumSides or 100

    Circle.Transparency = Settings.Aimbot.Transparency or 1

    Circle.Position = Vector2.new(0, 0)



    Client.Other.AimbotCircle = Circle



    function Client.Other.Aimbot()

        Client.Other.AimbotCircle.Visible = Settings.Aimbot.Visible or false

        Client.Other.AimbotCircle.Color = Settings.Aimbot.Color or Color3.fromRGB(255, 255, 255)

        Client.Other.AimbotCircle.Thickness = Settings.Aimbot.Thickness or 2

        Client.Other.AimbotCircle.Filled = Settings.Aimbot.Filled or false

        Client.Other.AimbotCircle.NumSides = Settings.Aimbot.NumSides or 100

        Client.Other.AimbotCircle.Transparency = Settings.Aimbot.Transparency or 1

        Client.Other.AimbotCircle.Radius = Settings.Aimbot.Radius or 100

    end

end



function Utils.PickRandom(Table)

    math.randomseed(os.time())

    return Table[math.random(#Table)]

end



function Utils.GetClosest()

    local ClosestScreenDistance = 9e150

    local ClosestWorldDistance = {9e150, 9e150}

    local AimbotTable;

    

    for i,v in next, workspace["WORKSPACE_Entities"].Players:GetChildren() do

        local Player = Players:FindFirstChild(v.Name)

        local Target = "Head"



        if not Player or Settings.Aimbot.TeamCheck and Player.Team == LocalPlayer.Team then

            continue;

        end



        if not Settings.Aimbot.DominateOnly then

            Target = Utils.PickRandom({"Head", "UpperTorso", "LowerTorso", "LeftLowerLeg", "RightLowerLeg", "LeftUpperArm", "LeftLowerArm"})

        end



        if Player and Player ~= LocalPlayer and v:FindFirstChild(Target) then

            local TargetPart = v[Target]

            local WorldPosition = CurrentCamera:WorldToViewportPoint(TargetPart.Position)

            local ScreenDistance = (Vector2.new(WorldPosition.X, WorldPosition.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude

            local WorldDistance = (WorldPosition - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

            local k, OnScreen = CurrentCamera:WorldToScreenPoint(TargetPart.Position)



            if not OnScreen then

                continue;

            end



            local function Finish()

                if ScreenDistance < Settings.Aimbot.Radius and ScreenDistance < ClosestScreenDistance then

                    if Settings.Aimbot.CheckWorldDistance and WorldDistance >= ClosestWorldDistance[2] and ScreenDistance >= ClosestWorldDistance[1] then

                        return;

                    end

                    ClosestScreenDistance = ScreenDistance

                    ClosestWorldDistance = {ScreenDistance, WorldDistance}

                    AimbotTable = {

                        ["ScreenDistance"] = ScreenDistance,

                        ["WorldDistance"] = WorldDistance,

                        ["Player"] = Player,

                        ["Character"] = v,

                        ["Target"] = TargetPart

                    }

                end

            end



            if Settings.Aimbot.VisibilityCheck and #CurrentCamera:GetPartsObscuringTarget({TargetPart.Position}, {CurrentCamera, LocalPlayer.Character, v}) == 0 then

                Finish()

            elseif not Settings.Aimbot.VisibilityCheck then

                Finish()

            end

        end

    end

    

    return AimbotTable

end



function Firework(Position, Velocity, Delay)

    coroutine.resume(coroutine.create(function()

        local FireworkProjectile = ReplicatedStorage.Resources.Projectiles.FireworkProjectile:Clone()

        local FireworkExplosion = ReplicatedStorage.Resources.VFX.Attachments.FireworkExplosionAt:Clone()

        local RandomColor = math.random(1, 6)

        local RandomColor1 = math.random(1, 6)

        

        FireworkProjectile.Parent = workspace.Ignore

        FireworkProjectile.LaunchSound.TimePosition = 0.8

        FireworkProjectile.LaunchSound.Playing = true

        FireworkProjectile.Position = Position

        FireworkProjectile.Velocity = Velocity or Vector3.new(0, 300, 0)

        FireworkExplosion.Parent = FireworkProjectile

        FireworkExplosion.Orientation = Vector3.new(-90, 0, 0)

        

        wait(Delay or 0.8)

        

        FireworkProjectile.BlackPowderProjectile.BarrelExhaustFrontal.Enabled = false

        FireworkExplosion.Sound.TimePosition = 3.5

        FireworkExplosion.Sound.Playing = true

        FireworkProjectile.Anchored = true

        

        for i,v in next, FireworkExplosion:GetChildren() do

            if (v.Name == "FireworkEmit" and i == RandomColor or i == RandomColor1) or v.Name == "Flash" then

                pcall(function()

                    v:Emit(v.EmitValue.Value)

                end)

            end

        end

        

        wait(10)

        FireworkProjectile:Destroy()

        FireworkExplosion:Destroy()

    end))

end



function LaunchStartFireworks()

    for i,v in next, Core["FireworkLaunch"] do

        coroutine.resume(coroutine.create(function()

            wait(math.random()*4)

            Firework(v)

        end))

    end

end



function BreakAllGlass()

    for i,v in next, getupvalues(ClientNetwork.BreakableGlass.GetBreakableGlass, 1)[1] do

        if type(v) == "table" and rawget(v, "Id") then

            ClientNetwork.Network:FireServer("BreakGlass", v.Id, Vector3.new(math.random(2, 5), math.random(2, 5), math.random(2, 5)))

        end

    end

end



function RagdollSelf()

    local OldAntiRagdoll = Settings.AntiRagdoll



    Settings.AntiRagdoll = false

    ClientNetwork.PlayerCharacter:Ragdoll()

    Settings.AntiRagdoll = OldAntiRagdoll

end



function KillSelf()

    local OldNoFallDamage = Settings.NoFallDamage

    local a = math.random(40, 80)



    Settings.NoFallDamage = false

    ClientNetwork.Network:FireServer("DamageSelf", a)

    ClientNetwork.Network:FireServer("DamageSelf", 100 - a)

    Settings.NoFallDamage = OldNoFallDamage

end



function CharAdded(Player)

    ESPLibrary:Add(Player.Character, {

        Name = Player.Name,

        Player = Player,

        PrimaryPart = Player.Character.PrimaryPart or Player.Character:WaitForChild("HumanoidRootPart", 20)

    })

end



function SpinMeRightRound()

    decode = syn.crypt.base64.decode or crypt.base64decode

    getcustomasset = getsynasset or getcustomasset



    local Sound64 = decode(game:GetObjects("rbxassetid://6385037822")[1].NotHere.Source)

    writefile("YouKnowYouLikeIt.mp3", Sound64)



    local Sound = Instance.new("Sound")

    Sound.Parent = game:GetService("CoreGui")

    Sound.SoundId = getcustomasset("YouKnowYouLikeIt.mp3")

    Sound.Volume = 1

    Sound:Play()

end



function ESP_ThunderstruckTree(Tree)

    if Tree and not Tree:FindFirstChild("ThunderFX") and Settings.LightningTree_ESP then

        local BillboardGui = Instance.new("BillboardGui")

        local TextLabel = Instance.new("TextLabel")

        BillboardGui.Parent = Tree.Trunk

        BillboardGui.Name = "ThunderFX"

        BillboardGui.AlwaysOnTop = true

        BillboardGui.Size = UDim2.new(0, 15, 0, 15)

        BillboardGui.ExtentsOffset = Vector3.new(0, 0, 0)

        BillboardGui.Adornee = Tree.Trunk

        TextLabel.Parent = BillboardGui

        TextLabel.Text = "Thunderstruck Tree"

        TextLabel.TextSize = 12

        TextLabel.BackgroundTransparency = 1

        TextLabel.Size = UDim2.new(1, 0, 1, 0)

        TextLabel.TextColor3 = Color3.fromRGB(66, 211, 255)



        coroutine.wrap(function()

            while wait(1) do

                local ParticleEmiters = {}

                for i,v in next, Tree:GetDescendants() do

                    if v:IsA("ParticleEmitter") and v.Enabled == true and (v.Texture:match("%d+") == "4666023777" or v.Texture:match("%d+") == "4666276725" or v.Texture:match("%d+") == "4592483396") then

                        table.insert(ParticleEmiters, v)

                    end

                end

                if #ParticleEmiters == 0 or Tree.Parent == nil or not Settings.LightningTree_ESP then

                    BillboardGui:Destroy()

                end

            end

        end)()

    end

end



function CheckForTree(Obj)

    for i,v in next, Obj:GetDescendants() do

        if v:IsA("ParticleEmitter") and v.Enabled == true and (v.Texture:match("%d+") == "4666023777" or v.Texture:match("%d+") == "4666276725" or v.Texture:match("%d+") == "4592483396") then

            ESP_ThunderstruckTree(Obj)

        end

    end

end



function UpdateLTEsp()

    if Settings.LightningTree_ESP then

		for i, v in next, workspace["WORKSPACE_Geometry"]:GetDescendants() do

			if v.Name == "Trunk" then

				CheckForTree(v)

			end

		end

	else

		for i, v in next, workspace["WORKSPACE_Geometry"]:GetDescendants() do

			if v.Name == "ThunderFX" then

				v:Destroy()

			end

		end

	end

end



function UpdateEsp()

    ESPLibrary.Players = Settings.ESP.Enabled or false

    ESPLibrary.Boxes = Settings.ESP.Boxes or false

    ESPLibrary.Tracers = Settings.ESP.Tracers or false

    if not Settings.ESP.Team then

        ESPLibrary.Color = Settings.ESP.Color or Color3.fromRGB(255, 255, 255)

    end

    ESPLibrary.Names = Settings.ESP.ND or false

    ESPLibrary.Team = Settings.ESP.Team or false

    ESPLibrary.TeamMates = Settings.ESP.TeamMates or false

end



function GetName()

    local Success, Response = pcall(function()

        return Players:GetNameFromUserIdAsync(math.random(1, 1000000))

    end)

    if not Success then

        return GetName()

    end

    return Response

end



function SaveSettings()

    writefile("ThisStuff_2317712696.json", JSON:Encode(Settings))

end



function CopyDiscordInvite()

    setclipboard(game:HttpGet("https://thisstuff.xyz/rawdiscord.txt"))

	ClientNetwork.UIHandler:GiveNotification({

		text = "Discord invite link has been copied to your clipboard",

		textcolor = "Green",

		center = false

	});

end



function RejoinServer()

    ClientNetwork.UIHandler:GiveNotification({

		text = "Rejoining server...",

		textcolor = "Green",

		center = false

	});

    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)

end



function NoJumpCooldown()

    for i,v in next, getprotos(ClientNetwork.PlayerCharacter.OnCharacterAdded) do

        if table.find(getconstants(v), "Jumping")  then

            if Settings.NoJumpCooldown ~= true then

                v = Core["OnCharacterAdded-JumpCooldown"]

            else

                function JumpFunction()

                    ClientNetwork.PlayerCharacter:LowerStamina(20)

                    return 0

                end

                setconstant(v, 4, JumpFunction)

            end

        end

    end

end



function NoRecoil()

    for i, v in next, Core["Weapons"] do

        v.BaseRecoil = not Settings.NoRecoil and Core["WeaponsStorage"][i].BaseRecoil or 0

    end

end



function NoSpread()

    for i, v in next, Core["Weapons"] do

        v.FanAccuracy = not Settings.NoSpread and Core["WeaponsStorage"][i].FanAccuracy or 1

        v.ProjectileAccuracy = not Settings.NoSpread and Core["WeaponsStorage"][i].ProjectileAccuracy or 1

    end

end



function Wallbang()

    for i, v in next, Core["Weapons"] do

        v.ProjectilePenetration = not Settings.Wallbang and Core["WeaponsStorage"][i].ProjectilePenetration or 500

    end

end



function InstantReload()

    for i, v in next, Core["Weapons"] do

        v.ReloadSpeed = not Settings.InstantReload and Core["WeaponsStorage"][i].ReloadSpeed or 1000

        v.LoadSpeed = not Settings.InstantReload and Core["WeaponsStorage"][i].LoadSpeed or 1000

        v.LoadEndSpeed = not Settings.InstantReload and Core["WeaponsStorage"][i].LoadEndSpeed or 1000

    end

end



function TableConvert(Table, String)

    local Previous = Table

    local Last = nil



    for i,v in next, string.split(String, "_") do

        Previous = Last and Previous[Last] or Previous

        Last = v

    end

    

    return Last, Previous

end



local function AnimalESP(Animal)

    Animal:WaitForChild("Health", 30)



    if not Animal:FindFirstChild("Health") then

        return;

    end



    if Core.HealthValues[Animal.Name] and Animal.Health.Value > Core.HealthValues[Animal.Name] then

        ESPLibrary:Add(Animal, {

            PrimaryPart = Animal:FindFirstChild("HumanoidRootPart"),

            Color = Settings.LegendaryAnimalESPColor or Color3.fromRGB(162, 0, 255),

            Name = ("Legendary %s"):format(Animal.Name),

            IsEnabled = "LegendaryAnimal"

        })



        return;

    end

    

    ESPLibrary:Add(Animal, {

        PrimaryPart = Animal:FindFirstChild("HumanoidRootPart"),

        Color = Settings.AnimalESPColor or Color3.fromRGB(0, 255, 255),

        Name = Animal.Name,

        IsEnabled = "Animal"

    })

end



ClientNetwork.GunItem.CanShoot = function(t)

    if Settings.NoDelay and t.Ammo > 0 then

        return true

    end

    

    return Core["CanShoot"](t)

end



Core["IsFirstPerson"] = hookfunction(ClientNetwork.Camera.IsFirstPerson, function(...)

    if Settings.SilentAim and rawget(getfenv(0), "script").Name ~= "Camera" and rawget(getfenv(0), "script").Name ~= "GameEvents" then

        return true

    end

    

    return Core["IsFirstPerson"](...)

end)



Core["GetMouseHit"] = hookfunction(ClientNetwork.Utils.GetMouseHit, function(...)

    if Settings.SilentAim then

        local Closest = Utils.GetClosest()



        if Closest then

            return Closest.Target.Position + Closest.Character.HumanoidRootPart.Velocity;

        end

    end



    return Core["GetMouseHit"](...)

end)



Core["Animal-Mount"] = hookfunction(ClientNetwork.Animal.Mount, function(...)

    if Settings.InfiniteBoosts then

        Core["Animal-Mount"](...)

        wait()



        local RidingAnimal = ClientNetwork.AnimalRiding.GetRidingAnimal()

        RidingAnimal.MaxBoosts = math.huge

        RidingAnimal.Boosts = math.huge



        return;

    end

    return Core["Animal-Mount"](...)

end)



Core["Rain-Enable"] = hookfunction(ClientNetwork.Rain.Enable, function()

    if Settings.NoRain then

        return;

    end

    return Core["Rain-Enable"]()

end)



ClientNetwork.PlayerCharacter.LowerStamina = function(k, Value)

    if Settings.InfiniteStamina then

        return;

    end

    ClientNetwork.Network:FireServer("LowerStamina", Value)

end



Core["Ragdoll"] = hookfunction(ClientNetwork.PlayerCharacter.Ragdoll, function(...)

    if Settings.AntiRagdoll then

        return;

    end

    return Core["Ragdoll"](...)

end)



Core["EnterRagdoll"] = hookfunction(ClientNetwork.Ragdolls.EnterRagdoll, function(...)

    if Settings.AutoGetUp then

        coroutine.resume(coroutine.create(function()

            local Start = tick()

            repeat

                wait(0)

            until ClientNetwork.PlayerCharacter:CanGetUp() or Start - tick() > 2

            if ClientNetwork.PlayerCharacter.IsRagdolledSelf then

                ClientNetwork.PlayerCharacter:GetUp()

            end

        end))

    end

    if Settings.InstantBreakFree then

        coroutine.resume(coroutine.create(function()

            local Start = tick()

            repeat

                wait(0)

            until ClientNetwork.PlayerCharacter:CanBreakFree() or Start - tick() > 4

            ClientNetwork.PlayerCharacter.BreakFreePerc = 5

        end))

    end

    return Core["EnterRagdoll"](...)

end)



Core["InitProjectiles"] = hookfunction(ClientNetwork.ProjectileHandler.InitProjectiles, function(c, Value, Data, Other, Callback)

    if Settings.NoSpread then

        Other.accuracy = Random.new():NextNumber(0.9, 1)

    end



    return Core["InitProjectiles"](c, Value, Data, Other, Callback)

end)



ClientNetwork.ProjectileHandler.GetHorseBackAccMod = function(...)

    if Settings.NoSpread then

        return 1.3

    end



    return Core["GetHorseBackAccMod"](...)

end



ClientNetwork.Animal.Ragdoll = function(...)

    if Settings.AntiAnimalRagdoll then

        return;

    end

    return Core["Animal-Ragdoll"](...)

end



ClientNetwork.PlayerCharacter.StopRoll = function(Table, ...)

    if Settings.NoRollCooldown then

        Table.RollDirection = nil

        Table.RollDebounce = false

    end

    return Core["StopRoll"](Table, ...)

end



ClientNetwork.PlayerCharacter.CanRoll = function(...)

    if Settings.NoRollCooldown then

        return true;

    end

    return Core["CanRoll"](...)

end



ClientNetwork.Network.FireServer = function(Network, Name, ...)

    local Arguments = {...}

    if Name == "DamageSelf" and Settings.NoFallDamage then

        return;

    end

    return Core["FireServer"](Network, Name, unpack(Arguments))

end



--[[





TEST





]]



local old = ClientNetwork.LassoItem.Update

ClientNetwork.LassoItem.Update = function(a, b)

    if Settings.Aimbot.Lasso then

        local Closest = Utils.GetClosest()



        if Closest and a.IsThrowingLasso then

            a.LassoCircle.CFrame = CFrame.new(Closest.Target.Position + Closest.Character.HumanoidRootPart.Velocity)

        end

    end

    

    return old(a, b)

end





--[[





TEST





]]



--//



Client["NoDelay"] = {GunCheats:AddSwitch("No Delay", function(Value)

    Settings.NoDelay = Value

end), "NoDelay", "No Delay"}



Client["NoRecoil"] = {GunCheats:AddSwitch("No Recoil", function(Value)

    Settings.NoRecoil = Value

    NoRecoil()

end), "NoRecoil", "No Recoil"}



Client["NoSpread"] = {GunCheats:AddSwitch("No Spread", function(Value)

    Settings.NoSpread = Value

    NoSpread()

end), "NoSpread", "No Spread"}



Client["Wallbang"] = {GunCheats:AddSwitch("Wallbang", function(Value)

    Settings.Wallbang = Value

    Wallbang()

end), "Wallbang", "Wallbang"}



Client["InstantReload"] = {GunCheats:AddSwitch("Instant Reload", function(Value)

    Settings.InstantReload = Value

    InstantReload()

end), "InstantReload", "Instant Reload"}



-->>



Client["InfiniteStamina"] = {CharacterCheats:AddSwitch("Infinite Stamina", function(Value)

    Settings.InfiniteStamina = Value

end), "InfiniteStamina", "Infinite Stamina"}



Client["NoFallDamage"] = {CharacterCheats:AddSwitch("No Fall Damage", function(Value)

    Settings.NoFallDamage = Value

end), "NoFallDamage", "No Fall Damage"}



Client["NoRollCooldown"] = {CharacterCheats:AddSwitch("No Roll Cooldown", function(Value)

    Settings.NoRollCooldown = Value

end), "NoRollCooldown", "No Roll Cooldown"}



Client["NoJumpCooldown"] = {CharacterCheats:AddSwitch("No Jump Cooldown", function(Value)

    Settings.NoJumpCooldown = Value

    NoJumpCooldown()

end), "NoJumpCooldown", "No Jump Cooldown"}



Client["AntiRagdoll"] = {CharacterCheats:AddSwitch("Anti Ragdoll", function(Value)

    Settings.AntiRagdoll = Value

end), "AntiRagdoll", "Anti Ragdoll"}



Client["AutoGetUp"] = {CharacterCheats:AddSwitch("Auto Get Up", function(Value)

    Settings.AutoGetUp = Value

end), "AutoGetUp", "Auto Get Up"}



Client["InstantBreakFree"] = {CharacterCheats:AddSwitch("Instant Break Free", function(Value)

    Settings.InstantBreakFree = Value

    wait()

    if Settings.InstantBreakFree then

        PlayerCharacter.BreakFreePerc = 5

    end

end), "InstantBreakFree", "Instant Break Free"}



if getconnections then

    Client["TPInvisible"] = {CharacterCheats:AddSwitch("Teleport Bypass/Invisible (Client Sided)", function(Value)

        Settings.TPInvisible = Value

        if Value then

            getconnections(ReplicatedStorage.Communication.Events.ACTrigger.OnClientEvent)[1]:Disable()

            return;

        end

        

        getconnections(ReplicatedStorage.Communication.Events.ACTrigger.OnClientEvent)[1]:Enable()

    end), "TPInvisible", "Teleport Bypass/Invisible (Client Sided)"}

end



Client["RainbowHair"] = {CharacterCheats:AddSwitch("Rainbow Hair", function(Value)

    Settings.RainbowHair = Value



    if Settings.RainbowHair ~= true then

        return;

    end



    coroutine.wrap(function()

        repeat

            wait()

            if not Core["CurrentHair"] then

                for i, v in next, LocalPlayer.Character:GetChildren() do

                    if v:IsA("Accessory") and string.find(v.Name, "Hair") then

                        Core["CurrentHair"] = v

                    end

                end

            end

            local hue = tick() % 12 / 12

            ClientNetwork.Network:FireServer("SetAppearanceItemColor", "Hair", Core["CurrentHair"].Name, Color3.fromHSV(hue, 1, 1))

        until Settings.RainbowHair ~= true

    end)()

end), "RainbowHair", "Rainbow Hair"}



Client["RainbowBeard"] = {CharacterCheats:AddSwitch("Rainbow Beard", function(Value)

    Settings.RainbowBeard = Value



    if Settings.RainbowBeard ~= true then

        return;

    end



    coroutine.wrap(function()

        repeat

            wait()

            if not Core["CurrentBeard"] then

                for i, v in next, LocalPlayer.Character:GetChildren() do

                    if v:IsA("Accessory") and string.find(v.Name, "Beard") then

                        Core["CurrentBeard"] = v

                    end

                end

            end

            local hue = tick() % 12 / 12

            ClientNetwork.Network:FireServer("SetAppearanceItemColor", "Beards", Core["CurrentBeard"].Name, Color3.fromHSV(hue, 1, 1))

        until Settings.RainbowHair ~= true

    end)()

end), "RainbowBeard", "Rainbow Beard"}



-->> 



Client["InfiniteBoosts"] = {AnimalCheats:AddSwitch("Infinite Boosts", function(Value)

    Settings.InfiniteBoosts = Value

    if Settings.InfiniteBoosts then

        local RidingAnimal = ClientNetwork.AnimalRiding.GetRidingAnimal()

        RidingAnimal.MaxBoosts = math.huge

        RidingAnimal.Boosts = math.huge

    else

        local RidingAnimal = ClientNetwork.AnimalRiding.GetRidingAnimal()

        RidingAnimal.MaxBoosts = Core["AnimalRiding"].MaxBoosts

        RidingAnimal.Boosts = Core["AnimalRiding"].MaxBoosts

    end

end), "InfiniteBoosts", "Infinite Boosts"}



Client["AntiAnimalRagdoll"] = {AnimalCheats:AddSwitch("Anti Ragdoll", function(Value)

    Settings.AntiAnimalRagdoll = Value

end), "AntiAnimalRagdoll", "Anti Ragdoll"}



-->>



Client["LightningTree_ESP"] = {ESP:AddSwitch("Thunderstruck Tree ESP", function(Value)

    Settings.LightningTree_ESP = Value

    UpdateLTEsp()

end), "LightningTree_ESP", "Thunderstruck Tree ESP"}



Client["LegendaryAnimalESP"] = {ESP:AddSwitch("Legendary Animal ESP", function(Value)

    Settings.LegendaryAnimalESP = Value

    ESPLibrary.LegendaryAnimal = Value

end), "LegendaryAnimalESP", "Legendary Animal ESP"}



Client["AnimalESP"] = {ESP:AddSwitch("Animal ESP", function(Value)

    Settings.AnimalESP = Value

    ESPLibrary.Animal = Value

end), "AnimalESP", "AnimalESP"}



Client["ESP_Enabled"] = {ESP:AddSwitch("Player ESP", function(Value)

    Settings.ESP.Enabled = Value

    UpdateEsp()

end), "ESP_Enabled", "Player ESP"}



Client["ESP_Boxes"] = {ESP:AddSwitch("Boxes", function(Value)

    Settings.ESP.Boxes = Value

    UpdateEsp()

end), "ESP_Boxes", "Boxes"}



Client["ESP_Tracers"] = {ESP:AddSwitch("Tracers", function(Value)

    Settings.ESP.Tracers = Value

    UpdateEsp()

end), "ESP_Tracers", "Tracers"}



Client["ESP_TeamMates"] = {ESP:AddSwitch("Show Team Mates", function(Value)

    Settings.ESP.TeamMates = Value

    UpdateEsp()

end), "ESP_TeamMates", "Show Team Mates"}



Client["ESP_Team"] = {ESP:AddSwitch("Use Team Color", function(Value)

    Settings.ESP.Team = Value

    UpdateEsp()

end), "ESP_Team", "Use Team Color"}



Client["ESP_ND"] = {ESP:AddSwitch("Show Name/Distance", function(Value)

    Settings.ESP.ND = Value

    UpdateEsp()

end), "ESP_ND", "Show Name/Distance"}



Client["AnimalESPColor"] = ESP:AddColorPicker("Animal ESP Color", function(Value)

    Settings.AnimalESPColor = Value

end)



Client["LegendaryAnimalESPColor"] = ESP:AddColorPicker("Legendary Animal ESP Color", function(Value)

    Settings.LegendaryAnimalESPColor = Value

end)



-->>



Client["SilentAim"] = {Aimbot:AddSwitch("Silent Aim", function(Value)

    Settings.SilentAim = Value

end), "SilentAim", "Silent Aim"}



Client["Aimbot_TeamCheck"] = {Aimbot:AddSwitch("Team Check", function(Value)

    Settings.Aimbot.TeamCheck = Value

end), "Aimbot_TeamCheck", "Team Check"}



Client["Aimbot_DominateOnly"] = {Aimbot:AddSwitch("Headshot Only", function(Value)

    Settings.Aimbot.DominateOnly = Value

end), "Aimbot_DominateOnly", "Headshot Only"}



Client["Aimbot_VisibilityCheck"] = {Aimbot:AddSwitch("Visibility Check", function(Value)

    Settings.Aimbot.VisibilityCheck = Value

end), "Aimbot_VisibilityCheck", "Visibility Check"}



Client["Aimbot_CheckWorldDistance"] = {Aimbot:AddSwitch("Check Distance of Player", function(Value)

    Settings.Aimbot.CheckWorldDistance = Value

end), "Aimbot_CheckWorldDistance", "Check Distance of Player"}



if Exploit == "Synapse" then

    Client["Aimbot_Visible"] = {Aimbot:AddSwitch("Show Circle", function(Value)

        Settings.Aimbot.Visible = Value

        Client.Other.Aimbot()

    end), "Aimbot_Visible", "Show Circle"}



    Client["Aimbot_Filled"] = {Aimbot:AddSwitch("Circle Filled", function(Value)

        Settings.Aimbot.Filled = Value

        Client.Other.Aimbot()

    end), "Aimbot_Filled", "Circle Filled"}



    Client["Aimbot_Transparency"] = Aimbot:AddSlider("Circle Transparency", function(Value)

        Settings.Aimbot.Transparency = Value

        Client.Other.Aimbot()

    end, {

        ["min"] = 0,

        ["max"] = 1,

        ["decimals"] = true

    })



    Client["Aimbot_NumSides"] = Aimbot:AddSlider("Number of Sides", function(Value)

        Settings.Aimbot.NumSides = Value

        Client.Other.Aimbot()

   end, {

        ["min"] = 2,

        ["max"] = 300,

    })



    Client["Aimbot_Radius"] = Aimbot:AddSlider("FOV Radius", function(Value)

        Settings.Aimbot.Radius = Value

        Client.Other.Aimbot()

    end, {

        ["min"] = 10,

        ["max"] = 900,

    })



    Aimbot:AddLabel("Circle Color")



    Client["Aimbot_Color"] = Aimbot:AddColorPicker(function(Value)

        Settings.Aimbot.Color = Value

        Client.Other.Aimbot()

    end)

else

    Settings.Aimbot.Radius = 1000

end



-->>



Client["Fullbright"] = {Miscellaneous:AddSwitch("Fullbright", function(Value)

    Settings.Fullbright = Value

    if Settings.Fullbright ~= true then

        game:GetService("Lighting").Ambient = Core.Ambient

        wait(0.2)

        game:GetService("Lighting").Ambient = Core.Ambient

    end

end), "Fullbright", "Fullbright"}



Client["NoRain"] = {Miscellaneous:AddSwitch("No Rain", function(Value)

    Settings.NoRain = Value

    ClientNetwork.Rain:Disable()

end), "NoRain", "No Rain"}



Client["NameProtect"] = {Miscellaneous:AddSwitch("Name Protect", function(Value)

    Settings.NameProtect = Value

    if Settings.NameProtect then

        local Name = GetName()

        ClientNetwork.Network:FireServer("SetDisplayName", Name)

    else

        ClientNetwork.Network:FireServer("SetDisplayName", "")

    end

end), "NameProtect", "Name Protect"}



Client["TumbleweedMayhem"] = {Miscellaneous:AddSwitch("Tumbleweed Mayhem (Client Sided)", function(Value)

    Settings.TumbleweedMayhem = Value

    if Settings.TumbleweedMayhem ~= true then

        return;

    end

    repeat

        wait(0.5)

        ClientNetwork.Tumbleweeds:Trigger()

    until not Settings.TumbleweedMayhem

end), "TumbleweedMayhem", "Tumbleweed Mayhem"}



Miscellaneous:AddButton("Launch Starter Fireworks (Client Sided)", LaunchStartFireworks)



Miscellaneous:AddButton("Break All Glass (You might get banned)", BreakAllGlass)



Miscellaneous:AddButton("Kill Self", KillSelf)



Miscellaneous:AddButton("Ragdoll Self", RagdollSelf)



-->>



Client["Keybinds"]["BreakAllGlass"] = Keybinds:AddKeybind("Break All Glass", function(Keybind)

    Settings.Keybinds.BreakAllGlass = Keybind

    BreakAllGlass()

end, {standard = nil})



Client["Keybinds"]["KillSelf"] = Keybinds:AddKeybind("Kill Self", function(Keybind)

    Settings.Keybinds.KillSelf = Keybind

    KillSelf()

end, {standard = nil})



Client["Keybinds"]["RagdollSelf"] = Keybinds:AddKeybind("Ragdoll Self", function(Keybind)

    Settings.Keybinds.RagdollSelf = Keybind

    RagdollSelf()

end, {standard = nil})



for i,v in next, Client do

    if type(v) == "table" and type(v[1]) == "table" and v[1].Set and type(v[2]) == "string" then

        pcall(function()

            Client["Keybinds"][i] = Keybinds:AddKeybind(v[3], function(Keybind)

                local Index, Setting = TableConvert(Settings, v[2])

                Settings.Keybinds[Index] = Keybind

                v[1]:Set(not Setting[Index])

            end)

        end)

    end

end



-->>



Client["AutoSave"] = SettingsT:AddSwitch("Auto Save", function(Value)

    Settings.AutoSave = Value

end)



SettingsT:AddButton("Save Settings", SaveSettings)



SettingsT:AddButton("Copy Discord Invite", CopyDiscordInvite)



SettingsT:AddButton("Rejoin Server", function()

    ClientNetwork.ConfirmPrompt:Open(RejoinServer, "Are you sure you want to rejoin?")

end)



SettingsT:AddLabel("You can find more scripts at https://thisstuff.xyz/features.html")



--//



Client["AnimalESPColor"]:Set(Settings.AnimalESPColor or Color3.fromRGB(0, 255, 255))

Client["LegendaryAnimalESPColor"]:Set(Settings.LegendaryAnimalESPColor or Color3.fromRGB(162, 0, 255))



for i,v in next, Client do

    if type(v) == "table" then

        if type(v[1]) == "table" and type(v[2]) == "string" then

            local Index, Setting = TableConvert(Settings, v[2])

            if v[1].Set then

                v[1]:Set(Setting[Index] and Setting[Index] or false)

            elseif v[1].SetKeybind then

                v[1]:SetKeybind(Setting[Index] or nil)

            end

        elseif v.Set and v.type == "Slider" then

            local Index, Setting = TableConvert(Settings, i)

            v:Set(Setting[Index] and Setting[Index] or 0)

        elseif v.Set then

            local Index, Setting = TableConvert(Settings, i)

            v:Set(Setting[Index] and Setting[Index] or false)

        end

    end

end



--//



coroutine.wrap(function()

	while wait(10) do

        if Settings.AutoSave then

		    SaveSettings()

        end

        if Settings.NameProtect then

            local Name = GetName()

            ClientNetwork.Network:FireServer("SetDisplayName", Name)

        end

	end

end)()



Players.PlayerAdded:Connect(function(Player)

    Player.CharacterAdded:Connect(function()

        CharAdded(Player)

    end)

end)



for i, v in next, workspace["WORKSPACE_Geometry"]:GetDescendants() do

    if v.Name == "Trees" then

        v.ChildAdded:Connect(function(Obj)

            Obj.DescendantAdded:Connect(function()

                CheckForTree(Obj)

            end)



            CheckForTree(Obj)

        end)

    end

end



for i,v in next, workspace["WORKSPACE_Entities"].Animals:GetChildren() do

    AnimalESP(v)

end



workspace["WORKSPACE_Entities"].Animals.ChildAdded:Connect(function(Animal)

    AnimalESP(Animal)

end)



for i,v in next, Players:GetPlayers() do

    --coroutine.wrap(function()

        v.CharacterAdded:Connect(function()

            CharAdded(v)

        end)

        if v.Character then

            CharAdded(v)

        end

    --end)()

end





UpdateLTEsp()



game:GetService("RunService").RenderStepped:Connect(function()

    if Settings.Aimbot.Visible then

        Client.Other.AimbotCircle.Position = Vector2.new(Mouse.X, Mouse.Y + GuiService:GetGuiInset().Y)

    end

    if Settings.Fullbright then

        game:GetService("Lighting").Ambient = Color3.fromRGB(255, 255, 255)

    end

end)



--//



if Settings.Bang then

    SpinMeRightRound()

end



--//



ESPLibrary:Toggle(true)



getgenv().TSLoaded = true



ClientNetwork.UIHandler:GiveNotification({

	text = "Created by NoTwistedHere",

	textcolor = "Gold",

	center = true

});

wait(0.5)

ClientNetwork.UIHandler:GiveNotification({

	text = "Report any bugs to me",

	textcolor = "Red",

	center = true

});



wait(0.1)



LaunchStartFireworks()