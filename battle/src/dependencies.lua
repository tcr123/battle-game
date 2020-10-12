Class = require 'lib/class'
Event = require 'lib/knife/event'
push  = require 'lib/push'
Timer = require 'lib/knife/timer'

require 'src/constant'
require 'src/util'

gTexture = {
    ['jellal'] = love.graphics.newImage('graphics/character/jellal.png'),
    ['zero'] = love.graphics.newImage('graphics/character/zero.png'),
    ['natsu'] = love.graphics.newImage('graphics/character/natsu.png'),
    ['midnight'] = love.graphics.newImage('graphics/character/midnight.png')
}

gFrame = {
    ['jellal'] = GenerateQuads(gTexture['jellal'], 64, 64),
    ['zero'] = GenerateQuads(gTexture['zero'], 64, 64),
    ['natsu'] = GenerateQuads(gTexture['natsu'], 64, 64),
    ['midnight'] = GenerateQuads(gTexture['midnight'], 64, 64)
}