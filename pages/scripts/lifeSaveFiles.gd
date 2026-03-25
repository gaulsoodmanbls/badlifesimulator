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
		$scrollContainer/control.add_child(button) #acutally creates the new node as a child of scrollContainer/control
		button.name = "life" + str(i) #renames the new node
		button.text = dir[i].get_basename() #sets the text on the new button to the extension-less file name of the "i"th save file
		button.size.x = 0 #sets the button to the minimum width it can be
		button.position = Vector2(1080 / 2 - button.size.x / 2 + 50, positionDown) #sets its position to be centred horizontally (+50 because the scrollContainer and control nodes are 100 pixels wider than the 2D scene) and positionDown pixels lower on the y axis than the top of the scrollContainer
		$scrollContainer.size.y += 50 + button.size.y #makes the scrollContainer taller so it can fit more buttons (we don't need to change the size of the control node that is a child of it
		positionDown += 50 + button.size.y #adds 100 + size of this button to positionDown so the next button will be lower down


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://pages/settings.tscn")
