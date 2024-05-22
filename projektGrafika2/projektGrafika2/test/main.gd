extends Node2D
@export var enemyscene: PackedScene
@export var bulletscene: PackedScene
var rng = RandomNumberGenerator.new()
@export var punkty = 0

	
func _physics_process(_delta):
	pass
	
func increment():
	punkty +=1

func scoretofile():
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_string(var_to_str(punkty))
	file.close()
	


func _on_mobtimer_timeout():

	var enemy = enemyscene.instantiate()
	var my_random_number = rng.randi_range(-1000.0, 1000.0)
	var my_random_number2 = rng.randf_range(-1000.0, 1000.0)
	var vectorP = Vector2(my_random_number,my_random_number2)
	var spawnlocation = Vector2(get_node("playerSprite").position) - vectorP
	enemy.position = spawnlocation
	if is_spawn_location_valid(spawnlocation):
		add_child(enemy)
	else:
		_on_mobtimer_timeout()
func is_spawn_location_valid(location: Vector2) -> bool:
	var player_position = get_node("playerSprite").position
	var invalid_area = Rect2(player_position - Vector2(500, 500), Vector2(1000, 1000))  # Tworzymy prostokąt o wymiarach 1000x1000 wokół gracza
	return not invalid_area.has_point(location)

	
