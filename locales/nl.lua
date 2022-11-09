--[[ ===================================================== ]]--
--[[          QBCore Autopilot Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--

local Translations = {
    notify = {
        ['activated_normal'] = "Autopilot Normal Geactiveerd",
        ['activated_crazy'] = "Autopilot Crazy Geactiveerd",
        ['disabled'] = "Autopilot - Uitgeschakeld",
        ['no_waypoint_set'] = "Er is geen waypoint!",
        ['not_in_vehicle'] = "Je zit niet in een voertuig!",
        ['no_fuel'] = "Je hebt geen benzine meer..",
        ['on_destination'] = "Je bent op de bestemming",
    },
    menu = {
        ['title'] = "Autopilot",
        ['start'] = "Start",
        ['stop'] = "Stop",
        ['drive_speed'] = "Snelheid",
        ['drive_mode'] = "Style",
        ['normal'] = "Normal",
        ['crazy'] = "Crazy",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
