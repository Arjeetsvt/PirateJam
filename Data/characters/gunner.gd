extends CharacterBody2D



var stand = 0
var health: int = 100
var speed: float = 150
var damage: int = 10
var input_enabled: bool = false

func _physics_process(delta: float):
	if input_enabled:
		handle_player_control()
	else:
		patrol_behavior()

func handle_player_control():
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = direction.normalized() * speed
	move_and_slide()

func patrol_behavior():
	# Example AI behavior: simple back-and-forth movement
	velocity = Vector2.LEFT * stand
	move_and_slide()

















#var speed = 100  
#
#func _physics_process(delta):
	#var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#velocity = direction * speed
	#move_and_slide()
