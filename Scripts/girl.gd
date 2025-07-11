extends CharacterBody3D

@export() var pathFollow: PathFollow3D
@export() var position_ref : Marker3D 
@export() var speed : float = 15;
@export() var jumpSpeed : float = 5;

func _physics_process(delta: float) -> void:
	var input_h = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var input_v = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	
	if !is_on_floor() :
		velocity.y += get_gravity().y * delta
		
	if  Input.is_action_just_pressed("jump") : 
		velocity.y += jumpSpeed
		
	var movement = Vector3.RIGHT * input_h + Vector3.FORWARD * input_v
	movement = movement.normalized() * speed
	global_transform = global_transform.looking_at(movement, Vector3.UP)
	
	
	velocity.x = movement.x
	velocity.z = movement.z
	move_and_slide()
	
	
