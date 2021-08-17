-- double band with dot background

-- Initialization handling

-- Initialize the background variable
-- Full Sample
function initDoubleBarBg()
    return {
        lines = {},
        color1 = 8,
        color2 = 9,
        prevLineCreatedAt = 0,
        frequency = 0.5, -- in seconds
        speed = 1
    }
end


-- data handling --

-- Handle the double bar data
function runDoubleBar(background)

    local currentTime = time()
    
    if (currentTime - background.prevLineCreatedAt) > background.frequency then
        background.prevLineCreatedAt = currentTime
        add(background.lines, createLine(background.color2))
    end

    moveLines(background)
    cleanLines(background)
end

function createLine(color, xPos)
    color = color or 1
    xPos = xPos or -20

    return {
        xPos = xPos,
        color = color
    }
end

function moveLines(background)
    for lineD in all(background.lines) do
        lineD.xPos = lineD.xPos + background.speed
    end
end

function cleanLines(background)
    for lineD in all(background.lines) do
        if lineD.xPos > 128 + 15 then
            del(background.lines, lineD)
        end
    end
end

-- draw handling

function drawDoubleBar(background)

    rectfill(0, 0, 128, 30, background.color1)

    for x = 0, 128, 2 do
        line(x, 31, x, 31, background.color1)
        line(x+1, 32, x+1, 32, background.color1)
        line(x, 33, x, 33, background.color1)
        line(x+1, 34, x+1, 34, background.color1)
    end

    rectfill(0, 98, 128, 128, background.color1)

    for x = 0, 128, 2 do
        line(x, 97, x, 97, background.color1)
        line(x+1, 96, x+1, 96, background.color1)
        line(x, 95, x, 95, background.color1)
        line(x+1, 94, x+1, 94, background.color1)
    end

    drawDoubleBarAnimation(background)
end

function drawDoubleBarAnimation(background)

    for lineD in all(background.lines) do
        line(lineD.xPos + 15, 0, lineD.xPos, 30, lineD.color)

        if (flr(lineD.xPos) % 2) == 1 then
            line(lineD.xPos, 32, lineD.xPos, 32, lineD.color)
            line(lineD.xPos, 34, lineD.xPos, 34, lineD.color)
        else
            line(lineD.xPos, 31, lineD.xPos, 31, lineD.color)
            line(lineD.xPos, 33, lineD.xPos, 33, lineD.color)
        end
    end

    for lineD in all(background.lines) do
        line(lineD.xPos, 98, lineD.xPos - 15, 128, lineD.color)

        if (flr(lineD.xPos) % 2) == 1 then
            line(lineD.xPos, 96, lineD.xPos, 96, lineD.color)
            line(lineD.xPos, 94, lineD.xPos, 94, lineD.color)
        else
            line(lineD.xPos, 97, lineD.xPos, 97, lineD.color)
            line(lineD.xPos, 95, lineD.xPos, 95, lineD.color)
        end
    end 
end
