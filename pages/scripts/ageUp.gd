extends Node2D #author(s): Ethan Scott


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame #waits until the frame is fully loaded. Without this, the screen flashes gray while on this scene
	global.age += 1 #the actual aging up
	print("age is now " + str(global.age))
	global.joy += randi_range(-8, 8) #randomly tweaks joy levels. can add anywhere from -8 (subtracts 8) to 8 (adds 8).
	global.health += randi_range(-8, 8)
	global.intellect += randi_range(-8, 8)
	global.looks += randi_range(-8, 8)
	global.statClamper() #clamps stats if they're below 0 or above 100
	#over timers
	global.joyOverTime.append(global.joy)
	global.healthOverTime.append(global.health)
	global.intellectOverTime.append(global.intellect)
	global.looksOverTime.append(global.looks)
	for i in global.familyAges.size(): #runs through every family member and ages them up
		global.familyAges[i] += 1
	for i in global.miscAges.size(): #runs through every miscellanious person you know and ages them up
		global.miscAges[i] += 1
	#schooling
	if global.schoolLevel != -1 && global.schoolLevel != 0: #if you have not not entered school yet and have not graduated yet (i.e. you are in school)
		global.workExperience.append("school-" + str(global.schoolLevel)) #adds schooling as work experience - this is used and removed only when you graduated
		global.schoolPerformance = global.intellect + randi_range(-6, 6) #you are doing as well in school as you are intelligent (with a little bit of random variation)
	#primary school
	if (global.age == 4 && global.schoolLevel == -1 && randi_range(1,2) == 1) || (global.age == 5 && global.schoolLevel == -1): #if you're 4 years old and aren't in school yet, there's a 1 in 2 chance of you getting put in primary school early, and if you're 5 and not in school yet, you automatically get put in no matter what
		global.schoolLevel = 1 #you get put in primary school
		global.schoolName = global.lastNames[randi_range(0, global.lastNames.size() - 1)] #makes school's name a random last name. Since some rare last names are just straight up blank... I'm not including those.
		match randi_range(1,3): #gives the high school a random appendix to make a full name, i.e. "McKenzie College"
			1:
				global.schoolName += " Academy"
			2:
				global.schoolName += " College"
			3:
				global.schoolName += " Primary School"
		global.revent.append("enrolled-in-primary-school")
		global.schoolPerformance = global.intellect + randi_range(-6, 6) #you are doing as well in school as you are intelligent, with a little bit of random variation (sets your performance for the first time so it's not immediately blank)
		print("you are now attending " + global.schoolName + ", a level " + str(global.schoolLevel) + " school")
	#high school
	if global.workExperience.count("school-1") == 7: #if you've already been attending primary school for 7 years
		global.schoolLevel = 2 #moves you to high school
		global.schoolName = global.lastNames[randi_range(0, global.lastNames.size() - 1)] #gives the high school a random name
		match randi_range(1,3): #gives the high school name a random appendix
			1:
				global.schoolName += " Academy"
			2:
				global.schoolName += " College"
			3:
				global.schoolName += " High School"
		global.revent.append("enrolled-in-high-school")
		global.degrees.append("primary-school") #congratulations! you now have... a primary school degree...
		#duplicates the workExperience array but without primary school experience since we will never need it for anything ever again, then replaces global.workExperience with the smaller duplicate
		var workExpDupe = []
		for i in global.workExperience.size():
			if global.workExperience[i] != "school-1":
				workExpDupe.append(global.workExperience[i])
		global.workExperience = workExpDupe
		print("you are now attending " + global.schoolName + ", a level " + str(global.schoolLevel) + " school")
	#high school graduation
	elif global.workExperience.count("school-2") == 6: #if you've been going to high school for 6 years
		global.schoolLevel = 0 #graduates you
		global.revent.append("graduated-high-school")
		global.degrees.append("high-school")
		#duplicates the workExperience array but without high school experience since we will never need it for anything ever again, then replaces global.workExperience with the smaller duplicate
		var workExpDupe = []
		for i in global.workExperience.size():
			if global.workExperience[i] != "school-2":
				workExpDupe.append(global.workExperience[i])
		global.workExperience = workExpDupe
		print("graduated high school")
	#random events
	if randi_range(1, 2) == 1 && global.RAUE == true: #if you're getting a random event (1 in 2 chance) and random events are enabled
		global.XPQueued += 15 #gives you XP for experiencing something
		if global.age >= 2: #you must be 2 or over to get random age up events
			print("choosing random age up event...")
			if global.age <= 4: #if age is 4 or below
				global.revent.append("toddler-" + str(randi_range(0, 0))) #second number in the randi_range is the last ID for the event that exists
			elif global.age >= 5 && global.age <= 12: #if age is between 5 and 12
				global.revent.append("child-" + str(randi_range(0, 0)))
			elif global.age >= 13 && global.age <= 19: #if age is between 13 and 19
				global.revent.append("teenager-" + str(randi_range(0, 0)))
			elif global.age >= 20 && global.age <= 65: #if age is between 20 and 65
				global.revent.append("adult-" + str(randi_range(0, 0)))
			elif global.age >= 66: #if age is over 66
				global.revent.append("elder-" + str(randi_range(0, 0)))
			print("appended event " + str(global.revent[global.revent.size() - 1])) #prints the last event ID (the one that was just appended) in the revent array
	if randi_range(1, 20) == 1 && global.RAUE == true: #if you're randomly getting a new friend :) and RAUE is enabled
		global.XPQueued += 15 #gives you XP for experiencing something
		if global.age <= 4: #if age is 4 or below
			global.revent.append("toddler-friend")
		elif global.age >= 5 && global.age <= 12: #if age is between 5 and 12
			global.revent.append("child-friend")
		elif global.age >= 13 && global.age <= 19: #if age is between 13 and 19
			global.revent.append("teenager-friend")
		elif global.age >= 20 && global.age <= 65: #if age is between 20 and 65
			global.revent.append("adult-friend")
		elif global.age >= 66: #if age is over 66
			global.revent.append("elder-friend")
		print("appended event " + str(global.revent[global.revent.size() - 1])) #prints the last event ID (the one that was just appended) in the revent array
	#death chance
	if global.age >= 50: #if you're old enough to randomly die (not super realistic, but as it turns out, it is NOT fun dying for no reason at age 2)
		print("1 in " + str(max(1, 4 + global.health * 3 - global.age * 2)) + " chance of death")
		if randi_range(1, max(1, 4 + global.health * 3 - global.age * 2)) == 1:
			global.causeOfDeath = "You died of natural causes"
			get_tree().change_scene_to_file("res://pages/death.tscn") #kills you
			return #ceases function of this function so nothing below this runs and it takes you to the new page
	#runs events if they're queued
	if global.revent.size() > 0: #if there are random events slated to appear
		get_tree().change_scene_to_file("res://pages/event.tscn") #goes to the event page
	else: #if there aren't random events slated to appear
		get_tree().change_scene_to_file("res://pages/game_menu.tscn") #goes back to game menu
