--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:enter(params)
    
    -- render offset for spaced character sprite (negated in render function of state)
    self.entity.offsetY = 5
    self.entity.offsetX = 0

    -- Assignment 5.2 - Set appropriate animation if player has pot
    if self.entity.hasPot then
        self.entity:changeAnimation('idle-pot-' .. self.entity.direction)
    end
end

function PlayerIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk')
    end

    if love.keyboard.wasPressed('space') then
        if not self.entity.hasPot then
            self.entity:changeState('swing-sword')
        end
    end

    if love.keyboard.wasPressed('lshift') and self.entity.hasPot then
        self.entity.hasPot = false
    end
end