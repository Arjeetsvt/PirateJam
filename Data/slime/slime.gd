extends CharacterBody2D


var movement_speed: float = 200
var current_host: CharacterBody2D = null

func _physics_process(delta: float):
	if not current_host:
		handle_movement()
	else:
		# Sync host position with the slime's movement
		current_host.position = position

func handle_movement():
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = direction.normalized() * movement_speed
	move_and_slide()

func _on_leap_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		possess_enemy(body)
		print("in")

#func _on_area_body_entered(body):
	#if body.is_in_group("enemies"):
		#possess_enemy(body)

func possess_enemy(enemy: CharacterBody2D):
	if current_host:
		release_current_host()
	current_host = enemy
	current_host.set_process(false)  # Disable AI
	current_host.input_enabled = true  # Enable player control
	current_host.position = position  # Sync position
	$slime.visible = false  # Hide slime during possession
	current_host.get_node("res://Data/assets/slime/slime.png").modulate = Color(0.7, 0.7, 1)  # Visual cue

func release_current_host():
	if current_host:
		current_host.input_enabled = false
		current_host.set_process(true)  # Reactivate AI
		current_host.get_node("res://Data/assets/slime/slime.png").modulate = Color(1, 1, 1)  # Reset visuals
		current_host = null
		$slime.visible = true  # Show slime again






#
#var speed = 100  
#
#func _physics_process(delta):
	#var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#velocity = direction * speed
	#move_and_slide()
