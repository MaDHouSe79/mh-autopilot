--[[ ===================================================== ]]--
--[[          QBCore Autopilot Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local autopilot = false
local final_destination = nil
local MenuItemId = nil
local body = 0.0
local engine = 0.0
local dirt = 0.0
local normalSpeed = 0.0
local driveType = nil

local function Stop(mode)
    autopilot = false
    final_destination = nil
    local player = PlayerPedId()
    if IsPedInAnyVehicle(player) then
        local vehicle = GetVehiclePedIsIn(player, false)
        FreezeEntityPosition(vehicle, true)
        ClearVehicleTasks(vehicle)
        ClearPedTasks(player)
        if Config.UseAutoHarness then exports['qb-smallresources']:ToggleHarness() end
        if mode == "nofuel" then QBCore.Functions.Notify(Lang:t('notify.no_fuel'), "error") end
        if mode == "ondestination" then QBCore.Functions.Notify(Lang:t('notify.on_destination'), "success") end
        QBCore.Functions.Notify(Lang:t('notify.disabled'), "success")
        SetVehicleEngineHealth(vehicle, engine)
        SetVehicleBodyHealth(vehicle, body)
        SetVehicleDirtLevel(vehicle, dirt)
        Wait(50)
        FreezeEntityPosition(vehicle, false)
    end
    Wait(100)
    ClearPedTasks(player)
end

local function Start(speed, style)
    local drivespeed = speed
    local player = PlayerPedId()
    if IsPedInAnyVehicle(player) then
        if DoesBlipExist(GetFirstBlipInfoId(8)) then
            if Config.UseAutoHarness then exports['qb-smallresources']:ToggleHarness() end
            local blip = GetFirstBlipInfoId(8)
            local bCoords = GetBlipCoords(blip)
            final_destination = bCoords
            ClearPedTasks(player)
            local veh = GetVehiclePedIsIn(player, false)
            body = GetVehicleBodyHealth(veh)
            engine = GetVehicleEngineHealth(veh)
            dirt = GetVehicleDirtLevel(veh)
            TaskVehicleDriveToCoord(player, veh, bCoords, drivespeed, 0, veh, style, 1, true)
            SetDriveTaskDrivingStyle(player, style)
            SetVehicleMaxSpeed(veh, 999.0)
            autopilot = true
        else
            QBCore.Functions.Notify(Lang:t('notify.no_waypoint_set'), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t('notify.not_in_vehicle'), "error")
    end
end

RegisterNetEvent('qb-radialmenu:client:onRadialmenuOpen', function()
    if MenuItemId ~= nil then
        exports['qb-radialmenu']:RemoveOption(MenuItemId)
        MenuItemId = nil
    end
    MenuItemId = exports['qb-radialmenu']:AddOption(Config.Radialmenu, MenuItemId)
end)

RegisterNetEvent('mh-autopilot:client:start', function(drivemode)
    local speed = Config.DriveStyles[drivemode].speed
    driveType = drivemode
    Start(speed, Config.DriveStyles[drivemode].style)
end)

RegisterNetEvent('mh-autopilot:client:stop', function()
    Stop('stop')
end)

RegisterNetEvent('mh-autopilot:client:menu', function()
    local drivestyles = {}
    for k, v in pairs(Config.DriveStyles) do
        drivestyles[#drivestyles + 1] = {value = v.name, text = v.label}
    end
    table.sort(drivestyles, function (a, b)
        if a.speed and b.speed then
            return a.speed < b.speed
        end
    end)
    local menu = exports["qb-input"]:ShowInput({
        header = Lang:t('menu.title'),
        submitText = Lang:t('menu.start'),
        inputs = {           
            {
                text = Lang:t('menu.drive_mode'),
                name = "drivemode",
                type = "select",
                options = drivestyles,
                isRequired = true
            },
        }
    })
    if menu then
        if menu.drivemode then TriggerEvent('mh-autopilot:client:start', menu.drivemode) else return end
    end
end)

Citizen.CreateThread(function()
    while true do
        if autopilot and final_destination ~= nil then
            local fuel = GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId()))
            if fuel <= 1.0 then 
                ClearPedTasks(PlayerPedId())
                Stop('nofuel') 
            end
            if not DoesBlipExist(GetFirstBlipInfoId(8)) then 
                ClearPedTasks(PlayerPedId())
                Stop('ondestination') 
            end
        end
        Citizen.Wait(0)
    end
end)