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
	if randi_range(1, 2) == 1: #if you're getting a random event (1 in 2 chance)
		if global.age >= 2: #you must be 2 or over to get random age up events
			print("choosing random age up event...")
			if global.age <= 4: #if age is 4 or above
				global.revent.append("toddler-" + str(randi_range(0, 0))) #second number in the randi_range is the last ID for the event that exists
			elif global.age >= 5 && global.age <= 12: #if age is between 5 and 12
				global.revent.append("child-" + str(randi_range(0, 0)))
			elif global.age >= 13 && global.age <= 19: #if age is between 13 and 19
				global.revent.append("teenager-" + str(randi_range(0, 0)))
			elif global.age >= 20 && global.age <= 65: #if age is between 20 and 65
				global.revent.append("adult-" + str(randi_range(0, 0)))
			elif global.age >= 66: #if age is over 66
				global.revent.append("elder-" + str(randi_range(0, 0)))
			print(global.revent[global.revent.size() - 1]) #prints the last event ID (the one that was just appended now) in the revent array
	if global.revent.size() > 0: #if there are random events slated to appear
		get_tree().change_scene_to_file("res://pages/event.tscn") #goes to the event page
	else: #if there aren't random events slated to appear
		get_tree().change_scene_to_file("res://pages/game_menu.tscn") #goes back to game menu
