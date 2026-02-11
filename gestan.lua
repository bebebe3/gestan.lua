local disable_spray = CreateClientConVar("disable_spray", "0", true, false, "")
CreateClientConVar("tarhun_aimbot", "1", true, false, "")
CreateClientConVar("tarhun_silent_aim", "0", true, false, "")
CreateClientConVar("tarhun_fov", "25", true, false, "")
CreateClientConVar("tarhun_ignore_team", "0", true, false, "")
CreateClientConVar("tarhun_esp", "0", true, false, "")
CreateClientConVar("tarhun_draw_fov", "0", true, false, "")
CreateClientConVar("tarhun_dot", "0", true, false, "")
CreateClientConVar("tarhun_norecoil", "0", true, false, "")
CreateClientConVar("tarhun_nospread", "0", true, false, "")
CreateClientConVar("tarhun_bhop", "0", true, false, "")
CreateClientConVar("tarhun_watermark", "1", true, false, "")
CreateClientConVar("tarhun_esp_box", "0", true, false, "")
CreateClientConVar("tarhun_esp_skeleton", "0", true, false, "")
CreateClientConVar("tarhun_esp_name", "0", true, false, "")
CreateClientConVar("tarhun_esp_health", "0", true, false, "")
CreateClientConVar("tarhun_esp_weapon", "0", true, false, "")
CreateClientConVar("tarhun_esp_distance", "0", true, false, "")
CreateClientConVar("tarhun_esp_bar", "0", true, false, "")
CreateClientConVar("tarhun_antiscreen", "1", true, false, "")
CreateClientConVar("tarhun_antiaim", "0", true, false, "")
CreateClientConVar("tarhun_antiaim_power", "10", true, false, "")
CreateClientConVar("tarhun_antiaim_speed", "5", true, false, "")
CreateClientConVar("tarhun_antiaim_mode", "0", true, false, "")
CreateClientConVar("tarhun_inventory_exploit", "0", true, false, "")
CreateClientConVar("tarhun_traitor_detection", "0", true, false, "")
CreateClientConVar("tarhun_aimbot_key", tostring(KEY_B), true, false, "")
CreateClientConVar("tarhun_fov_color_r", "255", true, false, "")
CreateClientConVar("tarhun_fov_color_g", "255", true, false, "")
CreateClientConVar("tarhun_fov_color_b", "255", true, false, "")
CreateClientConVar("tarhun_box_color_r", "255", true, false, "")
CreateClientConVar("tarhun_box_color_g", "50", true, false, "")
CreateClientConVar("tarhun_box_color_b", "50", true, false, "")
CreateClientConVar("tarhun_custom_fov", "90", true, false, "")
CreateClientConVar("tarhun_chat_spam", "0", true, false, "")
CreateClientConVar("tarhun_chat_message", "GESTAN.PRM ON TOP!", true, false, "")
CreateClientConVar("tarhun_chat_delay", "1", true, false, "")
CreateClientConVar("tarhun_chat_repeat", "20", true, false, "")
CreateClientConVar("tarhun_steal_name", "", true, false, "")
CreateClientConVar("tarhun_speed_multiplier", "1", true, false, "")

-- Глобальные переменные (инициализируются безопасно)
TARHUN_AIMBOT_ENABLED = false
TARHUN_SILENT_AIM_ENABLED = false
TARHUN_FOV = 25
TARHUN_IGNORE_TEAM = false
TARHUN_ESP_ENABLED = false
TARHUN_DRAW_FOV = false
TARHUN_DOT_ENABLED = false
TARHUN_CUSTOM_FOV = 90
TARHUN_THIRDPERSON = false
TARHUN_CHAT_SPAM = false
TARHUN_CHAT_MESSAGE = "GESTAN.PRM ON TOP!"
TARHUN_CHAT_DELAY = 1
TARHUN_CHAT_REPEAT = 20
TARHUN_NORECOIL = false
TARHUN_NOSPREAD = false
TARHUN_BHOP_ENABLED = false
TARHUN_WATERMARK_ENABLED = true
TARHUN_ESP_BOX = false
TARHUN_ESP_SKELETON = false
TARHUN_ESP_NAME = false
TARHUN_ESP_HEALTH = false
TARHUN_ESP_WEAPON = false
TARHUN_ESP_DISTANCE = false
TARHUN_ESP_BAR = false
TARHUN_INVENTORY_EXPLOIT = true
TARHUN_AIMBOT_KEY = KEY_B
TARHUN_FOV_COLOR = Color(255, 255, 255, 100)
TARHUN_BOX_COLOR = Color(255, 50, 50, 200)
TARHUN_SPEED_MULTIPLIER = 1
TARHUN_MENU_KEY_PRESSED = false

-- Функция для обновления значений из ConVars
local function UpdateConVars()
    local function safeGetBool(name, default)
        local cvar = GetConVar(name)
        return cvar and cvar:GetBool() or default
    end
    
    local function safeGetInt(name, default)
        local cvar = GetConVar(name)
        return cvar and cvar:GetInt() or default
    end
    
    TARHUN_AIMBOT_ENABLED = safeGetBool("tarhun_aimbot", false)
    TARHUN_SILENT_AIM_ENABLED = safeGetBool("tarhun_silent_aim", false)
    TARHUN_FOV = safeGetInt("tarhun_fov", 25)
    TARHUN_IGNORE_TEAM = safeGetBool("tarhun_ignore_team", false)
    TARHUN_ESP_ENABLED = safeGetBool("tarhun_esp", false)
    TARHUN_DRAW_FOV = safeGetBool("tarhun_draw_fov", false)
    TARHUN_DOT_ENABLED = safeGetBool("tarhun_dot", false)
    TARHUN_CUSTOM_FOV = safeGetInt("tarhun_custom_fov", 90)
    TARHUN_THIRDPERSON = safeGetBool("tarhun_thirdperson", false)
    TARHUN_CHAT_SPAM = safeGetBool("tarhun_chat_spam", false)
    TARHUN_CHAT_DELAY = safeGetInt("tarhun_chat_delay", 1)
    TARHUN_CHAT_REPEAT = safeGetInt("tarhun_chat_repeat", 20)
    
    local chatMsgCvar = GetConVar("tarhun_chat_message")
    TARHUN_CHAT_MESSAGE = chatMsgCvar and chatMsgCvar:GetString() or "GESTAN.PRM ON TOP!"
    TARHUN_NORECOIL = safeGetBool("tarhun_norecoil", false)
    TARHUN_NOSPREAD = safeGetBool("tarhun_nospread", false)
    TARHUN_BHOP_ENABLED = safeGetBool("tarhun_bhop", false)
    TARHUN_WATERMARK_ENABLED = safeGetBool("tarhun_watermark", true)
    TARHUN_ESP_BOX = safeGetBool("tarhun_esp_box", false)
    TARHUN_ESP_SKELETON = safeGetBool("tarhun_esp_skeleton", false)
    TARHUN_ESP_NAME = safeGetBool("tarhun_esp_name", false)
    TARHUN_ESP_HEALTH = safeGetBool("tarhun_esp_health", false)
    TARHUN_ESP_WEAPON = safeGetBool("tarhun_esp_weapon", false)
    TARHUN_ESP_DISTANCE = safeGetBool("tarhun_esp_distance", false)
    TARHUN_ESP_BAR = safeGetBool("tarhun_esp_bar", false)
    TARHUN_AIMBOT_KEY = safeGetInt("tarhun_aimbot_key", KEY_B)
    TARHUN_FOV_COLOR = Color(
        safeGetInt("tarhun_fov_color_r", 255),
        safeGetInt("tarhun_fov_color_g", 255),
        safeGetInt("tarhun_fov_color_b", 255),
        100
    )
    TARHUN_BOX_COLOR = Color(
        safeGetInt("tarhun_box_color_r", 255),
        safeGetInt("tarhun_box_color_g", 50),
        safeGetInt("tarhun_box_color_b", 50),
        200
    )
    TARHUN_SPEED_MULTIPLIER = safeGetInt("tarhun_speed_multiplier", 1)
end

-- Обновляем значения при инициализации (с задержкой)
timer.Simple(0.5, function()
    UpdateConVars()
end)

local antiaimAngle = Angle(0, 0, 0)
local antiaimTime = 0
local antiaimDirection = 1
local lastRealAngles = Angle(0, 0, 0)

surface.CreateFont("TarhunESP_Large", {
    font = "Verdana",
    size = 14,
    weight = 700,
    antialias = true
})

surface.CreateFont("TarhunESP_Normal", {
    font = "Verdana",
    size = 12,
    weight = 500,
    antialias = true
})

surface.CreateFont("TarhunESP_Small", {
    font = "Verdana",
    size = 10,
    weight = 400,
    antialias = true
})

local color_white = Color(255, 255, 255, 255)
local color_black = Color(0, 0, 0, 255)
local color_red = Color(255, 50, 50, 255)
local color_green = Color(50, 255, 50, 255)
local color_yellow = Color(255, 255, 50, 255)
local color_blue = Color(50, 150, 255, 255)

local function DrawSkeleton(ply)
    if not TARHUN_ESP_SKELETON then return end
    if not IsValid(ply) then return end
    if not hg or not hg.GetCurrentCharacter then return end
    
    local character = hg.GetCurrentCharacter(ply)
    if not IsValid(character) then return end
    
    local bones = {
        {"ValveBiped.Bip01_Spine", "ValveBiped.Bip01_Spine1"},
        {"ValveBiped.Bip01_Spine1", "ValveBiped.Bip01_Spine2"},
        {"ValveBiped.Bip01_Spine2", "ValveBiped.Bip01_Spine4"},
        {"ValveBiped.Bip01_Spine2", "ValveBiped.Bip01_L_UpperArm"},
        {"ValveBiped.Bip01_L_UpperArm", "ValveBiped.Bip01_L_Forearm"},
        {"ValveBiped.Bip01_L_Forearm", "ValveBiped.Bip01_L_Hand"},
        {"ValveBiped.Bip01_Spine2", "ValveBiped.Bip01_R_UpperArm"},
        {"ValveBiped.Bip01_R_UpperArm", "ValveBiped.Bip01_R_Forearm"},
        {"ValveBiped.Bip01_R_Forearm", "ValveBiped.Bip01_R_Hand"},
        {"ValveBiped.Bip01_Spine", "ValveBiped.Bip01_L_Thigh"},
        {"ValveBiped.Bip01_L_Thigh", "ValveBiped.Bip01_L_Calf"},
        {"ValveBiped.Bip01_L_Calf", "ValveBiped.Bip01_L_Foot"},
        {"ValveBiped.Bip01_Spine", "ValveBiped.Bip01_R_Thigh"},
        {"ValveBiped.Bip01_R_Thigh", "ValveBiped.Bip01_R_Calf"},
        {"ValveBiped.Bip01_R_Calf", "ValveBiped.Bip01_R_Foot"},
        {"ValveBiped.Bip01_Spine4", "ValveBiped.Bip01_Head1"}
    }
    
    local teamColor = team.GetColor(ply:Team())
    local skeletonColor = Color(teamColor.r, teamColor.g, teamColor.b, 150)
    
    for _, bonePair in ipairs(bones) do
        local bone1 = character:LookupBone(bonePair[1])
        local bone2 = character:LookupBone(bonePair[2])
        
        if bone1 and bone2 then
            local pos1 = character:GetBonePosition(bone1)
            local pos2 = character:GetBonePosition(bone2)
            
            if pos1 and pos2 then
                local screen1 = pos1:ToScreen()
                local screen2 = pos2:ToScreen()
                
                if screen1 and screen2 and screen1.visible and screen2.visible then
                    surface.SetDrawColor(skeletonColor)
                    surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
                end
            end
        end
    end
end

local function CalculatePlayerBox(ply)
    if not IsValid(ply) then return nil end
    if not hg or not hg.GetCurrentCharacter then return nil end
    
    local character = hg.GetCurrentCharacter(ply)
    if not IsValid(character) then return nil end
    
    local min, max = character:GetRenderBounds()
    local pos = character:GetPos()
    local ang = character:GetAngles()
    
    local corners = {
        Vector(min.x, min.y, min.z),
        Vector(min.x, min.y, max.z),
        Vector(min.x, max.y, min.z),
        Vector(min.x, max.y, max.z),
        Vector(max.x, min.y, min.z),
        Vector(max.x, min.y, max.z),
        Vector(max.x, max.y, min.z),
        Vector(max.x, max.y, max.z)
    }
    
    local worldCorners = {}
    for i, corner in ipairs(corners) do
        local rotated = corner
        rotated:Rotate(ang)
        worldCorners[i] = pos + rotated
    end
    
    local screenCorners = {}
    local minX, maxX = ScrW(), 0
    local minY, maxY = ScrH(), 0
    local anyVisible = false
    
    for i, worldPos in ipairs(worldCorners) do
        local screenPos = worldPos:ToScreen()
        screenCorners[i] = screenPos
        
        if screenPos.visible then
            anyVisible = true
            if screenPos.x < minX then minX = screenPos.x end
            if screenPos.x > maxX then maxX = screenPos.x end
            if screenPos.y < minY then minY = screenPos.y end
            if screenPos.y > maxY then maxY = screenPos.y end
        end
    end
    
    if not anyVisible then return nil end
    
    local boxWidth = maxX - minX
    local boxHeight = maxY - minY
    
    if boxWidth < 2 or boxHeight < 2 or boxWidth > ScrW() * 0.95 or boxHeight > ScrH() * 0.95 then
        return nil
    end
    
    return {
        minX = minX,
        minY = minY,
        maxX = maxX,
        maxY = maxY,
        boxWidth = boxWidth,
        boxHeight = boxHeight,
        centerX = (minX + maxX) / 2
    }
end

local function DrawESPBox(ply, boxData)
    if not TARHUN_ESP_BOX then return end
    
    surface.SetDrawColor(TARHUN_BOX_COLOR)
    surface.DrawOutlinedRect(boxData.minX, boxData.minY, boxData.boxWidth, boxData.boxHeight, 2)
    
    surface.SetDrawColor(color_white)
    surface.DrawOutlinedRect(boxData.minX + 1, boxData.minY + 1, boxData.boxWidth - 2, boxData.boxHeight - 2, 1)
end

local function DrawESPHealthBar(ply, boxData)
    if not TARHUN_ESP_BAR then return end
    
    local health = ply:Health()
    local maxHealth = ply:GetMaxHealth() or 100
    local healthPercent = math.Clamp(health / maxHealth, 0, 1)
    
    local healthColor = color_green
    if health < 30 then
        healthColor = color_red
    elseif health < 70 then
        healthColor = color_yellow
    end
    
    local healthBarWidth = 4
    local healthBarHeight = boxData.boxHeight * healthPercent
    local healthBarY = boxData.minY + (boxData.boxHeight - healthBarHeight)
    
    surface.SetDrawColor(healthColor)
    surface.DrawRect(boxData.minX - healthBarWidth - 2, healthBarY, healthBarWidth, healthBarHeight)
    
    surface.SetDrawColor(color_black)
    surface.DrawOutlinedRect(boxData.minX - healthBarWidth - 2, boxData.minY, healthBarWidth, boxData.boxHeight, 1)
end

