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
    -- scraptard pos 1 (in de hal) (left)
    [1] = {                -- This and the id, must be the same number.
        id = 1,            -- This needs the id from above. 
        min = 47.37,       -- Lower position of the lift
        max = 49.45,       -- Higher position of the lift (z from the main coords)
        beforemax = 45.53, -- Detector for speed_up_slow befor the final point
        beforemin = 48.00, -- Detector for speed_down_slow befor the final point
        entity = nil,      -- Dont change this
        needPoles = true,  -- Of dont have poles set this false
        openMenu = true,   -- Of you want to have a menu on the lift, false if you have other plans with it. (triggering by other scripts)
        workarea = {
            length = 7.0,  -- Length of the box zone
            wide = 7.0     -- Wide of the box zone
        },                 
        job = {"mechanic"}, -- job access
        coords = {
            ["x"] = 2345.31,
            ["y"] = 3141.512,
            ["z"] = 47.37874,
            ["h"] = -189.5
        } -- start base coords of this lift platform.
    },
    -- scraptard pos 2 (in de hal) (right)
    [2] = {
        id = 2,
        min = 47.37,
        max = 49.45,
        beforemax = 45.53,
        beforemin = 48.00,
        entity = nil,
        needPoles = true,
        openMenu = true,
        workarea = {
            length = 7.0,
            wide = 7.0
        },
        job = {"mechanic"},
        coords = {
            ["x"] = 2358.866,
            ["y"] = 3139.057,
            ["z"] = 47.37369,
            ["h"] = -190.5
        }
    },
    -- scraptard pos 3 (outside) (left)
    [3] = {
        id = 3,
        min = 47.31,
        max = 49.27,
        beforemax = 45.53,
        beforemin = 45.95,
        entity = nil,
        needPoles = true,
        openMenu = true,
        workarea = {
            length = 7.0,
            wide = 7.0
        },
        job = {"mechanic"},
        coords = {
            ["x"] = 2333.153,
            ["y"] = 3042.031,
            ["z"] = 47.31144,
            ["h"] = 1.0
        }
    },
    -- scraptard pos 4 (outside) (right)
    [4] = {
        id = 4,
        min = 47.31,
        max = 49.27,
        beforemax = 45.53,
        beforemin = 45.95,
        entity = nil,
        needPoles = true,
        openMenu = true,
        workarea = {
            length = 7.0,
            wide = 7.0
        },
        job = {"mechanic"},
        coords = {
            ["x"] = 2339.808,
            ["y"] = 3042.183,
            ["z"] = 47.3141,
            ["h"] = -1.0
        }
    },
    [5] = { -- blockenpark garage
        id = 5,
        min = 29.8,
        max = 32.0,
        beforemax = 31.5,
        beforemin = 30.0,
        elevator = nil, -- the entity 
        needPoles = true,
        openMenu = true,
        job = nil, -- nil or {"unemployed", "machenic", "tuner"}
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
