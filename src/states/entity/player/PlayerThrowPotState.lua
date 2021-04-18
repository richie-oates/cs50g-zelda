PlayerThrowPotState = Class{__includes = BaseState}

function PlayerThrowPotState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite; negated in render function of state
    self.player.offsetY = 5
    self.player.offsetX = 0

        -- lift-pot-left, right, etc
    self.player:changeAnimation('pot-throw-' .. self.player.direction)
    -- self.player.currentAnimation.forwards = false
end

function PlayerThrowPotState:enter(player, dungeon)
    -- add projectile to table of projectiles and remove object from table of objects
    local projectile = Projectile(self.player.liftedObject, self.player.direction)
    table.insert(self.dungeon.currentRoom.projectiles, projectile)
    for k, object in pairs(self.dungeon.currentRoom.objects) do
        if object.lifted then
            table.remove(self.dungeon.currentRoom.objects, k)
        end
    end
end

function PlayerThrowPotState:update()    
	-- if we've fully elapsed through one cycle of animation, change back to idle state
    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeAnimation('idle-' .. self.player.direction)
        Timer.after(0.5, function () 
            self.player.hasPot = false
            self.player:changeState('idle') end)       
    end
end

function PlayerThrowPotState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end