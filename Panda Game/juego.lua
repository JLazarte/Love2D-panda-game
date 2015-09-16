require 'datos'
require 'dibujante'

tick = function (dt)
	Lapso = Lapso + dt
	if Lapso > (1/fps) then
		Lapso = Lapso % (1/fps)
		if (Time > 0) then Time = Time - minTime end
		calcularFisica()
	end
end

girar = function (grados)
	
end

calcularFisic = function()


end

ColicionActor = function(x , y, Actor)
	local img = Actor.img
	local px = Actor.x - img:getWidth()/2
	local py = Actor.y - img:getHeight()/2
	return Colicion(x,y, px, py, px + img:getWidth(), py + img:getHeight())
end

Colicion = function(x,y, ox, oy, wx, hy)
	return (x >= ox and x <= wx and y >= oy and y <= hy)
end

click = function (x,y)
	
	if ColicionActor(x,y,Escenario.ActorDinamico["viento"]) then
		Pausa = not Pausa
	elseif Colicion(x,y,0,0, (winWidth/2)-1, winHeight) then
		girar(-45)
	elseif Colicion(x,y,winWidth/2, 0, winWidth, winHeight) then
		girar(45)
	end
end

CrearNivel = function ()
	addActorEstatico("fondo", winWidth/2, winHeight/2, 1, "fondo")
	addActorEstatico("escondido", 300 , 300, 1, "panda")
	addActorDinamico("panda", 100, 100, 1, "panda")
	addActorEstatico("tiempo", 0, Imagen["barra"]:getHeight()/2, 1, "barra")
	addActorDinamico("viento", winWidth - Imagen["flecha"]:getWidth()/2, Imagen["barra"]:getHeight() + Imagen["flecha"]:getHeight()/2, 1, "flecha")
	Time = maxTime
	Lapso = 0
end

Dibujar = function ()
    love.graphics.setColor( 255, 255, 255)
	DibujarActor(Escenario.ActorEstatico["fondo"])
	DibujarTiempo(Escenario.ActorEstatico["tiempo"])
	DibujarActor(Escenario.ActorDinamico["viento"])
	love.graphics.setColor( 0, 182, 0)
	DibujarActor(Escenario.ActorEstatico["escondido"])
	love.graphics.setColor( 255, 255, 255)
	DibujarActor(Escenario.ActorDinamico["panda"])
	love.graphics.setColor( 255, 255, 255)
end