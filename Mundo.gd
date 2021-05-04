extends Node
export(PackedScene) var rocas
var Score

func _ready():
	OS.center_window()
	randomize()
	$fondo.show()
	$fondo2.hide()
	
func nuevo_juego():
	
	Score = 0
	$Player.inicio($Position2D.position) #posicion de inicio
	$inicioTimer.start()
	$interfaz.mostrar_mensaje("Listo!")
	$interfaz.update_score(Score)
	$musica.play()
	$Player/Sprite_player.scale.x = 0.5
	$Player/Sprite_player.scale.y = 0.53
	$Player/Sprite_player.animation = "parado"
	$Player/Sprite_player.frame=0
	$fondo.hide()
	$fondo2.show()
	
	
	




func game_over():
	if $Player/Sprite_player.animation == "parado":
		$Player/Sprite_player.animation = "huevo"
		$Player.show()
		$Player/cambio.start()
		$audiomuerte.play()
		$Player/Sprite_player.scale.x = 3.4
		$Player/Sprite_player.scale.y = 3
	else:
		$scoreTimer.stop()
		$rocaTimer.stop()
		$interfaz.game_over()
		$musica.stop()
		$audiomuerte.play()
		yield($interfaz/MensajeTimer , "timeout")
		$fondo.show()
		$fondo2.hide()
		
	
	
	
	
	
	
	
	

	


func _on_inicioTimer_timeout():
	$scoreTimer.start()
	$rocaTimer.start()


func _on_scoreTimer_timeout():
	Score += 1
	$interfaz.update_score(Score)
	

func _on_rocaTimer_timeout():
	#seleccion lugar aleatorio en camino
	$camino/RocaPosicion.set_offset(randi())
	var R = rocas.instance()
	add_child(R)
	#la direccion
	var D = $camino/RocaPosicion.rotation + PI/2 + PI/18
	
	R.position = $camino/RocaPosicion.position
	D += rand_range(-PI/4 , PI/4)
	R.rotation = D
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min , R.velocidad_max) , 0).rotated(D))
	
