-- Minecraft Btools --
function _Main()
    local _Ws, _Plrs, _StG, _CG
    _Ws = game:GetService("Workspace")
    _Plrs = game:GetService("Players")
    _StG = game:GetService("StarterGui")
    _CG = game:GetService("CoreGui")
    
    local _Fr, _SrG, _SrF
    _SrG = Instance.new("ScreenGui", _CG)
    _Fr = Instance.new("Frame", _SrG)
    _SrF = Instance.new("ScrollingFrame", _Fr)
    
    local _CurrentVersion = 0.042
    local _RightPos, _BelowPos, _ButtonSize, _CanvasSize
    _RightPos = 0.02
    _BelowPos = 0.002
    _ButtonSize = 0.5
    _CanvasSize = 0
    
    local _plr, _mouse, _logss, _logerr, _NamedCubes
    _plr = _Plrs.LocalPlayer
    _mouse = _plr:GetMouse()
    
    _logss, _logerr = {}, {}
    _NamedCubes = {}
    _G._HHxScript_Storage_BlockId = _G._HHxScript_Storage_BlockId or {
        ["Grass"] = {
            ["_Grass_Block"] = {
                ["Top"] = {9267183930},
                ["Bottom"] = {9267089500},
                ["Side"] = {9267155972},
                ["PlacingSFX"] = {137280066138423},
                ["SeeThrough"] = {0},
                ["SideFacing"] = {0},
                ["HasVariants"] = {
                    ["Status"] = {1},
                    ["Name"] = {"_Grass_Normal"}
                },
                ["Color"] = {Color3.fromRGB(150, 70, 0)}
            }
        },
        ["Wood"] = {
            ["_Wood_Block"] = {
                ["Top"] = {9359130096},
                ["Bottom"] = {9359130096},
                ["Side"] = {9359131807},
                ["PlacingSFX"] = {8394333801},
                ["SeeThrough"] = {0},
                ["SideFacing"] = {0},
                ["HasVariants"] = {
                    ["Status"] = {0},
                    ["Name"] = {""}
                },
                ["Color"] = {Color3.fromRGB(97, 86, 51)}
            }
        },
        ["Plank"] = {
            ["_Wooden_Plank"] = {
                ["Top"] = {8676581022},
                ["Bottom"] = {8676581022},
                ["Side"] = {8676581022},
                ["PlacingSFX"] = {8394333801},
                ["SeeThrough"] = {0},
                ["SideFacing"] = {0},
                ["HasVariants"] = {
                    ["Status"] = {0},
                    ["Name"] = {""}
                },
                ["Color"] = {Color3.fromRGB(189, 173, 125)}
            }
        },
        ["Stone"] = {
            ["_Stone_Block"] = {
                ["Top"] = {8676746437},
                ["Bottom"] = {8676746437},
                ["Side"] = {8676746437},
                ["PlacingSFX"] = {111115402685183},
                ["SeeThrough"] = {0},
                ["SideFacing"] = {0},
                ["HasVariants"] = {
                    ["Status"] = {0},
                    ["Name"] = {""}
                },
                ["Color"] = {Color3.fromRGB(122, 122, 120)}
            }
        },
        ["I forgot what it's named"] = {
            ["_Forgotten_One"] = {
                ["Top"] = {8139086777},
                ["Bottom"] = {8139086777},
                ["Side"] = {8139086777},
                ["PlacingSFX"] = {111115402685183},
                ["SeeThrough"] = {0},
                ["SideFacing"] = {0},
                ["HasVariants"] = {
                    ["Status"] = {0},
                    ["Name"] = {""}
                },
                ["Color"] = {Color3.fromRGB(122, 122, 120)}
            }
        },
        ["Glass"] = {
            ["_Glass_Block"] = {
                ["Top"] = {11384458772},
                ["Bottom"] = {11384458772},
                ["Side"] = {11384458772},
                ["PlacingSFX"] = {9114603669},
                ["SeeThrough"] = {0.99},
                ["SideFacing"] = {0},
                ["HasVariants"] = {
                    ["Status"] = {0},
                    ["Name"] = {""}
                },
                ["Color"] = {Color3.fromRGB(255, 255, 255)}
            }
        }
    }
    
    local _IsOkay, _IsExist1, _CustomSize
    _IsOkay = true
    _CustomSize = 5
    
    local success, result = pcall(function() return printconsole end)
    _IsExist1 = success and typeof(result) == "function"
    
    _SrG.Name = "_MinecraftUI"
    
    _Fr.Name = "+DFrame"
    _Fr.BackgroundTransparency = 0.8
    _Fr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _Fr.Position = UDim2.new(0.25, 0, 0.25, 0)
    _Fr.Size = UDim2.new(0.2, 0, 0.25, 0)
    _Fr.Active = true
    _Fr.Draggable = true
    _Fr.Visible = true
    
    _SrF.Name = "+BSFrame"
    _SrF.BackgroundTransparency = 1
    _SrF.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _SrF.Position = UDim2.new(0.02, 0, 0.02, 0)
    _SrF.Size = UDim2.new(0.96, 0, 0.68, 0)
    _SrF.CanvasSize = UDim2.new(0, 0, 20, 0)
    _SrF.ScrollBarThickness = 0.1
    _SrF.Visible = true
    
    function _DP(_str)
        if _IsOkay or _IsOkay == true then
            if _IsExist1 or _IsExist1 == true then
                --printconsole(_str, 0, 255, 0)
                --_Notify(_str)
                print("[Important!, JK]: " .. _str)
            else
                print(_str)
            end
        end
    end
    
    function _MB1C(...)
        local _n = {...}
        _n[1].MouseButton1Click:Connect(function()
            local ss, err = pcall(function()
                _n[2]()
            end)
            if ss then
                table.insert(_logss, ss)
            else
                table.insert(_logerr, err)
            end
        end)
    end
    
    function _AddProperties(...)
        local Args = {...}
        if Args[3] == "UICorner" then
            local s = Instance.new("UICorner", Args[1])
            s.CornerRadius = UDim.new(Args[2], 0)
        elseif Args[3] == "UIAspectRatioConstraint" then
            local s = Instance.new("UIAspectRatioConstraint", Args[1])
            s.AspectRatio = Args[2]
        elseif Args[3] == "UIStroke" then
            local s = Instance.new("UIStroke", Args[1])
            s.Thickness = Args[2]
            s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            s.Color = Args[4]
        end
    end
    
    function _Notify(_str)
        _StG:SetCore("SendNotification", {
            Title = "[HoangHien-XScripts]",
            Text = _str,
            Duration = 1,
            Button1 = ">> OK <<",
            Callback = function()
                _DP(_str)
            end,
        })
    end
    
    function _CheckFolder()
        if not _Ws:FindFirstChild("_HHxScript_Storage") then
            local _Storage_1 = Instance.new("Folder", _Ws)
            _Storage_1.Name = "_HHxScript_Storage"
            _DP("[HHxScript-Debugging]: Not Exist... 1!")
            if not _Ws._HHxScript_Storage:FindFirstChild("_HHxScript_CubeStorage") then
                local _CubeStorage = Instance.new("Folder", _Ws._HHxScript_Storage)
                _CubeStorage.Name = "_HHxScript_CubeStorage"
                _DP("[HHxScript-Debugging]: Not Exist... 2!")
            else
                _DP("[HHxScript-Debugging]: Exist... 2!")
            end
        else
            _DP("[HHxScript-Debugging]: Exist... 1!")
        end
        
        if not _Ws._HHxScript_Storage:FindFirstChild("_HHxScript_Tools_Storage") then
            local _ToolStorage = Instance.new("Folder", _Ws._HHxScript_Storage)
            _ToolStorage.Name = "_HHxScript_Tools_Storage"
            _DP("[HHxScript-Debugging]: Not Exist... 3!")
        else
            _DP("[HHxScript-Debugging]: Exist... 3!")
        end
        
        if not _Ws._HHxScript_Storage:FindFirstChild("_HHxScript_SFX_Storage") then
            local _SoundStorage = Instance.new("Folder", _Ws._HHxScript_Storage)
            _SoundStorage.Name = "_HHxScript_SFX_Storage"
            _DP("[HHxScript-Debugging]: Not Exist... 4!")
        else
            _DP("[HHxScript-Debugging]: Exist... 4!")
        end
    end
    
    function _CreateStringValue(...)
        local Args = {...}
        local StringValue = Instance.new("StringValue", Args[1])
        StringValue.Name = Args[2]
        StringValue.Value = Args[3]
    end
    
    function _CreateDecal(...)
        local Args = {...}
        local Decal = Instance.new("Decal", Args[1])
        Decal.Face = Args[2]
        Decal.Texture = "rbxassetid://" .. Args[3]
    end
    
    function _CreateSound(...)
        local Args = {...}
        local Sound = Instance.new("Sound", Args[1])
        Sound.SoundId = "rbxassetid://" .. Args[2]
        Sound.Name = Args[3]
    end
    
    function _CreatePart(...)
        local Args = {...}
        local Part = Instance.new("Part", _Ws._HHxScript_Storage._HHxScript_CubeStorage)
        Part.Name = Args[1]
        Part.Anchored = true
        Part.CanCollide = Args[2]
        Part.Transparency = Args[3]
        Part.Color = Args[4]
        Part.Material = Args[5]
        Part.Position = Args[6]
        Part.Size = Vector3.new(_CustomSize, _CustomSize, _CustomSize)
        
        _CreateDecal(Part, Enum.NormalId.Top, Args[7])
        _CreateDecal(Part, Enum.NormalId.Bottom, Args[8])
        _CreateDecal(Part, Enum.NormalId.Front, Args[9])
        _CreateDecal(Part, Enum.NormalId.Back, Args[10])
        _CreateDecal(Part, Enum.NormalId.Left, Args[11])
        _CreateDecal(Part, Enum.NormalId.Right, Args[12])
        print("StringValue, Named: " .. Args[13])
        if typeof(Args[13]) == "string" then
            _CreateStringValue(Part, Args[13], "N/A")
        end
    end
    
    _CheckFolder()
    
    function _Requiresfunc(...)
        local Args = {...}
        local _t, _surface, _np
        _t = _mouse.Target
        _surface = _mouse.TargetSurface
        if not _t then
            return
        end
        
        if table.find(_NamedCubes, _t.Name) then
            local _p, _s, _os
            _p = _t.Position
            _s = _t.Size
            _os = Vector3.zero
            
            if _surface == Enum.NormalId.Top then
                _os = Vector3.new(0, _s.Y, 0)
            elseif _surface == Enum.NormalId.Bottom then
                _os = Vector3.new(0, -_s.Y, 0)
            elseif _surface == Enum.NormalId.Front then
                _os = Vector3.new(0, 0, -_s.Z)
            elseif _surface == Enum.NormalId.Back then
                _os = Vector3.new(0, 0, _s.Z)
            elseif _surface == Enum.NormalId.Left then
                _os = Vector3.new(-_s.X, 0, 0)
            elseif _surface == Enum.NormalId.Right then
                _os = Vector3.new(_s.X, 0, 0)
            end
            
            _np = _p + _os
        else
            _np = _mouse.Hit.p + Vector3.new(0, 2.5, 0)
        end
        
        Args[1]:Play()
        _np = Vector3.new(math.floor(_np.X + 0.5), math.floor(_np.Y + 0.5), math.floor(_np.Z + 0.5))
        _CreatePart(Args[2], true, Args[9], Args[10], Enum.Material.Plastic, _np, Args[3], Args[4], Args[5], Args[6], Args[7], Args[8], Args[11])
    end
    
    function _AddTool(...)
        local Args = {...}
        local _PlacingCubeTool = Instance.new("Tool", _plr.Backpack)
        _PlacingCubeTool.RequiresHandle = false
        _PlacingCubeTool.Name = Args[1]
        
        local _CloneTools = _PlacingCubeTool:Clone()
        if _Ws._HHxScript_Storage:FindFirstChild("_HHxScript_Tools_Storage") then
            _CloneTools.Parent = _Ws._HHxScript_Storage._HHxScript_Tools_Storage
            _DP("[Added Tool]: " .. Args[1] .. " to storage!")
        else
            _DP("[Unknown Err]: folder storage somehow does not exist!?")
        end
        
        _CreateSound(_Ws._HHxScript_Storage._HHxScript_SFX_Storage, Args[9], Args[1])
        local _CubeSFX = _Ws._HHxScript_Storage._HHxScript_SFX_Storage:FindFirstChild(Args[1])
        
        _PlacingCubeTool.Activated:Connect(function()
            _Requiresfunc(_CubeSFX, Args[2], Args[3], Args[4], Args[5], Args[6], Args[7], Args[8], Args[10], Args[11], Args[12])
        end)
    end
    
    function _PlusAddButtonIntoSCROLL(...)
        local Args = {...}
        local _btn = Instance.new("ImageButton", Args[1])
        _btn.Name = Args[2]
        _btn.Size = UDim2.new(0.2, 0, _ButtonSize, 0)
        _btn.Position = UDim2.new(_RightPos, 0, _BelowPos, 0)
        _btn.BackgroundTransparency = 1
        _btn.Image = "rbxassetid://" .. Args[3]
        _btn.ScaleType = Enum.ScaleType.Fit
        _btn.ImageColor3 = Color3.fromRGB(255, 255, 255)
        _btn.AutoButtonColor = true
        _btn.Visible = true
        _AddProperties(_btn, 1, "UIStroke", Color3.fromRGB(255, 255, 255))
        _AddProperties(_btn, 1, "UIAspectRatioConstraint")
        _MB1C(_btn, function()
            local _act0, _act1, _sfx
            function _cloneto()
                _act0 = _Ws._HHxScript_Storage._HHxScript_Tools_Storage:FindFirstChild(Args[2])
                _act0:Clone().Parent = _plr.Backpack
            end
            _cloneto()
            task.wait()
            _act1 = _plr.Backpack:FindFirstChild(Args[2])
            _sfx = _Ws._HHxScript_Storage._HHxScript_SFX_Storage:FindFirstChild(Args[2])
            if not _act1 then
                _cloneto()
            else
                _act1.Activated:Connect(function()
                    _Requiresfunc(_sfx, Args[4], Args[5], Args[6], Args[7], Args[8], Args[9], Args[10], Args[11], Args[12], Args[13])
                end)
                _DP("Added: " .. Args[2] .. " to Backpack!")
            end
        end)
        
        _RightPos += 0.24
        if _RightPos >= 0.95 then
            _RightPos = 0.02
            _BelowPos += 0.022
        end
    end
    
    function _Add2Table_CubesNamed(_s)
        for a, b in pairs(_s) do
            for c, d in pairs(b) do
                if type(c) == "string" then
                    table.insert(_NamedCubes, c)
                else
                    _DP("[HHxScript-Debugging]: It's not a string!")
                end
            end
        end
    end
    
    function _CreateTool(_s)
        for a, b in pairs(_s) do
            for c, d in pairs(b) do
                local t, b, s, sfx, trans, colorx, variants, variants_added
                t = d.Top[1]
                b = d.Bottom[1]
                s = d.Side[1]
                sfx = d.PlacingSFX[1]
                trans = d.SeeThrough[1]
                colorx = d.Color[1]
                variants = d.HasVariants
                
                print("Cube_X: " .. c .. ", Variant Numbers: " .. variants["Status"][1])
                if variants["Status"][1] == 1 then
                    variants_added = variants["Name"][1] or "_Empty_Variant"
                    print("First Check Variant Name: " .. variants_added)
                end
                
                variants_added = variants_added or "N/A"
                print("Seconds Check Variant Name: " .. variants_added)
                
                _AddTool(a, c, t, b, s, s, s, s, sfx, trans, colorx, variants_added)
                _PlusAddButtonIntoSCROLL(_SrF, a, s, c, t, b, s, s, s, s, trans, colorx, variants_added)
                _DP("[HHxScript-Debugging]: Added '" .. a .. "' to " .. _plr.Name .. " Backpack =)) !")
            end
        end
    end
    
    _AddProperties(_Fr, 0.05, "UICorner")
    --_AddProperties(_SrF, 0.15, "UICorner")
    _Add2Table_CubesNamed(_G._HHxScript_Storage_BlockId)
    _CreateTool(_G._HHxScript_Storage_BlockId)
    _Notify("Minecraft-InRoblox v" .. _CurrentVersion)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangHien2k3/NewProject/refs/heads/main/Avatar.luau"))()
if game:IsLoaded() then
    local ss, err = pcall(_Main)
    if ss then
        warn("Completed no error!")
    else
        warn("Error: " .. err)
    end
end
