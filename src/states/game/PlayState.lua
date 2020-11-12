PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
    
end

function PlayState:init()
    self.level = 1
    self.times = 1
    self.recoverMpDuration = 2
    self.recoverMpTimer = 0

    self.player = Player {
        animations = ENTITY_DEFS['player'..TYPE].animations,
        walkSpeed = ENTITY_DEFS['player'..TYPE].walkSpeed,
        
        x = VIRTUAL_WIDTH / 2 - 8,
        y = VIRTUAL_HEIGHT / 2 - 11,
        
        width = 20,
        height = 30,

        -- one heart == 2 health
        health = ENTITY_DEFS['player'..TYPE].health,
        magic = ENTITY_DEFS['player'..TYPE].magic,
        attack = ENTITY_DEFS['player'..TYPE].attack,
        defend = ENTITY_DEFS['player'..TYPE].defend,

        -- rendering and collision offset for spaced sprites
        offsetY = -5
    }

    self.dungeon = Dungeon(self.player, self.level)
    self.currentRoom = Room(self.player, self.level)
        
    self.player.stateMachine = StateMachine {
        ['walk'] = function() return PlayerWalkState(self.player, self.dungeon) end,
        ['idle'] = function() return PlayerIdleState(self.player) end,
        ['attack'] = function() return PlayerAttackState(self.player, self.dungeon) end,
        ['attack2'] = function() return PlayerAttackState2(self.player, self.dungeon) end,
        ['attack3'] = function() return PlayerAttackState3(self.player, self.dungeon) end,
        ['jump'] = function() return PlayerJumpState(self.player) end,
        ['power1'] = function() return PlayerPower1State(self.player, self.dungeon) end,
        ['power2'] = function() return PlayerPower2State(self.player, self.dungeon) end
    }

    self.player:changeState('idle')
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if self.dungeon.shifting == true and self.times == 1 then
        self.level = self.level + 1
        self.dungeon.level = self.level
        self.currentRoom.level = self.level
        self.times = 0
    elseif self.dungeon.shifting == false then
        self.times = 1
    end

    self.recoverMpTimer = self.recoverMpTimer + dt

    if self.recoverMpTimer > self.recoverMpDuration then
        self.recoverMpTimer = 0
        self.player.magic = math.min(self.player.magic + 10, 100)
    end

    self.dungeon:update(dt)

    if self.level > 6 then
        gStateMachine:change('victory')
    end
end

function PlayState:render()
    -- render dungeon and all entities separate from hearts GUI
    love.graphics.push()
    self.dungeon:render()
    love.graphics.pop()

    love.graphics.printf('No: ' .. tostring(self.level), 20, 36, 182, 'center')

    -- draw player hearts, top of screen
    local heartFrame = 5

    love.graphics.draw(gTextures['hearts'], gFrames['hearts'][heartFrame],
        (1) * (TILE_SIZE), 2)
    
    love.graphics.printf('HP: ' .. tostring(self.player.health), TILE_SIZE * 2, 2, 182)

    love.graphics.setColor(50, 37, 214, 255)
    love.graphics.printf('MP: ' .. tostring(self.player.magic), TILE_SIZE * 2, 16, 182)
end