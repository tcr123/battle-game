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
require 'src/Ball'

require 'src/world/Doorway'
require 'src/world/Dungeon'
require 'src/world/Room'

require 'src/states/BaseState'

require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'
require 'src/states/entity/EntityAttackState'
require 'src/states/entity/EntityDeadState'
require 'src/states/entity/EntityHurtState'

require 'src/states/entity/player/PlayerIdleState'
require 'src/states/entity/player/PlayerAttackState'
require 'src/states/entity/player/PlayerAttackState2'
require 'src/states/entity/player/PlayerAttackState3'
require 'src/states/entity/player/PlayerWalkState'
require 'src/states/entity/player/PlayerJumpState'
require 'src/states/entity/player/PlayerPower1State'
require 'src/states/entity/player/PlayerPower2State'

require 'src/states/game/GameOverState'
require 'src/states/game/SelectState'
require 'src/states/game/PlayState'
require 'src/states/game/StartState'
require 'src/states/game/VictoryState'

gImage ={
    ['player1'] = love.graphics.newImage('graphics/select/woody.bmp'),
    ['player2'] = love.graphics.newImage('graphics/select/ex.bmp'),
    ['player3'] = love.graphics.newImage('graphics/select/dennis.bmp'),
    ['player4'] = love.graphics.newImage('graphics/select/davis.jpg'),
}

gTextures = {
    ['tiles'] = love.graphics.newImage('graphics/tilesheet.png'),
    ['background'] = love.graphics.newImage('graphics/background.png'),
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
    ['arrows'] = love.graphics.newImage('graphics/select/arrows.png'),

    ['davis-ball'] = love.graphics.newImage('graphics/davis/davis_ball.png'),
    ['davis-ballmirror'] = love.graphics.newImage('graphics/davis/davis_ballmirror.png'),
    ['dennis-ball'] = love.graphics.newImage('graphics/davis/dennis_ball.png'),
    ['dennis-ballmirror'] = love.graphics.newImage('graphics/davis/dennis_ballmirror.png'),
    ['flare-ball'] = love.graphics.newImage('graphics/woody/Flare_ball.png'),
    ['flare-ballmirror'] = love.graphics.newImage('graphics/woody/Flare_ballmirror.png'),
    ['ex-ball'] = love.graphics.newImage('graphics/ex/exball.png'),
    ['ex-ballmirror'] = love.graphics.newImage('graphics/ex/exballmirror.png'),
    ['dragon-ball'] = love.graphics.newImage('graphics/boss/dragonball.png'),

    ['woody2'] = love.graphics.newImage('graphics/woody/woody2.png'),
    ['woody2-mirror'] = love.graphics.newImage('graphics/woody/woody2mirror.png'),
    ['dennis2'] = love.graphics.newImage('graphics/davis/dennis2.png'),
    ['dennis2-mirror'] = love.graphics.newImage('graphics/davis/dennis2mirror.png'),
    ['davis2'] = love.graphics.newImage('graphics/davis/davis2.png'),
    ['davis2-mirror'] = love.graphics.newImage('graphics/davis/davis2mirror.png'),
    ['ex2'] = love.graphics.newImage('graphics/ex/ex2.png'),
    ['ex2-mirror'] = love.graphics.newImage('graphics/ex/ex2mirror.png'),

    -- boss
    ['boss'] = love.graphics.newImage('graphics/boss/boss.png'),
    ['boss-mirror'] = love.graphics.newImage('graphics/boss/boss_mirror.png'),
    ['boss2'] = love.graphics.newImage('graphics/boss/boss2.png'),
    ['boss2-mirror'] = love.graphics.newImage('graphics/boss/boss2_mirror.png'),
    ['boss3'] = love.graphics.newImage('graphics/boss/dragon_power.png')
}

gFrames = {
    ['tiles'] = GenerateQuads(gTextures['tiles'], 16, 16),
    ['entities'] = GenerateQuads(gTextures['entities'], 16, 16),
    ['hearts'] = GenerateQuads(gTextures['hearts'], 16, 16),
    ['switches'] = GenerateQuads(gTextures['switches'], 16, 18),

    ['enemy'] = GenerateQuads(gTextures['enemy'], 41, 42),
    ['enemy-mirror'] = GenerateQuads(gTextures['enemy-mirror'], 41, 41),
    ['woody'] = GenerateQuads(gTextures['woody'], 41, 41),
    ['woody-mirror'] = GenerateQuads(gTextures['woody-mirror'], 41, 41),
    ['dennis'] = GenerateQuads(gTextures['dennis'], 41.4, 41),
    ['dennis-mirror'] = GenerateQuads(gTextures['dennis-mirror'], 41.4, 41),
    ['davis'] = GenerateQuads(gTextures['davis'], 41.4, 41),
    ['davis-mirror'] = GenerateQuads(gTextures['davis-mirror'], 41.4, 41),
    ['ex'] = GenerateQuads(gTextures['ex'], 41.4, 41),
    ['ex-mirror'] = GenerateQuads(gTextures['ex-mirror'], 41.4, 41),

    ['arrows'] = GenerateQuads(gTextures['arrows'], 24, 24),
    ['davis-ball'] = GenerateQuads(gTextures['davis-ball'], 59.25, 34),
    ['davis-ballmirror'] = GenerateQuads(gTextures['davis-ballmirror'], 59.25, 34),
    ['dennis-ball'] = GenerateQuads(gTextures['dennis-ball'], 57, 33),
    ['dennis-ballmirror'] = GenerateQuads(gTextures['dennis-ballmirror'], 57, 33),
    ['flare-ball'] = GenerateQuads(gTextures['flare-ball'], 40, 40),
    ['flare-ballmirror'] = GenerateQuads(gTextures['flare-ballmirror'], 40, 40),
    ['ex-ball'] = GenerateQuads(gTextures['ex-ball'], 34, 30),
    ['ex-ballmirror'] = GenerateQuads(gTextures['ex-ballmirror'], 34, 30),
    ['dragon-ball'] = GenerateQuads(gTextures['dragon-ball'], 89, 40),

    ['woody2'] = GenerateQuads(gTextures['woody2'], 41, 41),
    ['woody2-mirror'] = GenerateQuads(gTextures['woody2-mirror'], 41, 41),
    ['dennis2'] = GenerateQuads(gTextures['dennis2'], 41.4, 41),
    ['dennis2-mirror'] = GenerateQuads(gTextures['dennis2-mirror'], 41.4, 41),
    ['davis2'] = GenerateQuads(gTextures['davis2'], 41.4, 41),
    ['davis2-mirror'] = GenerateQuads(gTextures['davis2-mirror'], 41.4, 41),
    ['ex2'] = GenerateQuads(gTextures['ex2'], 41.4, 40.5),
    ['ex2-mirror'] = GenerateQuads(gTextures['ex2-mirror'], 41.4, 40.5),

    ['boss'] = GenerateQuads(gTextures['boss'], 41.4, 41),
    ['boss-mirror'] = GenerateQuads(gTextures['boss-mirror'], 41.4, 41),
    ['boss2'] = GenerateQuads(gTextures['boss2'], 83, 41),
    ['boss2-mirror'] = GenerateQuads(gTextures['boss2-mirror'], 83, 41),
    ['boss3'] = GenerateQuads(gTextures['boss3'], 103, 213)
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
    ['confirm'] = love.audio.newSource('sounds/confirm.wav'),
    ['nextlevel'] = love.audio.newSource('sounds/nextlevel.wav'),
    ['bom'] = love.audio.newSource('sounds/bom.wav')
}