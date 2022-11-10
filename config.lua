--[[ ===================================================== ]]--
--[[          QBCore Autopilot Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--

Config = {}

Config.DriveStyles = {
    ['reverse'] = {              -- style id
        name = "reverse",        -- style name
        label = "Drive Reverse", -- menu label
        speed = 10.0,            -- max drive speed
        style = 1074529828,      -- drive style (you can create more here: https://vespura.com/fivem/drivingstyle/)
    },
    ["slow"] = {
        name  = "slow",
        label = "Slow",
        speed = 10.0,
        style = 262575,
    },
    ["normal"] = {
        name  = "normal",
        label = "Normal",
        speed = 29.5,     -- 100 KPH
        style = 262447,
    },
    ["crazy"] = {
        name  = "crazy",
        label = "Crazy",
        speed = 60.0,
        style = 1074004276,
    },
    ["reckless"] = {
        name = "reckless", 
        label = "Reckless", 
        speed = 100.0,
        style = 1074528804,
    },
    ["super"] = {
        name = "super",
        label = "Super Fast",
        speed = 150.0,
        style = 1074528804,
    },
}

Config.Radialmenu = {
    id = 'autopilot',
    title = Lang:t('menu.title'),
    icon = 'car-side',
    items = {
        {
            id = 'autopilot1',
            title = Lang:t('menu.title'),
            icon = 'car-side',
            type = 'client',
            event = 'mh-autopilot:client:menu',
            shouldClose = true,
        },
        {
            id = 'autopilot2',
            title = Lang:t('menu.stop'),
            icon = 'car-side',
            type = 'client',
            event = 'mh-autopilot:client:stop',
            shouldClose = true,
        },
    },
}
