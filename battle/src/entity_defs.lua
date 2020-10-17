
ENTITY_DEFS = {
    ['enemy'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        animations = {
            ['walk-left'] = {
                frames = {30, 29, 28, 29},
                interval = 0.155,
                texture = 'enemy-mirror'
            },
            ['walk-right'] = {
                frames = {21, 22, 23, 22},
                interval = 0.15,
                texture = 'enemy'
            },
            ['idle-left'] = {
                frames = {10},
                texture = 'enemy-mirror'
            },
            ['idle-right'] = {
                frames = {1},
                texture = 'enemy'
            },
            ['attack-left'] = {
                frames = {20, 19},
                interval = 0.07,
                looping = false,
                texture = 'enemy-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12},
                interval = 0.07,
                looping = false,
                texture = 'enemy'
            },
            ['attack2-left'] = {
                frames = {18, 17},
                interval = 0.07,
                looping = false,
                texture = 'enemy-mirror'
            },
            ['attack2-right'] = {
                frames = {13, 14},
                interval = 0.07,
                looping = false,
                texture = 'enemy'
            },
            ['attack3-left'] = {
                frames = {16, 15},
                interval = 0.07,
                looping = false,
                texture = 'enemy-mirror'
            },
            ['attack3-right'] = {
                frames = {15, 16},
                interval = 0.07,
                looping = false,
                texture = 'enemy'
            },
            ['jump-left'] = {
                frames = {68, 68},
                interval = 0.10,
                texture = 'enemy-mirror'
            },
            ['jump-right'] = {
                frames = {63, 63},
                interval = 0.10,
                texture = 'enemy'
            },
            ['jump-walk-left'] = {
                frames = {67, 67},
                interval = 0.10,
                texture = 'enemy-mirror'
            },
            ['jump-walk-right'] = {
                frames = {64, 64},
                interval = 0.10,
                texture = 'enemy'
            }
        }
    },
    ['player1'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        animations = {
            ['walk-left'] = {
                frames = {30, 29, 28, 29},
                interval = 0.155,
                texture = 'woody-mirror'
            },
            ['walk-right'] = {
                frames = {21, 22, 23, 22},
                interval = 0.15,
                texture = 'woody'
            },
            ['idle-left'] = {
                frames = {10},
                texture = 'woody-mirror'
            },
            ['idle-right'] = {
                frames = {1},
                texture = 'woody'
            },
            ['attack-left'] = {
                frames = {20, 19, 18},
                interval = 0.10,
                looping = false,
                texture = 'woody-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12, 13},
                interval = 0.10,
                looping = false,
                texture = 'woody'
            },
            ['attack2-left'] = {
                frames = {17, 16, 15},
                interval = 0.10,
                looping = false,
                texture = 'woody-mirror'
            },
            ['attack2-right'] = {
                frames = {14, 15, 16},
                interval = 0.10,
                looping = false,
                texture = 'woody'
            },
            ['attack3-left'] = {
                frames = {14, 13, 11},
                interval = 0.14,
                looping = false,
                texture = 'woody-mirror'
            },
            ['attack3-right'] = {
                frames = {17, 18, 20},
                interval = 0.14,
                looping = false,
                texture = 'woody'
            },
            ['jump-left'] = {
                frames = {68, 68},
                interval = 0.10,
                texture = 'woody-mirror'
            },
            ['jump-right'] = {
                frames = {63, 63},
                interval = 0.10,
                texture = 'woody'
            },
            ['jump-walk-left'] = {
                frames = {67, 67},
                interval = 0.10,
                texture = 'woody-mirror'
            },
            ['jump-walk-right'] = {
                frames = {64, 64},
                interval = 0.10,
                texture = 'woody'
            }
        }
    },
    ['player2'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        animations = {
            ['walk-left'] = {
                frames = {30, 29, 28, 29},
                interval = 0.155,
                texture = 'ex-mirror'
            },
            ['walk-right'] = {
                frames = {21, 22, 23, 22},
                interval = 0.15,
                texture = 'ex'
            },
            ['idle-left'] = {
                frames = {10},
                texture = 'ex-mirror'
            },
            ['idle-right'] = {
                frames = {1},
                texture = 'ex'
            },
            ['attack-left'] = {
                frames = {20, 19},
                interval = 0.10,
                looping = false,
                texture = 'ex-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12},
                interval = 0.10,
                looping = false,
                texture = 'ex'
            },
            ['attack2-left'] = {
                frames = {18, 17},
                interval = 0.10,
                looping = false,
                texture = 'ex-mirror'
            },
            ['attack2-right'] = {
                frames = {13, 14},
                interval = 0.10,
                looping = false,
                texture = 'ex'
            },
            ['attack3-left'] = {
                frames = {17, 16, 15},
                interval = 0.14,
                looping = false,
                texture = 'ex-mirror'
            },
            ['attack3-right'] = {
                frames = {15, 16, 17},
                interval = 0.14,
                looping = false,
                texture = 'ex'
            },
            ['jump-left'] = {
                frames = {68, 68},
                interval = 0.10,
                texture = 'ex-mirror'
            },
            ['jump-right'] = {
                frames = {63, 63},
                interval = 0.10,
                texture = 'ex'
            },
            ['jump-walk-left'] = {
                frames = {67, 67},
                interval = 0.10,
                texture = 'ex-mirror'
            },
            ['jump-walk-right'] = {
                frames = {64, 64},
                interval = 0.10,
                texture = 'ex'
            }
        }
    },  
    ['player3'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        animations = {
            ['walk-left'] = {
                frames = {30, 29, 28, 29},
                interval = 0.155,
                texture = 'dennis-mirror'
            },
            ['walk-right'] = {
                frames = {21, 22, 23, 22},
                interval = 0.15,
                texture = 'dennis'
            },
            ['idle-left'] = {
                frames = {10},
                texture = 'dennis-mirror'
            },
            ['idle-right'] = {
                frames = {1},
                texture = 'dennis'
            },
            ['attack-left'] = {
                frames = {20, 19, 18},
                interval = 0.10,
                looping = false,
                texture = 'dennis-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12, 13},
                interval = 0.10,
                looping = false,
                texture = 'dennis'
            },
            ['attack2-left'] = {
                frames = {17, 16, 15},
                interval = 0.10,
                looping = false,
                texture = 'dennis-mirror'
            },
            ['attack2-right'] = {
                frames = {14, 15, 16},
                interval = 0.10,
                looping = false,
                texture = 'dennis'
            },
            ['attack3-left'] = {
                frames = {14, 13, 11},
                interval = 0.14,
                looping = false,
                texture = 'dennis-mirror'
            },
            ['attack3-right'] = {
                frames = {17, 18, 20},
                interval = 0.14,
                looping = false,
                texture = 'dennis'
            },
            ['jump-left'] = {
                frames = {68, 68},
                interval = 0.10,
                texture = 'dennis-mirror'
            },
            ['jump-right'] = {
                frames = {63, 63},
                interval = 0.10,
                texture = 'dennis'
            },
            ['jump-walk-left'] = {
                frames = {67, 67},
                interval = 0.10,
                texture = 'dennis-mirror'
            },
            ['jump-walk-right'] = {
                frames = {64, 64},
                interval = 0.10,
                texture = 'dennis'
            }
        }
    },
    ['player4'] = {
        walkSpeed = PLAYER_WALK_SPEED,
        animations = {
            ['walk-left'] = {
                frames = {30, 29, 28, 29},
                interval = 0.155,
                texture = 'davis-mirror'
            },
            ['walk-right'] = {
                frames = {21, 22, 23, 22},
                interval = 0.15,
                texture = 'davis'
            },
            ['idle-left'] = {
                frames = {10},
                texture = 'davis-mirror'
            },
            ['idle-right'] = {
                frames = {1},
                texture = 'davis'
            },
            ['attack-left'] = {
                frames = {20, 19, 18},
                interval = 0.10,
                looping = false,
                texture = 'davis-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12, 13},
                interval = 0.10,
                looping = false,
                texture = 'davis'
            },
            ['attack2-left'] = {
                frames = {17, 16, 15},
                interval = 0.10,
                looping = false,
                texture = 'davis-mirror'
            },
            ['attack2-right'] = {
                frames = {14, 15, 16},
                interval = 0.10,
                looping = false,
                texture = 'davis'
            },
            ['attack3-left'] = {
                frames = {14, 13, 11},
                interval = 0.14,
                looping = false,
                texture = 'davis-mirror'
            },
            ['attack3-right'] = {
                frames = {17, 18, 20},
                interval = 0.14,
                looping = false,
                texture = 'davis'
            },
            ['jump-left'] = {
                frames = {68, 68},
                interval = 0.10,
                texture = 'davis-mirror'
            },
            ['jump-right'] = {
                frames = {63, 63},
                interval = 0.10,
                texture = 'davis'
            },
            ['jump-walk-left'] = {
                frames = {67, 67},
                interval = 0.10,
                texture = 'davis-mirror'
            },
            ['jump-walk-right'] = {
                frames = {64, 64},
                interval = 0.10,
                texture = 'davis'
            }
        }
    }
}