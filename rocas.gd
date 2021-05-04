extends RigidBody2D

export(int) var velocidad_min
export(int) var velocidad_max
var tipo_roca = ["marron" , "corona"]

func _ready():
	$AnimatedSprite.animation= tipo_roca[ randi() % tipo_roca.size()]
func _process(delta):
	if $AnimatedSprite.animation == "marron" :
		$AnimatedSprite.scale.x= 0.64
		$AnimatedSprite.scale.y= 0.319
	else:
		$AnimatedSprite.scale.x= 0.358
		$AnimatedSprite.scale.y= 0.278
		
		


func _on_Visibilidad_screen_exited():
	queue_free()
