class_name TimmyMovement extends CharacterBody3D

@export() var speed := 15
@export() var jumpSpeed := 15
@export() var gravity := -30

@export() var xxx : ArmatureAnimation

@onready var animation_player = $"AnimationPlayer"
@onready var armature = $"ExportRoot"

var running := false 
var lerping := 0.15

func _physics_process(delta: float) -> void:
	var input_raw = Input.get_vector("left", "right", "forward", "backward")
	var input_h = input_raw.x
	var input_v = input_raw.y
	
	if !is_on_floor() :
		velocity.y += gravity * delta
	elif  Input.is_action_just_pressed("jump") : 
		velocity.y += jumpSpeed
		jump()
	
	var movement = Vector3.RIGHT * input_h + Vector3.FORWARD * input_v
	movement = movement.normalized() * speed
	
	if movement.length() > 0.1:
		running = true
		var facing_direction = global_transform.origin + movement.normalized()
		facing_direction.y = global_transform.origin.y
		armature.look_at(facing_direction, Vector3.UP)
	else : 
		running = false
	
	velocity.x = movement.x
	velocity.z = movement.z
	move_and_slide()
	
	# Do animation stuff.

func jump() -> void : 
	animation_state_machine.travel("JumpUp")	
