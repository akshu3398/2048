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

    -- -- add mock tile
    -- local tile = {tileX = 1, tileY = 1, x = grid[1][1].x, y = grid[1][1].y, num = 2}
    -- table.insert( self.tiles, tile)
    -- grid[1][1].occupied = true
    -- grid[1][1].tile = tile

    -- local tile = {tileX = 2, tileY = 1, x = grid[1][2].x, y = grid[1][2].y, num = 2}
    -- table.insert( self.tiles, tile)
    -- grid[1][2].occupied = true
    -- grid[1][2].tile = tile

    -- local tile = {tileX = 1, tileY = 2, x = grid[2][1].x, y = grid[2][1].y, num = 2}
    -- table.insert( self.tiles, tile)
    -- grid[2][1].occupied = true
    -- grid[2][1].tile = tile

    -- local tile = {tileX = 2, tileY = 2, x = grid[2][2].x, y = grid[2][2].y, num = 2}
    -- table.insert( self.tiles, tile)
    -- grid[2][2].occupied = true
    -- grid[2][2].tile = tile
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