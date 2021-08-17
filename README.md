# background-pico8
A cart with multiple fun background

![alt text](https://github.com/Remysd/background-pico8/raw/master/fun_bg_github.gif "Background gif sample")

This is a quick example to include the snow background in your pico cart.
All backgrounds follow this example
```lua
#include bg1.lua

function _init()
  snowBg = initSnowBg()
end

function _update()
  runSnowBg(snowBg)
end

function _draw()
	cls()
  drawSnowBg(snowBg)
end
```
