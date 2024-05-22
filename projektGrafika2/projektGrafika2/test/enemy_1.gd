extends CharacterBody2D
@export var nazwa = 'przeciwnik'
var wynik = 0

#1 to player zgodnie z drzewem
func _physics_process(delta):
	var playerposition =  get_parent().get_child(1).position
	# Oblicz wektor od wroga do gracza
	var vector_to_player = playerposition - self.position

# Normalizuj wektor, aby uzyskać kierunek
	var direction_to_player = vector_to_player.normalized()

# Określ prędkość wroga
	var enemy_speed = 100.0  # Dostosuj prędkość według potrzeb

# Ustaw nową pozycję wroga
	#self.position += direction_to_player * enemy_speed * delta
	var collision = move_and_collide(direction_to_player * enemy_speed * delta)
	if collision:
		if collision.get_collider().nazwa == 'hero':
			get_parent().get_node('.').scoretofile()
			collision.get_collider().die()
		
func hit():
	queue_free()
	
