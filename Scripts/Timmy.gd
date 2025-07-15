class_name TimmyMovement extends CharacterBody3D


@export() var speed := 8.0
@export() var acceleration := 200.0
@export() var jumpSpeed := 10.0
@export() var gravity := -30.0
@export() var rotation_speed := 12.0

@onready var animation_tree = $AnimationTree
@onready var armature = $ExportRoot
@onready var timmy_animation := TimmyAnimation.new()

var lerping := 0.15
var _last_movement_direction := Vector3.ZERO

func _ready() -> void:
	timmy_animation.timmy_movement = self
	timmy_animation.animation_tree = animation_tree

func _physics_process(delta: float) -> void:
	
	# floor movement
	var input_raw = Input.get_vector("left", "right", "forward", "backward")
	var input_h = input_raw.x
	var input_v = input_raw.y
	
	var up_velocity = velocity.y
	var movement_direction = (Vector3.RIGHT * input_h + Vector3.FORWARD * input_v).normalized()
	var movement = movement_direction * speed
	velocity = velocity.move_toward(movement, acceleration * delta)
	velocity.y = up_velocity
	
	if movement.length() > 0.1:
		_last_movement_direction = movement_direction
	var target_angle := Vector3.FORWARD.signed_angle_to(_last_movement_direction, Vector3.UP)
	armature.global_rotation.y = lerp_angle(armature.rotation.y, target_angle, rotation_speed * delta)
	
	if !is_on_floor() :
		velocity.y += gravity * delta
	elif  Input.is_action_just_pressed("jump") : 
		velocity.y += jumpSpeed
		
	move_and_slide()
	# Do animation stuff.
	timmy_animation.animate(delta)
	
