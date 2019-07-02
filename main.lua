--[[
    2048

    author : akshu3398@gmail.com
]]

Timer = require("lib/knife.timer")

WINDOW_WIDTH = 1280*3/4
WINDOW_HEIGHT = 720*3/4

GRID_TILE_SIZE = 100*(83/100)

PADDING = 15

GRID_VERTICAL_OFFSET = 70

GRID_BACKGROUND_WIDTH = WINDOW_WIDTH/2 - GRID_VERTICAL_OFFSET
GRID_BACKGROUND_HEIGHT = WINDOW_HEIGHT*(3/4)

grid = {}

-- background grid
for y=1,4 do
    table.insert( grid, {})
    for x=1,4 do
        table.insert( grid[y], {
            x = PADDING + WINDOW_WIDTH/4 + (x-1)*(GRID_TILE_SIZE + PADDING),
            y = PADDING + WINDOW_HEIGHT/8 + (y-1)*(GRID_TILE_SIZE + PADDING),
            occupied = false, tile = nil
        })
    end
end

-- moving tiles
tiles = {}

-- add mock tile
local tile = {tileX = 1, tileY = 1, x = grid[1][1].x, y = grid[1][1].y, num = 2}
table.insert( tiles, tile)
grid[1][1].occupied = true
grid[1][1].tile = tile

local tile = {tileX = 2, tileY = 1, x = grid[1][2].x, y = grid[1][2].y, num = 2}
table.insert( tiles, tile)
grid[1][2].occupied = true
grid[1][2].tile = tile

function love.load( ... )   
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
    love.window.setTitle('2048')
    font = love.graphics.newFont(64*3/4)
    love.graphics.setFont(font)

    canMove = true
end

function love.keypressed( key )
    if key == 'escape' then
        love.event.quit()
    end

    if canMove then
        -- move the tiles
        if key == 'up' then
            moveUp()

        elseif key == 'down' then
            moveDown()

        elseif key == 'left' then
            moveLeft()

        elseif key == 'right' then
            moveRight()

        end
    end
end

function love.update( dt )
    Timer.update(dt)
end

function getRightmostOpenX( startX, startY, finish )
    for x = startX + 1, finish do
        if grid[startY][x].occupied then
            return x-1
        end
    end

    return finish
end

function getLeftmostOpenX( startX, startY, finish )
    for x = startX - 1, finish, -1 do
        if grid[startY][x].occupied then
            return x + 1
        end
    end

    return finish
end

function getTopmostOpenX( startX, startY, finish)
    for y = startY - 1, finish, -1 do
        if grid[y][startX].occupied then
            return y
        end
    end

    return finish
end

function getBottommostOpenX( startX, startY, finish)
    for y = startY + 1, finish do
        if grid[y][startX].occupied then
            return y
        end
    end

    return finish
end

function moveUp( ... )
    -- iterate column by column over the grid from top to bottom
    for x=1,4 do
        for y=1,4 do
            local tile = grid[y][x].tile

            -- only move tile in it exists
            if tile then
                local farthestY = getTopmostOpenX(x, y, 1)
                
                if farthesty ~= y then
                    canMove = false
                    local oldY = tile.tileY
                    
                    tile.tileY = farthestY
                    grid[tile.tileY][x].tile = tile
                    grid[tile.tileY][x].occupied = true
                    grid[oldY][x].tile = nil
                    grid[oldY][x].occupied = false
                
                    Timer.tween(0.1, {
                        [tile] = {x = grid[tile.tileY][tile.tileX].x,
                                    y = grid[tile.tileY][tile.tileX].y}
                    }):finish(function()
                        canMove = true
                    end)
                end    
            end
        end
    end
end

function moveDown( ... )    
    -- iterate column by column over the grid from bottom to top
    for x=1,4 do
        for y=4,1,-1 do
            local tile = grid[y][x].tile

            -- only move tile in it exists
            if tile then
                local farthestY = getBottommostOpenX(x, y, 4)
                
                if farthesty ~= y then
                    canMove = false
                    local oldY = tile.tileY
                    
                    tile.tileY = farthestY
                    grid[tile.tileY][x].tile = tile
                    grid[tile.tileY][x].occupied = true
                    grid[oldY][x].tile = nil
                    grid[oldY][x].occupied = false
                
                    Timer.tween(0.1, {
                        [tile] = {x = grid[tile.tileY][tile.tileX].x,
                                    y = grid[tile.tileY][tile.tileX].y}
                    }):finish(function()
                        canMove = true
                    end)
                end    
            end
        end
    end   
end

function moveLeft( ... )        
    -- iterate row by row over the grid left to right
    for y=1,4 do
        for x=1,4 do
            local tile = grid[y][x].tile

            -- only move tile in it exists
            if tile then                
                local farthestX = getLeftmostOpenX(x, y, 1)
                
                if farthestX ~= x then
                    canMove = false
                    local oldX = tile.tileX
                    
                    tile.tileX = farthestX                    
                    grid[y][tile.tileX].tile = tile
                    grid[y][tile.tileX].occupied = true
                    grid[y][oldX].tile = nil
                    grid[y][oldX].occupied = false
                
                    Timer.tween(0.1, {
                        [tile] = {x = grid[tile.tileY][tile.tileX].x,
                                    y = grid[tile.tileY][tile.tileX].y}
                    }):finish(function()
                        canMove = true
                    end)
                end    
            end
        end
    end
end

function moveRight( ... )        
    -- iterate row by row over the grid right to left
    for y=1,4 do
        for x=4,1,-1 do
            local tile = grid[y][x].tile            

            -- only move tile in it exists
            if tile then                               
                local farthestX = getRightmostOpenX(x, y, 4)
                
                if farthestX ~= x then
                    canMove = false 
                    local oldX = tile.tileX
                    
                    tile.tileX = farthestX                    
                    grid[y][tile.tileX].tile = tile
                    grid[y][tile.tileX].occupied = true
                    grid[y][oldX].tile = nil
                    grid[y][oldX].occupied = false
                
                    Timer.tween(0.1, {
                        [tile] = {x = grid[tile.tileY][tile.tileX].x,
                                    y = grid[tile.tileY][tile.tileX].y}
                    }):finish(function()
                        canMove = true
                    end)
                end                                
            end
        end
    end 
end

function love.draw( ... )
    love.graphics.clear(250/255, 250/255, 238/255, 1)
    
    love.graphics.setColor(186/255, 173/255, 160/255, 1)
    love.graphics.rectangle('fill', 
        WINDOW_WIDTH/4, WINDOW_HEIGHT/8, 
        GRID_BACKGROUND_WIDTH, GRID_BACKGROUND_HEIGHT, 
        8, 8, 3)

    -- draw grid
    for y=1,4 do
        for x=1,4 do
            love.graphics.setColor(205/255, 192/255, 181/255, 1)
            love.graphics.rectangle('fill', grid[y][x].x, grid[y][x].y,
                GRID_TILE_SIZE, GRID_TILE_SIZE, 5, 5, 3)
        end
    end

    -- draw tiles
    for k, tile in pairs(tiles) do
        -- print(tile)
        love.graphics.setColor(238/255, 228/255, 218/255, 1)
        love.graphics.rectangle('fill', tile.x, tile.y, 
            GRID_TILE_SIZE, GRID_TILE_SIZE, 5, 5, 3)
        
        love.graphics.setColor(119/255, 110/255, 101/255, 1)
        love.graphics.printf(tile.num, tile.x, 
            tile.y + GRID_TILE_SIZE/2 - font:getHeight()/2, 
            GRID_TILE_SIZE, 'center')
    end
end