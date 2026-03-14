extends Node2D #author(s): Ethan Scott
#generates a random life for the player


var tips = ["Stuck? Try not being stuck.", "Working minimum wage is not an effective way to earn a high wage.", "Taxes are due! Evading them could lead to fines or imprisonment.", "Remember to eat your one small rock per day.", "Low on sodium? Eat some pure sodium metal.", "Japan has five vending machines per fighter pilot.", "Clumps in your cheesecake? Try using a declumper from your inventory.", "Clumps in your friend group? Try using a declumper from your inventory.", "Donating blood? Make sure your blood type is the same as the recipients'.", "Please inform your doctor if you believe you have played this game before. You might think you have. You haven't. This is only an illusion.", "Sun too bright? Try wearing sunglasses!", "Once dead, you are no longer alive. Keep this in mind when dying.", "Check the UV index in your area before going outside.", "Strapped for cash? Rob a bank.", "Your device is probably extremely slow if you are able to read this."] #tips to be displayed on the screen during loading :)


#name variables
const mFirstNames = ["Large", "John", "Jack", "Jason", "Smith", "Scott", "Jackson", "Fred", "Drew", "Austin", "Bruce", "Peter", "Liam", "Noah", "Oliver", "Kurtis", "Daniel", "George", "Nathan", "Ethan", "Matthew", "Racist", "Donald", "Stephen", "Robert", "Aardvaark", "Kevin", "Barbonious", "Michael", "Seth", "Zeke", "Ted", "Dominic", "Domestic", "David", "Jeffery", "Hunter", "Owen", "Jim", "Lorenzo", "Joseph", "Mr.", "Howard", "Josh", "Marshall", "LeBron", "James", "Fischer", "Tim", "Lucas", "Billy", "Lachlan", "Gary", "Norman", "Barrack", "Eddie", "Eco", "Tsar", "Ranjit", "Lincoln", "William", "Frank", "Jerome", "Neil", "Patrick", "Logan", "Albert", "Ernest", "Benjamin", "Adam", "Barney", "Felix", "Ralph", "Jaquavius", "Throquemorton", "Emmett", "Junior", "Nicholas", "Julian", "Aaron", "Skeeth", "Brian", "Denson", "Kelvin", "Gorge", "Pinkle", "Posture", "Lawrence", "Stanley", "Gregory", "Heath", "Ryan", "Ross", "Jake", "Raymond", "Glenn", "Terry", "Andre", "Joe", "Dirk", "Norme", "Oscar", "Fredandrewjamin", "Chidi", "Jianyu", "Manny", "Luke", "Bambadjan", "Trevor", "Tejas", "Taste", "Lithuania", "Nerd", "Mark", "The", "Lupus", "Harry", "Flint", "Bartholomew", "Brown", "Squnch", "Elliot", "Chase", "Daryl", "Alan", "Sandy", "Garrison", "Carter", "Gru", "Chandler", "Cheese", "Vince", "Miles", "Martin", "Carl", "Manase", "Henry", "Leo", "Arthur", "Hudson", "Chunce", "Brunch", "Lionel", "Chris", "Aden", "Dean", "Cameron", "Ferris", "Xander", "Zachary"] #masculine first names

const fFirstNames = ["Minh", "Arwyn", "Lily", "Violet", "Fresh", "Plunk", "Hannah", "Elena", "Sienna", "Alice", "Jacqueline", "Debbie", "Cheyanne", "Mrs.", "Lungs", "Ella", "Les", "Amber", "Skylar", "Tracy", "Beatrice", "Hayley", "Denise", "Alexa", "Athena", "Christina", "Holly", "Jessica", "Cook", "Amy", "Jeanette", "Eloise", "Amethyst", "Pheromone", "Cecilia", "Hazel", "Judy", "Gertrude", "Rose", "Lauren", "Ester", "Taylor", "Annabelle", "Jillian", "Jennifer", "Victoria", "Ava", "Hayley", "Mia", "Aria", "Linda", "Julia", "Heather", "Selena", "Dakota", "Stacy", "Stella", "Pearl", "Lea", "Eula", "AuthO", "Valarie", "Mary", "Dorothy", "Sharon", "Dianne", "Dina", "Janet", "Layla", "Charlette", "Mia", "Lori", "Eleanor", "Stephanie", "Tifanny", "Chelsea", "Trish", "Tahani", "Tiya", "Mindy", "Rebecca", "April", "June", "Maya", "Jaundice", "Melinda", "Lick", "Amanda", "Persephone", "Eve", "P.", "Strawberry", "Nicole", "Alanis", "Nora", "Cristin", "Stormy", "Lucy", "Amelia", "Toothbrush", "Evelyn", "Ariana", "Grace", "Harper", "Madison", "Scarlet", "Hadley", "Eva", "Atlas", "Olivia", "Hiro", "Lexie", "Patricia", "Sarah", "Tamantha", "Veronica", "Yobin", "Dolly", "Mila", "Sophia", "Eilzabeth", "Chloe", "Abigail", "Ivy", "Willow", "Delilah", "Sadie", "Maggie", "Madeline", "Eden", "Alina"] #feminine first names

