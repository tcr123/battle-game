EntityAttackState = Class{__includes = BaseState}

function EntityAttackState:init(entity)
    self.entity = entity

    local direction = self.entity.direction
    local left = self.entity.left

    local hitboxX, hitboxY, hitboxWidth, hitboxHeight

    if direction == 'left' then
        hitboxWidth = 10
        hitboxHeight = 16
        hitboxX = self.entity.x 
        hitboxY = self.entity.y + 10
    elseif direction == 'right' then
        hitboxWidth = 10
        hitboxHeight = 16
        hitboxX = self.entity.x + self.entity.width - 6
        hitboxY = self.entity.y + 10
    elseif direction == 'up' then
        if left == true then
            hitboxWidth = 10
            hitboxHeight = 16
            hitboxX = self.entity.x 
            hitboxY = self.entity.y + 10
        else
            hitboxWidth = 10
            hitboxHeight = 16
            hitboxX = self.entity.x + self.entity.width - 6
            hitboxY = self.entity.y + 10
        end
    else
        if left == true then
            hitboxWidth = 10
            hitboxHeight = 16
            hitboxX = self.entity.x 
            hitboxY = self.entity.y + 10
        else
            hitboxWidth = 10
            hitboxHeight = 16
            hitboxX = self.entity.x + self.entity.width -6
            hitboxY = self.entity.y + 10
        end
    end

    self.EnemyHitbox = Hitbox(hitboxX, hitboxY, hitboxWidth, hitboxHeight)
end

function EntityAttackState:processAI(params, dt)
    local room = params.room
    self.player = params.player

    if self.player:collides(self.EnemyHitbox) then
        if self.entity.direction == 'left' or  self.entity.direction == 'right' then
            self.entity:changeAnimation('attack-' .. self.entity.direction)
            self.player.hit = true
        else
            if self.entity.left == true then
                self.entity:changeAnimation('attack-left')
                self.player.hit = true
            else 
                self.entity:changeAnimation('attack-right')
                self.player.hit = true
            end
        end
    end

    if self.player.hit == true then
        self.player:damage(0)
        self.player:goInvulnerable(1.5)
        self.player.hit = false
    end

    if self.player.currentAnimation.timesPlayed > 0.5 then
        if self.player.invulnerable then
            self.entity:changeState('idle')
        else 
            self.entity:changeState('walk')
        end
    end
end

function EntityAttackState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
    
    -- debug for player and hitbox collision rects
     love.graphics.setColor(255, 0, 255, 255)
     love.graphics.rectangle('line', self.entity.x, self.entity.y, self.entity.width, self.entity.height)
     love.graphics.rectangle('line', self.EnemyHitbox.x, self.EnemyHitbox.y,
         self.EnemyHitbox.width, self.EnemyHitbox.height)
     love.graphics.setColor(255, 255, 255, 255)
end