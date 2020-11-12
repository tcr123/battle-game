VictoryState = Class{__includes = BaseState}

function VictoryState:init()
    self.times = 1
end

function VictoryState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start')
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if self.times == 1 then
        gSounds['nextlevel']:play()
        self.times = 0
    end
end

function VictoryState:render()
    love.graphics.draw(gTextures['place2'], 0, 0, 0, 
        VIRTUAL_WIDTH / gTextures['place2']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['place2']:getHeight())

    love.graphics.setFont(gFonts['zelda'])
    love.graphics.setColor(175, 53, 42, 255)
    love.graphics.printf('You Win', 0, VIRTUAL_HEIGHT / 2 - 48, VIRTUAL_WIDTH, 'center')
    
    love.graphics.setFont(gFonts['zelda-small'])
    love.graphics.printf('Press Enter', 0, VIRTUAL_HEIGHT / 2 + 16, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255, 255)
end