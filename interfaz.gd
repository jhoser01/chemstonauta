extends CanvasLayer

signal iniciar_juego
func mostrar_mensaje(texto):
	$mensaje.text = texto
	$mensaje.show()
	$MensajeTimer.start()

func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer , "timeout")
	$BotonPlay.show()
	$mensaje.text = "CHEEMSTONAUTA"
	$mensaje.show()
	
	
func update_score(puntos):
	$ScoreLabel.text = str(puntos)
	
	
	
	
	

	



func _on_MensajeTimer_timeout():
	$mensaje.hide()




func _on_BotonPlay_pressed():
	$BotonPlay.hide()
	emit_signal("iniciar_juego")
	
	
	
	
	
	
	
	
	
	
	
	
	
