Room = Class{}

function Room:init(player)
    self.width = MAP_WIDTH
    self.height = MAP_HEIGHT

    -- entities in the room
    self.entities = {}
    self:generateEntities()

    -- game objects in the room
    self.objects = {}
    self:generateObjects()

    -- reference to player for collisions, etc.
    self.player = player

    -- used for centering the dungeon rendering
    self.renderOffsetX = MAP_RENDER_OFFSET_X
    self.renderOffsetY = MAP_RENDER_OFFSET_Y

    -- used for drawing when this room is the next room, adjacent to the active
    self.adjacentOffsetX = 0
    self.adjacentOffsetY = 0

    self.spawnHeart = false
    self.posibility = math.random(2)
end

--[[
    Randomly creates an assortment of enemies for the player to fight.
]]
function Room:generateEntities()
    
end

--[[
    Randomly creates an assortment of obstacles for the player to navigate around.
]]
function Room:generateObjects()
    if love.keyboard.wasPressed('n') then
        if TYPE == 1 then
            if self.player.direction == 'left' then
                table.insert(self.objects, GameObject(
                GAME_OBJECT_DEFS['flare-left'],
                self.player.x , self.player.y
                ))
            elseif self.player.direction == 'right' then
                table.insert(self.objects, GameObject(
                GAME_OBJECT_DEFS['flare-right'],
                self.player.x + 41 , self.player.y
                ))
            else
                if self.player.left == true then
                    table.insert(self.objects, GameObject(
                    GAME_OBJECT_DEFS['flare-left'],
                    self.player.x , self.player.y
                    ))
                else 
                    table.insert(self.objects, GameObject(
                    GAME_OBJECT_DEFS['flare-right'],
                    self.player.x + 41 , self.player.y
                    ))
                end
            end
        end

        if TYPE == 3 then
            if self.player.direction == 'left' then
                table.insert(self.objects, GameObject(
                GAME_OBJECT_DEFS['dennis-ball-left'],
                self.player.x , self.player.y
                ))
            elseif self.player.direction == 'right' then
                table.insert(self.objects, GameObject(
                GAME_OBJECT_DEFS['dennis-ball-right'],
                self.player.x + 41 , self.player.y
                ))
            else
                if self.player.left == true then
                    table.insert(self.objects, GameObject(
                    GAME_OBJECT_DEFS['dennis-ball-left'],
                    self.player.x , self.player.y
                    ))
                else 
                    table.insert(self.objects, GameObject(
                    GAME_OBJECT_DEFS['dennis-ball-right'],
                    self.player.x + 41 , self.player.y
                    ))
                end
            end
        end
        if TYPE == 4 then
            if self.player.direction == 'left' then
                table.insert(self.objects, GameObject(
                GAME_OBJECT_DEFS['davis-ball-left'],
                self.player.x , self.player.y
                ))
            elseif self.player.direction == 'right' then
                table.insert(self.objects, GameObject(
                GAME_OBJECT_DEFS['davis-ball-right'],
                self.player.x + 41 , self.player.y
                ))
            else
                if self.player.left == true then
                    table.insert(self.objects, GameObject(
                    GAME_OBJECT_DEFS['davis-ball-left'],
                    self.player.x , self.player.y
                    ))
                else 
                    table.insert(self.objects, GameObject(
                    GAME_OBJECT_DEFS['davis-ball-right'],
                    self.player.x + 41 , self.player.y
                    ))
                end
            end
        end
    end
end

function Room:update(dt)
    -- don't update anything if we are sliding to another room (we have offsets)
    if self.adjacentOffsetX ~= 0 or self.adjacentOffsetY ~= 0 then return end

    self.player:update(dt)
end

function Room:render()
    for k, object in pairs(self.objects) do
        object:render(self.adjacentOffsetX, self.adjacentOffsetY)
    end

    -- move through them convincingly
    love.graphics.draw(gTextures['place2'], 0, 0, 0, 
        VIRTUAL_WIDTH / gTextures['place2']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['place2']:getHeight())
    
    if self.player then
        self.player:render()
    end
end