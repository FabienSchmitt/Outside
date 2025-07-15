class_name TimmyAnimation extends Node

var animation_tree : AnimationTree
var timmy_movement : TimmyMovement
var blend_speed := 5
var current_idle_blend := 0.0
var current_jump_blend := 0.0
var current_air_blend := 0.0

func animate(delta: float) -> void :
	blend_air_or_land(delta)
	blend_idle_walk(delta)
	blend_jump_or_fall(delta)
	
func blend_idle_walk(delta: float) -> void :
	var target = clamp(timmy_movement.velocity.length() / timmy_movement.speed, 0.0, 1.0)
	current_idle_blend = lerp(current_idle_blend, target, blend_speed * delta)
	animation_tree.set("parameters/BlendRunOrIdle/blend_amount", current_idle_blend)

func blend_air_or_land(delta: float) -> void: 
	var target = 0.0 if timmy_movement.is_on_floor() else 1.0
	current_air_blend = lerp(current_air_blend, target, blend_speed * delta)
	animation_tree.set("parameters/BlendAirOrLand/blend_amount", current_air_blend)

func blend_jump_or_fall(delta : float) -> void : 
	var target = 0.0 if timmy_movement.velocity.y >= 0.0 else 1.0
	#current_jump_blend = lerp(current_jump_blend, target, blend_speed * delta)
	animation_tree.set("parameters/BlendJumpOrFall/blend_amount", current_jump_blend)
