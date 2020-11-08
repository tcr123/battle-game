PlayerPower2State = Class{__includes = BaseState}

function PlayerPower2State:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    -- render offset for spaced character sprite
    self.player.offsetY = 5
    self.player.offsetX = 10
end

function PlayerPower2State:enter(params)
    gSounds['attack']:stop()
    gSounds['attack']:play()

    -- restart Attack swing animation
    self.player.currentAnimation:refresh()
end

function PlayerPower2State:update(dt)
    -- check if hitbox collides with any entities in the scene
    if self.player.direction == 'left' or  self.player.direction == 'right' then
        self.player:changeAnimation('power2-' .. self.player.direction)
        if self.player.direction == 'left' then
            self.player.x = self.player.x - self.player.walkSpeed * dt
    
            if self.player.x <= MAP_RENDER_OFFSET_X - (TILE_SIZE * 2) then 
                self.player.x = MAP_RENDER_OFFSET_X - (TILE_SIZE * 2)
                self.bumped = true
            end
        elseif self.player.direction == 'right' then
            self.player.x = self.player.x + self.player.walkSpeed * dt
    
            if self.player.x + self.player.width >= VIRTUAL_WIDTH + 12 then
                self.player.x = VIRTUAL_WIDTH - self.player.width + 12
                self.bumped = true
            end
        end
    else
        if self.player.left == true then
            self.player.x = self.player.x - self.player.walkSpeed * dt
    
            if self.player.x <= MAP_RENDER_OFFSET_X - (TILE_SIZE * 2) then 
                self.player.x = MAP_RENDER_OFFSET_X - (TILE_SIZE * 2)
                self.bumped = true
            end
            
            self.player:changeAnimation('power2-left')
        else 
            self.player.x = self.player.x + self.player.walkSpeed * dt
    
            if self.player.x + self.player.width >= VIRTUAL_WIDTH + 12 then
                self.player.x = VIRTUAL_WIDTH - self.player.width + 12
                self.bumped = true
            end

            self.player:changeAnimation('power2-right')
        end
    end

    for k, entity in pairs(self.dungeon.currentRoom.entities) do
        if entity:collides(self.player) and entity.notSelected == false then
            entity:damage(80 * self.player.attackV / entity.defendV)
            entity:goNotSelected(0.5)
            if not entity.dead then
                gSounds['hit-enemy']:play()
            end
        end
    end

    if self.player.currentAnimation.timesPlayed > 0.5 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end
end

function PlayerPower2State:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))

    -- debug for player and hitbox collision rects
    -- love.graphics.setColor(255, 0, 255, 255)
    -- love.graphics.rectangle('line', self.player.x, self.player.y, self.player.width, self.player.height)
    -- love.graphics.rectangle('line', self.AttackHitbox.x, self.AttackHitbox.y,
        -- self.AttackHitbox.width, self.AttackHitbox.height)
    -- love.graphics.setColor(255, 255, 255, 255)
end