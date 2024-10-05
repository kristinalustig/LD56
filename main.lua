local gs = require "gameState"
local c = require "camera"
local a = require "animals"

IS_DEBUG = true

SCENE = {
    INTRO = 1,
    MAIN = 2,
    HELP = 3,
    SETTINGS = 4,
    RESEARCH = 5,
    BESTIARY = 6,
    WIN = 7
}

TILE_TYPE = {
    MEADOW = 1,
    WATER = 2,
    DESERT = 3,
    FOREST = 4,
    ICE = 5,
    SNOW = 6,
    JUNGLE = 7,
    MOUNTAINS = 8,
    CITY = 9,
    PLAINS = 10,
    BLANK = 11
}

function love.load()

    gs.load()
    c.load()
    a.load()
    love.keyboard.setKeyRepeat(true, .5)

    if IS_DEBUG then
        -- do debug stuff here
    end

end

function love.update()

    gs.update()

end

function love.draw()

    local mx, my = love.mouse.getPosition()

    love.graphics.translate(c.getTranslate())
    gs.draw(mx, my)

end

function love.keypressed(k, _, isRepeat)
    if k == "up" or k == "down" or k == "left" or k == "right" or k == "w" or k == "a" or k == "s" or k == "d" or k == "r" then
        c.setTranslate(k, isRepeat)
    end
end

function love.mousereleased(x, y, b, _, _)
    gs.handleMouse(x, y, b)
end