--[[
    tile class
]]

Tile = Class()

function Tile:init( tileX, tileY, x, y )
    self.tileX = tileX
    self.tileY = tileY
    self.x = x
    self.y = y
    self.num = 2
    self.displayNum = self.num
end

function Tile:update( dt )
    -- body
end

function Tile:render( ... )
    love.graphics.setColor(238/255, 228/255, 218/255, 1)
    love.graphics.rectangle('fill', self.x, self.y, GRID_TILE_SIZE, GRID_TILE_SIZE, 5, 5, 3)
    
    love.graphics.setColor(119/255, 110/255, 101/255, 1)
    love.graphics.printf(self.num, self.x, self.y + GRID_TILE_SIZE/2 - font:getHeight()/2, GRID_TILE_SIZE, 'center')
end