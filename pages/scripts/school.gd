extends Node2D #author(s): Ethan Scott


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$schoolName.text = global.schoolName


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/game_menu.tscn") #takes you back
