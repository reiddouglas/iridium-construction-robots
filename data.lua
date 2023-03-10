--data.lua

local iridium_construction_robot_entity = table.deepcopy(data.raw["construction-robot"]["construction-robot"])

iridium_construction_robot_entity.name = 'iridium-construction-robot-entity'
iridium_construction_robot_entity.icons = {
    {
        icon = "__iridium-construction-robots__/Sprites/iridium-construction-robot.png",
    }
}
iridium_construction_robot_entity.max_payload_size = 1
iridium_construction_robot_entity.speed = data.raw["construction-robot"]["construction-robot"].speed * settings.startup["iridium-construction-robot-speed"].value
iridium_construction_robot_entity.max_health = data.raw["construction-robot"]["construction-robot"].max_health * settings.startup["iridium-construction-robot-health"].value
iridium_construction_robot_entity.resistances = {
    {
        type = 'physical',
        decrease = 10,
        percent = 50
    },
    {
        type = 'explosion',
        decrease = 20,
        percent = 90
    },
    {
        type = 'acid',
        decrease = 10,
        percent = 50
    }
}
if settings.startup["iridium-construction-robot-fireproof"].value == true then
    iridium_construction_robot_entity.resistances = {
        {
            type = 'fire',
            decrease = 0,
            percent = 100,
        }
    }
else
    iridium_construction_robot_entity.resistances = {
        {
            type = 'fire',
            decrease = 20,
            percent = 50,
        }
    }
end

local iridium_construction_robot_item = {
    type = 'item',
    name = 'iridium-construction-robot-item',
    icon_size = 64,
    icon_mipmaps = 2,
    icon = "__iridium-construction-robots__/Sprites/iridium-construction-robot.png",
    subgroup = 'logistic-network',
    order = 'i',
    place_result = 'iridium-construction-robot-entity',
    stack_size = 50
}

local iridium_construction_robot_recipe = {
    type = 'recipe',
    name = 'iridium-construction-robot-recipe',
    enabled = false,
    icon_size = 64,
    icon = "__iridium-construction-robots__/Sprites/iridium-construction-robot-recipe.png",
    ingredients = {
        {'construction-robot', 1},
        {'se-iridium-plate', 2}
    },
    result = 'iridium-construction-robot-item',
    energy_required = 1
}

local iridium_construction_robot_tech = {
    type = "technology",
    name = "iridium-construction-robot-tech",
    icon_size = 256,
    icon = "__iridium-construction-robots__/Sprites/iridium-construction-robotics-research.png",
    unit = {
        count = "250",
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"military-science-pack", 1},
            {"chemical-science-pack", 1},
            {"space-science-pack", 1},
            {"production-science-pack", 1},
            {"se-material-science-pack-3",1},
        },
        time = "30"
    },
    prerequisites = {
        "construction-robotics",
        --add SE pre-requisites here
        "se-material-science-pack-3"
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "iridium-construction-robot-recipe"
        }
    }
}

data:extend({
    iridium_construction_robot_entity, 
    iridium_construction_robot_item,
    iridium_construction_robot_recipe,
    iridium_construction_robot_tech
})

