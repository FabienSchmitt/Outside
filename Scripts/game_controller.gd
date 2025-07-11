extends Node 

func change_scene(path: String) -> void:
	var packed_scene = load(path)
	get_tree().change_scene_to_packed(packed_scene)

func start_game():
	change_scene("res://scenes/outside.tscn")

func show_menu():
	change_scene("res://scenes/menu.tscn")

func quit():
	get_tree().quit()
