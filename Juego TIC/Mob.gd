extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_roca = ["default"] #agregar otra animacion para tener varios objetos

func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]
#randomizar mobs



func _on_Visibilidad_screen_exited():
	queue_free()
