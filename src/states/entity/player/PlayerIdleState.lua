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

    if love.keyboard.wasPressed('n') then
        self.entity:changeState('power1')
    end

    if love.keyboard.wasPressed('space') then
        self.entity:changeState('jump')
    end
end