PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:enter(player)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 10
end

function PlayerIdleState:update(dt)
    EntityIdleState.update(self, dt)
end

function PlayerIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk')
    end

    if love.keyboard.wasPressed('m') then
        self.entity:changeState('attack')
    end

    if self.entity.magic >= 20 then
        if love.keyboard.wasPressed('n') then
            self.entity:changeState('power1')
        end
    end

    if self.entity.magic >= 50 then
        if love.keyboard.wasPressed('b') then
            self.entity.magic = self.entity.magic - 50
            self.entity:changeState('power2')
        end
    end

    if love.keyboard.wasPressed('space') then
        self.entity:changeState('jump')
    end
end