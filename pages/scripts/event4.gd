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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame #waits for frame to be processed first to avoid weirdness
	#testing purposes:
	$heading.text = "Soft start"
	$body.text = "It's your fourth birthday, and your uncle Randall just gave the first gift of the night: a bunch of blankets and other bedding."
	$option1.text = "Force a smile and pretend to be thankful, then cry in secret"
	$option2.text = "Kill him"
	$option3.text = "Regift them at his birthday next year while laughing maniachally"
	$option4.text = "Spit in his face, run away screaming, and never speak to him again"
	repositionResize()
