-- project tetris battle

require 'src/dependencies'

function love.load()
    love.window.setTitle('tetris battle')
    love.graphics.setDefaultFilter('nearest','nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)

end

function love.draw()
    push:start()
    love.graphics.draw(gTexture['zero'], gFrame['zero'][9], 50, 0)
    push:finish()
end
