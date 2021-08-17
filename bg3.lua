-- Circle background

-- initialization handling --

-- Initialize the background variables
--Full Sample
function initTunnelBg()
    return {
        circles = {},
        speed = 1.5,
        frequency = 0.2,
        prevCircleCreatedAt = 0,
        color1 = 13,
        color2 = 15,
        currentColor = 13,
        xPos = 64,
        yPos = 64,
        fill = 1
    }
end

-- data handling --

-- Run the snow background
function runTunnelBg(tunnel)
    local currentTime = time()
    
    if (currentTime - tunnel.prevCircleCreatedAt) > tunnel.frequency then
        tunnel.prevCircleCreatedAt = currentTime
        add(tunnel.circles, createCircle(tunnel))
    end

    growUpCircle(tunnel)
    cleanCircle(tunnel)
    circleControl(tunnel)
end

function createCircle(tunnel)

    local colorSelected = tunnel.color1

    if tunnel.currentColor == tunnel.color1 then
        colorSelected = tunnel.currentColor
        tunnel.currentColor = tunnel.color2
    else
        colorSelected = tunnel.currentColor
        tunnel.currentColor = tunnel.color1
    end

    return {
        color = colorSelected,
        xPos = tunnel.xPos,
        yPos = tunnel.yPos,
        radius = 1
    }
end

function growUpCircle(tunnel)
    for circle in all(tunnel.circles) do
        circle.radius = circle.radius + tunnel.speed
    end
end

function cleanCircle(tunnel)
    for circle in all(tunnel.circles) do
        if circle.radius > 128 then
            del(tunnel.circles, circle)
        end
    end 
end

function circleControl(tunnel)
    if btn(0) then
        -- tunnel.xPos = tunnel.xPos - 1
    end
    if btn(1) then
        -- tunnel.xPos = tunnel.xPos + 1
    end
    if btn(2) then
        tunnel.yPos = tunnel.yPos - 1
    end
    if btn(3) then
        tunnel.yPos = tunnel.yPos + 1
    end

    if btnp(5) then
        tunnel.fill = tunnel.fill * (-1)
    end
end

-- drawing handling --

function drawTunnelBg(tunnel)
    
    for circle in all(tunnel.circles) do
        if tunnel.fill == 1 then
            circfill(circle.xPos, circle.yPos, circle.radius, circle.color)
        else
            circ(circle.xPos, circle.yPos, circle.radius, circle.color)
        end
    end
end
