SelectState = Class{__includes = BaseState}

function SelectState:init()
    self.currentoption = 1
    self.option = 0
end

function SelectState:update(dt)
    if love.keyboard.wasPressed('left') then
        if self.currentoption == 1 then
            gSounds['no-select']:play()
        else
            self.currentoption = self.currentoption - 1
            gSounds['select']:play()
        end
    elseif love.keyboard.wasPressed('right') then
        if self.currentoption == 4 then
            gSounds['no-select']:play()
        else
            self.currentoption = self.currentoption + 1
            gSounds['select']:play()
        end
    end

    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        TYPE = self.currentoption
        gSounds['confirm']:play()
        gStateMachine:change('play')
    end
end

function SelectState:render()
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf("Select your paddle with left and right!", 0, VIRTUAL_HEIGHT / 4,
        VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf("(Press Enter to continue!)", 0, VIRTUAL_HEIGHT / 3,
        VIRTUAL_WIDTH, 'center')

    -- left arrow; should render normally if we're higher than 1, else
    -- in a shadowy form to let us know we're as far left as we can go
    if self.currentoption == 1 then
        -- tint; give it a dark gray with half opacity
        love.graphics.setColor(40, 40, 40, 128)
    end
    
    love.graphics.draw(gTextures['arrows'], gFrames['arrows'][1], VIRTUAL_WIDTH / 4 - 24,
        VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 3)
   
    -- reset drawing color to full white for proper rendering
    love.graphics.setColor(255, 255, 255, 255)

    -- right arrow; should render normally if we're less than 4, else
    -- in a shadowy form to let us know we're as far right as we can go
    if self.currentoption == 4 then
        -- tint; give it a dark gray with half opacity
        love.graphics.setColor(40, 40, 40, 128)
    end
    
    love.graphics.draw(gTextures['arrows'], gFrames['arrows'][2], VIRTUAL_WIDTH - VIRTUAL_WIDTH / 4,
        VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 3)
    
    -- reset drawing color to full white for proper rendering
    love.graphics.setColor(255, 255, 255, 255)

    -- draw the paddle itself, based on which we have selected
    love.graphics.draw(gImage['player'..self.currentoption], VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 2)
    love.graphics.printf('No: ' .. tostring(self.currentoption), 20, 24, 182, 'center')
end