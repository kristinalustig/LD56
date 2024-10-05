H = {}

function H.checkOverlapSquare(mx, my, x1, x2, y1, y2)
    return mx >= x1 and mx <= x2 and my >= y1 and my <= y2
end

function H.checkOverlapIso(mx, my, p1x, p1y, p2x, p2y, p3x, p3y, p4x, p4y)

    local slope1 = (p2y - p1y)/(p2x - p1x)
    local slope2 = (p3y - p2y)/(p3x - p2x)

    local isOverlap = true

    if (my < (slope1*mx) + (p2y - (slope1*p2x))) then
        isOverlap = false
    end
    if (my > (slope1*mx) + (p3y - (slope1*p3x))) then
        isOverlap = false
    end
    if (my > (slope2*mx) + (p4y - (slope2*p4x))) then
        isOverlap = false
    end
    if (my < (slope2*mx) + (p3y - (slope2*p3x))) then
        isOverlap = false
    end

    return isOverlap
end

--r = #rows, c = #cols, sw/h = sheet width/height
function H.quadExtractor(x, y, w, h, r, c, sw, sh)
  
    local quads = {}
    
    for i=0, r-1, 1 do
      for j=0, c-1, 1 do
        table.insert(quads, love.graphics.newQuad(x+(j*w), y+(i*h), w, h, sw, sh))
      end
    end
  
    return quads
    
  end

return H