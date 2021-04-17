--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },

    -- Assignment 5.1 - Make a heart pickup gameobject which is consumable
    
    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        consumable = true
    },

    ['pot'] = {
        -- Assignment 5.2 - pot gameobject
        type = 'pot',
        texture = 'tiles',
        frame = 14, --[[Set fixed frame for now, later make it random--]]
        width = 16,
        height = 16,
        solid = true,
        consumable = false,
        carryable = true,
        throwSpeed = 80
    }
}