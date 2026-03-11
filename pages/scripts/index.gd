extends Node2D #author(s): Ethan Scott


# Called when the node enters the scene tree for the first time. (in this case, since this is the index, on startup)
func _ready() -> void:
	match OS.get_name(): #checks which OS you're running
		"Windows": #if you're on windows
			print("you're running windows")
			var screenResolution: Vector2i = DisplayServer.screen_get_size(DisplayServer.window_get_current_screen()) #gets resolution of screen and saves it as a vector to a variable.
			DisplayServer.window_set_size(Vector2i(360, 640)) #sets window resolution to 640 x 360, or 1/3 of the original size. This makes the window managable on lower-resolution screens.
			DisplayServer.window_set_position(Vector2i(screenResolution/4)) #sets window position to the centre (basically the centre) of the screen. I could do /2 or /3 but then the window clips off the bottom of the screen on 1080p displays.
			print("window size adjusted")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
