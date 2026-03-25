extends Node2D #author(s): Ethan Scott
#THIS IS THE SCRIPT FOR THE LIFE SAVE FILES PAGE - NOT FOR LIFE SAVING AND LOADING IN GENERAL.


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.getSaveLifeFileName() #we don't actually need the life save file name, we just need to make sure the user://spycarsinc/bls/lives/ directory actually exists, and this function also happens to do that
	var buttonPreload = preload("res://objects/button_default.tscn")
	var path = "user://spycarsinc/bls/lives/"
	var dir = DirAccess.get_files_at(path)
	print(dir.size()) #gets the number of files in the path provided (i.e. how many life save files exist)
	print(dir) #prints every file in the directory
	$howManySavedLives.text = "You have " + str(DirAccess.get_files_at(path).size()) + " saved lives."
	var positionDown = 0
	#adds the button for each save file
	for i in dir.size(): #runs through every file in the directory
		var button = buttonPreload.instantiate() #makes the new button not a tscn file and an actual node
		$scrollContainer/centerContainer/vBoxContainer.add_child(button) #acutally creates the new node as a child of scrollContainer/centerContainer/vBoxContainer
		button.name = "life" + str(i) #renames the new node
		button.text = dir[i].get_basename() #sets the text on the new button to the extension-less file name of the "i"th save file
		button.size.x = 0 #sets the button to the minimum width it can be
		button.position = Vector2(1080 / 2 - button.size.x / 2, positionDown) #sets its position to be centred horizontally and positionDown pixels lower on the y axis than the top of the scrollContainer
		button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		button.clip_text = true
		#gets how much x size the text takes up on the button
		var text_width = button.get_theme_font("font").get_string_size(button.text, HORIZONTAL_ALIGNMENT_LEFT, -1, button.get_theme_font_size("font_size")).x #gets the total width of the text
		button.custom_minimum_size.x = min(text_width, 1000) #sets the button's cap (by setting its minimum size to either the size of the text or 1000, whichever's lower). This leads to buttons that are too big being abruptly cut off, but it doesn't really matter all that much.
		print(button.global_position.x)
		print(button.size.x)
	$scrollContainer/centerContainer/vBoxContainer.size.y += 50 #increases the size of the container so the scrolling doesn't stop as soon as you hit the bottom of the last button
	$scrollContainer/centerContainer.custom_minimum_size.x = $scrollContainer.size.x #sets the centerContainer's minimum x size to the scrollContainer's x size


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/settings.tscn")
