local h = require "helpers"
local c = require "camera"
local a = require "animals"

G = {}

local tileImg
local tileQuads
local tileMap
local highlight
local menu
local menuButtons
local currentMode
local currentOverlap

local buttonType

function G.load()

    tileImg = love.graphics.newImage("/assets/tilesbg.png")
    highlight = love.graphics.newImage("/assets/highlight.png")
    menu = love.graphics.newImage("/assets/menu.png")
    tileQuads = h.quadExtractor(0, 0, 192, 96, 11, 1, 192, 1056)

    mergeState = {
        l = 1,
        r = 2,
        u = 3,
        d = 4,
        lr = 4,
        lu = 6,
        ld = 7,
        ru = 8,
        rd = 9,
        ud = 10,
        lru = 11,
        lrd = 12,
        rud = 13,
        lrud = 14
    }

    buttonType = {
        biome = 1,
        eraser = 2,
        settings = 3,
        bestiary = 4
    }

    tileMap = InitTileMap()
    menuButtons = CreateMenu()
    currentMode = nil
    currentOverlap = nil
end

function G.update()

end

function G.draw(mx, my)

    currentOverlap = nil

    for k, col in ipairs(tileMap) do
        for _, v in ipairs(col) do
            local tile = v
            love.graphics.draw(tileImg, tileQuads[tile.tileType], tile.x, tile.y)
            local tx, ty = c.getTranslate()
            local xt = ""
            if h.checkOverlapIso(mx, my, tile.x+tx, tile.y+48+ty, tile.x+96+tx, tile.y+ty, tile.x+192+tx, tile.y+48+ty, tile.x+96+tx, tile.y+96+ty) then
                currentOverlap = tile
                xt="*"
            end
            love.graphics.printf(xt..tile.id..xt, tile.x, tile.y+48, 192, "center")
        end
    end

    --prioritize bottom menu
    if my < 826 then
        if currentOverlap then
            love.graphics.draw(highlight, currentOverlap.x, currentOverlap.y)
            love.graphics.rectangle("fill", mx, my, 100, 100)
            love.graphics.setColor(0, 0, 0)
            love.graphics.printf(currentOverlap.tileType, mx + 10, my + 10, 90, "center")
            for k, v in ipairs(currentOverlap.validAnimals) do
                love.graphics.printf(v.animalName, mx + 10, my + 10 + (20*k), 90, "center")
            end
            love.graphics.setColor(1, 1, 1)
        end
    end
    love.graphics.reset()
    love.graphics.draw(menu, 0, 826, 0, .75, .75)
    if my >= 826 then
        for k, v in ipairs(menuButtons) do
            if h.checkOverlapSquare(mx, my, v.x, v.x+72, v.y, v.y+72) then
                love.graphics.setPointSize(2)
                love.graphics.rectangle("line", v.x, v.y, 72, 72)
                break
            end
        end
    end
    
    if currentMode then
        love.graphics.setPointSize(3)
        love.graphics.setColor(1, 1, 0)
        love.graphics.rectangle("line", currentMode.x, currentMode.y, 72, 72)
        love.graphics.setColor(1, 1, 1)
    end
    love.graphics.translate(c.getTranslate())

end


function G.handleMouse(x, y, b)

    if y >= 804 then
        for k, v in ipairs(menuButtons) do
            if h.checkOverlapSquare(x, y, v.x, v.x+72, v.y, v.y+72) then
                currentMode = v
                break
            end
        end
    else
        if currentOverlap then
            if currentMode then
                currentOverlap.tileType = currentMode.tileType
                --THIS IS WHERE THE MAGIC HAPPENS I HOPE
                CheckAndUpdateMap()
            end
        end
    end

end


---LOCAL FUNCTIONS
function InitTileMap()

    local tempTable = {}
    local tileX = -960
    local tileY = -960
    local tileId = 1
    for j = 0, 30, 1 do
        local tileCol = {}
        for i = 0, 30, 1 do
            local tile = {
                x = tileX + (96*i),
                y = tileY + (96*j),
                id = tileId,
                tileType = TILE_TYPE.BLANK,
                validAnimals = {}
            }
            if i % 2 == 0 then
                tile.y = tile.y + 48
            end
            table.insert(tileCol, tile)
            tileId = tileId + 1
        end
        table.insert(tempTable, tileCol)
    end

    return tempTable

end

function CreateMenu()

    local tempTable = {}

    local y = 826
    local start = -1
    local incr = 72
    for i = 1, 10 do
        local btn = {
            buttonType = buttonType.biome,
            tileType = i,
            x = start + incr*i,
            y = y
        }
        table.insert(tempTable, btn)
    end

    table.insert(tempTable, {
        buttonType = buttonType.eraser,
        x = start + incr * 12,
        tileType = TILE_TYPE.BLANK,
        y = y
    })

    table.insert(tempTable, {
        buttonType = buttonType.settings,
        x = start + incr * 14,
        y = y
    })

    table.insert(tempTable, {
        buttonType = buttonType.bestiary,
        x = start + incr * 15,
        y = y
    })

    return tempTable

end

function CheckAndUpdateMap()
    --here is where we determine if animals should appear or not
    tileMap = a.addValidAnimalsToTileMap(tileMap)
end

return G