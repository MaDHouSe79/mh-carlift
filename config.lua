--[[ ===================================================== ]]--
--[[           QBCore Car Lift Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--

Config                   = {}
Config.DebugPoly         = false -- debug polyzone
--
Config.Speed_up          = 0.001 -- the speed the lift is going up
Config.Speed_up_slow     = 0.001 -- between "max" and "beforemax"
Config.Speed_down_slow   = 0.001 -- between "min" and "beforemin"
Config.Speed_down        = 0.002 -- the speed the lift is going down
--
Config.LiftPlatformModel = "prop_spray_jackframe"
Config.LiftPoleModel     = "prop_spray_jackleg"
Config.LiftElecBox       = "prop_elecbox_02b"
--
Config.SpawnElectraBox   = false
Config.BoxOffset         = {["x"] = 0.0, ["y"] = -3.3, ["z"] = -0.7, ["h"] = 0.0}
--
Config.UseAsJob          = false -- job access only. (the jobs you add in you lift setup)
--
Config.InteractButton    = 38 -- E
Config.MenuButtonDisplay = "E"
--
Config.PoleZOffzet       = 0.0
--
Config.Fontawesome = {
    close_menu = "fa-solid fa-angle-left",
    item_menu  = "fa-solid fa-angle-right",
    open_menu  = "fa-solid fa-circle-info",
}

Config.Elevators = {
	-- scraptard pos 1 (in de hal) (left)
	[1] = {               	                          -- this and the id, must be the same number.
		id           = 1,    	                      -- this needs the id from above. 
		min          = 47.37, 	                      -- lower position of the lift
		max          = 49.45, 	                      -- higher position of the lift (z from the main coords)
		beforemax    = 45.53, 	                      -- detector for speed_up_slow befor the final point
		beforemin    = 48.00, 	                      -- detector for speed_down_slow befor the final point
		entity       = nil,   	                      -- dont change this
		needPoles    = true,                         -- if dont have poles set this true
		openMenu     = true,                          -- if you want to have a menu on the lift, false if you have other plans with it. (triggering by other scripts)
		workarea     = {length = 7.0, wide = 7.0 },   -- length and wide of the box zone
		job          = {"mechanic"},                  -- job access
		coords       = {["x"] = 2345.31, ["y"] = 3141.512, ["z"] = 47.37874, ["h"] = -189.5}, -- start base coords of this lift platform.
	}, 
	-- scraptard pos 2 (in de hal) (right)
	[2] = {
		id        = 2,
		min       = 47.37,
		max       = 49.45,
		beforemax = 45.53,
		beforemin = 48.00,
		entity    = nil,
		needPoles = true,
		openMenu  = true,
		workarea  = {length = 7.0, wide = 7.0 },
		job       = {"mechanic"},
		coords    = {["x"] =  2358.866, ["y"] = 3139.057, ["z"] = 47.37369, ["h"] = -190.5},
	},
	-- scraptard pos 3 (outside) (left)
	[3] = {		
		id        = 3,
		min       = 47.31,
		max       = 49.27,
		beforemax = 45.53,
		beforemin = 45.95,
		entity    = nil,
		needPoles = true,
		openMenu  = true,
		workarea  = {length = 7.0, wide = 7.0},
		job       = {"mechanic"},
		coords    = {["x"] = 2333.153, ["y"] = 3042.031, ["z"] = 47.31144, ["h"] = 1.0},
	}, 
	-- scraptard pos 4 (outside) (right)
	[4] = {		
		id        = 4,
		min       = 47.31,
		max       = 49.27,
		beforemax = 45.53,
		beforemin = 45.95,
		entity    = nil,
		needPoles = true,
		openMenu  = true,
		workarea  = {length = 7.0, wide = 7.0},
		job       = {"mechanic"},
		coords    = {["x"] = 2339.808, ["y"] = 3042.183, ["z"] = 47.3141, ["h"] = -1.0},
	},
}
