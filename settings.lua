local iridium_construction_robot_speed_multiplier_setting = {
    type = "double-setting",
    name = "iridium-construction-robot-speed",
    setting_type = "startup",
    default_value = 2.0,
    minimum_value = 0.1,
    maximum_value = 10.0,
}
local iridium_construction_robot_health_multiplier_setting = {
    type = "double-setting",
    name = "iridium-construction-robot-health",
    setting_type = "startup",
    default_value = 5.0,
    minimum_value = 0.1,
    maximum_value = 10.0,
}
local iridium_construction_robot_fireproof_setting = {
    type = "bool-setting",
    name = "iridium-construction-robot-fireproof",
    setting_type = "startup",
    default_value = true
}
data:extend({
    iridium_construction_robot_speed_multiplier_setting,
    iridium_construction_robot_health_multiplier_setting,
    iridium_construction_robot_fireproof_setting
})