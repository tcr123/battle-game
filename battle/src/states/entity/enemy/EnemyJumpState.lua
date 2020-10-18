EnemyJumpState = Class{__includes = BaseState}

function EnemyJumpState:init(enemy)
    self.enemy = enemy

    self.enemy.offsetX = 0
    self.enemy.offsetY = 5

    local direction = self.enemy.direction
    local left = self.enemy.left

    self.top = self.enemy.y - 48
    self.origin = self.enemy.y
    self.down = false
    self.times = 1
    self.bumped = false

    if direction == 'left' or  direction == 'right' then
        self.enemy:changeAnimation('jump-' .. self.enemy.direction)
    else
        if left == true then
            self.enemy:changeAnimation('jump-left')
        else 
            self.enemy:changeAnimation('jump-right')
        end
    end
end

function EnemyJumpState:enter(params)
    self.enemy.currentAnimation:refresh()
end

function EnemyJumpState:update(dt)
    if self.down == true then
        if self.enemy.y <= self.origin then
            self.enemy.y = self.enemy.y - (PLAYER_JUMP_SPEED - 10)* dt
        else
            self.down = false
        end
    elseif self.down == false then
        if self.enemy.y >= self.top then
            self.enemy.y = self.enemy.y + (PLAYER_JUMP_SPEED + 20) * dt
        else
            self.down = true
        end
    end

    if love.keyboard.isDown('left') then
        self.enemy.direction = 'left'
    elseif love.keyboard.isDown('right') then
        self.enemy.direction = 'right'
    end

    if self.enemy.direction == 'left' then
        self.enemy.x = self.enemy.x - self.enemy.walkSpeed * dt

        if self.enemy.x <= MAP_RENDER_OFFSET_X - (TILE_SIZE * 2) then 
            self.enemy.x = MAP_RENDER_OFFSET_X - (TILE_SIZE * 2)
            self.bumped = true
        end
    elseif self.enemy.direction == 'right' then
        self.enemy.x = self.enemy.x + self.enemy.walkSpeed * dt

        if self.enemy.x + self.enemy.width >= VIRTUAL_WIDTH + 12 then
            self.enemy.x = VIRTUAL_WIDTH - self.enemy.width + 12
            self.bumped = true
        end
    end

    if self.bumped then
        if self.enemy.direction == 'left' then
            
            -- temporarily adjust position
            self.enemy.x = self.enemy.x - PLAYER_WALK_SPEED * dt

            -- readjust
            self.enemy.x = self.enemy.x + PLAYER_WALK_SPEED * dt
        elseif self.enemy.direction == 'right' then
            
            -- temporarily adjust position
            self.enemy.x = self.enemy.x + PLAYER_WALK_SPEED * dt

            -- readjust
            self.enemy.x = self.enemy.x - PLAYER_WALK_SPEED * dt
        end
    end

    if self.enemy.currentAnimation.timesPlayed > 1.0 and self.down == false then
        self.enemy.currentAnimation.timesPlayed = 0
        self.enemy:changeState('idle')
    end
end

function EnemyJumpState:render()
    local anim = self.enemy.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.enemy.x - self.enemy.offsetX), math.floor(self.enemy.y - self.enemy.offsetY))
end