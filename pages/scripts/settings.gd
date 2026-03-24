extends Node2D #author(s): Ethan Scott


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/main_menu.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/credits.tscn")
