extends Node2D #author(s): Ethan Scott
#handles events with 4 options


func repositionResize(): #repositions and resizes the nodes on-screen
	$heading.size.y = 0
	$body.size.y = 0
	#enabling word wrap so the buttons and text don't run off the screen if they're too long
	if $heading.get_minimum_size().x >= 1000:
		$heading.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		$heading.size.x = 900
	if $body.get_minimum_size().x >= 1000:
		$body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		$body.size.x = 900
	if $option1.get_minimum_size().x >= 1000:
		$option1.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		$option1.size.x = 900
	if $option2.get_minimum_size().x >= 1000:
		$option2.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		$option2.size.x = 900
	if $option3.get_minimum_size().x >= 1000:
		$option3.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		$option3.size.x = 900
	if $option4.get_minimum_size().x >= 1000:
		$option4.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		$option4.size.x = 900
	await get_tree().process_frame #wait one frame so the word wrap stuff is able to apply
	$body.position.y = $heading.position.y + $heading.get_minimum_size().y + 50 #sets position of body text to be 50 px lower than the heading text
	$option1.position.y = $body.position.y + $body.get_minimum_size().y + 100 #sets position of the option 1 button to be 100 px lower than the body text
	$option2.position.y = $option1.position.y + $option1.get_minimum_size().y + 50
	$option3.position.y = $option2.position.y + $option2.get_minimum_size().y + 50
	$option4.position.y = $option3.position.y + $option3.get_minimum_size().y + 50
	$heading.position.x = 1080 / 2 - ($heading.size.x / 2) #centres heading text horizontally on the screen
	$body.position.x = 1080 / 2 - ($body.size.x / 2)
	$option1.position.x = 1080 / 2 - ($option1.size.x / 2) #centres button horizontally on the screen
	$option2.position.x = 1080 / 2 - ($option2.size.x / 2)
	$option3.position.x = 1080 / 2 - ($option3.size.x / 2)
	$option4.position.x = 1080 / 2 - ($option4.size.x / 2)


func outcome(reventID):
	global.revent[0] = reventID
	get_tree().reload_current_scene()
	return


func goHome():
	global.revent.pop_front()
	get_tree().change_scene_to_file("res://pages/game_menu.tscn")
	return


func toddlerhood(): #toddlerhood base events - prefix is "toddler-"
	if global.revent[0] == "toddler-0": #if first element in the revent array is the following one
		$heading.text = "Parkscream"
		$body.text = "While out with your family at the park, you notice that there is an ice cream shop situated across the road."
		if global.familyTypes.has("Mother"): #if you have a mother
			$option1.text = "Ask your mother for one"
		elif global.familyTypes.has("Father"): #if you have no mother, only (a) father(s)
			$option1.text = "Ask your father for one"
		$option2.text = "Cry until you get one"
		$option3.text = "Bite your tongue and don't say anything"
		$option4.modulate.a = 0 #there is no fourth option; this makes the button transparent (opacity of 0) so you can't see it. There is no way to interact with it either, provided its click functionality isn't implemented within the "if" statement for this event.
		$credit.text = "mconcerning"


func childhood(): #childhood base events - prefix is "child-"
	if global.revent[0] == "child-0":
		var relativeOfChoice = global.familyRelationships.find(global.familyRelationships.min()) #which relative will be featured in this event? gets the index of the family member you have the lowest relationship with.
		$heading.text = "Soft start"
		$body.text = "It's your birthday party, and it's time to open presents! But the first present you open from your " + str(global.familyTypes[relativeOfChoice]).to_lower() + ", " + str(global.familyFirstNames[relativeOfChoice]) + ", was just a bunch of pillows and other bedding. You kind of wish they had just gotten you something else instead."
		$option1.text = "Thank them anyways"
		$option2.text = "Thank them enthusiastically"
		$option3.text = "Pitch a fit and cry"
		$option4.modulate.a = 0
		$credit.text = "Goblin + mconcerning"


func teenagehood(): #teenage base events - prefix is "teenager-"
	pass


func adulthood(): #adult base events - prefix is "adult-"
	pass


func elderhood(): #elderly base events - prefix is "elder-"
	pass


