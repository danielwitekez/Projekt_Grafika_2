extends CharacterBody2D
@export var nazwa = 'pocisk'
var speed = 750

func start(_position, _direction):
	rotation = _direction.angle()
	position = _position
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		collision.get_collider().hit()
		collision.get_collider().get_parent().increment()
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	# Deletes the bullet when it exits the screen.
	queue_free()