const uFirstNames = ["Robyn", "Jesse", "Quinn", "Riley", "Charly", "Sam", "McKenzie", "Quiche", "Dijon", "Fat", "Beanus", "Monty", "House", "Jaundice", "Gamboge", "Darcy", "Gen", "Bowel", "Luca", "Tomato", "Noel", "Disco", "Steel", "Lightning", "Weezer", "Detlef", "Gord", "Rowan", "Aether", "Jamie"] #unisex first names

const lastNames = ["Fries", "Smith", "Daniels", "Derulo", "Bush", "Wheeler", "Lanyard", "Scott", "Waterson", "Karmichael", "Morrison", "Stephens", "Curley", "Strong", "McLucas", "Zillman", "Mason", "Mosby", "Guy", "Esquire Jr.", "Aardvaarsk", "Kevins", "Sweat", "Pritchard", "Lithuania", "North Korea", "Carbohydrate", "Flickweert", "Lim", "Jones", "Pearson", "Campbell", "Wilson", "Robinson", "Spears", "Nacho", "Von Matterhorn", "Ball", "President", "Biden", "Pop", "Gonzalez", "Gooden", "Conners", "Beast", "Jr.", "Igloo", "Randor", "Erikson", "James", "Price", "Arnott", "Cook", "Collins", "McLauglan", "Whipp", "Wilcox", "Anderson", "Mills", "Wickersfeild", "Obama", "Lastname", "F. Kennedy", "Mustard", "Carpet III", "Parker", "Murphy", "Fresh", "Bomba", "Sand", "Lee", "Burton", "Nickels", "Chapman", "Shakespeare", "Bennedict", "St. John", "Lopez", "Cootes", "Pu", "Patrick Harris", "Armstrong", "Lips", "Willis", "Speilberg", "Franklin", "Green", "Smart", "Stinson", "Murdoch", "Swanson", "Bundy", "Sparks", "Ball", "Michaels", "Roberts", "Bryant", "Santos", "Pacheao", "Churnchill", "Seraneno", "Bob", "McKinley", "Mendez", "Joy", "Kubrick", "Lard", "Romaniello", "Hawking", "Polley", "Baker", "Carpenter", "George", "Trahan", "Johnson", "Slater", "Gomez", "MacIntyre", "Shellstrop", "Danger", "Bell", "Holt", "Parolta", "Diaz", "Jeoffards", "Braugher", "Samberg", "Beatriz", "Crews", "Lo Truglio", "Peretti", "Blocker", "Santiago", "Fumero", "Schur", "Goor", "Boyle", "Linetti", "Hitchcock", "Scully", "Danson", "Carden", "Harper", "Peabody", "Nobel", "Anagonye", "Al-Jamil", "Mendoza", "Jacinto", "Guldan", "Emia", "Sircar", "St. Claire", "Wallace", "Hullur", "Lid", "Zuckerberg", "Jackson", "Weeknd", "Wunch", "Worst", "Samuel", "Sparkles", "Lockwood", "Neumann", "Seinfeld", "Brown", "Cranckles", "Quesadilla", "Orthodella", "Joneston", "Thunch", "Banks", "Friday", "Ocean", "Strange", "Bond", "Scherbatsky", "Thicke", "Letterman", "Schaffer", "Rivers", "McConnell", "Milioti", "Barbakow", "Wise", "OBrien", "Loveday", "Lopez-Lopez", "Luna", "McGruginson", "Love-Hewitt", "Grande", "Heeler", "Noir", "Square Garden", "Luther", "King", "Spinach", "Overkill", "Johansson", "Scrumsktstingston", "White", "Martz", "Nacho", "Phelps", "Norris", "McBroom", "McQueen", "Richie", "Hansen", "Walker", "Schrempf", "Withers", "Sink", "Bueller", "Glover"] #dude just look at the variable name

