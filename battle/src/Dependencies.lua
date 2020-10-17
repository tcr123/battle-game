--
-- libraries
--

Class = require 'lib/class'
Event = require 'lib/knife.event'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Animation'
require 'src/constants'
require 'src/Entity'
require 'src/entity_defs'
require 'src/GameObject'
require 'src/game_objects'
require 'src/Hitbox'
require 'src/Player'
require 'src/StateMachine'
require 'src/Util'

require 'src/world/Doorway'
require 'src/world/Dungeon'
require 'src/world/Room'

require 'src/states/BaseState'

require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'

require 'src/states/entity/player/PlayerIdleState'
require 'src/states/entity/player/PlayerAttackState'
require 'src/states/entity/player/PlayerAttackState2'
require 'src/states/entity/player/PlayerAttackState3'
require 'src/states/entity/player/PlayerWalkState'
require 'src/states/entity/player/PlayerJumpState'

require 'src/states/game/GameOverState'
require 'src/states/game/SelectState'
require 'src/states/game/PlayState'
require 'src/states/game/StartState'

gImage ={
    ['player1'] = love.graphics.newImage('graphics/select/woody.bmp'),
    ['player2'] = love.graphics.newImage('graphics/select/ex.bmp'),
    ['player3'] = love.graphics.newImage('graphics/select/dennis.bmp'),
    ['player4'] = love.graphics.newImage('graphics/select/davis.jpg'),
}

gTextures = {
    ['tiles'] = love.graphics.newImage('graphics/tilesheet.png'),
    ['background'] = love.graphics.newImage('graphics/background.png'),
    ['character-walk'] = love.graphics.newImage('graphics/character_walk.png'),
    ['character-swing-sword'] = love.graphics.newImage('graphics/character_swing_sword.png'),
    ['character-pot-lift'] = love.graphics.newImage('graphics/character_pot_lift.png'),
    ['character-pot-walk'] = love.graphics.newImage('graphics/character_pot_walk.png'),
    ['hearts'] = love.graphics.newImage('graphics/hearts.png'),
    ['switches'] = love.graphics.newImage('graphics/switches.png'),
    ['entities'] = love.graphics.newImage('graphics/entities.png'),
    ['enemy'] = love.graphics.newImage('graphics/enemy.png'),
    ['enemy-mirror'] = love.graphics.newImage('graphics/enemymirror.png'),
    ['woody'] = love.graphics.newImage('graphics/woody/woody.png'),
    ['woody-mirror'] = love.graphics.newImage('graphics/woody/woodymirror.png'),
    ['ex'] = love.graphics.newImage('graphics/ex/ex.png'),
    ['ex-mirror'] = love.graphics.newImage('graphics/ex/exmirror.png'),
    ['dennis'] = love.graphics.newImage('graphics/davis/dennis.png'),
    ['dennis-mirror'] = love.graphics.newImage('graphics/davis/dennismirror.png'),
    ['davis'] = love.graphics.newImage('graphics/davis/davis.png'),
    ['davis-mirror'] = love.graphics.newImage('graphics/davis/davismirror.png'),
    ['place1'] = love.graphics.newImage('graphics/place1.png'),
    ['place2'] = love.graphics.newImage('graphics/place2.png'),
    ['arrows'] = love.graphics.newImage('graphics/select/arrows.png')
}

gFrames = {
    ['tiles'] = GenerateQuads(gTextures['tiles'], 16, 16),
    ['character-walk'] = GenerateQuads(gTextures['character-walk'], 16, 32),
    ['character-swing-sword'] = GenerateQuads(gTextures['character-swing-sword'], 32, 32),
    ['character-pot-lift'] = GenerateQuads(gTextures['character-pot-lift'], 16, 32),
    ['character-pot-walk'] = GenerateQuads(gTextures['character-pot-walk'], 16, 32),
    ['entities'] = GenerateQuads(gTextures['entities'], 16, 16),
    ['hearts'] = GenerateQuads(gTextures['hearts'], 16, 16),
    ['switches'] = GenerateQuads(gTextures['switches'], 16, 18),
    ['enemy'] = GenerateQuads(gTextures['enemy'], 41, 42),
    ['enemy-mirror'] = GenerateQuads(gTextures['enemy-mirror'], 41, 41),
    ['woody'] = GenerateQuads(gTextures['woody'], 41, 41),
    ['woody-mirror'] = GenerateQuads(gTextures['woody-mirror'], 41, 41),
    ['ex'] = GenerateQuads(gTextures['ex'], 41.4, 41),
    ['ex-mirror'] = GenerateQuads(gTextures['ex-mirror'], 41.4, 41),
    ['dennis'] = GenerateQuads(gTextures['dennis'], 41.4, 41),
    ['dennis-mirror'] = GenerateQuads(gTextures['dennis-mirror'], 41.4, 41),
    ['davis'] = GenerateQuads(gTextures['davis'], 41.4, 41),
    ['davis-mirror'] = GenerateQuads(gTextures['davis-mirror'], 41.4, 41),
    ['arrows'] = GenerateQuads(gTextures['arrows'], 24, 24),
}

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['gothic-medium'] = love.graphics.newFont('fonts/GothicPixels.ttf', 16),
    ['gothic-large'] = love.graphics.newFont('fonts/GothicPixels.ttf', 32),
    ['zelda'] = love.graphics.newFont('fonts/zelda.otf', 64),
    ['zelda-small'] = love.graphics.newFont('fonts/zelda.otf', 32)
}

gSounds = {
    ['music'] = love.audio.newSource('sounds/music.mp3'),
    ['attack'] = love.audio.newSource('sounds/sword.wav'),
    ['hit-enemy'] = love.audio.newSource('sounds/hit_enemy.wav'),
    ['hit-player'] = love.audio.newSource('sounds/hit_player.wav'),
    ['door'] = love.audio.newSource('sounds/door.wav'),
    ['pick-up'] = love.audio.newSource('sounds/pickup.wav'),
    ['break'] = love.audio.newSource('sounds/break.wav'),
    ['no-select'] = love.audio.newSource('sounds/no-select.wav'),
    ['select'] = love.audio.newSource('sounds/select.wav'),
    ['confirm'] = love.audio.newSource('sounds/confirm.wav')
}