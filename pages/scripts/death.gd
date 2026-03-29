extends Node2D #author(s): Ethan Scott


var timerRuns = 0 #how many times has the 100ms timer timed out?
var avgJoy = averageFinder(global.joyOverTime)
var avgHealth = averageFinder(global.healthOverTime)
var avgIntellect = averageFinder(global.intellectOverTime)
var avgLooks = averageFinder(global.looksOverTime)


func averageFinder(array): #finds the average value of all elements in an array (note: only works if all elements are numerals, because of maths)
	var average = 0
	if array.size() > 0: #if the array is not empty
		for i in array.size(): #runs through every element in the array
			average += array[i] #adds the value of the element at i to the average
		average = str(round(average / array.size())) #divides the average by the size of the array (i.e. turns it into the mean) and rounds the result
	else: #if the array is empty
		average = "nothing in the array :("
	return average


func _on_100ms_timeout() -> void: #every 0.1s
	if timerRuns == 0:
		$stats.text += global.causeOfDeath
	elif timerRuns == 1:
		$stats.text += "\n\nAge at death: " + str(global.age)
	elif timerRuns == 2:
		$stats.text += "\n\nAverage Joy: " + averageFinder(global.joyOverTime)
	elif timerRuns == 3:
		$stats.text += "\nJoy at death: " + str(global.joy)
	elif timerRuns == 4:
		$stats.text += "\n\nAverage Health: " + averageFinder(global.healthOverTime)
	elif timerRuns == 5:
		$stats.text += "\nHealth at death: " + str(global.health)
	elif timerRuns == 6:
		$stats.text += "\n\nAverage Intellect: " + averageFinder(global.intellectOverTime)
	elif timerRuns == 7:
		$stats.text += "\nIntellect at death: " + str(global.intellect)
	elif timerRuns == 8:
		$stats.text += "\n\nAverage Looks: " + averageFinder(global.looksOverTime)
	elif timerRuns == 9:
		$stats.text += "\nLooks at death: " + str(global.looks)
	timerRuns += 1


func _on_2s_timeout() -> void: #first 2s
	get_node("100ms").start() #$100ms doesn't work here for some reason (??)


#when you die
func _ready() -> void:
	if FileAccess.file_exists("user://spycarsinc/bls/lives/" + global.currentLife + ".bls") == true: #if a save file for this life exists
		DirAccess.remove_absolute("user://spycarsinc/bls/lives/" + global.currentLife + ".bls") #deletes the save file for this life
		print("successfully deleted save file for " + global.currentLife)
	global.currentLife = "" #no more currentLife
	global.saveGame()
