extends Control

func _on_new_game_button_pressed() -> void:
	Global.game_controller.change_3d_scene("Outside", true, false)


func _on_continue_button_pressed() -> void:
	Global.game_controller.change_3d_scene("Outside", true, false)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
