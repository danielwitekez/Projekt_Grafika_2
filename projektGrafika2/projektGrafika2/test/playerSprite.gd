extends CharacterBody2D

@export var move_speed : float = 200
@export var starting_direction : Vector2 = Vector2(0,1)
@onready var animation_tree = $AnimationTree
@export var nazwa = 'hero'
var input_direction :Vector2
func _ready():
	update_animation_parameters(starting_direction)
func _physics_process(_delta):
	input_direction = Vector2(
		(Input.get_action_strength("right") - Input.get_action_strength("left")),
		(Input.get_action_strength("up") - Input.get_action_strength("down"))*-1
	)
	update_animation_parameters(input_direction)
	velocity = move_speed * input_direction
	move_and_slide()
	
func update_animation_parameters(move_input : Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Idle/blend_position",move_input)
		animation_tree.set("parameters/Walk/blend_position",move_input)
	

var Bullet = preload("res://bullet.tscn")
var speed = 200
func die():
	get_tree().change_scene_to_file("res://TabelaWynikow.tscn")
func shoot():
	var b = Bullet.instantiate()
	b.start(self.position, get_local_mouse_position())
	get_tree().root.add_child(b)
