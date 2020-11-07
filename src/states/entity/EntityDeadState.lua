EntityDeadState = Class{__includes = BaseState}

function EntityDeadState:init(entity)
    self.entity = entity
    self.entity.offsetX = 10

    if self.entity.direction == 'left' or  self.entity.direction == 'right' then
        self.entity:changeAnimation('dead-' .. self.entity.direction)
    else
        if self.entity.left == true then
            self.entity:changeAnimation('dead-left')
        else 
            self.entity:changeAnimation('dead-right')
        end
    end
end

function EntityDeadState:processAI(params, dt)
    
end

function EntityDeadState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
    
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.entity.x, self.entity.y, self.entity.width, self.entity.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end