func option1events(): #option 1 has been picked
	if global.revent[0] == "toddler-0-o1":
		$heading.text = "Nooo"
		if global.familyTypes.has("Mother"): #if you have a mother
			$body.text = "She says no. You go home depressed and don't leave your room for 11 days.\n- 10 Joy" #mother-specific body text
		elif global.familyTypes.has("Father"): #if you have a father
			$body.text = "He says no. You go home depressed and don't keave your room for 11 days.\n- 10 Joy" #father-specific body text
		$option1.text = "Okay"
		$option2.modulate.a = 0
		$option3.modulate.a = 0
		$option4.modulate.a = 0
		global.joy -= 10 #deducts 10 joy
	elif global.revent[0] == "child-0-o1":
		var relativeOfChoice = global.familyRelationships.find(global.familyRelationships.min()) #gets the index of the gifter
		$heading.text = "Wow... It's just... Wow."
		if global.evality < 30: #if evality is under 30, you feel bad about lying
			$body.text = "They appreciate your kind words, but you feel kind of bad about lying.\n+ 5 relationship with your " + str(global.familyTypes[relativeOfChoice]) + " " + str(global.familyFirstNames[relativeOfChoice]) + ", - 5 Joy"
			global.joy -= 5
		else: #if evality is 30 or over, you don't feel bad
			$body.text = "They appreciate your kind words.\n+ 5 relationship with your " + str(global.familyTypes[relativeOfChoice]) + " " + str(global.familyFirstNames[relativeOfChoice])
		$option1.text = "Okay"
		$option2.modulate.a = 0
		$option3.modulate.a = 0
		$option4.modulate.a = 0
		global.familyRelationships[relativeOfChoice] += 5 #adds 5 to the relationship you have with the gifter
		global.evality += 3 #since you did something semi-bad, you become slightly desensitised to doing bad things


func option2events(): #option 2 has been picked
	if global.revent[0] == "toddler-0-o2":
		$heading.text = "You screamed for ice cream"
		if global.familyTypes.has("Mother"):
			$body.text = "You cry, and eventually your mother gives in and buys you one.\nJoy + 5, relationship with mother -5"
			global.familyRelationships[global.familyTypes.find("Mother")] -= 5
		elif global.familyTypes.has("Father"):
			$body.text = "You cry, and eventually your father gives in and buys you one.\nJoy + 5, relationship with father -5"
			global.familyRelationships[global.familyTypes.find("Father")] -= 5
		$option1.text = "Okay"
		$option2.modulate.a = 0
		$option3.modulate.a = 0
		$option4.modulate.a = 0
		global.joy += 5
		global.evality += 4
	elif global.revent[0] == "child-0-o2":
		var relativeOfChoice = global.familyRelationships.find(global.familyRelationships.min()) #gets the index of the gifter
		$heading.text = "Wow! It's just... Wow!"
		if global.evality < 40: #if evality is under 40, you feel bad about lying
			$body.text = "They appreciate your kind words, so much so that they surprise you with another $50, but you feel really bad about lying.\n+ 8 relationship with your " + str(global.familyTypes[relativeOfChoice]) + " " + str(global.familyFirstNames[relativeOfChoice]) + ", - 10 Joy, + $50"
			global.joy -= 10
		else: #if evality is 40 or above, you don't feel bad
			$body.text = "They appreciate your kind words, so much so that they surprise you with another $50.\n+ 8 relationship with your " + str(global.familyTypes[relativeOfChoice]) + " " + str(global.familyFirstNames[relativeOfChoice]) + ", + $50"
		$option1.text = "Okay"
		$option2.modulate.a = 0
		$option3.modulate.a = 0
		$option4.modulate.a = 0
		global.familyRelationships[relativeOfChoice] += 8
		global.money += 50
		global.evality += 4 #since you did something bad, you become slightly desensitised to doing bad things


