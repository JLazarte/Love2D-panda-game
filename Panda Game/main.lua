require 'juego'

calibrarPantalla = function ()
	globalWidth = love.graphics.getWidth( )
	globalHeight = love.graphics.getHeight( )
	winScale = globalWidth / winWidth
	if (winHeight * winScale) > globalHeight then
		winScale = globalHeight / winHeight
	end
	translateX = ((globalWidth - winWidth*winScale) / 2 )
	translateY = ((globalHeight - winHeight*winScale) / 2 )

end

function love.load()
	--love.window.setMode(0, 0, {fullscreen = true, resizable=false, vsync=false})
	love.window.setMode(800, 600, {fullscreen = false, resizable=true, vsync=false, minwidth=400, minheight=300})
	winWidth = 1280/2;
	winHeight = 800/2;
	calibrarPantalla()
	maxTime = 64
	minTime = 0.2
	fps = 60;
	CrearNivel()

end

function love.update(dt)
	calibrarPantalla()
	if not Pausa then
    	tick(dt)
    end
end
 
function love.keypressed(k)
    if k == "r" then
		CrearNivel()
	elseif k == "p" then
		Pausa = not Pausa
	elseif k == "a" then
		girar(-45)
	elseif k == "d" then
		girar(45)
	elseif k == "escape" then
      love.event.quit()
    end
end

function love.mousepressed(x, y, button)
   if button == "l" then -- this is the lowercase letter L, not a one (1)
   	  mx = x / winScale - translateX
      my = y / winScale - translateY
      click(mx,my)
   end
end

function love.touchpressed(id, x, y, pressure)
    mx = x * winWidth
    my = y * winHeight
    click(mx,my)
end

function love.draw()

	love.graphics.translate( translateX, translateY)
    Dibujar()

    --COMENTAME PUTO !!!
    --[
    love.graphics.setColor( 255, 0, 0)
    love.graphics.print("Current time: "..tostring(Time), 10, 80)
    love.graphics.print("Current translate: " .. tostring(translateX) ..  tostring("x") ..tostring(translateY) , 0, 90)
    love.graphics.print("Current mouse : "..tostring(mx).. " x " .. tostring(my), 10, 100)
    --[
    love.graphics.print("Current translate: " .. tostring( (globalWidth - winWidth*winScale) / 2) ..  tostring("x") ..tostring((globalHeight - winHeight*winScale) / 2) , 0, 0)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    love.graphics.print("Current globalWidth: "..tostring(globalWidth), 10, 20)
    love.graphics.print("Current globalHeight: "..tostring(globalHeight), 10, 30)
    love.graphics.print("Current false globalWidth: "..tostring(winWidth), 10, 40)
    love.graphics.print("Current false globalHeight: "..tostring(winHeight), 10, 50)
    love.graphics.print("Current scale: "..tostring(winScale), 10, 60)
	--]]
end