extends Node2D #author(s): Ethan Scott


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	if global.evality < 0:
		global.evality = 0
	elif global.evality > 100:
		global.evality = 100
	#stat text setting
	$name.text = str(global.firstName) + " " + str(global.lastName)
	$logs.text = str(global.logs)
	$money.text = "Money: $" + str(global.money)
	$age.text = "Age: " + str(global.age)
	$joy.text = "Joy: " + str(global.joy)
	$health.text = "Health: " + str(global.health)
	$intellect.text = "Intellect: " + str(global.intellect)
	$looks.text = "Looks: " + str(global.looks)
	if global.revent.size() != 0: #if there are random events queued
		get_tree().change_scene_to_file("res://pages/event.tscn")
	global.saveGame() #saves both life and game files (does not need to go before the line above as saveGame() is run when the event.gd script is initialised anyway)


func _on_new_game_egg_mouse_entered() -> void: #when the mouse is hovered over the new game egg button
	$newGameEgg.scale = Vector2(1.1, 1.1) #increases size by 10%

func _on_new_game_egg_mouse_exited() -> void: #when the mouse leaves hovering the new game egg button
	$newGameEgg.scale = Vector2(1, 1) #sets size back to normal

func _on_new_game_egg_pressed() -> void: #on new game egg button clicked
	get_tree().change_scene_to_file("res://pages/new_game_confirmation.tscn")


func _on_age_up_button_pressed() -> void: #on age up button pressed
	get_tree().change_scene_to_file("res://pages/age_up.tscn") #age up
