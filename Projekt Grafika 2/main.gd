extends Node2D
@export var enemyscene: PackedScene
var rng = RandomNumberGenerator.new()
	
func _physics_process(_delta):
	pass
	

	
	
	


func _on_mobtimer_timeout():
	var enemy = enemyscene.instantiate()
	var my_random_number = rng.randi_range(-1000.0, 1000.0)
	var my_random_number2 = rng.randf_range(-1000.0, 1000.0)
	var vectorP = Vector2(my_random_number,my_random_number2)
	var spawnlocation = Vector2(get_node("player/playerSprite").position) - vectorP
	enemy.position = spawnlocation
	add_child(enemy)
