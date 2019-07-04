--[[
    tile class
]]

Tile = Class()
tileColors = {
    [2] = {
        ['fill'] = {r = 238, g = 228, b = 218},
        ['font'] = {r = 119, g = 110, b = 101}
    },
    [4] = {
        ['fill'] = {r = 238, g = 224, b = 200},
        ['font'] = {r = 119, g = 110, b = 101}
    },
    [8] = {
        ['fill'] = {r = 242, g = 177, b = 121},
        ['font'] = {r = 349, g = 246, b = 242}
    },
    [16] = {
        ['fill'] = {r = 245, g = 149, b = 100},
        ['font'] = {r = 249, g = 246, b = 242}
    },
    [32] = {
        ['fill'] = {r = 246, g = 124, b = 95},
        ['font'] = {r = 249, g = 246, b = 242}
    },
    [64] = {
        ['fill'] = {r = 246, g = 94, b = 59},
        ['font'] = {r = 249, g = 246, b = 242}
    },
    [128] = {
        ['fill'] = {r = 242, g = 216, b = 106},
        ['font'] = {r = 249, g = 246, b = 242}
    },
    [256] = {
        ['fill'] = {r = 237, g = 204, b = 98},
        ['font'] = {r = 119, g = 110, b = 101}
    },
    [512] = {
        ['fill'] = {r = 229, g = 192, b = 42},
        ['font'] = {r = 119, g = 110, b = 101}
    },
    [1024] = {
        ['fill'] = {r = 226, g = 185, b = 19},
        ['font'] = {r = 119, g = 110, b = 101}
    },
    [2048] = {
        ['fill'] = {r = 236, g = 196, b = 2},
        ['font'] = {r = 119, g = 110, b = 101}
    },
    -- [4096] = {
    --     ['fill'] = {r = 238, g = 224, b = 200},
    --     ['font'] = {r = 119, g = 110, b = 101}
    -- },
    -- [8192] = {
    --     ['fill'] = {r = 238, g = 224, b = 200},
    --     ['font'] = {r = 119, g = 110, b = 101}
    -- },
}

function Tile:init( tileX, tileY, x, y )
    self.tileX = tileX
    self.tileY = tileY
    self.x = x
    self.y = y
    self.num = math.pow(2, math.random( 2 ))
    self.displayNum = self.num
end

function Tile:update( dt )
    -- body
end

function Tile:render( ... )
    local fillColor = tileColors[self.num]['fill']
    love.graphics.setColor(fillColor.r/255, fillColor.g/255, fillColor.b/255, 1)
    love.graphics.rectangle('fill', self.x, self.y, GRID_TILE_SIZE, GRID_TILE_SIZE, 5, 5, 3)
    local fontColor = tileColors[self.num]['font']
    love.graphics.setColor(fontColor.r/255, fontColor.g/255, fontColor.b/255, 1)
    love.graphics.printf(self.num, self.x, self.y + GRID_TILE_SIZE/2 - font:getHeight()/2, GRID_TILE_SIZE, 'center')
end