Room = Class{}

function Room:init(player)
    self.width = MAP_WIDTH
    self.height = MAP_HEIGHT

    -- entities in the room
    self.entities = {}
    self:generateEntities()

    -- game objects in the room
    self.objects = {}

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
    self.interval = 0.55
end

--[[
    Randomly creates an assortment of enemies for the player to fight.
]]
function Room:generateEntities()
    
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
        table.insert(self.objects, Ball{
            x = self.player.x,
            y = self.player.y,
            direction = self.player.direction,
            left = self.player.left
        })
    else
        self.interval = self.interval + dt
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
    end
end

function Room:render()
    -- move through them convincingly
    love.graphics.draw(gTextures['place2'], 0, 0, 0, 
        VIRTUAL_WIDTH / gTextures['place2']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['place2']:getHeight())
    
    if self.player then
        self.player:render()
    end

    for k,ball in pairs(self.objects) do
        ball:render()
    end
end