const rareFirstNames = ["Marl", "Rob", "Tinky", "Guy", "Paul", "Mildly", "™", "Eggs Bennedict", "Doordash", "Lettuce", "Snoopy", "Martin", "Lump"] #only generated in pairs of first name and last name. Regular names roll once for a first name and again to pick a last name, whereas rare names only roll once and pick the corresponding first and last name. So picking "Rob" as a rare first name cannot result in the name "Rob Salad", it will always result in "Rob Ery" as they are both at the same index. This is to make seperating first and last names easier, but also preserve the rare name as originally intended.

const rareLastNames = ["", "Ery", "Tonk Shank", "Man", "Salad", "Concerning", "", "Recipe", "Guy", "Lol", "DaDuck", "McFly", "Sum Payment"] #Marl and ™ have only a first name. This will result in some weird behaviour, such as the player being called "Mr./Mrs.[blank]", but that is a sarcrifice I am willing to make.


func namePicker(): #generates a full name for the player
	print(str(mFirstNames.size()) + " masculine first names.")
	print(str(fFirstNames.size()) + " feminine first names.")
	print(str(uFirstNames.size()) + " unisex first names.")
	print(str(lastNames.size()) + " total last names.")
	print(str(rareFirstNames.size()) + " total rare names.") #only rare first names because rare names come in pairs. refer to the rare names array in for more information.
	print(str((mFirstNames.size() * lastNames.size()) + (fFirstNames.size() * lastNames.size()) + (uFirstNames.size() * lastNames.size()) + rareFirstNames.size()) + " total possible unique name combinations.")
	if randi_range(1,3000) == 1: #if you're given a rare name (1 in 3,000 chance). A further 1 in (number of rare names) chance to get a specific rare name, meaning:
		print("picking a rare name. That means there is only a 1 in " + str(3000 * rareFirstNames.size()) + " chance of getting the name you're about to be assigned. Impressive!")
		var rareName = randi_range(0, rareFirstNames.size() - 1) #since rare names come in pairs, 
		global.firstName = rareFirstNames[rareName] #assigns rare first name
		global.lastName = rareLastNames[rareName] #assigns rare last name
	else: #if you aren't given a rare name
		if randi_range(1,20) == 1: #if you're given a unisex name (1 in 20 chance)
			print("picking a unisex name (1 in 20 chance)")
			global.firstName = uFirstNames[randi_range(0, uFirstNames.size() - 1)] #assigns a random unisex first name
		else: #if you aren't given a unisex name
			match global.sex: #gives a different name depending on sex
				"M":
					global.firstName = mFirstNames[randi_range(0, mFirstNames.size() - 1)] #assigns a male name
				"F":
					global.firstName = fFirstNames[randi_range(0, fFirstNames.size() - 1)] #assigns a female name
		global.lastName = lastNames[randi_range(0,lastNames.size() - 1)] #assigns a random last name. Function does not change depending on sex.
	print("your name is " + global.firstName + " " + global.lastName)


func epicStatChanges(): #changes your stats, epicly, based on factors outside of your control
	if global.lastName == "Smart" || global.firstName == "Nerd": #epic stat changes
		global.intellect = 3
	elif global.lastName == "Joy":
		global.joy = 3


