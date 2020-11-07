Room = Class{}

function Room:init(player, level)
    self.width = MAP_WIDTH
    self.height = MAP_HEIGHT

    -- game objects in the room
    self.objects = {}

    -- reference to player for collisions, etc.
    self.player = player
    self.level = level

    -- entities in the room
    self.entities = {}
    self:generateEntities()

    self.doorways = {}
    table.insert(self.doorways, Doorway('right', false, self))

    -- used for centering the dungeon rendering
    self.renderOffsetX = MAP_RENDER_OFFSET_X
    self.renderOffsetY = MAP_RENDER_OFFSET_Y

    -- used for drawing when this room is the next room, adjacent to the active
    self.adjacentOffsetX = 0
    self.adjacentOffsetY = 0

    self.interval = 0.55
end

--[[
    Randomly creates an assortment of enemies for the player to fight.
]]
function Room:generateEntities()
    local speed = {60, 70, 80}
    for i = 1, 2 do
        table.insert(self.entities, Entity {
            animations = ENTITY_DEFS['enemy'].animations,
            walkSpeed = speed[math.random(#speed)],

            -- ensure X and Y are within bounds of the map
            x = VIRTUAL_WIDTH - TILE_SIZE * 2,

            y = math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 41),
            
            width = 20,
            height = 30,

            health = ENTITY_DEFS['enemy'].health,
            attack = ENTITY_DEFS['enemy'].attack,
            defend = ENTITY_DEFS['enemy'].defend
        })

        self.entities[i].stateMachine = StateMachine {
            ['walk'] = function() return EntityWalkState(self.entities[i]) end,
            ['idle'] = function() return EntityIdleState(self.entities[i]) end,
            ['attack'] = function() return EntityAttackState(self.entities[i]) end,
            ['dead'] = function() return EntityDeadState(self.entities[i]) end,
            ['hurt'] = function() return EntityHurtState(self.entities[i]) end
        }

        self.entities[i]:changeState('walk')
    end

    if self.level > 1 then
        for i = 3, 4 do
            table.insert(self.entities, Entity {
                animations = ENTITY_DEFS['enemy'].animations,
                walkSpeed = speed[math.random(#speed)],

                -- ensure X and Y are within bounds of the map
                x = MAP_RENDER_OFFSET_X - 50,

                y = math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                    VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 41),
                
                width = 20,
                height = 30,

                health = ENTITY_DEFS['enemy'].health,
                attack = ENTITY_DEFS['enemy'].attack,
                defend = ENTITY_DEFS['enemy'].defend
            })

            self.entities[i].stateMachine = StateMachine {
                ['walk'] = function() return EntityWalkState(self.entities[i]) end,
                ['idle'] = function() return EntityIdleState(self.entities[i]) end,
                ['attack'] = function() return EntityAttackState(self.entities[i]) end,
                ['dead'] = function() return EntityDeadState(self.entities[i]) end,
                ['hurt'] = function() return EntityHurtState(self.entities[i]) end
            }

            self.entities[i]:changeState('walk')
        end
    end

    if self.level > 2 then
        for i = 5, 6 do
            table.insert(self.entities, Entity {
                animations = ENTITY_DEFS['enemy'].animations,
                walkSpeed = speed[math.random(#speed)],
    
                -- ensure X and Y are within bounds of the map
                x = VIRTUAL_WIDTH - TILE_SIZE * 2,
    
                y = math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                    VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 41),
                
                width = 20,
                height = 30,
    
                health = ENTITY_DEFS['enemy'].health,
                attack = ENTITY_DEFS['enemy'].attack,
                defend = ENTITY_DEFS['enemy'].defend
            })
    
            self.entities[i].stateMachine = StateMachine {
                ['walk'] = function() return EntityWalkState(self.entities[i]) end,
                ['idle'] = function() return EntityIdleState(self.entities[i]) end,
                ['attack'] = function() return EntityAttackState(self.entities[i]) end,
                ['dead'] = function() return EntityDeadState(self.entities[i]) end,
                ['hurt'] = function() return EntityHurtState(self.entities[i]) end
            }
    
            self.entities[i]:changeState('walk')
        end
    end

    if self.level > 3 then
        for i = 7, 8 do
            table.insert(self.entities, Entity {
                animations = ENTITY_DEFS['enemy'].animations,
                walkSpeed = speed[math.random(#speed)],

                -- ensure X and Y are within bounds of the map
                x = MAP_RENDER_OFFSET_X - 50,

                y = math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                    VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 41),
                
                width = 20,
                height = 30,

                health = ENTITY_DEFS['enemy'].health,
                attack = ENTITY_DEFS['enemy'].attack,
                defend = ENTITY_DEFS['enemy'].defend
            })

            self.entities[i].stateMachine = StateMachine {
                ['walk'] = function() return EntityWalkState(self.entities[i]) end,
                ['idle'] = function() return EntityIdleState(self.entities[i]) end,
                ['attack'] = function() return EntityAttackState(self.entities[i]) end,
                ['dead'] = function() return EntityDeadState(self.entities[i]) end,
                ['hurt'] = function() return EntityHurtState(self.entities[i]) end
            }

            self.entities[i]:changeState('walk')
        end
    end

    if self.level > 4 then
        for i = 9, 10 do
            table.insert(self.entities, Entity {
                animations = ENTITY_DEFS['enemy'].animations,
                walkSpeed = speed[math.random(#speed)],
    
                -- ensure X and Y are within bounds of the map
                x = VIRTUAL_WIDTH - TILE_SIZE * 2,
    
                y = math.random(MAP_RENDER_OFFSET_Y + TILE_SIZE,
                    VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) + MAP_RENDER_OFFSET_Y - TILE_SIZE - 41),
                
                width = 20,
                height = 30,
    
                health = ENTITY_DEFS['enemy'].health,
                attack = ENTITY_DEFS['enemy'].attack,
                defend = ENTITY_DEFS['enemy'].defend
            })
    
            self.entities[i].stateMachine = StateMachine {
                ['walk'] = function() return EntityWalkState(self.entities[i]) end,
                ['idle'] = function() return EntityIdleState(self.entities[i]) end,
                ['attack'] = function() return EntityAttackState(self.entities[i]) end,
                ['dead'] = function() return EntityDeadState(self.entities[i]) end,
                ['hurt'] = function() return EntityHurtState(self.entities[i]) end
            }
    
            self.entities[i]:changeState('walk')
        end
    end
end

--[[
    Randomly creates an assortment of obstacles for the player to navigate around.
]]

function Room:update(dt)
    -- don't update anything if we are sliding to another room (we have offsets)
    if self.adjacentOffsetX ~= 0 or self.adjacentOffsetY ~= 0 then return end

    self.player:update(dt)

    if love.keyboard.wasPressed('n') and self.interval > 0.5  then
        self.interval = 0
        table.insert(self.objects, Ball {
            x = self.player.x,
            y = self.player.y,
            direction = self.player.direction,
            left = self.player.left
        })
    else
        self.interval = self.interval + dt
    end

    for i = #self.entities, 1, -1 do
        local entity = self.entities[i]

        -- remove entity from the table if health is <= 0
        if entity.health <= 0 then
            entity:changeState('dead')
            Timer.after(1, function()
                entity.dead = true
                if entity.dead == true then
                    for k, doorway in pairs(self.doorways) do
                        doorway.open = true
                    end
        
                    gSounds['door']:play()
                end
            end)
        elseif not entity.dead then
            entity:processAI({room = self, player = self.player}, dt)
            entity:update(dt)
        end
        
        if self.player.health == 0 then
            gStateMachine:change('game-over')
        end
    end

    for k,ball in pairs(self.objects) do
        ball:update(dt)
    end

    for k,ball in pairs(self.objects) do
        if ball.x <= MAP_RENDER_OFFSET_X - 60 then 
            table.remove(self.objects, k)
        elseif ball.x >= VIRTUAL_WIDTH + 60 then
            table.remove(self.objects, k)
        end

        for k, entity in pairs(self.entities) do
            if ball:collides(entity) then
                table.remove(self.objects, k)
                entity:damage(50 * self.player.attackV / entity.defendV)
                if not entity.dead then
                    gSounds['hit-enemy']:play()
                end
            end
        end
    end
end

function Room:render()
    -- move through them convincingly

    love.graphics.draw(gTextures['place2'], 0, 0, 0, 
        VIRTUAL_WIDTH / gTextures['place2']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['place2']:getHeight())
    
    for k, entity in pairs(self.entities) do
        if not entity.dead then entity:render(self.adjacentOffsetX, self.adjacentOffsetY) end
    end

    love.graphics.printf('No: ' .. tostring(self.level), 20, 64, 182, 'center')

    if self.player then
        self.player:render()
    end

    for k,ball in pairs(self.objects) do
        ball:render()
    end
end