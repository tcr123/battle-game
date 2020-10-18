PlayerJumpState = Class{__includes = BaseState}

function PlayerJumpState:init(player)
    self.player = player

    self.player.offsetX = 0
    self.player.offsetY = 5

    local direction = self.player.direction
    local left = self.player.left

    self.top = self.player.y - 48
    self.origin = self.player.y
    self.down = false
    self.times = 1
    self.bumped = false

    if direction == 'left' or  direction == 'right' then
        self.player:changeAnimation('jump-' .. self.player.direction)
    else
        if left == true then
            self.player:changeAnimation('jump-left')
        else 
            self.player:changeAnimation('jump-right')
        end
    end
end

function PlayerJumpState:enter(params)
    self.player.currentAnimation:refresh()
end

function PlayerJumpState:update(dt)
    if self.down == true then
        if self.player.y <= self.origin then
            self.player.y = self.player.y - (PLAYER_JUMP_SPEED - 10)* dt
        else
            self.down = false
        end
    elseif self.down == false then
        if self.player.y >= self.top then
            self.player.y = self.player.y + (PLAYER_JUMP_SPEED + 20) * dt
        else
            self.down = true
        end
    end


    if love.keyboard.isDown('left') then
        self.player.direction = 'left'
        self.player.x = self.player.x - self.player.walkSpeed * dt

        if self.player.x <= MAP_RENDER_OFFSET_X - (TILE_SIZE * 2) then 
            self.player.x = MAP_RENDER_OFFSET_X - (TILE_SIZE * 2)
            self.bumped = true
        end
    elseif love.keyboard.isDown('right') then
        self.player.direction = 'right'
        self.player.x = self.player.x + self.player.walkSpeed * dt

        if self.player.x + self.player.width >= VIRTUAL_WIDTH + 12 then
            self.player.x = VIRTUAL_WIDTH - self.player.width + 12
            self.bumped = true
        end
    end

    if self.bumped then
        if self.player.direction == 'left' then
            
            -- temporarily adjust position
            self.player.x = self.player.x - PLAYER_WALK_SPEED * dt

            -- readjust
            self.player.x = self.player.x + PLAYER_WALK_SPEED * dt
        elseif self.player.direction == 'right' then
            
            -- temporarily adjust position
            self.player.x = self.player.x + PLAYER_WALK_SPEED * dt

            -- readjust
            self.player.x = self.player.x - PLAYER_WALK_SPEED * dt
        end
    end

    if self.player.currentAnimation.timesPlayed > 1.0 and self.down == false then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end
end

function PlayerJumpState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end