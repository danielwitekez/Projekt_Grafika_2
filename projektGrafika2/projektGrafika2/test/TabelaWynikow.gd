extends Control
func getwynik():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content
# Called when the node enters the scene tree for the first time.
func _ready():
	$Wynik.set_text(getwynik())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_powrot_przycisk_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	

	
