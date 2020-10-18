EnemyAttackState = Class{__includes = BaseState}

function EnemyAttackState:init(enemy, player, dungeon)
    self.enemy = enemy
    self.player = player
    self.dungeon = dungeon
    self.attack = false
    self.times = 1

    -- render offset for spaced character sprite
    self.enemy.offsetY = 5
    self.enemy.offsetX = 0

    -- create hitbox based on where the enemy is and facing
    local direction = self.enemy.direction
    local left = self.enemy.left

    local hitboxX, hitboxY, hitboxWidth, hitboxHeight

    if direction == 'left' then
        hitboxWidth = 10
        hitboxHeight = 32
        hitboxX = self.enemy.x 
        hitboxY = self.enemy.y + 2
    elseif direction == 'right' then
        hitboxWidth = 10
        hitboxHeight = 32
        hitboxX = self.enemy.x + self.enemy.width - 6
        hitboxY = self.enemy.y + 2
    elseif direction == 'up' then
        if left == true then
            hitboxWidth = 10
            hitboxHeight = 32
            hitboxX = self.enemy.x 
            hitboxY = self.enemy.y + 2
        else
            hitboxWidth = 10
            hitboxHeight = 32
            hitboxX = self.enemy.x + self.enemy.width - 6
            hitboxY = self.enemy.y + 2
        end
    else
        if left == true then
            hitboxWidth = 10
            hitboxHeight = 32
            hitboxX = self.enemy.x 
            hitboxY = self.enemy.y + 2
        else
            hitboxWidth = 10
            hitboxHeight = 32
            hitboxX = self.enemy.x + self.enemy.width -6
            hitboxY = self.enemy.y + 2
        end
    end

    self.AttackHitbox = Hitbox(hitboxX, hitboxY, hitboxWidth, hitboxHeight)
    if direction == 'left' or  direction == 'right' then
        self.enemy:changeAnimation('attack-' .. self.enemy.direction)
    else
        if left == true then
            self.enemy:changeAnimation('attack-left')
        else 
            self.enemy:changeAnimation('attack-right')
        end
    end
end

function EnemyAttackState:enter(params)
    gSounds['attack']:stop()
    gSounds['attack']:play()

    -- restart Attack swing animation
    self.enemy.currentAnimation:refresh()
end

function EnemyAttackState:update(dt)
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

    if self.enemy.currentAnimation.timesPlayed > 0.5 then
        if self.attack == true then
            self.enemy.currentAnimation.timesPlayed = 0
            self.enemy:changeState('attack2')
            self.attack = false
        else
            self.enemy.currentAnimation.timesPlayed = 0
            self.enemy:changeState('idle')
        end
    end
end

function EnemyAttackState:render()
    local anim = self.enemy.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.enemy.x - self.enemy.offsetX), math.floor(self.enemy.y - self.enemy.offsetY))

    -- debug for enemy and hitbox collision rects
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.enemy.x, self.enemy.y, self.enemy.width, self.enemy.height)
    -- love.graphics.rectangle('line', self.AttackHitbox.x, self.AttackHitbox.y,
    --     self.AttackHitbox.width, self.AttackHitbox.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end