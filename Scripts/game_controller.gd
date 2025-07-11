class_name GameController extends Node 

@export var world_3d : Node3D
@export var gui: Control

var current_3d_scene : Node3D
var current_gui_scene : Control

func _ready() -> void:
	Global.game_controller = self
	current_gui_scene = $GUI/SplashScreen

func change_gui_scene(new_scene: String, delete: bool, keep_running: bool = false) -> void : 
	if current_gui_scene != null : 
		if delete : 
			current_gui_scene.queue_free()
		elif keep_running :
			current_gui_scene.visible = false
		else:
			gui.remove_child(current_gui_scene)
			
	var new = load(new_scene).instanciate()
	gui.add_child(new)
	current_gui_scene = new
	
func change_3d_scene(new_scene: String, delete: bool, keep_running: bool = false) -> void : 
	if current_3d_scene != null : 
		if delete : 
			current_3d_scene.queue_free()
		elif keep_running :
			current_3d_scene.visible = false
		else:
			gui.remove_child(current_gui_scene)
			
	var new = load(new_scene).instanciate()
	world_3d.add_child(new)
	current_3d_scene = new
