PlayerThrowPotState = Class{__includes = BaseState}

function PlayerThrowPotState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 0

    self.player:changeAnimation('lift-' .. self.player.direction)
end

function PlayerThrowPotState:update(dt)
    -- check if hitbox collides with any entities in the scene
    if self.player.direction == 'left' then
        self.player:changeAnimation('lift-left')
        self.player.item.moving = true
        self.player.item.directionThrow = 'left'
    elseif self.player.direction == 'right' then
        self.player:changeAnimation('lift-right')
        self.player.item.moving = true
        self.player.item.directionThrow = 'right'
    elseif self.player.direction == 'up' then
        self.player:changeAnimation('lift-up')
        self.player.item.moving = true
        self.player.item.directionThrow = 'up'
    else
        self.player:changeAnimation('lift-down')
        self.player.item.moving = true
        self.player.item.directionThrow = 'down'
    end

    if self.player.item.moving == true then
        self.player.item = nil
        self.player:changeState('idle')
    end

    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end
end

function PlayerThrowPotState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end