
GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'present',
        states = {
            ['present'] = {
                frame = 5
            },
        },
        consumable = true
    },
    ['pot'] = {
        -- TODO
        type = 'pot',
        texture = 'tiles',
        frame = 14,
        width = 16,
        height = 16,
        solid = true,
        defaultState = 'stationary',
        states = {
            ['stationary'] = {
                frame = 14
            },
            ['broken'] = {
                frame = 52
            }
        },
        pickup = false,
        moving = false,
    },
    ['flare-right'] = {
        -- TODO
        type = 'ball',
        texture = 'flare-ball',
        frame = 1,
        width = 60,
        height = 60,
        solid = false,
        defaultState = 'moving',
        states = {
            ['moving'] = {
                frame = {1, 2, 3, 4}
            },
            ['broken'] = {
                frame = {5, 6, 7, 8}
            }
        },
        pickup = false,
        movingright = true,
    },
    ['flare-left'] = {
        -- TODO
        type = 'ball',
        texture = 'flare-ballmirror',
        frame = 1,
        width = 60,
        height = 60,
        solid = false,
        defaultState = 'moving',
        states = {
            ['moving'] = {
                frame = {4, 3, 2, 1}
            },
            ['broken'] = {
                frame = {8, 7, 6, 5}
            }
        },
        pickup = false,
        movingleft = true,
    },
    ['davis-ball-right'] = {
        -- TODO
        type = 'ball',
        texture = 'davis-ball',
        frame = 1,
        width = 69,
        height = 34,
        solid = false,
        defaultState = 'moving',
        states = {
            ['moving'] = {
                frame = {1, 2, 3, 4}
    
            },
            ['broken'] = {
                frame = {5, 6, 7, 8}
            }
        },
        pickup = false,
        movingright = true,
    },
    ['davis-ball-left'] = {
        -- TODO
        type = 'ball',
        texture = 'davis-ballmirror',
        frame = 1,
        width = 69,
        height = 34,
        solid = false,
        defaultState = 'moving',
        states = {
            ['moving'] = {
                frame = {4, 3, 2, 1}
            },
            ['broken'] = {
                frame = {8, 7, 6, 5}
            }
        },
        pickup = false,
        movingleft = true,
    },
    ['dennis-ball-right'] = {
        -- TODO
        type = 'ball',
        texture = 'dennis-ball',
        frame = 1,
        width = 57,
        height = 44,
        solid = false,
        defaultState = 'moving',
        states = {
            ['moving'] = {
                frame = {1, 2, 3, 4}
            },
            ['broken'] = {
                frame = {5, 6, 7, 8}
            }
        },
        pickup = false,
        movingright = true,
    },
    ['dennis-ball-left'] = {
        -- TODO
        type = 'ball',
        texture = 'dennis-ballmirror',
        frame = 1,
        width = 57,
        height = 44,
        solid = false,
        defaultState = 'moving',
        states = {
            ['moving'] = {
                frame = {4, 3, 2, 1}
            },
            ['broken'] = {
                frame = {8, 7, 6, 5}
            }
        },
        pickup = false,
        movingleft = true,
    },
}