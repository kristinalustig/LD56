C = {}

local translateX
local translateY

function C.load()

    translateX = 0
    translateY = 0

end

function C.getTranslate()

    return translateX, translateY

end

function C.setTranslate(key, isHold)

    local moveSpeed = 50
    if isHold then
        moveSpeed = 20
    end

    if key == "up" or key == "w" then
        translateY = translateY + moveSpeed
    elseif key == "down" or key == "s" then
        translateY = translateY - moveSpeed
    elseif key == "left" or key == "a" then
        translateX = translateX + moveSpeed
    elseif key == "right" or key == "d" then
        translateX = translateX - moveSpeed
    elseif key == "r" then
        translateX = 0
        translateY = 0
    end

end

return C