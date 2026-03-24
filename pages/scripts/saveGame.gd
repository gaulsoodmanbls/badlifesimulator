extends Node2D #author(s): Ethan Scott


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/developer_mode.tscn")


func _on_save_life_pressed() -> void: #on saving life button pressed
	global.saveGame()
	$confirmation.text = "Successfully saved to " + OS.get_user_data_dir()


func _on_open_save_location_pressed() -> void:
	OS.shell_show_in_file_manager(ProjectSettings.globalize_path("user://spycarsinc/bls/lives/")) #opens save file folder in file manager
