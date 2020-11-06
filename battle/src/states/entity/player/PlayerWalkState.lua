PlayerWalkState = Class{__includes = EntityWalkState}

function PlayerWalkState:init(player, dungeon)
    self.entity = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerWalkState:update(dt)
    if love.keyboard.isDown('left') then
        self.entity.left = true
        self.entity.direction = 'left'
        self.entity:changeAnimation('walk-left')

        -- move in 135 degree direction
        if love.keyboard.isDown('up') then
            self.entity.y = math.max(MAP_RENDER_OFFSET_Y + TILE_SIZE + self.entity.height, self.entity.y - PLAYER_WALK_SPEED_SCROLL * dt)

        -- move in 225 degree direction
        elseif love.keyboard.isDown('down') then
            self.entity.y = self.entity.y + PLAYER_WALK_SPEED_SCROLL * dt

            local bottomEdge = VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) 
            + MAP_RENDER_OFFSET_Y - TILE_SIZE

            if self.entity.y + self.entity.height >= bottomEdge then
                self.entity.y = bottomEdge - self.entity.height
            end
        end

    elseif love.keyboard.isDown('right') then
        self.entity.left = false
        self.entity.direction = 'right'
        self.entity:changeAnimation('walk-right')

        -- move in 45 degree direction
        if love.keyboard.isDown('up') then
            self.entity.y = math.max(MAP_RENDER_OFFSET_Y + TILE_SIZE + self.entity.height, self.entity.y - PLAYER_WALK_SPEED_SCROLL * dt)

        -- move in 315 degree direction
        elseif love.keyboard.isDown('down') then
            self.entity.y = self.entity.y + PLAYER_WALK_SPEED_SCROLL * dt
            
            local bottomEdge = VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) 
            + MAP_RENDER_OFFSET_Y - TILE_SIZE

            if self.entity.y + self.entity.height >= bottomEdge then
                self.entity.y = bottomEdge - self.entity.height
            end
        end

    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        if self.entity.left == true then
            self.entity:changeAnimation('walk-left')
        else 
            self.entity:changeAnimation('walk-right')
        end

    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        if self.entity.left == true then
            self.entity:changeAnimation('walk-left')
        else 
            self.entity:changeAnimation('walk-right')
        end

    else
        if self.entity.left == true then
            self.entity.direction = 'left'
        else 
            self.entity.direction = 'right'
        end
        self.entity:changeState('idle')
    end

    if love.keyboard.wasPressed('m') then
        self.entity:changeState('attack')
    end

    if love.keyboard.wasPressed('n') then
        self.entity:changeState('power1')
    end

    if love.keyboard.wasPressed('space') then
        self.entity:changeState('jump')
    end

    -- perform base collision detection against walls
    EntityWalkState.update(self, dt)

    -- if we bumped something when checking collision, check any object collisions
    if self.bumped then
        if self.entity.direction == 'left' then
            
            -- temporarily adjust position
            self.entity.x = self.entity.x - PLAYER_WALK_SPEED * dt

            -- readjust
            self.entity.x = self.entity.x + PLAYER_WALK_SPEED * dt
        elseif self.entity.direction == 'right' then
            
            -- temporarily adjust position
            self.entity.x = self.entity.x + PLAYER_WALK_SPEED * dt

            for k, doorway in pairs(self.dungeon.currentRoom.doorways) do
                if self.entity:collides(doorway) and doorway.open then
                    Event.dispatch('shift-right')
                end
            end

            -- readjust
            self.entity.x = self.entity.x - PLAYER_WALK_SPEED * dt
        elseif self.entity.direction == 'up' then
            
            -- temporarily adjust position
            self.entity.y = self.entity.y - PLAYER_WALK_SPEED * dt

            -- readjust
            self.entity.y = self.entity.y + PLAYER_WALK_SPEED * dt
        else
            
            -- temporarily adjust position
            self.entity.y = self.entity.y + PLAYER_WALK_SPEED * dt

            -- readjust
            self.entity.y = self.entity.y - PLAYER_WALK_SPEED * dt
        end
    end
end