extends Control

@onready var anim = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("walk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_powrot_przycisk_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

