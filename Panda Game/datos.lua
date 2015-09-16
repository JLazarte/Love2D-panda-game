Imagen = {}
Imagen["fondo"] = love.graphics.newImage("world/fondo.jpg")
Imagen["barra"] = love.graphics.newImage("world/time.png")
Imagen["panda"] = love.graphics.newImage("world/ball.png")
Imagen["flecha"] = love.graphics.newImage("world/flecha.png")

Escenario = {
ActorEstatico = {},
ActorDinamico = {}
}

addActorEstatico = function (anombre, ax, ay, aescala, aimagen)
	Escenario.ActorEstatico[anombre] = {
		nombre = anombre,
		x = ax,
		y = ay,
		escala = aescala,
		img = Imagen[aimagen]
	}
end

addActorDinamico = function (anombre, ax, ay, aescala, aimagen, aangulo, afuerzaX, afuerzaY)
	Escenario.ActorDinamico[anombre] = {
		nombre = anombre,
		x = ax,
		y = ay,
		escala = aescala,
		img = Imagen[aimagen],
		angulo = angulo,
		fuerzaX = afuerzaX,
		fuerzaY = afuerzaY
	}
end