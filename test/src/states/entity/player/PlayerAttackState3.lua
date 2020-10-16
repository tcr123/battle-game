PlayerAttackState3 = Class{__includes = BaseState}

function PlayerAttackState3:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 0

    -- create hitbox based on where the player is and facing
    local direction = self.player.direction
    local left = self.player.left

    local hitboxX, hitboxY, hitboxWidth, hitboxHeight

    if direction == 'left' then
        hitboxWidth = 10
        hitboxHeight = 32
        hitboxX = self.player.x 
        hitboxY = self.player.y + 2
    elseif direction == 'right' then
        hitboxWidth = 10
        hitboxHeight = 32
        hitboxX = self.player.x + self.player.width - 6
        hitboxY = self.player.y + 2
    elseif direction == 'up' then
        if left == true then
            hitboxWidth = 10
            hitboxHeight = 32
            hitboxX = self.player.x 
            hitboxY = self.player.y + 2
        else
            hitboxWidth = 10
            hitboxHeight = 32
            hitboxX = self.player.x + self.player.width - 6
            hitboxY = self.player.y + 2
        end
    else
        if left == true then
            hitboxWidth = 10
            hitboxHeight = 32
            hitboxX = self.player.x 
            hitboxY = self.player.y + 2
        else
            hitboxWidth = 10
            hitboxHeight = 32
            hitboxX = self.player.x + self.player.width -6
            hitboxY = self.player.y + 2
        end
    end

    self.AttackHitbox3 = Hitbox(hitboxX, hitboxY, hitboxWidth, hitboxHeight)
    if direction == 'left' or  direction == 'right' then
        self.player:changeAnimation('attack3-' .. self.player.direction)
    else
        if left == true then
            self.player:changeAnimation('attack3-left')
        else 
            self.player:changeAnimation('attack3-right')
        end
    end
end

function PlayerAttackState3:enter(params)
    gSounds['attack']:stop()
    gSounds['attack']:play()

    -- restart Attack swing animation
    self.player.currentAnimation:refresh()
end

function PlayerAttackState3:update(dt)
    -- check if hitbox collides with any entities in the scene
    for k, entity in pairs(self.dungeon.currentRoom.entities) do
        if entity:collides(self.AttackHitbox) then
            entity:damage(1)
            gSounds['hit-enemy']:play()
        end
    end

    if self.player.currentAnimation.timesPlayed > 0.5 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end
end

function PlayerAttackState3:render()
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