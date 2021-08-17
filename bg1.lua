-- Snow background

-- initialization handling --

-- Initialize the background variables
function initSnowBg()
    return {
        balls = {},
        intensity = 0.3,
        prevBallCreatedAt = 0,
        wind = 0.2 -- -1 to left, 0 no wind, 1 to right
    }
end

-- data handling --

-- Run the snow background
function runSnowBg(snowBg)
    local currentTime = time()
    
    if (currentTime - snowBg.prevBallCreatedAt) > snowBg.intensity then
        snowBg.prevBallCreatedAt = currentTime
        add(snowBg.balls, createBall())
    end

    moveBalls(snowBg)
    cleanOutBall(snowBg)
end

function moveBalls(snowBg)
    for ball in all(snowBg.balls) do
        ball.yPos = ball.yPos + ball.speed
        ball.xPos = ball.xPos + snowBg.wind
    end
end

-- Create a ball with randon properties
function createBall()
    -- pos between min and max horizontal size
    local xPos = flr(rnd(124))
    local radius = flr(rnd(3)) + 1
    local speed = radius -- If the ball is large, the speed is more faster

    return {
        xPos = xPos,
        yPos = -4,
        radius = radius,
        speed = speed / 2,
    }
end

function cleanOutBall(snowBg)
    for ball in all(snowBg.balls) do
        if ball.yPos > 128 then
            del(snowBg.balls, ball)
        end
    end
end

-- drawing handling --

function drawSnowBg(snowBg)
    for ball in all(snowBg.balls) do
        circfill(ball.xPos, ball.yPos, ball.radius, 7)
    end
end