func option3events(): #option 3 has been picked
	if global.revent[0] == "toddler-0-o3":
		$heading.text = "If you insist"
		if global.familyTypes.has("Mother"):
			$body.text = "Your mother points to the shop and asks you if you want to get one. You go on to have a great day out together.\nJoy + 10, relationship with mother + 10"
			global.familyRelationships[global.familyTypes.find("Mother")] += 10
		elif global.familyTypes.has("Father"):
			$body.text = "Your father points to the shop and asks you if you want to get one. You go on to have a great day out together.\nJoy + 10, relationship with father + 10"
			global.familyRelationships[global.familyTypes.find("Father")] += 10
		$option1.text = "Okay"
		$option2.modulate.a = 0
		$option3.modulate.a = 0
		$option4.modulate.a = 0
		global.joy += 10
	elif global.revent[0] == "child-0-o3":
		var relativeOfChoice = global.familyRelationships.find(global.familyRelationships.min()) #gets the index of the gifter
		$heading.text = "Wow, this sucks"
		var parents = [] #indexes of all parents; size determines whether "parent" should be plural or not in the body text
		for i in global.familyTypes.size(): #runs through every family member to check for parents
			if global.familyTypes[i] == "Mother" || global.familyTypes[i] == "Father": #if family member at the index we're checking is a parent
				parents.append(i)
		if parents.size() > 1: #if you have more than one parent
			$body.text = "Your parents scold you for being unappreciative.\n- 8 relationship with gifter, -8 relationship with parents, - 12 Joy"
		else: #if you only have one parent
			$body.text = "Your parent scolds you for being unappreciative.\n- 8 relationship with gifter, -8 relationship with parents, - 12 Joy"
		$option1.text = "Okay"
		$option2.modulate.a = 0
		$option3.modulate.a = 0
		$option4.modulate.a = 0
		global.familyRelationships[relativeOfChoice] -= 8 #deduct 8 relationship with gifter
		for i in parents.size(): #runs through every parent
				global.familyRelationships[parents[i]] -= 8 #deducts 8 relationship from the parent at the index of parents[i] (parents stores indexes, so the parents at position i in the parents array could have a different index to themself in the other family arrays.
		global.joy -= 12


func option4events(): #option 3 has been picked
	pass


func _on_option_1_pressed() -> void: #on option 1 selected
	if global.revent[0] == "toddler-0":
		global.revent[0] = "toddler-0-o1" #replaces the first revent (toddler 0) to toddler-0 option 1
		get_tree().reload_current_scene() #reloads page to update so the new revent displays
		return
	#confirmation - option 1 will be the only button available when the event's purpose is only to display information. Generally, the button will say "Okay".
	elif global.revent[0] == "toddler-0-o1" || global.revent[0] == "toddler-0-o2" || global.revent[0] == "toddler-0-o3":
		global.revent.pop_front() #removes element at index 0 from the revent array
		get_tree().change_scene_to_file("res://pages/game_menu.tscn")
		return
	elif global.revent[0] == "child-0":
		outcome("child-0-o1")
	elif global.revent[0] == "child-0-o1" || global.revent[0] == "child-0-o2" || global.revent[0] == "child-0-o3":
		goHome()


func _on_option_2_pressed() -> void: #on option 2 selected
	if global.revent[0] == "toddler-0":
		global.revent[0] = "toddler-0-o2" #replaces the first revent (toddler 0) to toddler-0 option 2
		get_tree().reload_current_scene()
		return
	elif global.revent[0] == "child-0":
		global.revent[0] = "child-0-o2"
		get_tree().reload_current_scene()
		return


func _on_option_3_pressed() -> void: #on option 3 selected
	if global.revent[0] == "toddler-0":
		global.revent[0] = "toddler-0-o3" #replaces the first revent (toddler 0) to toddler-0 option 2
		get_tree().reload_current_scene()
		return
	elif global.revent[0] == "child-0":
		global.revent[0] = "child-0-o3"
		get_tree().reload_current_scene()
		return


func _on_option_4_pressed() -> void: #on option 4 selected
	pass # Replace with function body.


func eventer(): #does the base events (before options are picked)
	toddlerhood()
	childhood()
	teenagehood()
	adulthood()
	elderhood()
	option1events()
	option2events()
	option3events()
	option4events()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global.revent.size() == 0: #if there are no events queued
		get_tree().change_scene_to_file("res://pages/game_menu.tscn")
		return
	print("showing event " + str(global.revent[0])) #prints the first event ID (the one that is about to be shown) in the revent array
	await get_tree().process_frame #waits for frame to be processed first to avoid weirdness
	eventer()
	repositionResize()
