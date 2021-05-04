extends Area2D

export(int) var Velocidad

var Movimiento = Vector2()

var limite

signal golpe
var sprite









func _ready():
	limite = get_viewport_rect().size
	hide() #jugador invisible



func _process(delta):
	sprite= $Sprite_player.animation
	Movimiento = Vector2() #reiniciar el movimiento
	if Input.is_action_pressed("ui_right"):
		Movimiento.x +=1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -=1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y +=1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -=1
	
	if Movimiento.length()>0: #verificar si se mueve
		Movimiento = Movimiento.normalized() * Velocidad  #normalizar la velicdad
	position += Movimiento * delta #cambiar la posicion con el movimiento
	position.x = clamp(position.x , 0 , limite.x)
	position.y = clamp(position.y , 0 , limite.y)
	
	if Movimiento.x != 0:
		
		$Sprite_player.animation=sprite
		if Movimiento.x < 0 :
			$Sprite_player.frame = 1
		elif Movimiento.x > 0 :
			$Sprite_player.frame= 0
			
			
		
		$Sprite_player.flip_v= false #si no estamos bajando, conservar vertical
	elif Movimiento.y !=0:
		
		$Sprite_player.animation=sprite
		
		$Sprite_player.flip_v= Movimiento.y > 0
	else:
		$Sprite_player.animation=sprite	


func _on_Player_body_entered(body): #cuando colisione
	
	hide()
	emit_signal("golpe")
	$CollisionShape2D.set_deferred("disabled", true)
		
	
		
	
func inicio(pos):
	position = pos
	show()  #mostrar personaje
	$CollisionShape2D.set_deferred("disabled", false)


func _on_cambio_timeout():
	show()
	$Sprite_player.scale.x = 0.4
	$Sprite_player.scale.y = 0.28
	
	$Sprite_player.animation="chemsito"
	$Sprite_player.frame=0
	
	$CollisionShape2D.set_deferred("disabled", false)
	
