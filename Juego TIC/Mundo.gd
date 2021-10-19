extends Node

export (PackedScene) var Roca
var Score 


func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Player.inicio($Posocion_inicio.position) #posicion de inicio player
	$Inicio_Timer.start()


func game_over():
	$Score_Timer.stop()
	$Roca_Timer.stop()


func _on_Inicio_Timer_timeout():
	$Roca_Timer.start()
	$Score_Timer.start()



func _on_Score_Timer_timeout():
	Score += 1


#selecionar camino de la roca
func _on_Roca_Timer_timeout():
	$Camino/Roca_Posicion.set_offset(randi())
	var R = Roca.instance()
	add_child(R)
	
	#seleccionar direccion
	var d = $Camino/Roca_Posicion.rotation + PI /2
	
	R.position = $Camino/Roca_Posicion.position
	
	d += rand_range(-PI /4, PI /4)
	R.rotation = d
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max), 0).rotated(d))
