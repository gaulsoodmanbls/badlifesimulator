extends Node2D #author(s): Ethan Scott


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame #waits until the frame is fully loaded. Without this, the screen flashes gray while on this scene
	global.age += 1 #the actual aging up
	print("age is now " + str(global.age))
	global.joy += randi_range(-8, 8) #randomly tweaks joy levels. can add anywhere from -8 (subtracts 8) to 8.
	global.health += randi_range(-8, 8)
	global.intellect += randi_range(-8, 8)
	global.looks += randi_range(-8, 8)
	#if stats are out of bounds (above or below their max/min value)
	if global.joy < 0:
		global.joy = 0
	elif global.joy > 100:
		global.joy = 100
	if global.health < 0:
		global.health = 0
	elif global.health > 100:
		global.health = 100
	if global.intellect < 0:
		global.intellect = 0
	elif global.intellect > 100:
		global.intellect = 100
	if global.looks < 0:
		global.looks = 0
	elif global.looks > 100:
		global.looks = 100
	get_tree().change_scene_to_file("res://pages/game_menu.tscn") #goes back to game menu
