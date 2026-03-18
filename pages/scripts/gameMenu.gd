extends Node2D #author(s): Ethan Scott


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$name.text = str(global.firstName) + " " + str(global.lastName)
	$logs.text = str(global.logs)
	$money.text = "Money: $" + str(global.money)
	$age.text = "Age: " + str(global.age)
	$joy.text = "Joy: " + str(global.joy)
	$health.text = "Health: " + str(global.health)
	$intellect.text = "Intellect: " + str(global.intellect)
	$looks.text = "Looks: " + str(global.looks)


func _on_new_game_egg_mouse_entered() -> void: #when the mouse is hovered over the new game egg button
	$newGameEgg.scale = Vector2(1.1, 1.1) #increases size by 10%

func _on_new_game_egg_mouse_exited() -> void: #when the mouse leaves hovering the new game egg button
	$newGameEgg.scale = Vector2(1, 1) #sets size back to normal

func _on_new_game_egg_pressed() -> void: #on new game egg button clicked
	get_tree().change_scene_to_file("res://pages/new_game_confirmation.tscn")


func _on_age_up_button_pressed() -> void: #on age up button pressed
	get_tree().change_scene_to_file("res://pages/age_up.tscn") #age up
