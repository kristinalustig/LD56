local h = require "helpers"

G = {}

local tileImg
local tileQuads
local tileMap

function G.load()

    tileImg = love.graphics.newImage("/assets/tiles.png")
    tileQuads = h.quadExtractor(0, 0, 192, 192, 10, 20, 3840, 1920)
    tileMap = InitTileMap()

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

end

function G.update()

end

function G.draw(mx, my)

    for y = -480, 1920, 48 do
        for k, v in ipairs(tileMap) do
            if v.y == y then
                local tile = v
                love.graphics.draw(tileImg, GetQuad(tile.tileType, tile.hasAnimal, tile.mergeState), tile.x, tile.y)
                love.graphics.printf(tile.id, tile.x+40, tile.y+90, 40, "left")
                if h.checkOverlapIso(mx, my, tile.x, tile.y+80, tile.x+48, tile.y, tile.x+96, tile.y+80, tile.x+48, tile.y+96) then
                    love.graphics.setColor(1, 0, 1)
                    love.graphics.printf(tile.id, 5, 5, 30, "left")
                end
            end
        end
    end

end


function G.handleMouse(x, y, b)

end


---LOCAL FUNCTIONS
function InitTileMap()

    local tempTable = {}
    local tileX = -480
    local tileY = -480
    local tileId = 1
    for j = 0, 40, 1 do
        for i = 0, 40, 1 do
            local tile = {
                x = tileX + (96*i),
                y = tileY + (96*j),
                id = tileId,
                tileType = love.math.random(10),
                hasAnimal = false
            }
            if i % 2 == 0 then
                tile.y = tile.y + 48
            end
            table.insert(tempTable, tile)
            tileId = tileId + 1
        end
    end

    return tempTable

end

function GetQuad(t, a, m)
    t = t * 20
    if a == true then
        t = t + 2
    end

    return tileQuads[t]

end

return G