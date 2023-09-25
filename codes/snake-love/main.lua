--- Graphics colours
local colors = {
    border = {0, 1, 0},
    snakehead = {0.5, 0, 0.5},
    snakebody = {0, 0.75, 0.4},
    apple = {1, 0.125, 0.125},
    score = {1, 1, 1},
    gameover = {1, 0, 0},
    paused = {0, 0, 1},
}

--- Player
local snake = {
    --- Snake blocks, [1] = head
    body = {},
    --- Snake direction, 0 = N, 1 = E, 2 = S, 3 = W
    d = 0,
}
--- Goodies
local apple = {}

local score, t, gameover, paused

--- Draws snake
local function drawsnake()
    love.graphics.setColor(colors.snakehead)
    for _, block in ipairs(snake.body) do
        love.graphics.rectangle("fill", block.x*16, block.y*16, 16, 16)
        love.graphics.setColor(colors.snakebody)
    end
end

--- Puts the apple on a new random position
local function resetapple()
    local x, y
    while true do
        x = love.math.random(60) - 1
        y = love.math.random(60) - 1
        local done = true
        for _, block in ipairs(snake.body) do
            if block.x == x and block.y == y then
                done = false
                break
            end
        end
        if done then
            apple = {x = x, y = y}
            break
        end
    end
end

--- Move snake forward by one cell
local function movesnake()
    local head = snake.body[1]
    local next = {x = head.x, y = head.y}
    if snake.d == 0 then next.y = next.y - 1 end
    if snake.d == 1 then next.x = next.x + 1 end
    if snake.d == 2 then next.y = next.y + 1 end
    if snake.d == 3 then next.x = next.x - 1 end
    if  next.x < 0 or next.x >= 60 or next.y < 0 or next.y >= 60 then
        gameover = true
        return
    end
    for _, block in ipairs(snake.body) do
        if block.x == next.x and block.y == next.y then
            gameover = true
            return
        end
    end
    snake.body = {next, unpack(snake.body)}
    if next.x == apple.x and next.y == apple.y then
        score = score + 1
        resetapple()
    else
        table.remove(snake.body)
    end
end

--- Updates game state based on keyboard input
local function detectkeys()
    if love.keyboard.isDown"up"    then snake.d = 0 end
    if love.keyboard.isDown"right" then snake.d = 1 end
    if love.keyboard.isDown"down"  then snake.d = 2 end
    if love.keyboard.isDown"left"  then snake.d = 3 end
end

function love.keyreleased(key)
    if key == "escape" then love.event.quit() end
    if gameover and key == "return" then love.event.quit"restart" end
    if key == "p" then paused = not paused end
end

function love.load()
    score = 0
    t = 0
    gameover = false
    paused = false
    snake.body = {
        {x = 30, y = 30},
        {x = 29, y = 30},
        {x = 28, y = 30},
    }
    snake.d = 1
    resetapple()
end

function love.draw()
    love.graphics.clear()
    love.graphics.setColor(colors.score)
    love.graphics.print("Score: " .. score, 5, 5, 0, 1.5, 1.5)
    love.graphics.setColor(colors.border)
    love.graphics.rectangle("line", 0, 0, 960, 960)
    -- Draw apple
    love.graphics.setColor(colors.apple)
    love.graphics.circle("fill", apple.x * 16 + 8, apple.y * 16 + 8, 8)
    drawsnake()
    if gameover then
        love.graphics.setColor(colors.gameover)
        love.graphics.print("Game Over", 200, 420, 0, 8, 8)
        return
    end
    if paused then
        love.graphics.setColor(colors.paused)
        love.graphics.print("Paused", 200, 420, 0, 8, 8)
    end
end

function love.update(dt)
    if gameover or paused then return end
    detectkeys()
    t = t + dt
    local tic = 0.25 / (1.0625 ^ score)
    if t < tic then return end
    t = t - tic
    movesnake()
end
