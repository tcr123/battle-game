Doorway = Class{}

function Doorway:init(direction, open, room)
    self.direction = direction
    self.open = open
    self.room = room

    if direction == 'right' then
        self.x = MAP_RENDER_OFFSET_X + (MAP_WIDTH * TILE_SIZE) - TILE_SIZE
        self.y = 0
        self.height = VIRTUAL_HEIGHT
        self.width = 16
    end
end

function Doorway:render(offsetX, offsetY)
    local texture = gTextures['tiles']
    local quads = gFrames['tiles']

    -- used for shifting the doors when sliding rooms
    self.x = self.x + offsetX
    self.y = self.y + offsetY

    if self.direction == 'right' then
        if self.open then
            love.graphics.draw(texture, quads[172], self.x, self.y)
            love.graphics.draw(texture, quads[173], self.x + TILE_SIZE, self.y)
            love.graphics.draw(texture, quads[191], self.x, self.y + TILE_SIZE)
            love.graphics.draw(texture, quads[192], self.x + TILE_SIZE, self.y + TILE_SIZE)
        else
            love.graphics.draw(texture, quads[174], self.x, self.y)
            love.graphics.draw(texture, quads[175], self.x + TILE_SIZE, self.y)
            love.graphics.draw(texture, quads[193], self.x, self.y + TILE_SIZE)
            love.graphics.draw(texture, quads[194], self.x + TILE_SIZE, self.y + TILE_SIZE)
        end
    end

    -- revert to original positions
    self.x = self.x - offsetX
    self.y = self.y - offsetY
end