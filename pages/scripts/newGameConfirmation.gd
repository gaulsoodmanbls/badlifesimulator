extends Node2D #author(s): Ethan Scott


func _on_cancel_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/game_menu.tscn") #cancel; go back to game menu


func _on_yes_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/new_random_game.tscn") #new random game


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/main_menu.tscn") #back to main menu


func _on_developer_mode_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/developer_mode_confirmation.tscn") #goes to the developer mode confirmation page

func _on_save_game_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/save_game.tscn") #goes to the save game page
