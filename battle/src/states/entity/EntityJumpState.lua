EntityJumpState = Class{__includes = BaseState}

function EntityJumpState:init(entity)
    self.entity = entity

    if self.entity.direction == 'left' or  self.entity.direction == 'right' then
        self.entity:changeAnimation('jump-' .. self.entity.direction)
    else
        if self.entity.left == true then
            self.entity:changeAnimation('jump-left')
        else 
            self.entity:changeAnimation('jump-right')
        end
    end
end

function EntityJumpState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
end