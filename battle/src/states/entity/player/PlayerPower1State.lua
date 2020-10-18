PlayerPower1State = Class{__includes = BaseState}

function PlayerPower1State:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 0

    -- create hitbox based on where the player is and facing
    local direction = self.player.direction
    local left = self.player.left

    if direction == 'left' or  direction == 'right' then
        self.player:changeAnimation('power1-' .. self.player.direction)
    else
        if left == true then
            self.player:changeAnimation('power1-left')
        else 
            self.player:changeAnimation('power1-right')
        end
    end
end

function PlayerPower1State:enter(params)
    gSounds['attack']:stop()
    gSounds['attack']:play()

    -- restart Attack swing animation
    self.player.currentAnimation:refresh()
end

function PlayerPower1State:update(dt)
    if self.player.currentAnimation.timesPlayed > 0.5 then
        if love.keyboard.wasPressed('n') then
            self.player.currentAnimation.timesPlayed = 0
            self.player:changeState('power1')
        else
            self.player.currentAnimation.timesPlayed = 0
            self.player:changeState('idle')
        end
    end
end

function PlayerPower1State:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))

        -- debug for player and hitbox collision rects
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.player.x, self.player.y, self.player.width, self.player.height)
    -- love.graphics.rectangle('line', self.AttackHitbox3.x, self.AttackHitbox3.y,
    --     self.AttackHitbox3.width, self.AttackHitbox3.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end