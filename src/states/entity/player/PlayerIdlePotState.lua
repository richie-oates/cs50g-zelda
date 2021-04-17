PlayerIdlePotState = Class{__includes = EntityIdleState}

function PlayerIdlePotState:enter(params)
    
    -- render offset for spaced character sprite (negated in render function of state)
    self.entity.offsetY = 5
    self.entity.offsetX = 0
 
    self.entity:changeAnimation('idle-pot-' .. self.entity.direction)
    
end

function PlayerIdlePotState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk-pot')
    end

    if love.keyboard.wasPressed('lshift') and self.entity.hasPot then
        self.entity.hasPot = false
        self.entity:changeState('throw-pot')
    end
end