extends Node2D #author(s): Ethan Scott
#handles events with 4 options


@warning_ignore("integer_division") #this is really annoying, inconsequential, and I don't know how to fix it so
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


func eventer(): #does the events
	#toddlerhood
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
	#childhood
	#teenagehood
	#adulthood
	#elderlyhood


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame #waits for frame to be processed first to avoid weirdness
	eventer()
	repositionResize()
