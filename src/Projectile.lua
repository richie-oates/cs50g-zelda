--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{__includes = GameObject}

function Projectile:init(object, direction)

	self.texture = object.texture
    self.frame = object.frame or 1
    -- dimensions
    self.x = object.x
    self.y = object.y
    self.width = object.width
    self.height = object.height
    self.throwSpeed = object.defs.throwSpeed
    self.dx, self.dy = 0, 0

    if direction == 'left' then
    	self.dx = - self.throwSpeed
    elseif direction == 'right' then
    	self.dx = self.throwSpeed
    elseif direction == 'up' then
    	self.dy = - self.throwSpeed
    elseif direction == 'down' then
    	self.dy = self.throwSpeed
    end

end

function Projectile:update(dt)
	self.x = self.x + self.dx * dt
	self.y = self.y + self.dy * dt
end

-- function Projectile:render()

-- end