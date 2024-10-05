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

function love.load()

    PushSetup()

    gs.load()
    C.load()

    if IS_DEBUG then
        -- do debug stuff here
    end

end

function love.update()

    gs.update()

end

function love.draw()

    push:start()

    gs.draw()
    
    love.graphics.translate(c.getTranslate())
    local mx, my = push:toGame(love.mouse.getX(), love.mouse.getY())

    if IS_DEBUG then
        for i=-10, 10, 1 do
            for j=-10, 10, 1 do
                love.graphics.rectangle("fill", i*50, j*50, 50, 50)
                if i%2 == 0 then
                    if j % 2 == 0 then
                        love.graphics.setColor(1, 0, 0)
                    else
                        love.graphics.setColor(1, 1, 1)
                    end
                elseif i % 3 == 0 then
                    if j % 3 == 0 then
                        love.graphics.setColor(0, 1, 0)
                    else
                        love.graphics.setColor(1, 1, 0)
                    end
                else
                    love.graphics.setColor(0, 0, 1)
                    if j % 2 == 0 then
                        love.graphics.setColor(1, 0, 1)
                    end
                end
            end
        end
        love.graphics.printf("("..math.floor(mx)..", "..math.floor(my)..")", mx, my, 100, "left")
    end
    
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

function love.keyreleased(k)
    if k == "up" or k == "down" or k == "left" or k == "right" or k == "w" or k == "a" or k == "s" or k == "d" or k == "r" then
        c.setTranslate(k)
    end
end