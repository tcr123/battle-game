EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity, dungeon)
    self.entity = entity
    self.entity:changeAnimation('walk-left')

    self.dungeon = dungeon

    -- used for AI control
    self.moveDuration = 0
    self.movementTimer = 0

    -- keeps track of whether we just hit a wall
    self.bumped = false
end

function EntityWalkState:update(dt)
    
    -- assume we didn't hit a wall
    self.bumped = false

    if self.entity.direction == 'left' then
        self.entity.x = self.entity.x - self.entity.walkSpeed * dt

        if self.entity.x <= MAP_RENDER_OFFSET_X - (TILE_SIZE * 2) then 
            self.entity.x = MAP_RENDER_OFFSET_X - (TILE_SIZE * 2)
            self.bumped = true
        end
    elseif self.entity.direction == 'right' then
        self.entity.x = self.entity.x + self.entity.walkSpeed * dt

        if self.entity.x + self.entity.width >= VIRTUAL_WIDTH + 12 then
            self.entity.x = VIRTUAL_WIDTH - self.entity.width + 12
            self.bumped = true
        end
    elseif self.entity.direction == 'up' then
        self.entity.y = self.entity.y - self.entity.walkSpeed * dt

        if self.entity.y <= MAP_RENDER_OFFSET_Y + TILE_SIZE + self.entity.height then 
            self.entity.y = MAP_RENDER_OFFSET_Y + TILE_SIZE + self.entity.height
            self.bumped = true
        end
    elseif self.entity.direction == 'down' then
        self.entity.y = self.entity.y + self.entity.walkSpeed * dt

        local bottomEdge = VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) 
            + MAP_RENDER_OFFSET_Y - TILE_SIZE

        if self.entity.y + self.entity.height >= bottomEdge then
            self.entity.y = bottomEdge - self.entity.height
            self.bumped = true
        end
    elseif self.entity.direction =='up-right' then
        self.entity.x = self.entity.x + self.entity.walkSpeed * dt
        self.entity.y = self.entity.y - PLAYER_WALK_SPEED_SCROLL * dt

        if self.entity.x + self.entity.width >= VIRTUAL_WIDTH + 12 then
            self.entity.x = VIRTUAL_WIDTH - self.entity.width + 12
            self.bumped = true
        end

        if self.entity.y <= MAP_RENDER_OFFSET_Y + TILE_SIZE + self.entity.height then 
            self.entity.y = MAP_RENDER_OFFSET_Y + TILE_SIZE + self.entity.height
            self.bumped = true
        end
    end
end

function EntityWalkState:processAI(params, dt)
    local room = params.room
    self.player = params.player
    local reach = false

    if self.entity.x < self.player.x + 20 and reach == false then
        self.entity.direction = 'right'
        self.entity.left = true
        if self.entity.x > self.player.x then
            reach = true
        end
    elseif self.entity.x > self.player.x - 20 and reach == false then
        self.entity.direction = 'left'
        self.entity.left = true
        if self.entity.x < self.player.x then
            reach = true
        end
    end

    if self.entity.y < self.player.y and reach == true then
        self.entity.direction = 'down'
        if self.entity.y > self.player.y then
            reach = false
        end
    elseif self.entity.y > self.player.y and reach == true then
        self.entity.direction = 'up'
        if self.entity.y < self.player.y then
            reach = false
        end
    end

    if self.entity.direction == 'right' or self.entity.direction == 'left' then
        self.entity:changeAnimation('walk-' .. tostring(self.entity.direction))
    else
        if self.entity.left == true then
            self.entity:changeAnimation('walk-left')
        else
            self.entity:changeAnimation('walk-right')
        end
    end

    if not self.entity.dead and self.player:collides(self.entity) and not self.player.invulnerable then
        self.entity:changeState('attack')
    end 
end

function EntityWalkState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
    
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.entity.x, self.entity.y, self.entity.width, self.entity.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end