local function DrawESPName(ply, boxData)
    if not TARHUN_ESP_NAME then return end
    
    local nick = ply:Nick()
    if string.len(nick) > 12 then
        nick = string.sub(nick, 1, 12) .. "..."
    end
    
    draw.SimpleText(nick, "TarhunESP_Normal", boxData.minX + boxData.boxWidth/2, boxData.minY - 15, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
end

local function DrawESPHealthText(ply, boxData)
    if not TARHUN_ESP_HEALTH then return end
    
    local health = ply:Health()
    local healthColor = color_green
    if health < 30 then
        healthColor = color_red
    elseif health < 70 then
        healthColor = color_yellow
    end
    
    draw.SimpleText(health, "TarhunESP_Small", boxData.minX - 9, boxData.minY - 8, healthColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)
end

local function DrawESPWeapon(ply, boxData)
    if not TARHUN_ESP_WEAPON then return end
    
    local weapon = ply:GetActiveWeapon()
    local weaponName = "No Weapon"
    if IsValid(weapon) then
        weaponName = weapon:GetPrintName() or weapon:GetClass()
        if string.len(weaponName) > 15 then
            weaponName = string.sub(weaponName, 1, 15) .. "..."
        end
    end
    
    draw.SimpleText(weaponName, "TarhunESP_Small", boxData.minX + boxData.boxWidth/2, boxData.maxY + 3, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
end

local function DrawESPDistance(ply, boxData)
    if not TARHUN_ESP_DISTANCE then return end
    
    local distance = math.Round(LocalPlayer():GetPos():Distance(ply:GetPos()) / 50)
    draw.SimpleText(distance .. "m", "TarhunESP_Small", boxData.minX + boxData.boxWidth/2, boxData.maxY + 15, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
end

hook.Add("DrawOverlay", "TARHUN_ESP", function()
    if not TARHUN_ESP_ENABLED then return end
    
    for _, ply in ipairs(player.GetAll()) do
        if not IsValid(ply) or not ply:Alive() then continue end
        if ply == LocalPlayer() then continue end
        if TARHUN_IGNORE_TEAM and ply:Team() == LocalPlayer():Team() then continue end
        
        DrawSkeleton(ply)
        
        local boxData = CalculatePlayerBox(ply)
        if not boxData then continue end
        
        DrawESPBox(ply, boxData)
        DrawESPHealthBar(ply, boxData)
        DrawESPName(ply, boxData)
        DrawESPHealthText(ply, boxData)
        DrawESPWeapon(ply, boxData)
        DrawESPDistance(ply, boxData)
    end
end)

local function IsHomigradWeapon(wep)
    if not IsValid(wep) then return false end
    return wep.Base == "homigrad_base" or
           wep.PrimarySpread or
           wep.EyeSpray or
           wep.ApplyEyeSpray or
           wep.Step_Spray or
           wep.AnimApply_ShootRecoil or  
           wep.AnimationInspect or      
           (wep.GetPrimaryMul and wep:GetPrimaryMul()) or
           (wep.Primary and wep.Primary.Ammo and hg and hg.ammotypeshuy and hg.ammotypeshuy[wep.Primary.Ammo]) 
end

local original_ViewPunch
local original_ViewPunch2
local original_HGAddView
local original_renderscene
local original_hg_cam_things
local original_realismcam

local function ApplyNoRecoil()
    if original_ViewPunch == nil then
        original_ViewPunch = _G.ViewPunch
    end
    if original_ViewPunch2 == nil then
        original_ViewPunch2 = _G.ViewPunch2
    end
    if original_HGAddView == nil then
        original_HGAddView = HGAddView
    end
    if original_renderscene == nil then
        original_renderscene = renderscene
    end
    if hg and hg.cam_things and original_hg_cam_things == nil then
        original_hg_cam_things = hg.cam_things
    end
    if original_realismcam == nil then
        local realismConvar = GetConVar("hg_realismcam")
        original_realismcam = realismConvar and realismConvar:GetInt() or 0
    end

    _G.ViewPunch = function(ang) end
    _G.ViewPunch2 = function(ang) end

    HGAddView = function(ply, origin, angles, velLen)
        if not ply:Alive() then return origin, angles end
        
        local camera_position_addition = Vector(0, 0, 0)
        origin:Add(camera_position_addition)
        
        local ang = Angle(0, 0, 0)
        local lerped_ang = Angle(0, 0, 0)
                
        local walkLerped = 0
        local walk = 0
        local walkTime = 0
        local x, y = 0, 0
        ply.xMove = 0
        
        if ply.MovementInertiaAddView then
            angles = angles + ply.MovementInertiaAddView
            ply.MovementInertiaAddView.r = 0
            ply.MovementInertiaAddView.p = 0
        end
        
        return origin, angles
    end

    if hg then
        hg.cam_things = function(ply, view, angles)
            local offsetView = Angle(0, 0, 0)
            local angle_difference = Angle(0, 0, 0)
            local position_difference = Vector(0, 0, 0)
            angles[3] = angles[3] - (lean_lerp or 0) * 0
        end
    end

    hook.Add("MotionBlur", "NoShakeMotionBlur", function() return {0, 0, 0, 0} end)

    renderscene = function(pos, angle, fov)
        local clean_pos = LocalPlayer():EyePos()
        local clean_angle = LocalPlayer():EyeAngles()
        local view = CalcView(LocalPlayer(), clean_pos, clean_angle, fov)
        if view then
            view.angles = clean_angle
            view.origin = clean_pos
        end
        return original_renderscene(clean_pos, clean_angle, fov)
    end

    RunConsoleCommand("hg_realismcam", "0")
end

local function RestoreRecoil()
    if original_ViewPunch ~= nil then
        _G.ViewPunch = original_ViewPunch
    end
    if original_ViewPunch2 ~= nil then
        _G.ViewPunch2 = original_ViewPunch2
    end

    if original_HGAddView ~= nil then
        HGAddView = original_HGAddView
    end

    if hg and original_hg_cam_things ~= nil then
        hg.cam_things = original_hg_cam_things
    end

    hook.Remove("MotionBlur", "NoShakeMotionBlur")

    if original_renderscene ~= nil then
        renderscene = original_renderscene
    end

    if original_realismcam ~= nil then
        RunConsoleCommand("hg_realismcam", tostring(original_realismcam))
    end
end

cvars.AddChangeCallback("disable_spray", function(convar_name, old_value, new_value)
    if tobool(new_value) then
        ApplyNoRecoil()
    else
        RestoreRecoil()
    end
end)

if disable_spray:GetBool() then
    ApplyNoRecoil()
end

hook.Add("Think", "homigrad_disable_spray", function()
    if not disable_spray:GetBool() then return end

    local ply = LocalPlayer()
    if not IsValid(ply) then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or not IsHomigradWeapon(wep) then return end

    wep.norecoil = true

    wep.EyeSpray = Angle(0, 0, 0)
    if wep.EyeSprayVel then wep.EyeSprayVel = Angle(0, 0, 0) end
    if wep.sprayAngles then wep.sprayAngles = Angle(0, 0, 0) end
    if wep.SprayI then wep.SprayI = 0 end
    if wep.weaponSway then wep.weaponSway = Angle(0, 0, 0) end
    if wep.dmgStack then wep.dmgStack = 0 end
    if wep.dmgStack2 then wep.dmgStack2 = 0 end

    if wep.Anim_RecoilCameraZoom then wep.Anim_RecoilCameraZoom = Vector(0, 0, 0) end
    if wep.Anim_RecoilCameraZoomSet then wep.Anim_RecoilCameraZoomSet = Vector(0, 0, 0) end
    if wep.Anim_RecoilLerp then wep.Anim_RecoilLerp = 0 end
    if wep.WepAngOffset then wep.WepAngOffset = Angle(0, 0, 0) end
    if wep.angvel then wep.angvel = Angle(0, 0, 0) end
    if wep.LHPosOffset then wep.LHPosOffset = Vector(0, 0, 0) end
    if wep.LHAngOffset then wep.LHAngOffset = Angle(0, 0, 0) end
    if wep.RHPosOffset then wep.RHPosOffset = Vector(0, 0, 0) end
    if wep.RHAngOffset then wep.RHAngOffset = Angle(0, 0, 0) end

    local owner = wep:GetOwner()
    if owner == ply then
        if wep.Step_Spray and not wep._original_Step_Spray then
            wep._original_Step_Spray = wep.Step_Spray
            wep.Step_Spray = function(self, time, dtime)
                self.EyeSpray = Angle(0, 0, 0)
                if wep._original_Step_Spray then wep._original_Step_Spray(self, time, dtime) end
            end
        end

        if wep.ApplyEyeSpray and not wep._original_ApplyEyeSpray then
            wep._original_ApplyEyeSpray = wep.ApplyEyeSpray
            wep.ApplyEyeSpray = function(self, value)
                self.EyeSpray = Angle(0, 0, 0)
            end
        end

        if wep.ApplyEyeSprayVel and not wep._original_ApplyEyeSprayVel then
            wep._original_ApplyEyeSprayVel = wep.ApplyEyeSprayVel
            wep.ApplyEyeSprayVel = function(self, value)
                if wep._original_ApplyEyeSprayVel then wep._original_ApplyEyeSprayVel(self, Angle(0,0,0)) end
            end
        end

        if wep.Step_SprayVel and not wep._original_Step_SprayVel then
            wep._original_Step_SprayVel = wep.Step_SprayVel
            wep.Step_SprayVel = function(self, dtime)
                self.EyeSprayVel = Angle(0, 0, 0)
                if wep._original_Step_SprayVel then wep._original_Step_SprayVel(self, dtime) end
            end
        end

        if wep.AnimApply_ShootRecoil and not wep._original_AnimApply_ShootRecoil then
            wep._original_AnimApply_ShootRecoil = wep.AnimApply_ShootRecoil
            wep.AnimApply_ShootRecoil = function(self, time)
            end
        end

        if wep.AnimationInspect and not wep._original_AnimationInspect then
            wep._original_AnimationInspect = wep.AnimationInspect
            wep.AnimationInspect = function(self, time)
                self.LHPosOffset = Vector(0,0,0)
                self.LHAngOffset = Angle(0,0,0)
                self.RHPosOffset = Vector(0,0,0)
                self.RHAngOffset = Angle(0,0,0)
                self.WepAngOffset = Angle(0,0,0)
                self.angvel = Angle(0,0,0)
             
                if wep._original_AnimationInspect then
                    local tempPunch = ViewPunch
                    local tempPunch2 = ViewPunch2
                    ViewPunch = function() end
                    ViewPunch2 = function() end
                    wep._original_AnimationInspect(self, time)
                    ViewPunch = tempPunch
                    ViewPunch2 = tempPunch2
                end
            end
        end

        if wep.PrimarySpread and not wep._original_PrimarySpread then
            wep._original_PrimarySpread = wep.PrimarySpread
            wep.PrimarySpread = function(self, ...)
                if CLIENT and (self:GetOwner() == LocalPlayer() or (not LocalPlayer():Alive() and self:GetOwner() == LocalPlayer():GetNWEntity("spect"))) and self.norecoil then
                    self.SprayI = self.SprayI + 1
                    self.dmgStack = self.dmgStack + self.Primary.Damage
                    self.dmgStack2 = math.min(self.dmgStack2 + 0.2, 60)
                    return 
                end
                return wep._original_PrimarySpread(self, ...)
            end
        end
    end
end)

hook.Add("Think", "RestoreSWEPOnDisable", function()
    if disable_spray:GetBool() then return end

    local ply = LocalPlayer()
    if not IsValid(ply) then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or not IsHomigradWeapon(wep) then return end

    wep.norecoil = nil

    if wep._original_Step_Spray then
        wep.Step_Spray = wep._original_Step_Spray
        wep._original_Step_Spray = nil
    end

    if wep._original_ApplyEyeSpray then
        wep.ApplyEyeSpray = wep._original_ApplyEyeSpray
        wep._original_ApplyEyeSpray = nil
    end

    if wep._original_ApplyEyeSprayVel then
        wep.ApplyEyeSprayVel = wep._original_ApplyEyeSprayVel
        wep._original_ApplyEyeSprayVel = nil
    end

    if wep._original_Step_SprayVel then
        wep.Step_SprayVel = wep._original_Step_SprayVel
        wep._original_Step_SprayVel = nil
    end

    if wep._original_AnimApply_ShootRecoil then
        wep.AnimApply_ShootRecoil = wep._original_AnimApply_ShootRecoil
        wep._original_AnimApply_ShootRecoil = nil
    end

    if wep._original_AnimationInspect then
        wep.AnimationInspect = wep._original_AnimationInspect
        wep._original_AnimationInspect = nil
    end

    if wep._original_PrimarySpread then
        wep.PrimarySpread = wep._original_PrimarySpread
        wep._original_PrimarySpread = nil
    end
end)

hook.Add("Think", "NoRecoilEyeAngles", function()
    if not disable_spray:GetBool() then return end
    local ply = LocalPlayer()
    if not IsValid(ply) then return end
    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or not IsHomigradWeapon(wep) then return end
    
    if wep.EyeSpray then
        ply:SetEyeAngles(ply:EyeAngles() - wep.EyeSpray)
        wep.EyeSpray = Angle(0, 0, 0)
    end
    
    if wep.Anim_RecoilLerp then wep.Anim_RecoilLerp = 0 end
    if wep.inspect then wep.inspect = nil end 
end)

timer.Create("NoShakeZeroVars", 0.1, 0, function()
    if not disable_spray:GetBool() then return end
    local ply = LocalPlayer()
    if IsValid(ply) then
        breathing_amount = 0
        walk_amount = 0
        walkLerped = 0
        velocityAdd = Vector(0, 0, 0)
        velocityAddVel = Vector(0, 0, 0)
        lerped_ang = Angle(0, 0, 0)
        offsetView = Angle(0, 0, 0)
        angle_difference = Angle(0, 0, 0)
        angle_difference2 = Angle(0, 0, 0)
        position_difference = Vector(0, 0, 0)
        position_difference2 = Vector(0, 0, 0)
        swayAng = Angle(0, 0, 0)
    end
end)

hook.Add("CalcView", "NoShakeOverride", function(ply, origin, angles, fov, znear, zfar)
    -- Если NoRecoil выключен
    if not disable_spray:GetBool() then 
        -- Проверяем Third Person
        if TARHUN_THIRDPERSON and IsValid(ply) and ply:Alive() then
            local customFov = TARHUN_CUSTOM_FOV or 90
            
            local view = {}
            view.origin = origin - (angles:Forward() * 120) + (angles:Up() * 30)
            view.angles = angles
            view.fov = customFov
            view.drawviewer = true
            view.znear = znear or 3
            view.zfar = zfar or 6000
            
            -- Trace to prevent camera going through walls
            local trace = util.TraceLine({
                start = origin,
                endpos = view.origin,
                filter = ply
            })
            
            if trace.Hit then
                view.origin = trace.HitPos + trace.HitNormal * 5
            end
            
            return view
        end
        
        -- Если Third Person выключен, но Custom FOV включен
        if TARHUN_CUSTOM_FOV and TARHUN_CUSTOM_FOV ~= 90 then
            local view = {
                origin = origin,
                angles = angles,
                fov = TARHUN_CUSTOM_FOV,
                znear = znear or 3,
                zfar = zfar or 6000,
                drawviewer = false
            }
            return view
        end
        
        return 
    end
    
    -- NoRecoil включен
    local view = {
        origin = origin,
        angles = angles,
        fov = fov,
        znear = znear or 3,
        zfar = zfar or 6000,
        drawviewer = true
    }
    
    LookX, LookY = 0, 0
    
    view.angles = angles  
    view.origin = origin  
    
    local vel = ply:GetVelocity()
    local velLen = 0 
    
    if ply:InVehicle() then
        local vehicle = ply:GetVehicle()
        if IsValid(vehicle) then
        end
    end
    
    view.origin, view.angles = HGAddView(ply, view.origin, view.angles, 0)
    
    breathing_amount = 0
    walk_amount = 0
    
    lerpfovadd = 0
    
    -- Применяем Custom FOV
    if TARHUN_CUSTOM_FOV and TARHUN_CUSTOM_FOV ~= 90 then
        view.fov = TARHUN_CUSTOM_FOV
    else
        view.fov = hg_fov and hg_fov:GetInt() or fov
    end
    
    view.angles.roll = 0
    
    -- Применяем Third Person если включен
    if TARHUN_THIRDPERSON and IsValid(ply) and ply:Alive() then
        view.origin = view.origin - (view.angles:Forward() * 120) + (view.angles:Up() * 30)
        view.drawviewer = true
        
        -- Trace to prevent camera going through walls
        local trace = util.TraceLine({
            start = origin,
            endpos = view.origin,
            filter = ply
        })
        
        if trace.Hit then
            view.origin = trace.HitPos + trace.HitNormal * 5
        end
    end
    
    return view
end, 1000)  

local vecZero = Vector(0, 0, 0)
local angZero = Angle(0, 0, 0)
hook.Add("Bones", "homigrad_no_walk_sway", function(ply)
    if not disable_spray:GetBool() then return end
    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) or not IsHomigradWeapon(wep) then return end
    local vel = ply:GetVelocity():LengthSqr()
    if vel < 1 then return end  

    if hg and hg.bone and hg.bone.Set then
        hg.bone.Set(ply, "l_upperarm", vecZero, angZero, "no_sway", 0.01)
        hg.bone.Set(ply, "r_upperarm", vecZero, angZero, "no_sway", 0.01)
        hg.bone.Set(ply, "l_forearm", vecZero, angZero, "no_sway", 0.01)
        hg.bone.Set(ply, "r_forearm", vecZero, angZero, "no_sway", 0.01)
        hg.bone.Set(ply, "spine", vecZero, angZero, "no_sway", 0.01)
        hg.bone.Set(ply, "spine1", vecZero, angZero, "no_sway", 0.01)
        hg.bone.Set(ply, "spine2", vecZero, angZero, "no_sway", 0.01)
    end
end, -1000)

hook.Add("CreateMove", "TARHUN_ANTIAIM", function(cmd)
    local antiaimCvar = GetConVar("tarhun_antiaim")
    if not antiaimCvar or not antiaimCvar:GetBool() then return end
    
    local me = LocalPlayer()
    if not IsValid(me) or not me:Alive() then return end
    
    local w = me:GetActiveWeapon()
    if IsValid(w) and w.GetIronsights and w:GetIronsights() then return end
    
    local powerCvar = GetConVar("tarhun_antiaim_power")
    local speedCvar = GetConVar("tarhun_antiaim_speed")
    local modeCvar = GetConVar("tarhun_antiaim_mode")
    
    if not powerCvar or not speedCvar or not modeCvar then return end
    
    local power = powerCvar:GetInt()
    local speed = speedCvar:GetFloat()
    local mode = modeCvar:GetInt()
    
    lastRealAngles = cmd:GetViewAngles()
    
    antiaimTime = antiaimTime + FrameTime() * speed
    
    local fakeAngles = Angle(lastRealAngles)
    
    if mode == 0 then
        local jitterX = math.sin(CurTime() * 15) * power
        local jitterY = math.cos(CurTime() * 12) * power * 2
        
        fakeAngles.p = fakeAngles.p + jitterX
        fakeAngles.y = fakeAngles.y + jitterY
        
    elseif mode == 1 then
        local spinSpeed = power * 10
        fakeAngles.y = fakeAngles.y + (CurTime() * spinSpeed) % 360
        
    elseif mode == 2 then
        if antiaimTime > 0.5 then
            antiaimTime = 0
            fakeAngles.p = math.random(-power, power)
            fakeAngles.y = math.random(-180, 180)
        end
    end
    
    cmd:SetViewAngles(fakeAngles)
    
    return true
end)

hook.Add("CalcView", "TARHUN_ANTIAIM_REALVIEW", function(ply, pos, angles, fov)
    local antiaimCvar = GetConVar("tarhun_antiaim")
    if not antiaimCvar or not antiaimCvar:GetBool() then return end
    
    local me = LocalPlayer()
    if not IsValid(me) or not me:Alive() then return end
    
    return {
        origin = pos,
        angles = lastRealAngles,
        fov = fov,
        drawviewer = true
    }
end)

hook.Add("Think", "TARHUN_ANTIAIM_WEAPON", function()
    local antiaimCvar = GetConVar("tarhun_antiaim")
    if not antiaimCvar or not antiaimCvar:GetBool() then return end
    
    local me = LocalPlayer()
    if not IsValid(me) or not me:Alive() then return end
    
    me:SetEyeAngles(lastRealAngles)
end)

hook.Add("Think", "TARHUN_ANTIAIM_BONES", function()
    local antiaimCvar = GetConVar("tarhun_antiaim")
    if not antiaimCvar or not antiaimCvar:GetBool() then return end
    if not hg or not hg.GetCurrentCharacter then return end
    
    local me = LocalPlayer()
    if not IsValid(me) or not me:Alive() then return end
    
    local char = hg.GetCurrentCharacter(me)
    if not IsValid(char) then return end
    
    local powerCvar = GetConVar("tarhun_antiaim_power")
    local modeCvar = GetConVar("tarhun_antiaim_mode")
    
    if not powerCvar or not modeCvar then return end
    
    local power = powerCvar:GetInt() * 0.3
    local mode = modeCvar:GetInt()
    
    local bones = {
        "ValveBiped.Bip01_Head1",
        "ValveBiped.Bip01_Spine2",
        "ValveBiped.Bip01_Spine1",
        "ValveBiped.Bip01_Spine4"
    }
    
    for _, boneName in ipairs(bones) do
        local bone = char:LookupBone(boneName)
        if bone then
            char:ManipulateBonePosition(bone, Vector(0, 0, 0))
        end
    end
    
    local time = CurTime()
    
    if mode == 0 then 
        local headMove = math.sin(time * 8) * power * 0.2
        local spineMove = math.cos(time * 6) * power * 0.1
        
        local headBone = char:LookupBone("ValveBiped.Bip01_Head1")
        if headBone then
            char:ManipulateBonePosition(headBone, Vector(headMove, spineMove, 0))
        end
        
        local spineBone = char:LookupBone("ValveBiped.Bip01_Spine2")
        if spineBone then
            char:ManipulateBonePosition(spineBone, Vector(spineMove, headMove, 0))
        end
        
    elseif mode == 1 then
        local spinAmount = math.sin(time * 3) * power * 0.3
        
        local headBone = char:LookupBone("ValveBiped.Bip01_Head1")
        if headBone then
            char:ManipulateBonePosition(headBone, Vector(0, spinAmount, 0))
        end
    end
end)

hook.Add("Think", "TARHUN_ANTIAIM_RESET", function()
    local antiaimCvar = GetConVar("tarhun_antiaim")
    if not antiaimCvar then return end
    if antiaimCvar:GetBool() then return end
    if not hg or not hg.GetCurrentCharacter then return end
    
    local me = LocalPlayer()
    if not IsValid(me) then return end
    
    local char = hg.GetCurrentCharacter(me)
    if not IsValid(char) then return end
    
    local bones = {
        "ValveBiped.Bip01_Head1",
        "ValveBiped.Bip01_Spine2",
        "ValveBiped.Bip01_Spine1",
        "ValveBiped.Bip01_Spine4"
    }
    
    for _, boneName in ipairs(bones) do
        local bone = char:LookupBone(boneName)
        if bone then
            char:ManipulateBonePosition(bone, Vector(0, 0, 0))
        end
    end
end)

-- Глобальные переменные цветов для меню
local TARHUN_COLORS = {
    bg = Color(5, 5, 8, 180),
    sidebar = Color(10, 5, 8, 200),
    content = Color(8, 8, 12, 190),
    accent1 = Color(200, 15, 45, 255),
    accent2 = Color(255, 40, 80, 255),
    glow = Color(255, 30, 70, 180),
    text = Color(255, 255, 255, 255),
    text_dim = Color(180, 180, 190, 255)
}

local function OpenTARHUNMenu()
    if IsValid(TARHUNMenu) then
        TARHUNMenu:Remove()
    end

    local scrW, scrH = ScrW(), ScrH()
    local menuW = scrW * 0.85
    local menuH = scrH * 0.75

    TARHUNMenu = vgui.Create("DFrame")
    TARHUNMenu:SetSize(menuW, menuH)
    TARHUNMenu:SetTitle("")
    TARHUNMenu:SetDraggable(true)
    TARHUNMenu:ShowCloseButton(false)
    TARHUNMenu:Center()
    TARHUNMenu:MakePopup()

    surface.CreateFont("TarhunTitle", {
        font = "Disket Mono Bold", size = 42, weight = 700, antialias = true, shadow = false
    })
    surface.CreateFont("TarhunBold", {
        font = "Disket Mono Bold", size = 16, weight = 700, antialias = true
    })
    surface.CreateFont("TarhunNormal", {
        font = "Disket Mono Bold", size = 14, weight = 700, antialias = true
    })
    surface.CreateFont("TarhunSmall", {
        font = "Disket Mono Bold", size = 12, weight = 700, antialias = true
    })
    surface.CreateFont("TarhunMatrix", {
        font = "Disket Mono Bold", size = 18, weight = 700, antialias = true
    })

    local color_bg = TARHUN_COLORS.bg
    local color_sidebar = TARHUN_COLORS.sidebar
    local color_content = TARHUN_COLORS.content
    local color_accent1 = TARHUN_COLORS.accent1
    local color_accent2 = TARHUN_COLORS.accent2
    local color_glow = TARHUN_COLORS.glow
    local color_text = TARHUN_COLORS.text
    local color_text_dim = TARHUN_COLORS.text_dim
    
    local animTime = 0
    local matrixChars = {}
    local matrixSymbols = {"0", "1", "Z", "O", "V", "G", "A", "M", "E", "V", "I", "P", "█", "▓", "▒", "░"}
    
    for i = 1, 25 do
        table.insert(matrixChars, {
            x = math.random(0, menuW),
            y = math.random(-menuH, 0),
            speed = math.random(100, 300),
            char = matrixSymbols[math.random(1, #matrixSymbols)],
            alpha = math.random(100, 255),
            trail = {}
        })
    end
    
    local cachedSin = {}
    local cacheTime = 0
    
    local function getCachedSin(val)
        if not CurTime then return math.sin(val) end
        local key = math.floor(val * 100)
        if not cachedSin[key] or CurTime() - cacheTime > 0.1 then
            cachedSin[key] = math.sin(val)
            cacheTime = CurTime()
        end
        return cachedSin[key]
    end
    
    local function shouldUpdate(interval)
        if not CurTime then return false end
        return math.floor(CurTime() * 60) % interval == 0
    end

    TARHUNMenu.Paint = function(self, w, h)
        animTime = animTime + FrameTime()
        
        draw.RoundedBox(0, 0, 0, w, h, color_bg)
        
        if shouldUpdate(2) then
            for _, char in ipairs(matrixChars) do
                char.y = char.y + char.speed * FrameTime() * 2
                if char.y > h + 50 then 
                    char.y = -50
                    char.x = math.random(0, w)
                    char.char = matrixSymbols[math.random(1, #matrixSymbols)]
                end
                
                local colorShift = getCachedSin(animTime * 3 + char.x * 0.01) * 0.5 + 0.5
                local r = Lerp(colorShift, 200, 255)
                local g = Lerp(colorShift, 15, 60)
                local b = Lerp(colorShift, 45, 100)
                
                draw.SimpleText(char.char, "TarhunMatrix", char.x, char.y, Color(r, g, b, char.alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end
        
        local headerHeight = 60
        surface.SetDrawColor(color_accent1)
        surface.DrawRect(0, 0, w, headerHeight)
        
        for i = 0, headerHeight, 5 do
            local fraction = i / headerHeight
            local alpha = Lerp(fraction, 255, 180)
            surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, alpha)
            surface.DrawRect(0, i, w, 5)
        end
        
        for i = 0, 4 do
            surface.SetDrawColor(color_glow.r, color_glow.g, color_glow.b, 50 - i * 10)
            surface.DrawRect(0, headerHeight + i, w, 1)
        end
        
        local pulse = getCachedSin(animTime * 4) * 0.3 + 0.7
        surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, 255 * pulse)
        surface.DrawRect(0, headerHeight + 5, w, 3)
        
        local glitchX, glitchY = 0, 0
        if shouldUpdate(5) then
            glitchX = math.random(-2, 2)
            glitchY = math.random(-1, 1)
        end
        
        draw.SimpleText("GESTAN.PRM", "TarhunTitle", w/2 + glitchX - 2, headerHeight/2 + glitchY, Color(255, 0, 50, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("GESTAN.PRM", "TarhunTitle", w/2 + glitchX + 2, headerHeight/2 + glitchY, Color(0, 255, 255, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
        local titleShift = getCachedSin(animTime * 2) * 0.5 + 0.5
        local titleR = Lerp(titleShift, 255, 200)
        local titleG = Lerp(titleShift, 255, 50)
        local titleB = Lerp(titleShift, 255, 80)
        draw.SimpleText("GESTAN.PRM", "TarhunTitle", w/2, headerHeight/2, Color(titleR, titleG, titleB, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
        surface.SetDrawColor(color_accent1)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(w - 3, 0, 3, h)
        surface.DrawRect(0, h - 3, w, 3)
        
        for i = 0, 6, 2 do
            surface.SetDrawColor(color_glow.r, color_glow.g, color_glow.b, 40 - i * 6)
            surface.DrawRect(3 + i, headerHeight, 2, h - headerHeight)
            surface.DrawRect(w - 3 - i, headerHeight, 2, h - headerHeight)
        end
        
        surface.SetDrawColor(color_accent2)
        surface.DrawRect(15, 15, 40, 3)
        surface.DrawRect(15, 15, 3, 40)
        surface.DrawRect(w - 55, 15, 40, 3)
        surface.DrawRect(w - 18, 15, 3, 40)
        surface.DrawRect(15, h - 18, 40, 3)
        surface.DrawRect(15, h - 55, 3, 40)
        surface.DrawRect(w - 55, h - 18, 40, 3)
        surface.DrawRect(w - 18, h - 55, 3, 40)
        
        if shouldUpdate(3) then
            local scanY = (animTime * 150) % h
            surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, 40)
            surface.DrawRect(0, scanY, w, 2)
        end
        
        draw.SimpleText("PREMIUM EDITION", "TarhunSmall", 20, h - 25, color_accent2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        draw.SimpleText("v0.2", "TarhunSmall", w - 20, h - 25, color_text_dim, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
    end

    local closeBtn = vgui.Create("DButton", TARHUNMenu)
    closeBtn:SetSize(50, 50)
    closeBtn:SetPos(menuW - 60, 5)
    closeBtn:SetText("✕")
    closeBtn:SetFont("TarhunTitle")
    closeBtn:SetTextColor(color_text)
    closeBtn.DoClick = function()
        TARHUNMenu:Remove()
    end
    closeBtn.Paint = function(self, w, h)
        local hoverAlpha = self:IsHovered() and 255 or 180
        local pulse = math.sin(animTime * 5) * 0.2 + 0.8
        
        draw.RoundedBox(4, 0, 0, w, h, Color(color_accent1.r, color_accent1.g, color_accent1.b, hoverAlpha * pulse))
        
        if self:IsHovered() then
            surface.SetDrawColor(255, 100, 100, 150)
            surface.DrawOutlinedRect(0, 0, w, h, 2)
        end
    end

    local leftPanel = vgui.Create("DPanel", TARHUNMenu)
    leftPanel:SetSize(200, menuH - 80)
    leftPanel:SetPos(10, 75)
    leftPanel.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, color_sidebar)
        
        local edgeShift = getCachedSin(animTime * 2) * 0.3 + 0.7
        surface.SetDrawColor(color_accent1.r * edgeShift, color_accent1.g, color_accent1.b, 255)
        surface.DrawRect(0, 0, 4, h)
        
        for i = 0, 8, 2 do
            surface.SetDrawColor(color_glow.r, color_glow.g, color_glow.b, 30 - i * 3)
            surface.DrawRect(4 + i, 0, 2, h)
        end
    end

    local contentPanel = vgui.Create("DPanel", TARHUNMenu)
    contentPanel:SetSize(menuW - 230, menuH - 80)
    contentPanel:SetPos(220, 75)
    contentPanel.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, color_content)
        
        local borderShift = getCachedSin(animTime * 2.5) * 0.3 + 0.7
        surface.SetDrawColor(color_accent1.r * borderShift, color_accent1.g, color_accent1.b, 150)
        surface.DrawOutlinedRect(0, 0, w, h, 2)
        
        surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, 15)
        surface.DrawRect(2, 2, w - 4, h - 4)
    end

    local currentTab = "AIMBOT"
    local contentScroll = vgui.Create("DScrollPanel", contentPanel)
    contentScroll:SetSize(menuW - 250, menuH - 100)
    contentScroll:SetPos(10, 10)
    
    local keyNames = {
        [MOUSE_LEFT] = "LMB",
        [MOUSE_RIGHT] = "RMB",
        [MOUSE_MIDDLE] = "MMB",
        [MOUSE_4] = "MOUSE4",
        [MOUSE_5] = "MOUSE5",
    }
    
    for k, v in pairs(_G) do
        if type(v) == "number" and string.sub(k, 1, 4) == "KEY_" then
            keyNames[v] = string.sub(k, 5)
        end
    end
    
    local activeKeybindButton = nil

    local function CreateKeybindPanel(parent, text, convar, keybindConvar, callback)
        local cvar = GetConVar(convar)
        local keyCvar = GetConVar(keybindConvar)
        
        if not cvar or not keyCvar then return nil end
        
        local value = cvar:GetBool()
        local currentKey = keyCvar:GetInt()
        
        if currentKey == 0 then
            currentKey = nil
        end
        
        local panel = vgui.Create("DPanel", parent)
        panel:SetSize(menuW - 270, 55)
        panel:Dock(TOP)
        panel:DockMargin(0, 0, 0, 10)
        panel.Paint = function(self, w, h)
            local bgShift = math.sin(animTime * 1.5 + self:GetY() * 0.01) * 0.2 + 0.8
            for i = 0, h do
                local fraction = i / h
                local alpha = Lerp(fraction, 50, 25) * bgShift
                surface.SetDrawColor(15, 15, 20, alpha)
                surface.DrawRect(0, i, w, 1)
            end
            
            local textShift = math.sin(animTime * 2 + self:GetY() * 0.02) * 0.3 + 0.7
            local textR = Lerp(textShift, 255, 200)
            local textG = Lerp(textShift, 255, 100)
            local textB = Lerp(textShift, 255, 120)
            draw.SimpleText(text, "TarhunNormal", 20, h/2, Color(textR, textG, textB, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            
            local lineAlpha = math.sin(animTime * 3) * 50 + 200
            surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, lineAlpha)
            surface.DrawRect(0, h-2, w, 2)
            
            if self:IsHovered() then
                surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, 80)
                surface.DrawRect(0, 0, 4, h)
            end
        end

        local toggle = vgui.Create("DCheckBox", panel)
        toggle:SetSize(30, 30)
        toggle:SetPos(menuW - 330, 12)
        toggle:SetValue(value)
        toggle.OnChange = function(self, val)
            RunConsoleCommand(convar, val and "1" or "0")
            if callback then callback(val) end
        end
        
        toggle.Paint = function(self, w, h)
            if self:GetChecked() then
                local checkShift = math.sin(animTime * 4) * 0.3 + 0.7
                draw.RoundedBox(4, 0, 0, w, h, Color(color_accent1.r * checkShift, color_accent1.g, color_accent1.b, 255))
                surface.SetDrawColor(255, 100, 100, 200)
                surface.DrawOutlinedRect(0, 0, w, h, 2)
                draw.SimpleText("✓", "TarhunBold", w/2, h/2, color_text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox(4, 0, 0, w, h, Color(30, 30, 35, 255))
                surface.SetDrawColor(60, 60, 70, 255)
                surface.DrawOutlinedRect(0, 0, w, h, 1)
            end
        end
        
        local keybindBtn = vgui.Create("DButton", panel)
        keybindBtn:SetSize(120, 30)
        keybindBtn:SetPos(menuW - 460, 12)
        keybindBtn:SetText("")
        keybindBtn.isBinding = false
        keybindBtn.currentKey = currentKey
        
        keybindBtn.Paint = function(self, w, h)
            local btnColor = self.isBinding and Color(255, 100, 50, 255) or Color(40, 40, 50, 255)
            draw.RoundedBox(4, 0, 0, w, h, btnColor)
            
            if self:IsHovered() or self.isBinding then
                surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, 150)
                surface.DrawOutlinedRect(0, 0, w, h, 2)
            else
                surface.SetDrawColor(80, 80, 90, 255)
                surface.DrawOutlinedRect(0, 0, w, h, 1)
            end
            
            local displayText
            if self.isBinding then
                displayText = "Press key..."
            elseif self.currentKey and self.currentKey > 0 and keyNames[self.currentKey] then
                displayText = keyNames[self.currentKey]
            else
                displayText = "Press a bind..."
            end
            
            draw.SimpleText(displayText, "TarhunSmall", w/2, h/2, color_text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        
        keybindBtn.DoClick = function(self)
            if activeKeybindButton and activeKeybindButton ~= self then
                activeKeybindButton.isBinding = false
            end
            self.isBinding = true
            activeKeybindButton = self
        end
        
        keybindBtn.Think = function(self)
            if self.isBinding then
                for key, name in pairs(keyNames) do
                    if input.IsKeyDown(key) and key ~= KEY_ESCAPE then
                        self.currentKey = key
                        RunConsoleCommand(keybindConvar, tostring(key))
                        if keybindConvar == "tarhun_aimbot_key" then
                            TARHUN_AIMBOT_KEY = key
                        end
                        self.isBinding = false
                        activeKeybindButton = nil
                        return
                    end
                end
                
                if not self.bindStartTime then
                    self.bindStartTime = CurTime()
                end
                
                if CurTime() - self.bindStartTime > 0.2 then
                    if input.IsMouseDown(MOUSE_LEFT) then
                        self.currentKey = MOUSE_LEFT
                        RunConsoleCommand(keybindConvar, tostring(MOUSE_LEFT))
                        if keybindConvar == "tarhun_aimbot_key" then
                            TARHUN_AIMBOT_KEY = MOUSE_LEFT
                        end
                        self.isBinding = false
                        activeKeybindButton = nil
                        self.bindStartTime = nil
                    elseif input.IsMouseDown(MOUSE_RIGHT) then
                        self.currentKey = MOUSE_RIGHT
                        RunConsoleCommand(keybindConvar, tostring(MOUSE_RIGHT))
                        if keybindConvar == "tarhun_aimbot_key" then
                            TARHUN_AIMBOT_KEY = MOUSE_RIGHT
                        end
                        self.isBinding = false
                        activeKeybindButton = nil
                        self.bindStartTime = nil
                    elseif input.IsMouseDown(MOUSE_MIDDLE) then
                        self.currentKey = MOUSE_MIDDLE
                        RunConsoleCommand(keybindConvar, tostring(MOUSE_MIDDLE))
                        if keybindConvar == "tarhun_aimbot_key" then
                            TARHUN_AIMBOT_KEY = MOUSE_MIDDLE
                        end
                        self.isBinding = false
                        activeKeybindButton = nil
                        self.bindStartTime = nil
                    elseif input.IsMouseDown(MOUSE_4) then
                        self.currentKey = MOUSE_4
                        RunConsoleCommand(keybindConvar, tostring(MOUSE_4))
                        if keybindConvar == "tarhun_aimbot_key" then
                            TARHUN_AIMBOT_KEY = MOUSE_4
                        end
                        self.isBinding = false
                        activeKeybindButton = nil
                        self.bindStartTime = nil
                    elseif input.IsMouseDown(MOUSE_5) then
                        self.currentKey = MOUSE_5
                        RunConsoleCommand(keybindConvar, tostring(MOUSE_5))
                        if keybindConvar == "tarhun_aimbot_key" then
                            TARHUN_AIMBOT_KEY = MOUSE_5
                        end
                        self.isBinding = false
                        activeKeybindButton = nil
                        self.bindStartTime = nil
                    end
                end
            else
                self.bindStartTime = nil
            end
        end

        return panel
    end
    
    local function CreateColorPanel(parent, text, convar, colorConvarPrefix, callback)
        local cvar = GetConVar(convar)
        local rCvar = GetConVar(colorConvarPrefix .. "_r")
        local gCvar = GetConVar(colorConvarPrefix .. "_g")
        local bCvar = GetConVar(colorConvarPrefix .. "_b")
        
        if not cvar or not rCvar or not gCvar or not bCvar then return nil end
        
        local value = cvar:GetBool()
        local currentColor = Color(
            rCvar:GetInt(),
            gCvar:GetInt(),
            bCvar:GetInt()
        )
        
        local panel = vgui.Create("DPanel", parent)
        panel:SetSize(menuW - 270, 55)
        panel:Dock(TOP)
        panel:DockMargin(0, 0, 0, 10)
        panel.Paint = function(self, w, h)
            local bgShift = getCachedSin(animTime * 1.5 + (self:GetY() or 0) * 0.01) * 0.2 + 0.8
            for i = 0, h do
                local fraction = i / h
                local alpha = Lerp(fraction, 50, 25) * bgShift
                surface.SetDrawColor(15, 15, 20, alpha)
                surface.DrawRect(0, i, w, 1)
            end
            
            local textShift = getCachedSin(animTime * 2 + (self:GetY() or 0) * 0.02) * 0.3 + 0.7
            local textR = Lerp(textShift, 255, 200)
            local textG = Lerp(textShift, 255, 100)
            local textB = Lerp(textShift, 255, 120)
            draw.SimpleText(text, "TarhunNormal", 20, h/2, Color(textR, textG, textB, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            
            local lineAlpha = getCachedSin(animTime * 3) * 50 + 200
            surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, lineAlpha)
            surface.DrawRect(0, h-2, w, 2)
            
            if self:IsHovered() then
                surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, 80)
                surface.DrawRect(0, 0, 4, h)
            end
        end

        local toggle = vgui.Create("DCheckBox", panel)
        toggle:SetSize(30, 30)
        toggle:SetPos(menuW - 330, 12)
        toggle:SetValue(value)
        toggle.OnChange = function(self, val)
            RunConsoleCommand(convar, val and "1" or "0")
            if callback then callback(val) end
        end
        
        toggle.Paint = function(self, w, h)
            if self:GetChecked() then
                local checkShift = getCachedSin(animTime * 4) * 0.3 + 0.7
                draw.RoundedBox(4, 0, 0, w, h, Color(color_accent1.r * checkShift, color_accent1.g, color_accent1.b, 255))
                surface.SetDrawColor(255, 100, 100, 200)
                surface.DrawOutlinedRect(0, 0, w, h, 2)
                draw.SimpleText("✓", "TarhunBold", w/2, h/2, color_text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox(4, 0, 0, w, h, Color(30, 30, 35, 255))
                surface.SetDrawColor(60, 60, 70, 255)
                surface.DrawOutlinedRect(0, 0, w, h, 1)
            end
        end
        
        local colorBtn = vgui.Create("DButton", panel)
        colorBtn:SetSize(120, 30)
        colorBtn:SetPos(menuW - 460, 12)
        colorBtn:SetText("")
        
        colorBtn.Paint = function(self, w, h)
            draw.RoundedBox(4, 0, 0, w, h, currentColor)
            
            if self:IsHovered() then
                surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, 150)
                surface.DrawOutlinedRect(0, 0, w, h, 2)
            else
                surface.SetDrawColor(255, 255, 255, 100)
                surface.DrawOutlinedRect(0, 0, w, h, 1)
            end
            
            draw.SimpleText("COLOR", "TarhunSmall", w/2, h/2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        
        colorBtn.DoClick = function(self)
            local colorMixer = vgui.Create("DFrame")
            colorMixer:SetSize(300, 250)
            colorMixer:Center()
            colorMixer:SetTitle("Choose Color")
            colorMixer:MakePopup()
            
            local mixer = vgui.Create("DColorMixer", colorMixer)
            mixer:Dock(FILL)
            mixer:SetColor(currentColor)
            mixer:SetAlphaBar(false)
            
            mixer.ValueChanged = function(self, col)
                currentColor = col
                RunConsoleCommand(colorConvarPrefix .. "_r", tostring(col.r))
                RunConsoleCommand(colorConvarPrefix .. "_g", tostring(col.g))
                RunConsoleCommand(colorConvarPrefix .. "_b", tostring(col.b))
                
                if colorConvarPrefix == "tarhun_fov_color" then
                    TARHUN_FOV_COLOR = Color(col.r, col.g, col.b, 100)
                elseif colorConvarPrefix == "tarhun_box_color" then
                    TARHUN_BOX_COLOR = Color(col.r, col.g, col.b, 200)
                end
            end
        end

        return panel
    end

    local function CreateSettingPanel(parent, text, convar, callback)
        local cvar = GetConVar(convar)
        if not cvar then return nil end
        
        local value = cvar:GetBool()
        
        local panel = vgui.Create("DPanel", parent)
        panel:SetSize(menuW - 270, 55)
        panel:Dock(TOP)
        panel:DockMargin(0, 0, 0, 10)
        panel.Paint = function(self, w, h)
            local bgShift = math.sin(animTime * 1.5 + self:GetY() * 0.01) * 0.2 + 0.8
            for i = 0, h do
                local fraction = i / h
                local alpha = Lerp(fraction, 50, 25) * bgShift
                surface.SetDrawColor(15, 15, 20, alpha)
                surface.DrawRect(0, i, w, 1)
            end
            
            local textShift = math.sin(animTime * 2 + self:GetY() * 0.02) * 0.3 + 0.7
            local textR = Lerp(textShift, 255, 200)
            local textG = Lerp(textShift, 255, 100)
            local textB = Lerp(textShift, 255, 120)
            draw.SimpleText(text, "TarhunNormal", 20, h/2, Color(textR, textG, textB, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            
            local lineAlpha = math.sin(animTime * 3) * 50 + 200
            surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, lineAlpha)
            surface.DrawRect(0, h-2, w, 2)
            
            if self:IsHovered() then
                surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, 80)
                surface.DrawRect(0, 0, 4, h)
            end
        end

        local toggle = vgui.Create("DCheckBox", panel)
        toggle:SetSize(30, 30)
        toggle:SetPos(menuW - 330, 12)
        toggle:SetValue(value)
        toggle.OnChange = function(self, val)
            RunConsoleCommand(convar, val and "1" or "0")
            if callback then callback(val) end
        end
        
        toggle.Paint = function(self, w, h)
            if self:GetChecked() then
                local checkShift = math.sin(animTime * 4) * 0.3 + 0.7
                draw.RoundedBox(4, 0, 0, w, h, Color(color_accent1.r * checkShift, color_accent1.g, color_accent1.b, 255))
                surface.SetDrawColor(255, 100, 100, 200)
                surface.DrawOutlinedRect(0, 0, w, h, 2)
                draw.SimpleText("✓", "TarhunBold", w/2, h/2, color_text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox(4, 0, 0, w, h, Color(30, 30, 35, 255))
                surface.SetDrawColor(60, 60, 70, 255)
                surface.DrawOutlinedRect(0, 0, w, h, 1)
            end
        end

        return panel
    end

    local function CreateSliderPanel(parent, text, min, max, convar, callback)
        local cvar = GetConVar(convar)
        if not cvar then return nil end
        
        local value = cvar:GetInt()
        
        local panel = vgui.Create("DPanel", parent)
        panel:SetSize(menuW - 270, 90)
        panel:Dock(TOP)
        panel:DockMargin(0, 0, 0, 10)
        
        local currentValue = value
        
        panel.Paint = function(self, w, h)
            local bgShift = math.sin(animTime * 1.5 + self:GetY() * 0.01) * 0.2 + 0.8
            for i = 0, h do
                local fraction = i / h
                local alpha = Lerp(fraction, 50, 25) * bgShift
                surface.SetDrawColor(15, 15, 20, alpha)
                surface.DrawRect(0, i, w, 1)
            end
            
            local textShift = math.sin(animTime * 2 + self:GetY() * 0.02) * 0.3 + 0.7
            local textR = Lerp(textShift, 255, 200)
            local textG = Lerp(textShift, 255, 100)
            local textB = Lerp(textShift, 255, 120)
            draw.SimpleText(text, "TarhunNormal", 20, 25, Color(textR, textG, textB, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            
            local lineAlpha = math.sin(animTime * 3) * 50 + 200
            surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, lineAlpha)
            surface.DrawRect(0, h-2, w, 2)
        end

        local slider = vgui.Create("DNumSlider", panel)
        slider:SetSize(menuW - 310, 40)
        slider:SetPos(20, 50)
        slider:SetText("")
        slider:SetMin(min)
        slider:SetMax(max)
        slider:SetValue(value)
        slider:SetDecimals(0)
        
        slider.Slider.Paint = function(self, w, h)
            local fraction = (currentValue - min) / (max - min)
            
            draw.RoundedBox(3, 0, h/2-4, w, 8, Color(30, 30, 35, 255))
            
            for i = 0, w * fraction do
                local frac = i / (w * fraction)
                local colorShift = math.sin(animTime * 3 + frac * 5) * 0.3 + 0.7
                local r = Lerp(colorShift, 180, 255)
                local g = Lerp(colorShift, 20, 60)
                local b = Lerp(colorShift, 40, 100)
                surface.SetDrawColor(r, g, b, 255)
                surface.DrawRect(i, h/2-4, 1, 8)
            end
            
            local pos = (w - 20) * fraction
            local handlePulse = math.sin(animTime * 5) * 0.2 + 0.8
            draw.RoundedBox(10, pos, h/2-12, 20, 24, Color(color_accent1.r * handlePulse, color_accent1.g, color_accent1.b, 255))
            surface.SetDrawColor(255, 100, 100, 200)
            surface.DrawOutlinedRect(pos, h/2-12, 20, 24, 2)
        end
        
        slider.OnValueChanged = function(self, val)
            currentValue = val
            RunConsoleCommand(convar, tostring(math.Round(val)))
            if callback then callback(val) end
            panel:GetParent():InvalidateLayout()
        end

        return panel
    end

    local function UpdateContent()
        contentScroll:Clear()
        
        if currentTab ~= "SHIT" then
            local sectionHeader = vgui.Create("DPanel", contentScroll)
            sectionHeader:SetSize(menuW - 290, 70)
            sectionHeader:Dock(TOP)
            sectionHeader:DockMargin(0, 0, 0, 15)
            sectionHeader.Paint = function(self, w, h)
                for i = 0, h do
                    local fraction = i / h
                    local colorShift = math.sin(animTime * 2 + fraction * 3) * 0.3 + 0.7
                    local r = Lerp(fraction, 150 * colorShift, 80)
                    local g = Lerp(fraction, 20, 10)
                    local b = Lerp(fraction, 40, 10)
                    surface.SetDrawColor(r, g, b, 220)
                    surface.DrawRect(0, i, w, 1)
                end
                
                local titleShift = math.sin(animTime * 3) * 0.4 + 0.6
                local titleR = Lerp(titleShift, 255, 200)
                local titleG = Lerp(titleShift, 255, 80)
                local titleB = Lerp(titleShift, 255, 100)
                
                draw.SimpleText(currentTab .. " SETTINGS", "TarhunTitle", w/2 + 2, h/2 + 2, Color(0, 0, 0, 120), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(currentTab .. " SETTINGS", "TarhunTitle", w/2, h/2, Color(titleR, titleG, titleB, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                
                local lineAlpha = math.sin(animTime * 4) * 80 + 170
                surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, lineAlpha)
                surface.DrawRect(0, h-4, w, 4)
            end
        end

        if currentTab == "AIMBOT" then
            CreateKeybindPanel(contentScroll, "Aimbot Enabled", "tarhun_aimbot", "tarhun_aimbot_key", function(val)
                TARHUN_AIMBOT_ENABLED = val
            end)
            
            CreateSliderPanel(contentScroll, "FOV", 1, 180, "tarhun_fov", function(val)
                TARHUN_FOV = val
            end)
            
            CreateSettingPanel(contentScroll, "Ignore Team", "tarhun_ignore_team", function(val)
                TARHUN_IGNORE_TEAM = val
            end)
            
            CreateSettingPanel(contentScroll, "Silent Aim", "tarhun_silent_aim", function(val)
                TARHUN_SILENT_AIM_ENABLED = val
            end)
            
            CreateColorPanel(contentScroll, "Draw FOV Circle", "tarhun_draw_fov", "tarhun_fov_color", function(val)
                TARHUN_DRAW_FOV = val
            end)

            local weaponHeader = vgui.Create("DPanel", contentScroll)
            weaponHeader:SetSize(365, 45)
            weaponHeader:Dock(TOP)
            weaponHeader:DockMargin(0, 15, 0, 8)
            weaponHeader.Paint = function(self, w, h)
                draw.SimpleText("WEAPON SETTINGS", "TarhunBold", w/2, h/2, color_accent2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, 100)
                surface.DrawRect(0, h-1, w, 1)
            end

            CreateSettingPanel(contentScroll, "No Recoil", "tarhun_norecoil", function(val)
                TARHUN_NORECOIL = val
            end)
            
            CreateSettingPanel(contentScroll, "No Spread", "tarhun_nospread", function(val)
                TARHUN_NOSPREAD = val
            end)

            CreateSettingPanel(contentScroll, "No Camera Shake", "disable_spray", function(val)
                RunConsoleCommand("disable_spray", val and "1" or "0")
            end)
            
            local applyButton = vgui.Create("DButton", contentScroll)
            applyButton:SetSize(365, 65)
            applyButton:SetText("APPLY ALL WEAPON SETTINGS")
            applyButton:SetTextColor(color_text)
            applyButton:SetFont("TarhunBold")
            applyButton:Dock(TOP)
            applyButton:DockMargin(0, 15, 0, 8)
            applyButton.DoClick = function()
                RunConsoleCommand("tarhun_norecoil", "1")
                RunConsoleCommand("tarhun_nospread", "1")
                RunConsoleCommand("disable_spray", "1")
                UpdateContent()
            end
            
            applyButton.Paint = function(self, w, h)
                if self:IsHovered() then
                    for i = 0, h do
                        local fraction = i / h
                        local r = Lerp(fraction, 200, 120)
                        local g = Lerp(fraction, 30, 15)
                        local b = Lerp(fraction, 30, 15)
                        surface.SetDrawColor(r, g, b, 255)
                        surface.DrawRect(0, i, w, 1)
                    end
                    surface.SetDrawColor(255, 100, 100, 200)
                    surface.DrawOutlinedRect(0, 0, w, h, 2)
                else
                    for i = 0, h do
                        local fraction = i / h
                        local r = Lerp(fraction, 120, 60)
                        local g = Lerp(fraction, 15, 8)
                        local b = Lerp(fraction, 15, 8)
                        surface.SetDrawColor(r, g, b, 255)
                        surface.DrawRect(0, i, w, 1)
                    end
                    surface.SetDrawColor(color_accent1)
                    surface.DrawOutlinedRect(0, 0, w, h, 1)
                end
            end
            
        elseif currentTab == "VISUALS" then
            CreateSettingPanel(contentScroll, "ESP Enabled", "tarhun_esp", function(val)
                TARHUN_ESP_ENABLED = val
            end)
            
            CreateColorPanel(contentScroll, "2D Box", "tarhun_esp_box", "tarhun_box_color", function(val)
                TARHUN_ESP_BOX = val
            end)
            
            CreateSettingPanel(contentScroll, "Skeleton ESP", "tarhun_esp_skeleton", function(val)
                TARHUN_ESP_SKELETON = val
            end)
            
            CreateSettingPanel(contentScroll, "Player Name", "tarhun_esp_name", function(val)
                TARHUN_ESP_NAME = val
            end)
            
            CreateSettingPanel(contentScroll, "Health Bar", "tarhun_esp_bar", function(val)
                TARHUN_ESP_BAR = val
            end)
            
            CreateSettingPanel(contentScroll, "Health Text", "tarhun_esp_health", function(val)
                TARHUN_ESP_HEALTH = val
            end)
            
            CreateSettingPanel(contentScroll, "Weapon", "tarhun_esp_weapon", function(val)
                TARHUN_ESP_WEAPON = val
            end)
            
            CreateSettingPanel(contentScroll, "Distance", "tarhun_esp_distance", function(val)
                TARHUN_ESP_DISTANCE = val
            end)
            
            CreateSettingPanel(contentScroll, "Muzzle Crosshair", "tarhun_dot", function(val)
                TARHUN_DOT_ENABLED = val
            end)
            
        elseif currentTab == "MISC" then
            CreateSettingPanel(contentScroll, "Bunny Hop", "tarhun_bhop", function(val)
                TARHUN_BHOP_ENABLED = val
            end)
            
            CreateSettingPanel(contentScroll, "Anti-Aim", "tarhun_antiaim", function(val)
            end)
            
            CreateSliderPanel(contentScroll, "Anti-Aim Power", 1, 30, "tarhun_antiaim_power", function(val)
            end)

            CreateSliderPanel(contentScroll, "Anti-Aim Speed", 1, 10, "tarhun_antiaim_speed", function(val)
            end)

            local modePanel = vgui.Create("DPanel", contentScroll)
            modePanel:SetSize(365, 65)
            modePanel:Dock(TOP)
            modePanel:DockMargin(0, 0, 0, 8)
            modePanel.Paint = function(self, w, h)
                for i = 0, h do
                    local fraction = i / h
                    local alpha = Lerp(fraction, 40, 20)
                    surface.SetDrawColor(color_content.r, color_content.g, color_content.b, alpha)
                    surface.DrawRect(0, i, w, 1)
                end
                draw.SimpleText("Anti-Aim Mode", "TarhunNormal", 15, 18, color_text, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
                surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, 150)
                surface.DrawRect(0, h-2, w, 2)
            end

            local modeCombo = vgui.Create("DComboBox", modePanel)
            modeCombo:SetSize(160, 28)
            modeCombo:SetPos(190, 18)
            modeCombo:SetValue("Jitter")
            modeCombo:AddChoice("Jitter")
            modeCombo:AddChoice("Spin")
            modeCombo:AddChoice("Random")
            modeCombo.OnSelect = function(self, index, value)
                RunConsoleCommand("tarhun_antiaim_mode", tostring(index-1))
            end
            
            modeCombo.Paint = function(self, w, h)
                draw.RoundedBox(4, 0, 0, w, h, Color(40, 40, 45, 255))
                surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, 150)
                surface.DrawOutlinedRect(0, 0, w, h, 1)
            end

            timer.Simple(0.1, function()
                if IsValid(modeCombo) then
                    local modeCvar = GetConVar("tarhun_antiaim_mode")
                    if modeCvar then
                        local currentMode = modeCvar:GetInt()
                        modeCombo:ChooseOptionID(currentMode + 1)
                    end
                end
            end)
            
            CreateSettingPanel(contentScroll, "Anti Screengrab (Test)", "tarhun_antiscreen", function(val)
            end)

            CreateSettingPanel(contentScroll, "Watermark", "tarhun_watermark", function(val)
                TARHUN_WATERMARK_ENABLED = val
            end)
            
            CreateSettingPanel(contentScroll, "Third Person", "tarhun_thirdperson", function(val)
                TARHUN_THIRDPERSON = val
            end)
            
            local speedPanel = vgui.Create("DPanel", contentScroll)
            speedPanel:SetSize(365, 65)
            speedPanel:Dock(TOP)
            speedPanel:DockMargin(0, 0, 0, 8)
            speedPanel.Paint = function(self, w, h)
                for i = 0, h do
                    local fraction = i / h
                    local alpha = Lerp(fraction, 40, 20)
                    surface.SetDrawColor(color_content.r, color_content.g, color_content.b, alpha)
                    surface.DrawRect(0, i, w, 1)
                end
                draw.SimpleText("Speed Multiplier", "TarhunNormal", 15, 18, color_text, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
                surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, 150)
                surface.DrawRect(0, h-2, w, 2)
            end

            local speedCombo = vgui.Create("DComboBox", speedPanel)
            speedCombo:SetSize(160, 28)
            speedCombo:SetPos(190, 18)
            speedCombo:SetValue("Normal")
            speedCombo:AddChoice("Very Slow")
            speedCombo:AddChoice("Normal")
            speedCombo:AddChoice("Fast")
            speedCombo:AddChoice("Very Fast")
            speedCombo.OnSelect = function(self, index, value)
                RunConsoleCommand("tarhun_speed_multiplier", tostring(index-1))
                TARHUN_SPEED_MULTIPLIER = index-1
            end
            
            speedCombo.Paint = function(self, w, h)
                draw.RoundedBox(4, 0, 0, w, h, Color(40, 40, 45, 255))
                surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, 150)
                surface.DrawOutlinedRect(0, 0, w, h, 1)
            end

            timer.Simple(0.1, function()
                if IsValid(speedCombo) then
                    local speedCvar = GetConVar("tarhun_speed_multiplier")
                    if speedCvar then
                        local currentSpeed = speedCvar:GetInt()
                        speedCombo:ChooseOptionID(currentSpeed + 1)
                    end
                end
            end)
            
            local chatSpamPanel = vgui.Create("DPanel", contentScroll)
            chatSpamPanel:SetSize(365, 190)
            chatSpamPanel:Dock(TOP)
            chatSpamPanel:DockMargin(0, 10, 0, 10)
            chatSpamPanel.Paint = function(self, w, h)
                for i = 0, h do
                    local fraction = i / h
                    local alpha = Lerp(fraction, 50, 25)
                    surface.SetDrawColor(15, 15, 20, alpha)
                    surface.DrawRect(0, i, w, 1)
                end
                
                local textShift = math.sin(animTime * 2) * 0.3 + 0.7
                local textR = Lerp(textShift, 255, 200)
                local textG = Lerp(textShift, 255, 100)
                local textB = Lerp(textShift, 255, 120)
                draw.SimpleText("Chat Spam", "TarhunBold", 15, 15, Color(textR, textG, textB, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                
                local lineAlpha = math.sin(animTime * 3) * 50 + 200
                surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, lineAlpha)
                surface.DrawRect(0, h-2, w, 2)
            end
            
            local chatInput = vgui.Create("DTextEntry", chatSpamPanel)
            chatInput:SetSize(340, 30)
            chatInput:SetPos(12, 40)
            chatInput:SetPlaceholderText("Enter message to spam...")
            chatInput:SetFont("TarhunNormal")
            
            local chatMsgCvar = GetConVar("tarhun_chat_message")
            if chatMsgCvar then
                chatInput:SetValue(chatMsgCvar:GetString())
            end
            
            chatInput.OnChange = function(self)
                local text = self:GetValue()
                RunConsoleCommand("tarhun_chat_message", text)
                TARHUN_CHAT_MESSAGE = text
            end
            
            chatInput.Paint = function(self, w, h)
                draw.RoundedBox(4, 0, 0, w, h, Color(30, 30, 35, 255))
                surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, 100)
                surface.DrawOutlinedRect(0, 0, w, h, 1)
                self:DrawTextEntryText(color_text, color_accent2, color_text)
            end
            
            local delayLabel = vgui.Create("DLabel", chatSpamPanel)
            delayLabel:SetPos(12, 80)
            delayLabel:SetSize(150, 20)
            delayLabel:SetFont("TarhunSmall")
            delayLabel:SetText("Delay (seconds):")
            delayLabel:SetTextColor(color_text_dim)
            
            local delaySlider = vgui.Create("DNumSlider", chatSpamPanel)
            delaySlider:SetPos(150, 75)
            delaySlider:SetSize(200, 30)
            delaySlider:SetMin(0.1)
            delaySlider:SetMax(10)
            delaySlider:SetDecimals(1)
            
            local delayCvar = GetConVar("tarhun_chat_delay")
            if delayCvar then
                delaySlider:SetValue(delayCvar:GetFloat())
            end
            
            delaySlider.OnValueChanged = function(self, value)
                RunConsoleCommand("tarhun_chat_delay", tostring(value))
                TARHUN_CHAT_DELAY = value
            end
            
            delaySlider.Label:SetVisible(false)
            delaySlider.TextArea:SetFont("TarhunSmall")
            delaySlider.TextArea:SetTextColor(color_text)
            
            delaySlider.Slider.Paint = function(self, w, h)
                draw.RoundedBox(4, 0, h/2 - 2, w, 4, Color(40, 40, 45, 255))
                
                local fraction = (delaySlider:GetValue() - 0.1) / (10 - 0.1)
                draw.RoundedBox(4, 0, h/2 - 2, w * fraction, 4, color_accent1)
            end
            
            delaySlider.Slider.Knob.Paint = function(self, w, h)
                draw.RoundedBox(8, 0, 0, w, h, color_accent2)
                if self:IsHovered() then
                    surface.SetDrawColor(255, 100, 100, 150)
                    surface.DrawOutlinedRect(0, 0, w, h, 2)
                end
            end
            
            local repeatLabel = vgui.Create("DLabel", chatSpamPanel)
            repeatLabel:SetPos(12, 110)
            repeatLabel:SetSize(150, 20)
            repeatLabel:SetFont("TarhunSmall")
            repeatLabel:SetText("Repeat count:")
            repeatLabel:SetTextColor(color_text_dim)
            
            local repeatSlider = vgui.Create("DNumSlider", chatSpamPanel)
            repeatSlider:SetPos(150, 105)
            repeatSlider:SetSize(200, 30)
            repeatSlider:SetMin(1)
            repeatSlider:SetMax(50)
            repeatSlider:SetDecimals(0)
            
            local repeatCvar = GetConVar("tarhun_chat_repeat")
            if repeatCvar then
                repeatSlider:SetValue(repeatCvar:GetInt())
            end
            
            repeatSlider.OnValueChanged = function(self, value)
                RunConsoleCommand("tarhun_chat_repeat", tostring(math.floor(value)))
                TARHUN_CHAT_REPEAT = math.floor(value)
            end
            
            repeatSlider.Label:SetVisible(false)
            repeatSlider.TextArea:SetFont("TarhunSmall")
            repeatSlider.TextArea:SetTextColor(color_text)
            
            repeatSlider.Slider.Paint = function(self, w, h)
                draw.RoundedBox(4, 0, h/2 - 2, w, 4, Color(40, 40, 45, 255))
                
                local fraction = (repeatSlider:GetValue() - 1) / (50 - 1)
                draw.RoundedBox(4, 0, h/2 - 2, w * fraction, 4, color_accent1)
            end
            
            repeatSlider.Slider.Knob.Paint = function(self, w, h)
                draw.RoundedBox(8, 0, 0, w, h, color_accent2)
                if self:IsHovered() then
                    surface.SetDrawColor(255, 100, 100, 150)
                    surface.DrawOutlinedRect(0, 0, w, h, 2)
                end
            end
            
            local spamButton = vgui.Create("DButton", chatSpamPanel)
            spamButton:SetSize(340, 35)
            spamButton:SetPos(12, 145)
            spamButton:SetText("")
            
            local spamCvar = GetConVar("tarhun_chat_spam")
            local isSpamming = spamCvar and spamCvar:GetBool() or false
            
            spamButton.Paint = function(self, w, h)
                local btnColor = isSpamming and Color(255, 50, 50, 255) or Color(50, 200, 50, 255)
                if self:IsHovered() then
                    btnColor = Color(btnColor.r + 30, btnColor.g + 30, btnColor.b + 30, 255)
                end
                
                draw.RoundedBox(0, 0, 0, w, h, btnColor)
                
                if self:IsHovered() then
                    surface.SetDrawColor(255, 255, 255, 100)
                    surface.DrawOutlinedRect(0, 0, w, h, 2)
                end
                
                local btnText = isSpamming and "STOP SPAM" or "START SPAM"
                draw.SimpleText(btnText, "TarhunBold", w/2, h/2, color_text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
            
            spamButton.DoClick = function(self)
                isSpamming = not isSpamming
                RunConsoleCommand("tarhun_chat_spam", isSpamming and "1" or "0")
                TARHUN_CHAT_SPAM = isSpamming
            end
            
            local infoPanel = vgui.Create("DPanel", contentScroll)
            infoPanel:SetSize(365, 140)
            infoPanel:Dock(TOP)
            infoPanel:DockMargin(0, 15, 0, 0)
            infoPanel.Paint = function(self, w, h)
                for i = 0, h do
                    local fraction = i / h
                    local alpha = Lerp(fraction, 50, 25)
                    surface.SetDrawColor(color_content.r, color_content.g, color_content.b, alpha)
                    surface.DrawRect(0, i, w, 1)
                end
                
                draw.SimpleText("Fuck you.", "TarhunBold", w/2, 22, color_accent2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("Be t a", "TarhunNormal", 15, 50, color_text_dim, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText("Press M for Menu", "TarhunNormal", 15, 72, color_text_dim, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText("Press B for Aimbot", "TarhunNormal", 15, 94, color_text_dim, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText("MAGNIT EDITION", "TarhunNormal", 15, 116, color_accent2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                
                surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, 150)
                surface.DrawRect(0, h-2, w, 2)
            end
        
        elseif currentTab == "SHIT" then
            local shitHeader = vgui.Create("DPanel", contentScroll)
            shitHeader:SetSize(menuW - 290, 60)
            shitHeader:Dock(TOP)
            shitHeader:DockMargin(0, 0, 0, 15)
            shitHeader.Paint = function(self, w, h)
                for i = 0, h do
                    local fraction = i / h
                    local colorShift = math.sin(animTime * 2 + fraction * 3) * 0.3 + 0.7
                    local r = Lerp(fraction, 150 * colorShift, 80)
                    local g = Lerp(fraction, 20, 10)
                    local b = Lerp(fraction, 40, 10)
                    surface.SetDrawColor(r, g, b, 220)
                    surface.DrawRect(0, i, w, 1)
                end
                
                local titleShift = math.sin(animTime * 3) * 0.4 + 0.6
                local titleR = Lerp(titleShift, 255, 200)
                local titleG = Lerp(titleShift, 255, 80)
                local titleB = Lerp(titleShift, 255, 100)
                
                draw.SimpleText("ОБРАЩЕНИЕ КЕРАСИНО КЕРАСИНОВИЧА", "TarhunBold", w/2, h/2 - 10, Color(titleR, titleG, titleB, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("ФИЛЛИПОВИЧА К ИГРОКАМ ХОМИГРАДА", "TarhunBold", w/2, h/2 + 15, Color(titleR, titleG, titleB, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                
                local lineAlpha = math.sin(animTime * 4) * 80 + 170
                surface.SetDrawColor(color_accent2.r, color_accent2.g, color_accent2.b, lineAlpha)
                surface.DrawRect(0, h-4, w, 4)
            end
            
            local customText = [[
Вот вы дегенераты? скажи те мне люду простому зачем вы просто говорите на пол
на постоянке? вам с этого приятно?
ГДЕ рп ГДЕ интересность играть?
вы просто говорите на пол тем самым сделав игру невозможной особенно те
кто даже не успевают договорить и сразу стреляют на поражение обращение к вам:
И Д И Т Е Н А Х У Й! еба я как жириновский сказал xddd
]]
            
            local textPanel = vgui.Create("DPanel", contentScroll)
            textPanel:SetSize(menuW - 290, 400)
            textPanel:Dock(TOP)
            textPanel:DockMargin(0, 0, 0, 15)
            textPanel.Paint = function(self, w, h)
                for i = 0, h do
                    local fraction = i / h
                    local bgShift = math.sin(animTime * 1.5 + self:GetY() * 0.01) * 0.2 + 0.8
                    local alpha = Lerp(fraction, 50, 25) * bgShift
                    surface.SetDrawColor(15, 15, 20, alpha)
                    surface.DrawRect(0, i, w, 1)
                end
                
                surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, 150)
                surface.DrawOutlinedRect(0, 0, w, h, 2)
                
                local lines = string.Explode("\n", customText)
                local yPos = 20
                for _, line in ipairs(lines) do
                    local textShift = math.sin(animTime * 2 + yPos * 0.01) * 0.3 + 0.7
                    local textR = Lerp(textShift, 255, 200)
                    local textG = Lerp(textShift, 255, 100)
                    local textB = Lerp(textShift, 255, 120)
                    
                    draw.SimpleText(line, "TarhunNormal", 20, yPos, Color(textR, textG, textB, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
                    yPos = yPos + 25
                end
                
                local lineAlpha = math.sin(animTime * 3) * 50 + 200
                surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, lineAlpha)
                surface.DrawRect(0, h-2, w, 2)
            end
        end
    end

    local navButtons = {
        {name = "AIMBOT"},
        {name = "VISUALS"},
        {name = "MISC"},
        {name = "SHIT"}
    }

    for i, btnInfo in ipairs(navButtons) do
        local navBtn = vgui.Create("DButton", leftPanel)
        navBtn:SetSize(190, 65)
        navBtn:SetPos(5, 10 + (i-1)*75)
        navBtn:SetText(btnInfo.name)
        navBtn:SetFont("TarhunBold")
        
        navBtn.Paint = function(self, w, h)
            if currentTab == btnInfo.name then
                for j = 0, h do
                    local fraction = j / h
                    local colorShift = math.sin(animTime * 3 + fraction * 2) * 0.3 + 0.7
                    local r = Lerp(fraction, 200 * colorShift, 100)
                    local g = Lerp(fraction, 20, 10)
                    local b = Lerp(fraction, 40, 10)
                    surface.SetDrawColor(r, g, b, 255)
                    surface.DrawRect(0, j, w, 1)
                end
                
                local textShift = math.sin(animTime * 4) * 0.3 + 0.7
                navBtn:SetTextColor(Color(255 * textShift, 255 * textShift, 255, 255))
                
                surface.SetDrawColor(255, 100, 100, 220)
                surface.DrawOutlinedRect(0, 0, w, h, 3)
            else
                draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 20, 255))
                navBtn:SetTextColor(color_text_dim)
                
                if self:IsHovered() then
                    for j = 0, h do
                        local fraction = j / h
                        local hoverShift = math.sin(animTime * 4) * 0.2 + 0.8
                        local alpha = Lerp(fraction, 100, 50) * hoverShift
                        surface.SetDrawColor(color_accent1.r, color_accent1.g, color_accent1.b, alpha)
                        surface.DrawRect(0, j, w, 1)
                    end
                    navBtn:SetTextColor(color_text)
                end
            end
        end
        
        navBtn.DoClick = function()
            currentTab = btnInfo.name
            UpdateContent()
        end
    end

    UpdateContent()
end

local function SetupConVarCallbacks()
    cvars.AddChangeCallback("tarhun_aimbot", function(_, _, new) TARHUN_AIMBOT_ENABLED = tobool(new) end)
    cvars.AddChangeCallback("tarhun_silent_aim", function(_, _, new) TARHUN_SILENT_AIM_ENABLED = tobool(new) end)
    cvars.AddChangeCallback("tarhun_fov", function(_, _, new) TARHUN_FOV = tonumber(new) end)
    cvars.AddChangeCallback("tarhun_ignore_team", function(_, _, new) TARHUN_IGNORE_TEAM = tobool(new) end)
    cvars.AddChangeCallback("tarhun_esp", function(_, _, new) TARHUN_ESP_ENABLED = tobool(new) end)
    cvars.AddChangeCallback("tarhun_draw_fov", function(_, _, new) TARHUN_DRAW_FOV = tobool(new) end)
    cvars.AddChangeCallback("tarhun_dot", function(_, _, new) TARHUN_DOT_ENABLED = tobool(new) end)
    cvars.AddChangeCallback("tarhun_norecoil", function(_, _, new) TARHUN_NORECOIL = tobool(new) end)
    cvars.AddChangeCallback("tarhun_nospread", function(_, _, new) TARHUN_NOSPREAD = tobool(new) end)
    cvars.AddChangeCallback("tarhun_bhop", function(_, _, new) TARHUN_BHOP_ENABLED = tobool(new) end)
    cvars.AddChangeCallback("tarhun_watermark", function(_, _, new) TARHUN_WATERMARK_ENABLED = tobool(new) end)
    
    cvars.AddChangeCallback("tarhun_esp_box", function(_, _, new) TARHUN_ESP_BOX = tobool(new) end)
    cvars.AddChangeCallback("tarhun_esp_skeleton", function(_, _, new) TARHUN_ESP_SKELETON = tobool(new) end)
    cvars.AddChangeCallback("tarhun_esp_name", function(_, _, new) TARHUN_ESP_NAME = tobool(new) end)
    cvars.AddChangeCallback("tarhun_esp_health", function(_, _, new) TARHUN_ESP_HEALTH = tobool(new) end)
    cvars.AddChangeCallback("tarhun_esp_weapon", function(_, _, new) TARHUN_ESP_WEAPON = tobool(new) end)
    cvars.AddChangeCallback("tarhun_esp_distance", function(_, _, new) TARHUN_ESP_DISTANCE = tobool(new) end)
    cvars.AddChangeCallback("tarhun_esp_bar", function(_, _, new) TARHUN_ESP_BAR = tobool(new) end)
    
    cvars.AddChangeCallback("tarhun_aimbot_key", function(_, _, new) TARHUN_AIMBOT_KEY = tonumber(new) end)
    
    cvars.AddChangeCallback("tarhun_custom_fov", function(_, _, new) TARHUN_CUSTOM_FOV = tonumber(new) end)
    cvars.AddChangeCallback("tarhun_thirdperson", function(_, _, new) TARHUN_THIRDPERSON = tobool(new) end)
    
    cvars.AddChangeCallback("tarhun_chat_spam", function(_, _, new) TARHUN_CHAT_SPAM = tobool(new) end)
    cvars.AddChangeCallback("tarhun_chat_message", function(_, _, new) TARHUN_CHAT_MESSAGE = new end)
    cvars.AddChangeCallback("tarhun_chat_delay", function(_, _, new) TARHUN_CHAT_DELAY = tonumber(new) end)
    cvars.AddChangeCallback("tarhun_chat_repeat", function(_, _, new) TARHUN_CHAT_REPEAT = tonumber(new) end)
    
    cvars.AddChangeCallback("tarhun_fov_color_r", function()
        local rCvar = GetConVar("tarhun_fov_color_r")
        local gCvar = GetConVar("tarhun_fov_color_g")
        local bCvar = GetConVar("tarhun_fov_color_b")
        if rCvar and gCvar and bCvar then
            TARHUN_FOV_COLOR = Color(
                rCvar:GetInt(),
                gCvar:GetInt(),
                bCvar:GetInt(),
                100
            )
        end
    end)
    cvars.AddChangeCallback("tarhun_fov_color_g", function()
        local rCvar = GetConVar("tarhun_fov_color_r")
        local gCvar = GetConVar("tarhun_fov_color_g")
        local bCvar = GetConVar("tarhun_fov_color_b")
        if rCvar and gCvar and bCvar then
            TARHUN_FOV_COLOR = Color(
                rCvar:GetInt(),
                gCvar:GetInt(),
                bCvar:GetInt(),
                100
            )
        end
    end)
    cvars.AddChangeCallback("tarhun_fov_color_b", function()
        local rCvar = GetConVar("tarhun_fov_color_r")
        local gCvar = GetConVar("tarhun_fov_color_g")
        local bCvar = GetConVar("tarhun_fov_color_b")
        if rCvar and gCvar and bCvar then
            TARHUN_FOV_COLOR = Color(
                rCvar:GetInt(),
                gCvar:GetInt(),
                bCvar:GetInt(),
                100
            )
        end
    end)
    
    cvars.AddChangeCallback("tarhun_box_color_r", function()
        local rCvar = GetConVar("tarhun_box_color_r")
        local gCvar = GetConVar("tarhun_box_color_g")
        local bCvar = GetConVar("tarhun_box_color_b")
        if rCvar and gCvar and bCvar then
            TARHUN_BOX_COLOR = Color(
                rCvar:GetInt(),
                gCvar:GetInt(),
                bCvar:GetInt(),
                200
            )
        end
    end)
    cvars.AddChangeCallback("tarhun_box_color_g", function()
        local rCvar = GetConVar("tarhun_box_color_r")
        local gCvar = GetConVar("tarhun_box_color_g")
        local bCvar = GetConVar("tarhun_box_color_b")
        if rCvar and gCvar and bCvar then
            TARHUN_BOX_COLOR = Color(
                rCvar:GetInt(),
                gCvar:GetInt(),
                bCvar:GetInt(),
                200
            )
        end
    end)
    cvars.AddChangeCallback("tarhun_box_color_b", function()
        local rCvar = GetConVar("tarhun_box_color_r")
        local gCvar = GetConVar("tarhun_box_color_g")
        local bCvar = GetConVar("tarhun_box_color_b")
        if rCvar and gCvar and bCvar then
            TARHUN_BOX_COLOR = Color(
                rCvar:GetInt(),
                gCvar:GetInt(),
                bCvar:GetInt(),
                200
            )
        end
    end)
end

SetupConVarCallbacks()

concommand.Add("gestan.prm", function()
    OpenTARHUNMenu()
end)

local function ToggleMenu()
    if IsValid(TARHUNMenu) then
        TARHUNMenu:Remove()
    else
        OpenTARHUNMenu()
    end
end

hook.Add("Think", "TARHUN_MENU_BIND", function()
    if input.IsKeyDown(KEY_M) then
        if not TARHUN_MENU_KEY_PRESSED then
            TARHUN_MENU_KEY_PRESSED = true
            ToggleMenu()
        end
    else
        TARHUN_MENU_KEY_PRESSED = false
    end
end)

local ply = LocalPlayer()
local besttar = false
local me = LocalPlayer()

hook.Add("CreateMove", "TARHUN_BUNNYHOP", function(cmd)
    if not TARHUN_BHOP_ENABLED then return end
    
    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end
   
    if cmd:KeyDown(IN_JUMP) then
        if ply:WaterLevel() >= 2 then return end
        
        if not ply:IsOnGround() then
            cmd:RemoveKey(IN_JUMP)
        end
    end
end)

hook.Add("CreateMove", "TARHUN_SILENT_AIM_AUTO", function(cmd)
    if not TARHUN_SILENT_AIM_ENABLED then return end
    if not hg or not hg.GetCurrentCharacter then return end
    
    local me = LocalPlayer()
    if not IsValid(me) or not me:Alive() then return end
    
    if not cmd:KeyDown(IN_ATTACK) then return end
    
    local plys = player.GetAll()
    local bestTarget = nil
    local bestDistance = math.huge
    
    local scrW, scrH = ScrW(), ScrH()
    local centerX, centerY = scrW / 2, scrH / 2
    local fovRadius = (TARHUN_FOV / 90) * scrW * 0.4
    
    for i = 1, #plys do
        if plys[i] == me or not plys[i]:Alive() or plys[i]:IsDormant() then continue end
        if TARHUN_IGNORE_TEAM and plys[i]:Team() == me:Team() then continue end
        
        local enemyChar = hg.GetCurrentCharacter(plys[i])
        if not IsValid(enemyChar) then continue end
        
        local headBone = enemyChar:LookupBone("ValveBiped.Bip01_Head1")
        if not headBone then continue end
        
        local headPos = enemyChar:GetBonePosition(headBone)
        if not headPos then continue end
        
        local screenPos = headPos:ToScreen()
        if not screenPos or not screenPos.visible then continue end
        
        local distToCenter = math.sqrt(
            (screenPos.x - centerX)^2 + 
            (screenPos.y - centerY)^2
        )
        
        if distToCenter > fovRadius then continue end
        
        local distance = me:GetPos():Distance(plys[i]:GetPos())
        if distance < bestDistance then
            bestDistance = distance
            bestTarget = headPos
        end
    end
    
    if bestTarget then
        local eyePos = me:EyePos()
        local aimAngle = (bestTarget - eyePos):Angle()
        
        cmd:SetViewAngles(aimAngle)
    end
end)

hook.Add("Think", "TARHUN_AIMBOT", function()
    if not TARHUN_AIMBOT_ENABLED then return end
    if not input.IsKeyDown(TARHUN_AIMBOT_KEY) then return end
    if not hg or not hg.GetCurrentCharacter then return end
    
    hook.Remove("RenderScreenspaceEffects", "flasheseffect")
    hook.Remove("RenderScreenspaceEffects", "organism-effects")
    
    besttar = false
    local plys = player.GetAll()
    local bestScore = math.huge
    local bestTarget = nil
    
    local screenCenterX = ScrW() / 2
    local screenCenterY = ScrH() / 2
    
    for i = 1, #plys do
        if plys[i] == me or not plys[i]:Alive() or plys[i]:IsDormant() then continue end
        if TARHUN_IGNORE_TEAM and plys[i]:Team() == LocalPlayer():Team() then continue end
        
        local enemyChar = hg.GetCurrentCharacter(plys[i])
        if not IsValid(enemyChar) then continue end
        
        local headBone = enemyChar:LookupBone("ValveBiped.Bip01_Head1")
        if not headBone then continue end
        
        local enemyPos = enemyChar:GetBonePosition(headBone)
        if not enemyPos then continue end
        
        if not plys[i]:GetNWBool("fake", false) then
            local tr = util.TraceLine({
                start = me:EyePos(),
                endpos = enemyPos,
                filter = me,
                mask = MASK_SHOT,
            })
            if tr.Entity ~= enemyChar then continue end
        end
        
        local screenPos = enemyPos:ToScreen()
        if not screenPos or screenPos.x < 0 or screenPos.x > ScrW() or screenPos.y < 0 or screenPos.y > ScrH() then
            continue
        end
        
        local distToCenter = math.sqrt(
            math.pow(screenPos.x - screenCenterX, 2) + 
            math.pow(screenPos.y - screenCenterY, 2)
        )
        
        local fovRadius = (TARHUN_FOV / 90) * ScrW() * 0.4
        
        if distToCenter > fovRadius then continue end
        
        local distance3D = me:GetPos():Distance(plys[i]:GetPos())
        local distanceBonus = math.min(distance3D / 1000, 1)
        
        local totalScore = distToCenter - (distanceBonus * 50)
        
        if totalScore < bestScore then
            bestScore = totalScore
            bestTarget = plys[i]
        end
    end
    
    besttar = bestTarget

    if not besttar then return end
    if not me:Alive() or not IsValid(me) then return end

    local w = me:GetActiveWeapon()
    if not IsValid(w) then return end
    if not w.GetMuzzleAtt then return end

    local enemyChar = hg.GetCurrentCharacter(besttar)
    if not IsValid(enemyChar) then return end

    local headBone = enemyChar:LookupBone("ValveBiped.Bip01_Head1")
    if not headBone then return end
    
    local enemyPos = enemyChar:GetBonePosition(headBone)
    if not enemyPos then return end

    local eyePos = me:EyePos()
    local gun = w:GetWeaponEntity()
    local owner = LocalPlayer()
    local ent = LocalPlayer()
    
    if owner:IsPlayer() then
        ent = hg.GetCurrentCharacter(owner)
    end
    
    if not hg.ammotypeshuy or not w.Primary or not w.Primary.Ammo then return end
    local ammotype = hg.ammotypeshuy[w.Primary.Ammo]
    if not ammotype or not ammotype.BulletSettings then return end
    ammotype = ammotype.BulletSettings
    
    local att = w:GetMuzzleAtt(gun, true)
    if not att then return end
    
    local pos, ang = att.Pos, att.Ang
    if not owner:IsPlayer() and not owner:IsNPC() then return end

    local primary = w.Primary
    local tr, pos, ang = w:GetTrace(true)

    local dir = ang:Forward()
    local dist, point = util.DistanceToLine(pos, pos - dir * 50, owner:EyePos())
    
    local tr = {}
    tr.start = point
    tr.endpos = pos
    tr.filter = {owner, ent, SERVER and hg.ragdollFake[owner]}
    local trace = util.TraceLine(tr)

    local headpos, headang
    local head = ent:GetBoneMatrix(ent:LookupBone("ValveBiped.Bip01_Head1"))

    if head then
        headpos, headang = head:GetTranslation(), head:GetAngles()
    else
        headpos, headang = ent:GetPos(), ent:GetAngles()
    end

    local shootpos = (owner.suiciding and headpos and (headpos - headang:Forward() * 1 + headang:Right() * 1) or (trace.HitPos - trace.Normal))
    local dirangle = ang

    local diff = dirangle - me:EyeAngles()
    diff:Normalize()

    local aimAng = (enemyPos - shootpos):Angle() - diff
    aimAng:Normalize()
    aimAng.r = 0

    local xd = LerpAngle(0.7, me:EyeAngles(), Angle(aimAng.x, aimAng.y, 0))
    me:SetEyeAngles(xd)
end)

hook.Add("HUDPaint", "TARHUN_DRAW_FOV", function()
    if not TARHUN_DRAW_FOV then return end
    
    local centerX = ScrW() / 2
    local centerY = ScrH() / 2
    
    local radius = (TARHUN_FOV / 90) * ScrW() * 0.4
    
    surface.SetDrawColor(TARHUN_FOV_COLOR)
    draw.NoTexture()
    for i = 1, 32 do
        local angle = (i / 32) * math.pi * 2
        local nextAngle = ((i + 1) / 32) * math.pi * 2
        
        local x1 = centerX + math.cos(angle) * radius
        local y1 = centerY + math.sin(angle) * radius
        local x2 = centerX + math.cos(nextAngle) * radius
        local y2 = centerY + math.sin(nextAngle) * radius
        
        surface.DrawLine(x1, y1, x2, y2)
    end
end)

hook.Add("Think", "TARHUN_NORECOIL", function()
    if not TARHUN_NORECOIL then return end
    if not ply:GetActiveWeapon() then return end
    
    local wep = ply:GetActiveWeapon()
    if wep.Primary then
        wep.Primary.Force = 0.01
        wep.cameraShakeMul = 0.01
        wep.addSprayMul = 0.01
        wep.SprayRand = {Angle(0,0,0),Angle(0,0,0)}
        wep.SpreadMul = 0.01
        wep.SpreadMulZoom = 0.01
        wep.sprayAngles = Angle(0,0,0)
        wep.EyeSpray = Angle(0,0,0)
        
        wep.Primary.Recoil = 0
        wep.Primary.KickUp = 0
        wep.Primary.KickDown = 0
        wep.Primary.KickHorizontal = 0
    end
end)

hook.Add("Think", "TARHUN_NOSPREAD", function()
    if not TARHUN_NOSPREAD then return end
    if not ply:GetActiveWeapon() then return end
    
    local wep = ply:GetActiveWeapon()
    if wep.Primary then
        wep.Primary.Spread = 0
        wep.Primary.SpreadZoom = 0
        wep.Primary.IronAccuracy = 0.01
        
        if wep.Cone then wep.Cone = 0 end
        if wep.ConeZoom then wep.ConeZoom = 0 end
        if wep.Accuracy then wep.Accuracy = 100 end
        if wep.AccuracyDivisor then wep.AccuracyDivisor = 100 end
        
        if wep.Inaccuracy then wep.Inaccuracy = 0 end
        if wep.VelocitySensitivity then wep.VelocitySensitivity = 0 end
        
        wep.Primary.Distance = 99999
        wep.Primary.NumShots = 1
    end
end)

hook.Add("EntityFireBullets", "TARHUN_PERFECT_ACCURACY", function(ent, data)
    if not TARHUN_NOSPREAD then return end
    if ent ~= LocalPlayer() then return end
    
    data.Spread = Vector(0, 0, 0)
    data.Spread.x = 0
    data.Spread.y = 0
    
    local eyeAngles = LocalPlayer():EyeAngles()
    data.Dir = eyeAngles:Forward()
    
    return true
end)

local hitMarkers = {}

surface.CreateFont("TarhunHitMarker", {
    font = "Disket Mono Bold",
    size = 32,
    weight = 700,
    antialias = true,
    shadow = true
})

surface.CreateFont("TarhunHitMarkerSmall", {
    font = "Disket Mono Bold",
    size = 24,
    weight = 700,
    antialias = true,
    shadow = true
})

hook.Add("EntityTakeDamage", "TARHUN_HIT_MARKER", function(target, dmg)
    if not TARHUN_SILENT_AIM_ENABLED then return end
    if not hg or not hg.GetCurrentCharacter then return end
    
    local attacker = dmg:GetAttacker()
    if attacker ~= LocalPlayer() then return end
    if not IsValid(target) or not target:IsPlayer() then return end
    
    local hitgroup = target:LastHitGroup()
    local isHeadshot = (hitgroup == HITGROUP_HEAD)
    
    local targetChar = hg.GetCurrentCharacter(target)
    if not IsValid(targetChar) then return end
    
    local hitPos = targetChar:GetPos() + Vector(0, 0, 70)
    
    table.insert(hitMarkers, {
        pos = hitPos,
        text = isHeadshot and "HEADSHOT!" or "SO CLOSE!",
        color = isHeadshot and Color(255, 50, 50, 255) or Color(255, 200, 50, 255),
        font = isHeadshot and "TarhunHitMarker" or "TarhunHitMarkerSmall",
        time = CurTime(),
        lifetime = 2.0,
        startZ = hitPos.z,
        isHeadshot = isHeadshot
    })
end)

hook.Add("ScalePlayerDamage", "TARHUN_HIT_MARKER_ALT", function(target, hitgroup, dmg)
    if not TARHUN_SILENT_AIM_ENABLED then return end
    if not hg or not hg.GetCurrentCharacter then return end
    
    local attacker = dmg:GetAttacker()
    if attacker ~= LocalPlayer() then return end
    if not IsValid(target) or not target:IsPlayer() then return end
    
    local isHeadshot = (hitgroup == HITGROUP_HEAD)
    
    local targetChar = hg.GetCurrentCharacter(target)
    if not IsValid(targetChar) then 
        local hitPos = target:GetPos() + Vector(0, 0, 70)
        
        table.insert(hitMarkers, {
            pos = hitPos,
            text = isHeadshot and "HEADSHOT!" or "SO CLOSE!",
            color = isHeadshot and Color(255, 50, 50, 255) or Color(255, 200, 50, 255),
            font = isHeadshot and "TarhunHitMarker" or "TarhunHitMarkerSmall",
            time = CurTime(),
            lifetime = 2.0,
            startZ = hitPos.z,
            isHeadshot = isHeadshot
        })
        return
    end
    
    local hitPos = targetChar:GetPos() + Vector(0, 0, 70)
    
    table.insert(hitMarkers, {
        pos = hitPos,
        text = isHeadshot and "HEADSHOT!" or "SO CLOSE!",
        color = isHeadshot and Color(255, 50, 50, 255) or Color(255, 200, 50, 255),
        font = isHeadshot and "TarhunHitMarker" or "TarhunHitMarkerSmall",
        time = CurTime(),
        lifetime = 2.0,
        startZ = hitPos.z,
        isHeadshot = isHeadshot
    })
end)

hook.Add("HUDPaint", "TARHUN_DRAW_HIT_MARKERS", function()
    if not TARHUN_SILENT_AIM_ENABLED then return end
    
    local currentTime = CurTime()
    
    for i = #hitMarkers, 1, -1 do
        local marker = hitMarkers[i]
        local age = currentTime - marker.time
        
        if age > marker.lifetime then
            table.remove(hitMarkers, i)
            continue
        end
        
        local progress = age / marker.lifetime
        local alpha = math.max(0, 255 * (1 - progress))
        local offsetZ = progress * 50
        
        local drawPos = Vector(marker.pos.x, marker.pos.y, marker.startZ + offsetZ)
        local screenPos = drawPos:ToScreen()
        
        if screenPos and screenPos.visible then
            local scale = 1.0
            if progress < 0.2 then
                scale = 0.5 + (progress / 0.2) * 0.5
            end
            
            local drawColor = Color(marker.color.r, marker.color.g, marker.color.b, alpha)
            
            draw.SimpleText(marker.text, marker.font, screenPos.x + 2, screenPos.y + 2, Color(0, 0, 0, alpha * 0.5), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(marker.text, marker.font, screenPos.x, screenPos.y, drawColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
end)

local draw_line = surface.DrawLine
local draw_rect = surface.DrawRect
local draw_color = surface.SetDrawColor
local white = Color(255, 255, 255, 255)
local black = Color(0, 0, 0, 255)

function draw_outlined_point(x, y, pointColor, outlineColor)
    draw_color(outlineColor)
    for i = -1, 1 do
        for j = -1, 1 do
            if i ~= 0 or j ~= 0 then
                draw_rect(x + i, y + j, 1, 1)
            end
        end
    end
    
    draw_color(pointColor)
    draw_rect(x, y, 4, 4)
end

hook.Add("HUDPaint", "TARHUN_DOT", function()
    if not TARHUN_DOT_ENABLED then return end
    
    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end
    
    local weapon = ply:GetActiveWeapon()
    if not IsValid(weapon) then return end
    
    if not weapon.DoRT then return end
    
    local gun = weapon:GetWeaponEntity()
    if not IsValid(gun) then return end
    
    local att = weapon:GetMuzzleAtt(gun, true)
    if not att then return end
    
    local pos, ang = weapon:GetTrace(true, nil, nil, true)
    if not pos then return end
    
    local localPos = Vector(0, 0, 0)
    if weapon.localScopePos then
        localPos:Set(weapon.localScopePos)
        localPos:Rotate(ang)
        pos:Add(localPos)
    end
    
    local view = render.GetViewSetup(true)
    local diff, point = util.DistanceToLine(view.origin, view.origin + ang:Forward() * 50, pos)
    
    local screenPos = point:ToScreen()
    if screenPos and screenPos.visible then
        local x, y = screenPos.x, screenPos.y
        draw_outlined_point(x, y, white, black)
    end
end)

local watermark_config = {
    textColor = Color(255, 0, 0, 255),
    backgroundColor = Color(0, 0, 0, 150),
    padding = 10
}

surface.CreateFont("TarhunWatermarkFont", {
    font = "Arial",
    size = 16,
    weight = 500,
    antialias = true
})

hook.Add("HUDPaint", "TarhunStatsHUD", function()
    if not TARHUN_WATERMARK_ENABLED then return end
    if not LocalPlayer() or not LocalPlayer():IsValid() then return end
    
    local fps = math.Round(1 / FrameTime())
    local ping = LocalPlayer():Ping()
    local name = LocalPlayer():Nick()
    
    local text = "мсиси | FPS: "..fps.." | Ping: "..ping.."ms | "..name
    
    surface.SetFont("TarhunWatermarkFont")
    local textWidth, textHeight = surface.GetTextSize(text)
    
    local x = ScrW() - textWidth - watermark_config.padding
    local y = watermark_config.padding
    
    surface.SetDrawColor(watermark_config.backgroundColor)
    surface.DrawRect(x - 8, y - 3, textWidth + 16, textHeight + 6)
    
    draw.SimpleText(text, "TarhunWatermarkFont", x, y, watermark_config.textColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end)

local chatSpamTimer = 0

hook.Add("Think", "TARHUN_CHAT_SPAM", function()
    if not TARHUN_CHAT_SPAM then return end
    if chatSpamTimer > CurTime() then return end
    
    local delay = TARHUN_CHAT_DELAY or 1
    chatSpamTimer = CurTime() + delay
    
    local message = TARHUN_CHAT_MESSAGE or "GESTAN.PRM ON TOP!"
    local repeatCount = TARHUN_CHAT_REPEAT or 20
    
    if message and message ~= "" then
        local repeatedMessage = string.rep(message, repeatCount)
        RunConsoleCommand("say", repeatedMessage)
    end
end)

local cooldown = 0
local plyMenu = nil

local function nameThings(i, thing)
    local weps = weapons.Get(i)
    local entss = scripted_ents.Get(i)
    if weps then return weps.PrintName end
    if entss then return entss.PrintName end
    if hg and hg.armor and hg.armor[i] and hg.armor[i][thing] then return thing end
    if hg and hg.attachmentslaunguage and hg.attachmentslaunguage[thing] then return thing end
    if i == "Money" then return "Money, " .. tostring(thing) .. "$" end
    return tostring(i)
end

local function getIconThing(i, thing, tab)
    if tab == "Weapons" and weapons.Get(i) then
        local GunTable = weapons.Get(i)
        local Icon = (GunTable.WepSelectIcon2 ~= nil and GunTable.WepSelectIcon2) or GunTable.WepSelectIcon
        local Overide = GunTable.WepSelectIcon2 == nil and true or false
        local HaveIcon = true
        return Icon, HaveIcon, Overide, false
    end

    if tab == "Attachments" and hg and hg.attachmentsIcons and hg.attachmentsIcons[thing] then
        local AttIcon = hg.attachmentsIcons[thing]
        local HaveIcon = true
        return AttIcon, HaveIcon, false, true
    end

    if tab == "Armor" then
        local AttIcon = hg and hg.armorIcons and hg.armorIcons[thing]
        local HaveIcon = true
        return AttIcon, HaveIcon, false, true
    end

    if tab == "Money" then
        local AttIcon = "scrappers/money_icon.png"
        local HaveIcon = true
        return AttIcon, HaveIcon, false
    end
    return nil, false, false, false
end

local functions2 = {
    ["Weapons"] = function(ply, ent, wep)
        if true then return true end
    end,
    ["Ammo"] = function(ply, ent, ammo, amt)
        if true then return true end
    end,
    ["Armor"] = function(ply, ent, placement, armor)
        if hg and hg.armor and hg.armor[placement] and hg.armor[placement][armor] and hg.armor[placement][armor].nodrop then return false end
        if true then return true end
    end,
    ["Attachments"] = function(ply, ent, att, tbl)
        if true then return true end
    end,
    ["Money"] = function(ply, ent)
        if true then return true end
    end,
}

local functions = {
    ["Weapons"] = function(ply, ent, wep)
        local weapon = weapons.Get(wep)
        if (ent:IsPlayer() and IsValid(ent:GetActiveWeapon()) and ent:GetActiveWeapon() == wep) then return end
        return true
    end,
    ["Ammo"] = function(ply, ent, ammo, amt)
        if true then return true end
    end,
    ["Armor"] = function(ply, ent, placement, armor)
        local armors = ply:GetNetVar("Armor",{})
        if armors[placement] then return false end
        if true then return true end
    end,
    ["Attachments"] = function(ply, ent, att, tbl)
        if true then return true end
    end,
    ["Money"] = function(ply, ent)
        if true then return true end
    end,
}

local function TakeItem(tblIndex, thing, item, owner)
    local item = istable(item) and item or {item}
    net.Start("ply_take_item")
        net.WriteString(tblIndex)
        net.WriteString(thing)
        net.WriteTable(item)
        net.WriteEntity(owner)
    net.SendToServer()
end

local EXPLOIT_OpenInv = function(ent)
    if not IsValid(ent) then return end

    local ply = LocalPlayer()
    local inv = ent:GetNetVar("Inventory")
    inv = inv or {}
    inv["Money"] = inv["Money"] or {}
    local entmoney = ent:GetNetVar("zb_Scrappers_RaidMoney") or 0
    if entmoney > 0 then inv["Money"]["Money"] = entmoney end
    local armor = ent:GetNetVar("Armor") or {}
    inv["Armor"] = armor

    ent.foundloot = ent.foundloot or {}
    for tab, things in pairs(inv) do
        if istable(things) then
            for i in pairs(things) do
                ent.foundloot[i] = true
            end
        end
    end

    if IsValid(plyMenu) then
        plyMenu:Remove()
        plyMenu = nil
    end

    cooldown = CurTime() + 0

    local name = IsValid(ent) and (ent:IsPlayer() or ent:IsRagdoll()) and ent:GetPlayerName() .. "'s inventory" or "Container"
    local sizeX, sizeY = ScrW() / 3, ScrH() / 2.5
    plyMenu = vgui.Create("ZFrame")
    plyMenu.ent = ent
    plyMenu.entindex = ent:EntIndex()

    plyMenu:SetTitle("")
    plyMenu:SetSize(sizeX, sizeY)
    plyMenu:Center()
    plyMenu:MakePopup()
    plyMenu:SetKeyBoardInputEnabled(false)
    plyMenu:ShowCloseButton(true)
    plyMenu:SetVisible(true)
    plyMenu.Created = CurTime() - 100

    plyMenu.PaintOver = function(self, w, h)
        draw.DrawText(name, "HomigradFontSmall", w / 2, 10, color_white, TEXT_ALIGN_CENTER)
        draw.DrawText("R - Close | LMB - Take | RMB - Item menu", "HomigradFontSmall", w / 2, h - h*0.055 , Color(255,255,255,45), TEXT_ALIGN_CENTER)
    end

    function plyMenu:Think()
        local ent = self.ent
        if not IsValid(ent) then self:Close() return end
        if LocalPlayer().organism and LocalPlayer().organism.otrub or not LocalPlayer():Alive() then self:Remove() return end
        if (ent:GetPos() - LocalPlayer():GetPos()):LengthSqr() > 125^2 then self:Remove() return end
        if ent:IsPlayer() and not IsValid(ent.FakeRagdoll) then self:Remove() return end
        if input.IsKeyDown(KEY_R) then
            self:Close()
        end
    end

    local DScrollPanel = vgui.Create("DScrollPanel", plyMenu)
    DScrollPanel:SetPos(sizeX / 30, sizeY / 12)
    DScrollPanel:SetSize(sizeX - sizeX / 16, sizeY - sizeY / 7)
    DScrollPanel:Dock(FILL)
    DScrollPanel:DockMargin(2,8,2,20)

    function DScrollPanel:Paint(w, h)
    end

    local grid = vgui.Create("DGrid", DScrollPanel)
    grid:Dock(FILL)
    grid:DockMargin(12, 10, 0, 0)
    grid:SetCols(5)
    grid:SetColWide(sizeX / 5 - sizeX / 16 / 9)
    grid:SetRowHeight(sizeY / 6.5 + sizeY / 32)

    local function sortKeys(keys, ent)
        table.sort(keys, function(a, b)
            local atbl = weapons.Get(a)
            local btwbl = weapons.Get(b)
            local wepA = atbl and atbl.holsteredBone and not atbl.shouldntDrawHolstered
            local wepB = btwbl and btwbl.holsteredBone and not btwbl.shouldntDrawHolstered

            local wepValueA = wepA and 1 or 0
            local wepValueB = wepB and 1 or 0

            if wepValueA ~= wepValueB then
                return wepValueA < wepValueB
            end

            return a < b
        end)
    end

    for tab, things in pairs(inv) do
        if not istable(things) then continue end
        local keys = table.GetKeys(things)
        sortKeys(keys, ent)

        for k, i in ipairs(keys) do
            local thing = things[i]
            local thing1 = istable(thing) and thing or {thing}

            if not functions2[tab](ply, ent, i, unpack(thing1)) then continue end

            if ent:IsPlayer() and IsValid(ent:GetActiveWeapon()) and ent:GetActiveWeapon():GetClass() == i then continue end

            local button = vgui.Create("DButton", plyMenu)
            button:SetText("")
            button:DockMargin(5, 0, 2, 0)
            button:SetSize(sizeX / 5.8, sizeY / 5.8)
            button:SetAlpha(255)
            button.Created = nil

            button.DoClick = function()
                if cooldown > CurTime() then return end
                cooldown = CurTime() + 0.5

                if not functions[tab](ply, ent, i, unpack(thing1)) then
                    local OptionsMenu = DermaMenu()
                    OptionsMenu:AddOption( "You have item like this", function() end )
                    OptionsMenu:Open()
                    return
                end
                if istable(thing) then
                    thing["render"] = {}
                end

                surface.PlaySound("arc9_eft_shared/generic_mag_pouch_in" .. math.random(7) .. ".ogg")
                grid.SoundKD = CurTime() + 0.2
                button:Remove()
                TakeItem(tab, i, thing, ent)
            end

            button.DoRightClick = function()
                if cooldown > CurTime() then return end
                cooldown = CurTime() + 0.5

                if not functions[tab](ply, ent, i, unpack(thing1)) then
                    local OptionsMenu = DermaMenu()
                    OptionsMenu:AddOption( "You have item like this", function() end )
                    OptionsMenu:Open()
                    return
                end
                if istable(thing) then
                    thing["render"] = {}
                end

                surface.PlaySound("arc9_eft_shared/generic_mag_pouch_in" .. math.random(7) .. ".ogg")
                grid.SoundKD = CurTime() + 0.2

                local OptionsMenu = DermaMenu()
                OptionsMenu:AddOption( "Take", function() button:Remove() TakeItem(tab, i, thing, ent) end )
                OptionsMenu:Open()
            end

            local name = nameThings(i, thing)
            button.col1 = 100
            button.Paint = function(self, w, h)
                self.col1 = Lerp(0.1, self.col1, self:IsHovered() and 255 or 100)
                if self:IsHovered() then
                    self.SoundKD = self.SoundKD or 0
                    if (grid.SoundKD or 0) < CurTime() and self.SoundKD < CurTime() then surface.PlaySound("arc9_eft_shared/generic_mag_pouch_out" .. math.random(7) .. ".ogg") end
                    self.SoundKD = CurTime() + 0.1
                end

                surface.SetDrawColor(self.col1, 0, 0, 15)
                surface.DrawRect(0, 0, w, h)
                local Icon, HaveIcon, Overide, Quad = getIconThing(i, thing, tab)
                if Icon then
                    self.Icon = self.Icon or (isstring(Icon) and Material(Icon)) or Icon
                end

                if HaveIcon and self.Icon then
                    if Overide and isnumber( Icon ) then
                        surface.SetTexture(self.Icon)
                    else
                        surface.SetMaterial(self.Icon)
                    end

                    surface.SetDrawColor(255, 255, 255)
                    surface.DrawTexturedRect(Quad and w / 5 + 5 or 0 - 5, 5, Quad and (w / 2 + 2.5) or (w + 10), Quad and h / 1.3 or h - 10)
                end

                surface.SetDrawColor(self.col1,0,0,self.col1)
                surface.DrawOutlinedRect(0, 0, w, h, 1)
                local Text = (tab == "Ammo" and game.GetAmmoName(name)) or language.GetPhrase(name) or name
                local SubText = utf8.sub(Text, 17)
                Text = utf8.sub(Text, 1, 17) .. "\n" .. utf8.sub(Text, 18)
                draw.DrawText(Text, "ZCity_VerySuperTiny", w / 2, (HaveIcon and h / ((#SubText > 0 and 1.65) or 1.3)) or h / 3, color_white, TEXT_ALIGN_CENTER)
            end
            grid:AddItem(button)
        end
    end
end

local original_OpenInv = OpenInv

OpenInv = EXPLOIT_OpenInv

net.Receive("should_open_inv", function()
    local ent = net.ReadEntity()
    EXPLOIT_OpenInv(ent)
end)

print("GESTAN.PRM killa all homigraders END")

hook.Add("Think", "TARHUN_SPEED_MULTIPLIER", function()
    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end
    
    local speedCvar = GetConVar("tarhun_speed_multiplier")
    if not speedCvar then return end
    
    local speedMultiplier = speedCvar:GetInt()
    if speedMultiplier == 1 then return end
    
    local baseWalkSpeed = 150
    local baseRunSpeed = 250
    
    if speedMultiplier == 0 then
        ply:SetWalkSpeed(baseWalkSpeed * 0.3)
        ply:SetRunSpeed(baseRunSpeed * 0.3)
    elseif speedMultiplier == 2 then
        ply:SetWalkSpeed(baseWalkSpeed * 1.5)
        ply:SetRunSpeed(baseRunSpeed * 1.5)
    elseif speedMultiplier == 3 then
        ply:SetWalkSpeed(baseWalkSpeed * 2.5)
        ply:SetRunSpeed(baseRunSpeed * 2.5)
    end
end)