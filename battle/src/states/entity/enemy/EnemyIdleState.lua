EnemyIdleState = Class{__includes = EntityIdleState}

function EnemyIdleState:enter(enemy)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function EnemyIdleState:update(dt)
    EntityIdleState.update(self, dt)
end

function EnemyIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk')
    end

    if love.keyboard.wasPressed('m') then
        self.entity:changeState('attack')
    end

    if love.keyboard.wasPressed('space') then
        self.entity:changeState('jump')
    end
end