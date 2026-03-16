extends Node2D #author(s): Ethan Scott


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if OS.get_name() == "Windows" || OS.get_name() == "Linux": #checks if you're running windows or linux
		print("you're running windows or linux")
		var _screenResolution: Vector2i = DisplayServer.screen_get_size(DisplayServer.window_get_current_screen()) #gets resolution of screen and saves it as a vector to a variable.
		DisplayServer.window_set_size(Vector2i(360, 640)) #sets window resolution to 640 x 360, or 1/3 of the original size. This makes the window managable on lower-resolution screens.
		DisplayServer.window_set_position(Vector2i(100, 100)) #sets window position to the top-left of the screen. Without any repositioning, the window is by default clipping off the screen on PC displays with a resolution of 1080p or lower.
		print("window size adjusted")
	print("running version " + global.versionNumber)
	get_tree().change_scene_to_file("res://pages/main_menu.tscn")
