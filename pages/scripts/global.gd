extends Node #author(s): Ethan Scott

#this is this game's global script. It is accessible from any script at any point. If you need to access or change a variable from here, for instance, firstName, in a different script, type "global." before the variable name: "global.firstName".


#engine
var versionNumber = ProjectSettings.get_setting("application/config/version") #change this in settings when working on an update to the next version number :) go to project -> project settings -> application -> config
var revent = [] #event IDs (can store multiple). begins with an age identifier (toddler, child, teenager, adult, elder, or "na" for not applicable) and ends with a unique number.


#personal
var firstName = "" #both this and last name should begin with a capital
var lastName = ""
var age = 0 #in years
var sex = "" #will become either M for Male or F for Female during new life generation. For simplicity's sake I am not yet adding intersexuality, but I may later.
var joy = 0
var health = 0
var intellect = 0
var looks = 0
var logs = ""
var money = 0
#hidden stats - not shown to the player
var evality = 0 #on a scale from 0 - 100, how evil are you? i.e. how much joy do you derive from doing bad things, and what bad things are you capable of? higher is more.
var sexuality = "" #stored definitively, not relative to the sex of the player, i.e. if you're attracted to men, this value would be "M", if you're attracted to women, it would be "F", if you were attracted to both, it would be "Bi", and so on.


#family
var familyFirstNames = []
var familyLastNames = []
var familyTypes = []
var familyAges = []
var familySexes = []
var familyRelationships = []

#other (miscellaneous) relationships
var miscFirstNames = []
var miscLastNames = []
var miscTypes = []
var miscAges = []
var miscSexes = []
var miscRelationships = []


#miscellaneous stuff that must be stored over multiple pages
#things that must be kept track of when inventing new people for events
var eventPersonFirstName = ""
var eventPersonLastName = ""
var eventPersonAge = ""
var eventPersonSex = ""


#testing variables - used in developer mode
var RAUE = true #RAUE is an acronym for Random Age Up Events. When true, events will randomly appear when aging up. When false, they will not.


#inter-life variables (non-life specific, saved into the game save file, persists across all lives)
var currentLife = ""


#savegame stuff
func lifeSerialiser(): #serialises every life-specific variable we need to save into a dictionary and then returns it
	var collinsDictionary = {
		#engine
		"revent" : revent,
		#personal
		"firstName" : firstName,
		"lastName" : lastName,
		"age" : age,
		"sex" : sex,
		"joy" : joy,
		"health" : health,
		"intellect" : intellect,
		"looks" : looks,
		"logs" : logs,
		"money" : money,
		"evality" : evality,
		"sexuality" : sexuality,
		#family relationships
		"familyFirstNames" : familyFirstNames,
		"familyLastNames" : familyLastNames,
		"familyTypes" : familyTypes,
		"familyAges" : familyAges,
		"familySexes" : familySexes,
		"familyRelationships" : familyRelationships,
		#other relationships
		"miscFirstNames" : miscFirstNames,
		"miscLastNames" : miscLastNames,
		"miscTypes" : miscTypes,
		"miscAges" : miscAges,
		"miscSexes" : miscSexes,
		"miscRelationships" : miscRelationships
	}
	return collinsDictionary

func gameSerialiser(): #serialises every NON-life-specific variable we need to save into a dictionary and then returns it
	var cambridgeDictionary = {
		"currentLife" : currentLife
	}
	return cambridgeDictionary

func getSaveLifeFileName(): #will return the unqiue file name, e.g. "Marsden-Gord-9"
	#checks the paths exist
	var dirPath = "user://spycarsinc/bls/lives/"
	if not DirAccess.dir_exists_absolute(dirPath):
		DirAccess.make_dir_recursive_absolute(dirPath) #if the paths don't exist, create them
	#has two save files - one for life-specific variables, and one for non-life-specific (game) variables.
	#unique file checking
	var lifeAnd = 0
	var uniqueLifeSaveName = false
	while uniqueLifeSaveName == false:
		if FileAccess.file_exists("user://spycarsinc/bls/lives/" + firstName + "-" + lastName + "-" + str(lifeAnd) + ".bls"): #if there is already a file with the same name (so it doesn't get overwritten against your will)
			lifeAnd += 1 #try incrementing the lifeAnd number that gets appended to the file name
		else: #if the file name is unique, and so writing to it will not overwrite another life
			uniqueLifeSaveName = true #stops loop; we have a valid file name
	return firstName + "-" + lastName + "-" + str(lifeAnd) #returns the unique file name

func saveGame(): #does the actual saving
	var lifeSavePath = "user://spycarsinc/bls/lives/" + currentLife + ".bls" #the path on the user's device the save will be located - this save only stores the life-specific stuff that doesn't persist between lives (age, relationships, health...)
	var gameSavePath  = "user://spycarsinc/bls/game.bls" #this save stores all of the non-life-specific stuff that does persist between lives (achievements, XP and levels, DNA, etc...)
	var lifeSaveFile = FileAccess.open(lifeSavePath, FileAccess.WRITE)
	var gameSaveFile = FileAccess.open(gameSavePath, FileAccess.WRITE)
	#and now do the rest
	lifeSaveFile.store_var(lifeSerialiser()) #overwrites the life save file with collinsDictionary from the lifeSerialiser() function above.
	gameSaveFile.store_var(gameSerialiser()) #overwrites the game save file with cambridgeDictionary from the gameSerialiser() function above.
	lifeSaveFile.close() #closes file and saves changes
	gameSaveFile.close() #closes file and saves changes
