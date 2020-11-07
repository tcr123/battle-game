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
    -- used for shifting the doors when sliding rooms
    self.x = self.x + offsetX
    self.y = self.y + offsetY

    -- revert to original positions
    self.x = self.x - offsetX
    self.y = self.y - offsetY
end