func familyGenerator(): #HELP I DON'T WANT TO MAKE THIS SCRIPT FOR A THIRD TIME WHY WHY WHYYYY
	#types (happens first)
	var howManyGrandparents = 0 #how many gransparents do you have, if any? number is generated later. max is 2x number of parents
	var howManyParents = 0 #how many parents do you have?
	if randi_range(1, 12) == 1: #if you have a single parent
		howManyParents = 1 #you have one parent
		if randi_range(1, 2) == 1: #if you have a single mother
			global.familyTypes.append("Mother") #appends mother
		else: #if you have a single father
			global.familyTypes.append("Father") #appends father
		howManyGrandparents = randi_range(0,2) #how many grandparents do you have
	else: #if you have TWO parents
		howManyParents = 2 #you have two parents
		if randi_range(1, 18) == 1: #if you have two parents of the same sex
			if randi_range(1, 2) == 1: #if two mothers
				global.familyTypes.append("Mother") #appends mother
				global.familyTypes.append("Mother") #appends mother
			else: #if two fathers
				global.familyTypes.append("Father") #appends father
				global.familyTypes.append("Father") #appends father
		else: #if you have two parents of DIFFERENT sex
			global.familyTypes.append("Mother") #appends mother
			global.familyTypes.append("Father") #appends father
		howManyGrandparents = randi_range(0,4) #how many grandparents do you have
	if randi_range(1, 2) == 1: #if you're getting siblings
		var howManySiblings = randi_range(1, 4) #how many siblings will be generated
		while howManySiblings > 0: #while there are still siblings left to be generated
			if randi_range(1, 2) == 1: #if sibling is a female
				global.familyTypes.append("Sister") #appends sister
			else: #if sibling is a male
				global.familyTypes.append("Brother") #appends brother
			howManySiblings -= 1 #we just generated a sibling, remember? god
	while howManyGrandparents > 0: #while there are still grandparents left to generate
		if howManyGrandparents >= 2: #must be greater than or equal to 2 considering we are appending two grandparents
			if randi_range(1, 60) == 1: #if you have two grandparents of the same sex; much less likely because they are old
					if randi_range(1, 2) == 1: #if you have two grandmothers
						global.familyTypes.append("Grandmother") #appends grandmother
						global.familyTypes.append("Grandmother") #appends grandmother
					else: #if you have two grandfathers
						global.familyTypes.append("Grandfather") #appends grandfather
						global.familyTypes.append("Grandfather") #appends grandfather
					howManyGrandparents -= 2 #-2 because we just appended two grandparents at once
			else: #if you have two grandparents of DIFFERENT sex
				global.familyTypes.append("Grandmother") #appends grandmother
				global.familyTypes.append("Grandfather") #appends grandfather
				howManyGrandparents -= 2 #-2 because we just appended two grandparents at once
		else: #if you only have one grandparent left to generate (can't be 0 because to be here in the first place you must have over 0
			if randi_range(1, 2) == 1: #if you have one grandmother
				global.familyTypes.append("Grandmother") #appends grandmother
			else: #if you have one grandfather
				global.familyTypes.append("Grandfather") #appends grandfather
			howManyGrandparents -= 1 #1 less grandparent you need to generate
	if randi_range(1, 3) == 1: #if you have aunts/uncles
		var howManyUncaunts = randi_range(1, 4) #you may have any number of aunts/uncles between 1 and 4
		while howManyUncaunts > 0: #while there are still more aunts/uncles to generate
			if randi_range(1, 2) == 1: #if you're getting an aunt
				global.familyTypes.append("Aunt") #appens aunt
			else: #if you're getting an uncle
				global.familyTypes.append("Uncle") #appends uncle
			howManyUncaunts -= 1 #1 less aunt/uncle you need to generate
		if randi_range(1, 3) == 1: #if you're getting cousins - requires aunts/uncles
			var howManyCousins = randi_range(1, 5) #how many cousins you will get, from 1 to 5
			while howManyCousins > 0: #while there are still cousins left to generate
				global.familyTypes.append("Cousin") #don't need to do seperate appendings by sex since cousin is a gender neutral term; sexes will be assigned later
				howManyCousins -= 1 #1 less cousin left to generate
	#sexer
	for i in global.familyTypes.size() - 1: #sets a variable, i, to run through every item in the familyTypes array. Runs once for every item in it. Index of the family member corresponds with the index of their sex.
		if global.familyTypes[i] == "Mother" || global.familyTypes[i] == "Sister" || global.familyTypes[i] == "Grandmother" || global.familyTypes[i] == "Aunt": #if family member at index i is female
			global.familySexes.append("F") #appends female
		elif global.familyTypes[i] == "Father" || global.familyTypes[i] == "Brother" || global.familyTypes[i] == "Grandfather" || global.familyTypes[i] == "Uncle": #if family member at index i is male
			global.familySexes.append("M") #appends male
		else: #if family member at index i is your cousin
			if randi_range(1, 2) == 1: #if cousin is female
				global.familySexes.append("F") #appends female
			else: #if cousin is male
				global.familySexes.append("M") #appends male
		i += 1 #+1 so it doesn't loop forever and moves on to the index of the next family member
	#namer
	var parentsAreMarried = false #parents aren't married by default, but this might change:
	if howManyParents == 2: #if you have two parents
		if randi_range(1, 2) == 1: #if parents ARE married (1 in 2 chance)
			parentsAreMarried = true #then parents being married is TRUE
	for i in global.familyTypes.size() - 1: #sets a variable, i, to run through every item in the familyTypes array. Runs once for every item in it. Index of the family member corresponds with the index of their name.
		#last names - Last names are assigned before first names so they can be overridden by rare names, which are all full names.
		if global.familyTypes[i] == "Mother" || global.familyTypes[i] == "Father": #if the family member being analysed now is a parent
			if howManyParents == 1: #if you only have one parent
				global.familyLastNames.append(global.lastName) #they get your surname automatically
			elif parentsAreMarried == true: #if parents are married. If this is true, it also means that you have two parents because of how the true value gets assigned. If true, you and both of them will share the same family surname. If they are not, you and ONE of them will share one. If the family member you would have originally gotten your surname from later gets a rare name and therefore a special rare surname, I guess they made it up because now you've gotten yours from nowhere.
				global.familyLastNames.append(global.lastName) #gives them the family surname
			else: #if you have two parents BUT they're aren't married
				var parentsBeforeThis = false #are there any parents in the familyTypes array before this one? The first parent in the array will get your surname. False by default so it only gets changed if there are other parents before.
				var x = i-1 #used to keep track of which family member we're checking. Starts off by checking the 
				while x >= 0: #while there are still family members earlier in the array before this one
					if global.familyTypes[x] == "Mother" || global.familyTypes[x] == "Father": #if the family member at the index x is a parent, that means there is a parent before the one at i
						parentsBeforeThis = true #the parent at index i is not the first parent
					x -= 1 #advance
				if parentsBeforeThis == false: #if, after we checked, we found there aren't any parents in the array before this
					global.familyLastNames.append(global.lastName) #parent gets your last name
		else: #if family member at index i is NOT your parent
			global.familyLastNames.append(lastNames[randi_range(0, lastNames.size() - 1)]) #gives them a random last name
		#first names and rare names
		if randi_range(1, 3000) == 1: #if family member is getting a rare full name
			var rareNameIndex = randi_range(0, rareFirstNames.size() - 1) #first name and last name have the same index. picks one random index to use.
			global.familyFirstNames.append(rareFirstNames[rareNameIndex]) #appends the first name of the index
			global.familyLastNames.pop_back() #removes (pops) the last element of the familyLastNames array. This is because this family member was already given a last name and we are about to override that with a new one.
			global.familyLastNames.append(rareLastNames[rareNameIndex]) #appends the last name of the index
		else: #if family member is NOT getting a rare full name
			if randi_range(1, 20) == 1: #if family member is getting a unisex first name
				global.familyFirstNames.append(uFirstNames[randi_range(0, uFirstNames.size() - 1)]) #appends a random unisex first name
			else: #if family member is NOT getting a unisex first name
				if global.familySexes[i] == "F": #if family member at index i is female
					global.familyFirstNames.append(fFirstNames[randi_range(0, fFirstNames.size() - 1)]) #appends to familyFirstNames a random female first name
				else: #if family member at index i is male
					global.familyFirstNames.append(mFirstNames[randi_range(0, mFirstNames.size() - 1)]) #appends to familyFirstNames a random male first name
	#relationshipper
	for i in global.familyTypes.size() - 1: #runs through and checks every family member, assigning them a relationship to you
		if global.familyTypes[i] == "Mother" || global.familyTypes[i] == "Father": #if family member at i is your parent
			global.familyRelationships.append(randi_range(30, 100))
		elif global.familyTypes[i] == "Grandmother" || global.familyTypes[i] == "Grandfather": #if family member is your grandparent
			global.familyRelationships.append(randi_range(30, 100))
		elif global.familyTypes[i] == "Aunt" || global.familyTypes[i] == "Uncle": #if family member is your aunt/uncle
			global.familyRelationships.append(randi_range(20, 70))
		elif global.familyTypes[i] == "Brother" || global.familyTypes[i] == "Sister": #if family member is your sibling
			global.familyRelationships.append(randi_range(40, 80))
		elif global.familyTypes[i] == "Cousin": #if family member is your cousin
			global.familyRelationships.append(randi_range(0, 30))
	print(global.familyFirstNames)
	print(global.familyLastNames)
	print(global.familySexes)
	print(global.familyAges)
	print(global.familyTypes)
	print(global.familyRelationships)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$loadingText.text = tips[randi_range(0, tips.size() - 1)] #picks a random tip to display. Must be size -1 because arrays are 0-indexed, meaning that the number of items in the array will be 1 more than the index of the last item.
	global.sex = randi_range(0,1) #turns sex into a random number, either 0 or 1
	match global.sex: #assigns sex
		0: #if the number is 0, you are male
			global.sex = "M"
			print("you are male!")
		1: #if 1, you are female
			global.sex = "F"
			print("you are female!")
	global.joy = randi_range(10,90)
	global.health = randi_range(1, 100)
	global.intellect = randi_range(10,90)
	global.looks = randi_range(1,100)
	print("Joy: " + str(global.joy))
	print("Health: " + str(global.health))
	print("Intellect: " + str(global.intellect))
	print("Looks: " + str(global.looks))
	namePicker()
	epicStatChanges()
	familyGenerator() #:sob:
