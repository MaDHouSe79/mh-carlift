--[[ ===================================================== ]] --
--[[             MH Car Lift Script by MaDHouSe            ]] --
--[[ ===================================================== ]] --
local Translations = {
    notify = {
        ['can_not_use_lift_insice_vehicle'] = "You can't use the lift if you are inside the vehicle.",
        ['no_access'] = "You don't have access to use this carlift"
    },
    menu = {
        ['menu_title'] = "Auto Lift",
        ['elevator_up'] = "Up the elevator",
        ['elevator_down'] = "Down the elevator",
        ['elevator_stop'] = "Stop the elevator",
        ['press_to_open'] = "[%{key}] - Lift Menu ID(%{id})",
        ['menu_close'] = "Close"
    }
}
Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
