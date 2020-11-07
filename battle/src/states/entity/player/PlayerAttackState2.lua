PlayerAttackState2 = Class{__includes = BaseState}

function PlayerAttackState2:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon
    self.times = 0

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 10

    -- create hitbox based on where the player is and facing
    local direction = self.player.direction
    local left = self.player.left

    local hitboxX, hitboxY, hitboxWidth, hitboxHeight

    if direction == 'left' then
        hitboxWidth = 10
        hitboxHeight = 20
        hitboxX = self.player.x - 6
        hitboxY = self.player.y + 8
    elseif direction == 'right' then
        hitboxWidth = 10
        hitboxHeight = 20
        hitboxX = self.player.x + self.player.width - 4
        hitboxY = self.player.y + 8
    elseif direction == 'up' then
        if left == true then
            hitboxWidth = 10
            hitboxHeight = 20
            hitboxX = self.player.x - 6
            hitboxY = self.player.y + 8
        else
            hitboxWidth = 10
            hitboxHeight = 20
            hitboxX = self.player.x + self.player.width - 4
            hitboxY = self.player.y + 8
        end
    else
        if left == true then
            hitboxWidth = 10
            hitboxHeight = 20
            hitboxX = self.player.x - 6
            hitboxY = self.player.y + 8
        else
            hitboxWidth = 10
            hitboxHeight = 20
            hitboxX = self.player.x + self.player.width - 4
            hitboxY = self.player.y + 8
        end
    end

    self.AttackHitbox2 = Hitbox(hitboxX, hitboxY, hitboxWidth, hitboxHeight)
    if direction == 'left' or  direction == 'right' then
        self.player:changeAnimation('attack2-' .. self.player.direction)
    else
        if left == true then
            self.player:changeAnimation('attack2-left')
        else 
            self.player:changeAnimation('attack2-right')
        end
    end
end

function PlayerAttackState2:enter(params)
    gSounds['attack']:stop()
    gSounds['attack']:play()

    -- restart Attack swing animation
    self.player.currentAnimation:refresh()
end

function PlayerAttackState2:update(dt)
    -- check if hitbox collides with any entities in the scene
    for k, entity in pairs(self.dungeon.currentRoom.entities) do
        if entity:collides(self.AttackHitbox2) then
            entity:damage(1)
            if not entity.dead then
                gSounds['hit-enemy']:play()
            end
        end
    end

    if love.keyboard.wasPressed('m') then
        self.times = 1
    end

    if self.player.currentAnimation.timesPlayed > 0.5 then
        if self.times == 1 then
            self.times = 0
            self.player.currentAnimation.timesPlayed = 0
            self.player:changeState('attack3')
        else
            self.player.currentAnimation.timesPlayed = 0
            self.player:changeState('idle')
        end
    end
end

function PlayerAttackState2:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))

    -- debug for player and hitbox collision rects
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.player.x, self.player.y, self.player.width, self.player.height)
    -- love.graphics.rectangle('line', self.AttackHitbox2.x, self.AttackHitbox2.y,
    --     self.AttackHitbox2.width, self.AttackHitbox2.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end