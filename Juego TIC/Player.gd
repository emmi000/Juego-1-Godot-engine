extends Area2D

export (int) var Velocidad
var Movimiento = Vector2()
var limite
signal golpe	

func _ready():
	hide()#ocultar player
	limite = get_viewport_rect().size  #no salir de la ventana


func _process(delta):
	Movimiento=Vector2()#reiniciar posicion (vector)
	
	if Input.is_action_pressed("ui_right"):
		Movimiento.x +=1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -=1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -=1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y +=1
	if Movimiento.length() > 0: #normalizar velocidad en diagonal
		Movimiento = Movimiento.normalized() *Velocidad
		
	position += Movimiento * delta #actualizar la posicion
	#para que no se salga de la ventana
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	

#mostrar player y game over
func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$Collision_Player.disabled = true
	
func inicio(pos):
	position = pos
	show()#mostrar player
	$Collision_Player.disabled = false;
	
