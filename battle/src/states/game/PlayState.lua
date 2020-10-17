PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
    
end

function PlayState:init()
    self.player = Player {
        animations = ENTITY_DEFS['player'..TYPE].animations,
        walkSpeed = ENTITY_DEFS['player'..TYPE].walkSpeed,
        
        x = VIRTUAL_WIDTH / 2 - 8,
        y = VIRTUAL_HEIGHT / 2 - 11,
        
        width = 41,
        height = 41,

        -- one heart == 2 health
        health = 6,

        -- rendering and collision offset for spaced sprites
        offsetY = 5
    }

    self.dungeon = Dungeon(self.player)
    self.currentRoom = Room(self.player)
    
    self.player.stateMachine = StateMachine {
        ['walk'] = function() return PlayerWalkState(self.player, self.dungeon) end,
        ['idle'] = function() return PlayerIdleState(self.player) end,
        ['attack'] = function() return PlayerAttackState(self.player, self.dungeon) end,
        ['attack2'] = function() return PlayerAttackState2(self.player, self.dungeon) end,
        ['attack3'] = function() return PlayerAttackState3(self.player, self.dungeon) end,
        ['jump'] = function() return PlayerJumpState(self.player) end,
        ['power1'] = function() return PlayerPower1State(self.player, self.dungeon) end
    }
    self.player:changeState('idle')
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    self.dungeon:update(dt)
end

function PlayState:render()
    -- render dungeon and all entities separate from hearts GUI
    love.graphics.push()
    self.dungeon:render()
    love.graphics.pop()

    -- draw player hearts, top of screen
    local healthLeft = self.player.health
    local heartFrame = 1

    for i = 1, 3 do
        if healthLeft > 1 then
            heartFrame = 5
        elseif healthLeft == 1 then
            heartFrame = 3
        else
            heartFrame = 1
        end

        love.graphics.draw(gTextures['hearts'], gFrames['hearts'][heartFrame],
            (i - 1) * (TILE_SIZE + 1), 2)
        
        healthLeft = healthLeft - 2
    end
end