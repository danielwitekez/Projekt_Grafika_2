extends Control
var label : Label
var time_elapsed : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $Tekst1
	label.set_text("Istnieje ponad 260 różnych gatunków małp, a są one podzielone na dwie główne grupy: małpy szerokonose (w tym człowiek) i małpy wąskonose.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_elapsed += delta

	if time_elapsed >=10.0:
		change_text()
		 # Zresetuj czas
		
	if time_elapsed >=20.0:
		change_text2()
		time_elapsed = 0.0 

func change_text():
	label.set_text("Małpy mają bardziej rozwinięte kubki smakowe niż ludzie, co oznacza, że ​​mogą być bardziej wybredne w kwestii jedzenia.")
func change_text2():
	label.set_text("Małpy wykazują różnorodne formy zachowania społecznego. Niektóre gatunki żyją w dużych grupach, podczas gdy inne są bardziej samotne.")

func _on_start_przycisk_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_tutorial_przycisk_pressed():
	get_tree().change_scene_to_file("res://Tutorial.tscn")

func _on_quit_przycisk_pressed():
	get_tree().quit()
