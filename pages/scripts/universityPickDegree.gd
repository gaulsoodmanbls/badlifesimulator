extends Node2D #author(s): Ethan Scott


func _on_cancel_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/game_menu.tscn")


#degrees
func _on_medicine_pressed() -> void:
	global.degreePicked = "education"
	global.revent[0] = "university-degree-picked"
	get_tree().change_scene_to_file("res://pages/event.tscn")
