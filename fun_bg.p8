pico-8 cartridge // http://www.pico-8.com
version 32
__lua__

#include utils.lua
#include bg1.lua
#include bg2.lua

function _init()
    initSnowBg()
    initWaveBg()
end

function _update()
    runSnowBg()
    runWaveBg()
end

function _draw()
	cls()

    -- drawSnowBg()
    drawWaveBg(waveBg)
    drawWaveBg(secondaryWaveBg)

    title = "background cart !"
    outline(title, getCenterTextX(title), 110, 9, 8)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
