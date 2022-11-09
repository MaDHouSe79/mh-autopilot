--[[ ===================================================== ]]--
--[[          QBCore Autopilot Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--

local Translations = {
    notify = {
        ['activated_normal'] = "Autopilot Normal Activated",
        ['activated_crazy'] = "Autopilot Crazy Activated",
        ['disabled'] = "Autopilot - Disabled",
        ['no_waypoint_set'] = "You have not set a waypoint!",
        ['not_in_vehicle'] = "You are not in a vehicle!",
        ['no_fuel'] = "You're out of gas..",
        ['on_destination'] = "You are at the destination",
    },
    menu = {
        ['title'] = "Autopilot",
        ['start'] = "Start",
        ['stop'] = "Stop",
        ['drive_speed'] = "Speed",
        ['drive_mode'] = "Style",
        ['normal'] = "Normal",
        ['crazy'] = "Crazy",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
