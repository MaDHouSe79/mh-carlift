--[[ ===================================================== ]] --
--[[             MH Car Lift Script by MaDHouSe            ]] --
--[[ ===================================================== ]] --
local Translations = {
    notify = {
        ['can_not_use_lift_insice_vehicle'] = "Je kunt de lift niet gebruiken als je in de auto zit..",
        ['no_access'] = "Je hebt geen toegang om deze lift te gebruiken"
    },
    menu = {
        ['menu_title'] = "Auto Lift",
        ['elevator_up'] = "De lift omhoog",
        ['elevator_down'] = "Lift naar beneden",
        ['elevator_stop'] = "Stop de Lift",
        ['press_to_open'] = "[%{key}] - Lift Menu ID(%{id})",
        ['menu_close'] = "Sluit"
    }
}
Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
