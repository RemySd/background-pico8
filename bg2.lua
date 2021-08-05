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
        center = 108,
        speed = 0.2,
        color = 1
    }

    createLines(waveBg)

    secondaryWaveBg = {
        waves = {},
        samples = 129,
        amp = 6,
        frequency = 1,
        center = 110,
        speed = 0.5,
        color = 12
    }

    createLines(secondaryWaveBg)

    thirdWaveBg = {
        waves = {},
        samples = 128,
        amp = 4,
        frequency = 1,
        center = 122,
        speed = 0.1,
        color = 7
    }

    createLines(thirdWaveBg)
end

function createLines(waveItem)
    local i_f = 128 / waveItem.frequency
    local dx = 128 / waveItem.samples
    local color = waveItem.color or WHITE_COLOR
    
    for x = 0, 128, dx do
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
    runWave(waveBg)
    runWave(secondaryWaveBg)
    runWave(thirdWaveBg)
end

function runWave(wave)
    for waveDot in all(wave.waves) do
        waveDot.x1 = waveDot.x1 + wave.speed
        waveDot.x2 = waveDot.x2 + wave.speed

        if waveDot.x1 >= 127 then
            waveDot.x1 = 0
        end

        if waveDot.x2 >= 127 then
            waveDot.x2 = 0
        end
    end
end

-- drawing handling --

function drawWaveBg(wave)

    for waveDot in all(wave.waves) do
        drawMultipleLine(waveDot, wave.amp)
    end

    rectfill(0, wave.center + wave.amp, 128, 128, wave.color)

end

-- Display the line wave tu fill the bottom of the wave
function drawMultipleLine(waveDot, amp)
    for diff = 0, (amp*2), 1 do
        line(waveDot.x1, waveDot.y1 + diff, waveDot.x2, waveDot.y2 + diff, waveDot.color)
    end
end