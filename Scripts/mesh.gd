extends MeshInstance3D

func _process(delta: float) -> void:
	var input_h = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	var input_v = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	
	transform.origin.x += input_h * delta * 5
	transform.origin.z += input_v * delta * 5
	
	rotate_object_local(Vector3.FORWARD, input_h * delta * 5)
	rotate_object_local(Vector3.RIGHT, input_v * delta * 5)
