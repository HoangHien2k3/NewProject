-- HoangHien_XScripts --
-- Avatar: ... --
local _Workspace, _Players
_Workspace = game:GetService("Workspace")
_Players = game:GetService("Players")

local _Player, _Animation, _CurrentOutfits, _Id, _Stuff
_Player = _Players.LocalPlayer
_Animation = _Player.Character.Animate
_CurrentOutfits, _Id, _Stuff = {
    ["Shirt"] = function()
        return _Player.Character and _Player.Character:FindFirstChild("Shirt")
    end,
    ["Pants"] = function()
        return _Player.Character and _Player.Character:FindFirstChild("Pants")
    end
}, {
    ["Shirt"] = {"http://www.roblox.com/asset/?id=14658350086"},
    ["Pants"] = {"http://www.roblox.com/asset/?id=7359562576"},
    ["Type"] = {"http://www.roblox.com/asset/?id=", "rbxassetid://"}
}, {
    ["Fluffy Ears"] = {
        ["Head"] = {
            ["MeshId"] = {"rbxassetid://17618202202"},
            ["TextureId"] = {"rbxassetid://17411092404"},
            ["CF_1"] = {CFrame.new(0, -0.5, 0)},
            ["CF_2"] = {CFrame.Angles(0, 0, 0)},
            ["V3"] = {Vector3.new(0.6, 0.6, 0.6)}
        }
    }
}

function _ClassicOutfitInstance(_item, _name, _id, _type)
    local _s = Instance.new(_item, _Player.Character)
    _s.Name = _name
    if _type == "Shirt" then
        _s.ShirtTemplate = _id
    elseif _type == "Pants" then
        _s.PantsTemplate = _id
    end
end

function _ClassicOutfitChange(_type, _num)
    if _CurrentOutfits[_type]() ~= nil then
        if _type == "Shirt" then
            _CurrentOutfits[_type]().ShirtTemplate = _Id[_type][_num]
        elseif _type == "Pants" then
            _CurrentOutfits[_type]().PantsTemplate = _Id[_type][_num]
        end
    else
        _ClassicOutfitInstance(_type, _type, _Id[_type][_num], _type)
    end
end

function _PartInstance(_name, pr, _body, _MeshId, _TextureId, cf, cfa, v3)
    local p, w, s
    p = Instance.new("Part", pr)
    w = Instance.new("Weld", pr)
    s = Instance.new("SpecialMesh", p)
    -- Properties[1] --
    p.Transparency = 0
    p.Anchored = false
    p.CanCollide = false
    p.Size = Vector3.new(1, 1, 1)
    p.Color = Color3.new(0, 0, 0)
    p.Name = _name
    w.C1 = cf * cfa
    w.Part0 = pr[_body]
    w.Part1 = p
    s.MeshId = _MeshId
    s.TextureId = _TextureId
    s.Scale = v3
end

function _BasedInTable(_table)
    for a, b in pairs(_table) do
        for c, d in pairs(b) do
            if type(d) == "table" then
                _PartInstance(a, _Player.Character, c, d["MeshId"][1], d["TextureId"][1], d["CF_1"][1], d["CF_2"][1], d["V3"][1])
            end
        end
    end
end

function _ChangedAnimations(...)
    local _x = {...}
    _Animation = _Player.Character.Animate
    _Animation.idle.Animation1.AnimationId = _Id["Type"][1] .. _x[1]
    _Animation.idle.Animation2.AnimationId = _Id["Type"][1] .. _x[2]
    _Animation.walk.WalkAnim.AnimationId = _Id["Type"][1] .. _x[3]
    _Animation.run.RunAnim.AnimationId = _Id["Type"][1] .. _x[4]
    _Animation.jump.JumpAnim.AnimationId = _Id["Type"][1] .. _x[5]
    _Animation.climb.ClimbAnim.AnimationId = _Id["Type"][1] .. _x[6]
    _Animation.fall.FallAnim.AnimationId = _Id["Type"][1] .. _x[7]
    --_Animation.swim.SwimAnim.AnimationId = _Id["Type"][1] .. _x[8]
    if _Player.Character.Humanoid.Sit == true then
        _Player.Character.Humanoid.Jump = true
    else
        _Player.Character.Humanoid.Jump = false
    end
end

function _Avatar(...)
    local _a = {...}
    _Player:ClearCharacterAppearance()
    task.wait(_a[1])
    _ClassicOutfitChange("Shirt", 1)
    _ClassicOutfitChange("Pants", 1)
    --_PartInstance()
    _BasedInTable(_Stuff)
    --_ChangedAnimations()
end

_Avatar(0.1)
