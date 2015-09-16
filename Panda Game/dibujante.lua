DibujarActor = function (Actor)
	local img = Actor.img
	local xEscala = 1
	local angulo = 0
	if Actor.angulo then angulo = Actor.angulo end
	love.graphics.draw(img, Actor.x*winScale, Actor.y*winScale, angulo,  Actor.escala * winScale, Actor.escala * winScale, img:getWidth()/2, img:getHeight()/2)

end

DibujarTiempo = function (Actor)
	local img = Actor.img
	local angulo = 0
	if Actor.angulo then angulo = Actor.angulo end
	love.graphics.draw(img, ((Actor.x + (Time/maxTime) * (winWidth/2)) * winScale) , Actor.y*winScale, angulo,  Actor.escala * winScale * Time, Actor.escala * winScale, img:getWidth()/2, img:getHeight()/2)
end