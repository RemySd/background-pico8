-- This file is a utils class for all pico project

-- a basic print text of the center to the screen
function printCenter(content, yPos, c)
    yPos = yPos or 0
    color = color or 7
    xPos = getCenterTextX(content)

    print(content, xPos, yPos, color)
end

-- Find the x position for a specific text and size screen
function getCenterTextX(t, screenSize)
    screenSize = screenSize or 128

    if screenSize%2 == 1 then
        screenSize = screenSize + 1
    end

    halfSize = screenSize / 2

    return halfSize - #t * 2
end

function outline(content, xPos, yPos , color1, color2)
	for i=0,2 do
	 for j=0,2 do
	  if not(i==1 and j==1) then
	   print(content, xPos+i, yPos+j, color1)
	  end
	 end
	end

	print(content, xPos+1, yPos+1, color2)
end

function zspr(n,w,h,dx,dy,dz,fx,fy)
    sspr(8*(n%16),8*flr(n/16),8*w,8*h,dx,dy,8*w*dz,8*h*dz,fx,fy)
end
