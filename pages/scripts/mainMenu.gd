extends Node2D #author(s): Ethan Scott


# Called when the node enters the scene tree for the first time. (in this case, since this is the index, on startup)
func _ready() -> void:
	$versionNumber.text = "v" + global.versionNumber


func _on_new_game_pressed() -> void: #on new game button pressed
	print("creating new random life...")
	get_tree().change_scene_to_file("res://pages/new_random_game.tscn")


func _on_settings_pressed() -> void: #actually add setting at some point, not just credits
	get_tree().change_scene_to_file("res://pages/credits.tscn")
