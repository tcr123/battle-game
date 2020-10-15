PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:enter(player)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerIdleState:update(dt)
    EntityIdleState.update(self, dt)
end

function PlayerIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        if self.entity.item == nil then
            self.entity:changeState('walk')
        else
            self.entity:changeState('carry')
        end
    end

    if self.entity.item == nil then
        if love.keyboard.wasPressed('space') then
            self.entity:changeState('attack')
        end

        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            self.entity:changeState('pickup')
        end
    else
        if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
            self.entity:changeState('throw')
        end
    end
end