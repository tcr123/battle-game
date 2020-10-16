
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
                frames = {20, 19, 18, 17},
                interval = 0.07,
                looping = false,
                texture = 'enemy-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12, 13, 14},
                interval = 0.07,
                looping = false,
                texture = 'enemy'
            },
            ['pot-lift-left'] = {
                frames = {10, 11, 12},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-right'] = {
                frames = {4, 5, 6},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-down'] = {
                frames = {1, 2, 3},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-up'] = {
                frames = {7, 8, 9},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-left'] = {
                frames = {12},
                texture = 'character-pot-lift'
            },
            ['lift-right'] = {
                frames = {6},
                texture = 'character-pot-lift'
            },
            ['lift-down'] = {
                frames = {3},
                texture = 'character-pot-lift'
            },
            ['lift-up'] = {
                frames = {9},
                texture = 'character-pot-lift'
            },
            ['carry-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
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
                frames = {20, 19, 18, 17, 16, 15},
                interval = 0.05,
                looping = false,
                texture = 'woody-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12, 13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'woody'
            },
            ['pot-lift-left'] = {
                frames = {10, 11, 12},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-right'] = {
                frames = {4, 5, 6},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-down'] = {
                frames = {1, 2, 3},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-up'] = {
                frames = {7, 8, 9},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-left'] = {
                frames = {12},
                texture = 'character-pot-lift'
            },
            ['lift-right'] = {
                frames = {6},
                texture = 'character-pot-lift'
            },
            ['lift-down'] = {
                frames = {3},
                texture = 'character-pot-lift'
            },
            ['lift-up'] = {
                frames = {9},
                texture = 'character-pot-lift'
            },
            ['carry-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
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
                frames = {20, 19, 18, 17, 16, 15, 14},
                interval = 0.08,
                looping = false,
                texture = 'ex-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12, 13, 14, 15, 16, 17},
                interval = 0.08,
                looping = false,
                texture = 'ex'
            },
            ['pot-lift-left'] = {
                frames = {10, 11, 12},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-right'] = {
                frames = {4, 5, 6},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-down'] = {
                frames = {1, 2, 3},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-up'] = {
                frames = {7, 8, 9},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-left'] = {
                frames = {12},
                texture = 'character-pot-lift'
            },
            ['lift-right'] = {
                frames = {6},
                texture = 'character-pot-lift'
            },
            ['lift-down'] = {
                frames = {3},
                texture = 'character-pot-lift'
            },
            ['lift-up'] = {
                frames = {9},
                texture = 'character-pot-lift'
            },
            ['carry-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
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
                frames = {20, 19, 18, 17, 16, 15},
                interval = 0.05,
                looping = false,
                texture = 'dennis-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12, 13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'dennis'
            },
            ['pot-lift-left'] = {
                frames = {10, 11, 12},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-right'] = {
                frames = {4, 5, 6},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-down'] = {
                frames = {1, 2, 3},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-up'] = {
                frames = {7, 8, 9},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-left'] = {
                frames = {12},
                texture = 'character-pot-lift'
            },
            ['lift-right'] = {
                frames = {6},
                texture = 'character-pot-lift'
            },
            ['lift-down'] = {
                frames = {3},
                texture = 'character-pot-lift'
            },
            ['lift-up'] = {
                frames = {9},
                texture = 'character-pot-lift'
            },
            ['carry-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
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
                frames = {20, 19, 18, 17, 16, 15},
                interval = 0.05,
                looping = false,
                texture = 'davis-mirror'
            },
            ['attack-right'] = {
                frames = {11, 12, 13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'davis'
            },
            ['pot-lift-left'] = {
                frames = {10, 11, 12},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-right'] = {
                frames = {4, 5, 6},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-down'] = {
                frames = {1, 2, 3},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['pot-lift-up'] = {
                frames = {7, 8, 9},
                interval = 0.10,
                looping = false,
                texture = 'character-pot-lift'
            },
            ['lift-left'] = {
                frames = {12},
                texture = 'character-pot-lift'
            },
            ['lift-right'] = {
                frames = {6},
                texture = 'character-pot-lift'
            },
            ['lift-down'] = {
                frames = {3},
                texture = 'character-pot-lift'
            },
            ['lift-up'] = {
                frames = {9},
                texture = 'character-pot-lift'
            },
            ['carry-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            },
            ['carry-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character-pot-walk'
            }
        }
    }
}