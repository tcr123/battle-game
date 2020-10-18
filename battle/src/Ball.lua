Ball = Class{}

function Ball:init(def)
    self.x = def.x
    self.y = def.y
    self.direction = def.direction
    self.left = def.left

    if self.type == 1 then
        self.width = 60
        self.height = 60
    elseif self.type == 2 then
        self.width = 34
        self.height =30
    elseif self.type == 3 then
        self.width = 57
        self.height = 44
    elseif self.type == 4 then
        self.width = 69
        self.height = 34
    end

    -- these variables are for keeping track of our velocity on both the
    -- X and Y axis, since the ball can move in two dimensions
    self.dy = 0
    self.dx = 150

    self.type = TYPE
end

--[[
    Expects an argument with a bounding box, be that a paddle or a brick,
    and returns true if the bounding boxes of this and the argument overlap.
]]
function Ball:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

--[[
    Places the ball in the middle of the screen, with no movement.
]]
function Ball:reset()
    self.x = VIRTUAL_WIDTH / 2 - 2
    self.y = VIRTUAL_HEIGHT / 2 - 2
    self.dx = 0
    self.dy = 0
end

function Ball:update(dt)
    if self.direction == 'left' then
        self.x = self.x - self.dx * dt
    elseif self.direction == 'right' then
        self.x = self.x + self.dx * dt
    else
        if self.left == true then
            self.x = self.x - self.dx * dt
        else
            self.x = self.x + self.dx * dt
        end
    end
end

function Ball:render()
    -- gTexture is our global texture for all blocks
    -- gBallFrames is a table of quads mapping to each individual ball skin in the texture
    if self.type == 1 then
        if self.direction == 'left' then
            love.graphics.draw(gTextures['flare-ballmirror'], gFrames['flare-ballmirror'][4],
            self.x, self.y)
        elseif self.direction == 'right' then
            love.graphics.draw(gTextures['flare-ball'], gFrames['flare-ball'][1],
            self.x + 4, self.y)
        else
            if self.left == true then
                love.graphics.draw(gTextures['flare-ballmirror'], gFrames['flare-ballmirror'][4],
                self.x, self.y)
            else
                love.graphics.draw(gTextures['flare-ball'], gFrames['flare-ball'][1],
                self.x + 4, self.y)
            end
        end
    elseif self.type == 2 then
        if self.direction == 'left' then
            love.graphics.draw(gTextures['ex-ballmirror'], gFrames['ex-ballmirror'][4],
            self.x, self.y)
        elseif self.direction == 'right' then
            love.graphics.draw(gTextures['ex-ball'], gFrames['ex-ball'][1],
            self.x + 4, self.y)
        else
            if self.left == true then
                love.graphics.draw(gTextures['ex-ballmirror'], gFrames['ex-ballmirror'][4],
                self.x, self.y)
            else
                love.graphics.draw(gTextures['ex-ball'], gFrames['ex-ball'][1],
                self.x + 4, self.y)
            end
        end
    elseif self.type == 3 then
        if self.direction == 'left' then
            love.graphics.draw(gTextures['dennis-ballmirror'], gFrames['dennis-ballmirror'][4],
                self.x, self.y)
        elseif self.direction == 'right' then
            love.graphics.draw(gTextures['dennis-ball'], gFrames['dennis-ball'][1],
                self.x + 4, self.y)
        else
            if self.left == true then
                love.graphics.draw(gTextures['dennis-ballmirror'], gFrames['dennis-ballmirror'][4],
                self.x, self.y)
            else
                love.graphics.draw(gTextures['dennis-ball'], gFrames['dennis-ball'][1],
                self.x + 4, self.y)
            end
        end
    elseif self.type == 4 then
        if self.direction == 'left' then
            love.graphics.draw(gTextures['davis-ballmirror'], gFrames['davis-ballmirror'][4],
                self.x, self.y)
        elseif self.direction == 'right' then
            love.graphics.draw(gTextures['davis-ball'], gFrames['davis-ball'][1],
                self.x + 4, self.y)
        else
            if self.left == true then
                love.graphics.draw(gTextures['davis-ballmirror'], gFrames['davis-ballmirror'][4],
                self.x, self.y)
            else
                love.graphics.draw(gTextures['davis-ball'], gFrames['davis-ball'][1],
                self.x + 4, self.y)
            end
        end
    end
end
