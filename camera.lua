C = {}

local translateX
local translateY
local currentScale

function C.load()

    translateX = 0
    translateY = 0
    currentScale = 1

end

function C.getTranslate()

    return translateX, translateY

end

function C.getScale()

    return currentScale

end

function C.setTranslate(key)

    if key == "up" or key == "w" then
        translateY = translateY + 100
    elseif key == "down" or key == "s" then
        translateY = translateY - 100
    elseif key == "left" or key == "a" then
        translateX = translateX + 100
    elseif key == "right" or key == "d" then
        translateX = translateX - 100
    elseif key == "r" then
        translateX = 0
        translateY = 0
    end

end

function C.setScale(dir)

end

return C