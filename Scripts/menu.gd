extends Control

func _on_new_game_button_pressed() -> void:
	GameController.start_game()


func _on_continue_button_pressed() -> void:
	pass
	#GameController.change_3d_scene("Outside", true, false)

func _on_quit_button_pressed() -> void:
	GameController.quit()
