PlayerAttackState = Class{__includes = BaseState}

function PlayerAttackState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon
    self.attack = false
    self.times = 1

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 0

    -- create hitbox based on where the player is and facing
    local direction = self.player.direction
    local left = self.player.left

    local hitboxX, hitboxY, hitboxWidth, hitboxHeight

    if direction == 'left' then
        hitboxWidth = 10
        hitboxHeight = 20
        hitboxX = self.player.x + 2
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
            hitboxX = self.player.x + 2
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
            hitboxX = self.player.x + 2
            hitboxY = self.player.y + 8
        else
            hitboxWidth = 10
            hitboxHeight = 20
            hitboxX = self.player.x + self.player.width - 4
            hitboxY = self.player.y + 8
        end
    end

    self.AttackHitbox = Hitbox(hitboxX, hitboxY, hitboxWidth, hitboxHeight)
    if direction == 'left' or  direction == 'right' then
        self.player:changeAnimation('attack-' .. self.player.direction)
    else
        if left == true then
            self.player:changeAnimation('attack-left')
        else 
            self.player:changeAnimation('attack-right')
        end
    end
end

function PlayerAttackState:enter(params)
    gSounds['attack']:stop()
    gSounds['attack']:play()

    -- restart Attack swing animation
    self.player.currentAnimation:refresh()
end

function PlayerAttackState:update(dt)
    -- check if hitbox collides with any entities in the scene
    for k, entity in pairs(self.dungeon.currentRoom.entities) do
        if entity:collides(self.AttackHitbox) then
            entity:damage(1)
            gSounds['hit-enemy']:play()
        end
    end

    if love.keyboard.wasPressed('m') then
        self.attack = true
    end

    if self.player.currentAnimation.timesPlayed > 0.5 then
        if self.attack == true then
            self.player.currentAnimation.timesPlayed = 0
            self.player:changeState('attack2')
            self.attack = false
        else
            self.player.currentAnimation.timesPlayed = 0
            self.player:changeState('idle')
        end
    end
end

function PlayerAttackState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))

    -- debug for player and hitbox collision rects
     love.graphics.setColor(255, 0, 255, 255)
     love.graphics.rectangle('line', self.player.x, self.player.y, self.player.width, self.player.height)
     love.graphics.rectangle('line', self.AttackHitbox.x, self.AttackHitbox.y,
         self.AttackHitbox.width, self.AttackHitbox.height)
     love.graphics.setColor(255, 255, 255, 255)
end