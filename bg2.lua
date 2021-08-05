-- Wave background

WHITE_COLOR = 7

-- initialization handling --

-- Initialize the background variables
function initWaveBg()
    waveBg = {
        waves = {},
        samples = 128,
        amp = 3,
        frequency = 1,
        center = 80,
        speed = 0.1,
        color = 13
    }

    createLines(waveBg)

    secondaryWaveBg = {
        waves = {},
        samples = 128,
        amp = 7,
        frequency = 1,
        center = 82,
        speed = 0.5,
        color = 12
    }

    createLines(secondaryWaveBg)
end

function createLines(waveItem)
    local i_f = 128 / waveItem.frequency
    local dx = 128 / waveItem.samples
    local color = waveItem.color or WHITE_COLOR
    
    for x = 0, 127, dx do
        local lineWave = {
            x1 = x,
            y1 = waveItem.center + sin(x / i_f) * waveItem.amp,
            x2 = x,
            y2 = waveItem.center + sin(x / i_f) * waveItem.amp,
            color = color
        }

        add(waveItem.waves, lineWave)
    end
end

-- data handling --

-- Run the wave background
function runWaveBg()
    for wave in all(waveBg.waves) do
        wave.x1 = wave.x1 + waveBg.speed
        wave.x2 = wave.x2 + waveBg.speed

        if wave.x1 > 127 then
            wave.x1 = 0
        end

        if wave.x2 > 127 then
            wave.x2 = 0
        end
    end

    for wave in all(secondaryWaveBg.waves) do
        wave.x1 = wave.x1 + secondaryWaveBg.speed
        wave.x2 = wave.x2 + secondaryWaveBg.speed

        if wave.x1 > 127 then
            wave.x1 = 0
        end

        if wave.x2 > 127 then
            wave.x2 = 0
        end
    end
end

-- drawing handling --

function drawWaveBg(waveItem)

    for waveDot in all(waveItem.waves) do
        line(waveDot.x1, waveDot.y1, waveDot.x2, waveDot.y2, waveDot.color)
    end

end
