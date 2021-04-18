--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    self.defs = def
    
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1
    self.frames = def.frames

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
    self.onCollide = function() end

    -- Assignment 5.1
    self.consumable = def.consumable or false
    -- Assignment 5.3
    self.liftable = def.liftable or false
    self.lifted = false
end

function GameObject:update(dt)

end

function GameObject:lifting(player)
    Timer.tween(0.465, {[self] = {y = player.y - self.height + 2, x = player.x}})
end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    if self.states then
        self.frame = self.states[self.state].frame
    end
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end