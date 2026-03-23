extends Node2D #author(s): Ethan Scott


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/settings.tscn")


func _on_save_life_pressed() -> void: #on saving life button pressed
	global.saveGame()
