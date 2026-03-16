extends Node2D #author(s): Ethan Scott


func _on_cancel_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/game_menu.tscn") #cancel; go back to game menu


func _on_yes_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/new_random_game.tscn") #new random game
