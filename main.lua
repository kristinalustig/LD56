local gs = require "gameState"
local push = require "push"
local c = require "camera"

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
    GRASS = 1,
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

    PushSetup()

    gs.load()
    C.load()
    love.keyboard.setKeyRepeat(true, .5)

    if IS_DEBUG then
        -- do debug stuff here
    end

end

function love.update()

    gs.update()

end

function love.draw()

    push:start()

    local mx, my = push:toGame(love.mouse.getX(), love.mouse.getY())

    love.graphics.translate(c.getTranslate())
    love.graphics.scale(c.getScale())

    gs.draw(mx, my)

    push:finish()

end

function PushSetup()
    local gameWidth, gameHeight = 800, 600
    local windowWidth, windowHeight = love.window.getDesktopDimensions()

    if love.system.getOS() == "Web" then
        windowWidth, windowHeight = 800, 600
    elseif windowHeight >= 1032 then
        windowWidth, windowHeight = 1200, 900
    else
        windowWidth, windowHeight = 800, 600
    end

    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false, resizable = false, pixelperfect = true, stretched = true})
end

function love.keypressed(k, _, isRepeat)
    if k == "up" or k == "down" or k == "left" or k == "right" or k == "w" or k == "a" or k == "s" or k == "d" or k == "r" then
        c.setTranslate(k, isRepeat)
    end
end

function love.wheelmoved(_, y)
    c.setScale(y)
end

function love.mousereleased(x, y, b, _, _)
    gs.handleMouse(x, y, b)
end