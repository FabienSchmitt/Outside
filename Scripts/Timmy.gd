extends CharacterBody3D

@export() var speed : float = 15;
@export() var jumpSpeed : float = 5;
@onready var animation_player = $"../Timmy_test/AnimationPlayer"
@onready var armature = $"../Timmy_test/ExportRoot"

var lerping : float = 0.15
var running : bool = false


func _physics_process(delta: float) -> void:
	var input_h = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var input_v = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	
	if !is_on_floor() :
		velocity.y += get_gravity().y * delta
		
	if  Input.is_action_just_pressed("jump") : 
		velocity.y += jumpSpeed
		
	var movement = Vector3.RIGHT * input_h + Vector3.FORWARD * input_v
	movement = movement.normalized() * speed
	
	if movement.length() > 0.1:
		animation_player.play("timmy_test/Runing")
		running = true
		var facing_direction = global_transform.origin + movement.normalized()
		facing_direction.y = global_transform.origin.y
		armature.look_at(facing_direction, Vector3.UP)
		#var target_pos = global_transform.origin + movement.normalized()
		#var current_basis = armature.global_transform.basis
		#var target_basis = Transform3D().looking_at(target_pos - armature.global_transform.origin, Vector3.UP).basis
		#armature.global_transform.basis = current_basis.slerp(target_basis, delta * 10.0)
	
	elif running:
		running = false
		animation_player.play("timmy_test/Stop")
		
	else : 
		running = false
		animation_player.play("timmy_test/Idle")
	
	velocity.x = movement.x
	velocity.z = movement.z
	move_and_slide()
	
	
