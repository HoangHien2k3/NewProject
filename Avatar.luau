-- HoangHien_XScripts --
-- Avatar: ... --
local _Workspace, _Players
_Workspace = game:GetService("Workspace")
_Players = game:GetService("Players")

local _Player, _CurrentOutfits, _Id
_Player = _Players.LocalPlayer
_CurrentOutfits, _Id = {
    ["Shirt"] = function()
        return _Player.Character and _Player.Character:FindFirstChild("Shirt")
    end,
    ["Pants"] = function()
        return _Player.Character and _Player.Character:FindFirstChild("Pants")
    end
}, {
    ["Shirt"] = {"http://www.roblox.com/asset/?id=14658350086"},
    ["Pants"] = {"http://www.roblox.com/asset/?id=7359562576"}
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

function _Avatar(...)
    local _a = {...}
    _Player:ClearCharacterAppearance()
    task.wait(_a[1])
    _ClassicOutfitChange("Shirt", 1)
    _ClassicOutfitChange("Pants", 2)
end

_Avatar(0.1)
