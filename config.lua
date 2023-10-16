--[[ ===================================================== ]] --
--[[             MH Car Lift Script by MaDHouSe            ]] --
--[[ ===================================================== ]] --
Config = {}
Config.DebugPoly = false -- debug polyzone
--
Config.Speed_up = 0.001 -- the speed the lift is going up
Config.Speed_up_slow = 0.001 -- between "max" and "beforemax"
Config.Speed_down_slow = 0.001 -- between "min" and "beforemin"
Config.Speed_down = 0.002 -- the speed the lift is going down
--
Config.LiftPlatformModel = "prop_spray_jackframe"
Config.LiftPoleModel = "prop_spray_jackleg"
Config.LiftElecBox = "prop_elecbox_02b"
--
Config.SpawnElectraBox = true
Config.BoxOffset = {
    ["x"] = 0.0,
    ["y"] = -3.3,
    ["z"] = -0.7,
    ["h"] = 0.0
}
--
Config.UseAsJob = false -- job access only. (the jobs you add in you lift setup)
--

Config.ButtonLiftUp = 208 -- PAGE UP (Lift UP)
Config.ButtonLiftDown = 207 -- PAGE DOWN (Lift DOWN)
Config.ButtonLiftStop = 214 -- DELETE (LIFT STOP)
Config.ButtonLiftAttach = 121 -- INSERT (LIST VEHICLE ATTACH)

Config.InteractButton = 38 -- E
Config.MenuButtonDisplay = "E"
--
Config.PoleZOffzet = -0.30
--
Config.Fontawesome = {
    close_menu = "fa-solid fa-angle-left",
    item_menu = "fa-solid fa-angle-right",
    open_menu = "fa-solid fa-circle-info"
}

Config.Elevators = {
    [1] = {
        id = 1,
        min = 29.8,
        max = 32.0,
        beforemax = 31.5,
        beforemin = 30.0,
        elevator = nil, -- the entity 
        needPoles = true,
        openMenu = true,
		job = {"all"},
        workarea = {
            length = 7.0,
            wide = 7.0
        },
        coords = {
            ["x"] = 259.07,
            ["y"] = -772.27,
            ["z"] = 29.8,
            ["h"] = 71.19
        }
    }
}

Config.VehicleAttachOffset = {
    ['massacro'] = {
        x = 0.0, -- +forward/-bankward
        y = 0.0, -- +left/-right
        z = 0.36 -- +up/-down
    }

    -- add more vehicles here
}
