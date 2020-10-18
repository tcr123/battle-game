
GameObject = Class{}

function GameObject:init(def, x, y)
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height
    self.dx = 50
    self.dy = 50

    -- default empty collision callback
    self.onCollide = function () end
    self.consumable = def.consumable
    self.pickup = def.pickup
    self.moving = def.moving
    self.movingleft = def.movingleft
    self.movingright = def.movingright
    self.directionThrow = nil
    self.destination = TILE_SIZE * 4
end

function GameObject:update(dt)
    if self.moving == true then
        self.destination = self.destination - self.dx * dt
        if self.destination > 0 then
            if self.directionThrow == 'left' then
                self.x = self.x - self.dx * dt
                self.y = self.y + (self.dy * dt) / 4
            elseif self.directionThrow == 'right' then
                self.x = self.x + self.dx * dt
                self.y = self.y + (self.dy * dt) / 4
            elseif self.directionThrow == 'up' then
                self.y = self.y - self.dy * dt
            elseif self.directionThrow == 'down' then
                self.y = self.y + self.dy * dt
            end

            if self.x <= MAP_RENDER_OFFSET_X + TILE_SIZE then 
                self.moving = false
                gSounds['break']:play()
                if self.state == 'stationary' then
                    self.state = 'broken'
                    self.pickup = false
                end
            elseif self.x + self.width >= VIRTUAL_WIDTH - TILE_SIZE * 2 then
                self.moving = false
                gSounds['break']:play()
                if self.state == 'stationary' then
                    self.state = 'broken'
                    self.pickup = false
                end 
            elseif self.y <= MAP_RENDER_OFFSET_Y + TILE_SIZE - self.height / 2 then
                self.moving = false
                gSounds['break']:play()
                if self.state == 'stationary' then
                    self.state = 'broken'
                    self.pickup = false
                end
            elseif self.y + self.height >= VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE then
                self.moving = false
                gSounds['break']:play()
                if self.state == 'stationary' then
                    self.state = 'broken'
                    self.pickup = false
                end 
            end
        elseif self.destination <= 0 then
            self.moving = false
            gSounds['break']:play()
            if self.state == 'stationary' then
                self.state = 'broken'
                self.pickup = false
            end
        end
    end
end

function GameObject:collides(target)
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                self.y + self.height < target.y or self.y > target.y + target.height)
end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        math.floor(self.x + adjacentOffsetX), math.floor(self.y + adjacentOffsetY))
end