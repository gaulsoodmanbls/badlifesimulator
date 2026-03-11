extends Node2D #author(s): Ethan Scott
#generates a random life for the player


var tips = ["Stuck? Try not being stuck.", "Working minimum wage is not an effective way to earn a high wage.", "Taxes are due! Evading them could lead to fines or imprisonment.", "Remember to eat your one small rock per day.", "Low on sodium? Eat some pure sodium metal.", "Japan has five vending machines per fighter pilot.", "Clumps in your cheesecake? Try using a declumper from your inventory.", "Clumps in your friend group? Try using a declumper from your inventory.", "Donating blood? Make sure your blood type is the same as the recipients'.", "Please inform your doctor if you believe you have played this game before. You might think you have. You haven't. This is only an illusion.", "Sun too bright? Try wearing sunglasses!", "Once dead, you are no longer alive. Keep this in mind when dying.", "Check the UV index in your area before going outside.", "Strapped for cash? Rob a bank.", "Your device is probably extremely slow if you are able to read this.", "Make adjustments. Go get it energised."] #tips to be displayed on the screen during loading :)


#name variables
const mFirstNames = ["Large", "John", "Jack", "Jason", "Smith", "Scott", "Jackson", "Fred", "Drew", "Austin", "Bruce", "Peter", "Liam", "Noah", "Oliver", "Kurtis", "Daniel", "George", "Nathan", "Ethan", "Matthew", "Racist", "Donald", "Stephen", "Robert", "Aardvaark", "Kevin", "Barbonious", "Michael", "Seth", "Zeke", "Ted", "Dominic", "David", "Jeffery", "Hunter", "Owen", "Jim", "Lorenzo", "Joseph", "Mr.", "Howard", "Josh", "Marshall", "LeBron", "James", "Fischer", "Tim", "Lucas", "Billy", "Lachlan", "Gary", "Norman", "Barrack", "Eddie", "Eco", "Tsar", "Ranjit", "Lincoln", "William", "Frank", "Jerome", "Neil", "Patrick", "Logan", "Albert", "Ernest", "Benjamin", "Adam", "Barney", "Felix", "Ralph", "Jaquavius", "Throquemorton", "Emmett", "Junior", "Nicholas", "Julian", "Aaron", "Skeeth", "Brian", "Denson", "Kelvin", "Gorge", "Pinkle", "Posture", "Lawrence", "Stanley", "Gregory", "Heath", "Ryan", "Ross", "Jake", "Raymond", "Glenn", "Terry", "Andre", "Joe", "Dirk", "Norme", "Oscar", "Fredandrewjamin", "Chidi", "Jianyu", "Manny", "Luke", "Bambadjan", "Trevor", "Tejas", "Taste", "Lithuania", "Nerd", "Mark", "The", "Lupus", "Harry", "Flint", "Bartholomew", "Brown", "Squnch", "Elliot", "Chase", "Daryl", "Alan", "Sandy", "Garrison", "Carter", "Gru", "Chandler", "Cheese", "Vince", "Miles", "Martin", "Carl", "Manase", "Henry", "Leo", "Arthur", "Hudson", "Chunce", "Brunch", "Lionel", "Chris", "Aden"] #masculine first names

const fFirstNames = ["Minh", "Arwyn", "Lily", "Violet", "Fresh", "Plunk", "Hannah", "Elena", "Sienna", "Alice", "Jaqueline", "Debbie", "Cheyanne", "Mrs.", "Lungs", "Ella", "Les", "Amber", "Skylar", "Tracy", "Beatrice", "Hayley", "Denise", "Alexa", "Athena", "Christina", "Holly", "Jessica", "Cook", "Amy", "Jeanette", "Eloise", "Amethyst", "Pheromone", "Cecilia", "Hazel", "Judy", "Gertrude", "Rose", "Lauren", "Ester", "Taylor", "Annabelle", "Jillian", "Jennifer", "Victoria", "Ava", "Hayley", "Mia", "Aria", "Linda", "Julia", "Heather", "Selena", "Dakota", "Stacy", "Stella", "Pearl", "Lea", "Eula", "AuthO", "Valarie", "Mary", "Dorothy", "Sharon", "Dianne", "Dina", "Janet", "Layla", "Charlette", "Mia", "Lori", "Eleanor", "Stephanie", "Tifanny", "Chelsea", "Trish", "Tahani", "Tiya", "Mindy", "Rebecca", "April", "June", "Maya", "Jaundice", "Melinda", "Lick", "Amanda", "Persephone", "Eve", "P.", "Strawberry", "Nicole", "Alanis", "Nora", "Cristin", "Stormy", "Lucy", "Amelia", "Toothbrush", "Evelyn", "Ariana", "Grace", "Harper", "Madison", "Scarlet", "Hadley", "Eva", "Atlas", "Olivia", "Hiro", "Lexie", "Patricia", "Sarah"] #feminine first names

const uFirstNames = ["Robyn", "Jesse", "Quinn", "Riley", "Charly", "Sam", "McKenzie", "Quiche", "Dijon", "Fat", "Beanus", "Monty", "House", "Jaundice", "Gamboge", "Darcy", "Gen", "Bowel", "Luca", "Tomato", "Noel", "Disco", "Steel", "Lightning", "Weezer", "Detlef"] #unisex first names

const lastNames = ["Fries", "Smith", "Daniels", "Derulo", "Bush", "Wheeler", "Lanyard", "Scott", "Waterson", "Karmichael", "Morrison", "Stephens", "Curley", "Strong", "McLucas", "Zillman", "Mason", "Mosby", "Guy", "Esquire Jr.", "Aardvaarsk", "Kevins", "Sweat", "Pritchard", "Lithuania", "North Korea", "Carbohydrate", "Flickweert", "Lim", "Jones", "Pearson", "Campbell", "Wilson", "Robinson", "Spears", "Nacho", "Von Matterhorn", "Ball", "President", "Biden", "Pop", "Gonzalez", "Gooden", "Conners", "Beast", "Jr.", "Igloo", "Randor", "Erikson", "James", "Price", "Arnott", "Cook", "Collins", "McLauglan", "Whipp", "Wilcox", "Anderson", "Mills", "Wickersfeild", "Obama", "Lastname", "F. Kennedy", "Mustard", "Carpet III", "Parker", "Murphy", "Fresh", "Bomba", "Sand", "Lee", "Burton", "Nickels", "Chapman", "Shakespeare", "Bennedict", "St. John", "Lopez", "Cootes", "Pu", "Patrick Harris", "Armstrong", "Lips", "Willis", "Speilberg", "Franklin", "Green", "Smart", "Stinson", "Murdoch", "Swanson", "Bundy", "Sparks", "Ball", "Michaels", "Roberts", "Bryant", "Santos", "Pacheao", "Churnchill", "Seraneno", "Bob", "McKinley", "Mendez", "Joy", "Kubrick", "Lard", "Romaniello", "Hawking", "Polley", "Baker", "Carpenter", "George", "Trahan", "Johnson", "Slater", "Gomez", "MacIntyre", "Shellstrop", "Danger", "Bell", "Holt", "Parolta", "Diaz", "Jeoffards", "Braugher", "Samberg", "Beatriz", "Crews", "Lo Truglio", "Peretti", "Blocker", "Santiago", "Fumero", "Schur", "Goor", "Boyle", "Linetti", "Hitchcock", "Scully", "Danson", "Carden", "Harper", "Peabody", "Nobel", "Anagonye", "Al-Jamil", "Mendoza", "Jacinto", "Guldan", "Emia", "Sircar", "St. Claire", "Wallace", "Hullur", "Lid", "Zuckerberg", "Jackson", "Weeknd", "Wunch", "Worst", "Samuel", "Sparkles", "Lockwood", "Neumann", "Seinfeld", "Brown", "Cranckles", "Quesadilla", "Orthodella", "Joneston", "Thunch", "Banks", "Friday", "Ocean", "Strange", "Bond", "Scherbatsky", "Thicke", "Letterman", "Schaffer", "Rivers", "McConnell", "Milioti", "Barbakow", "Wise", "OBrien", "Loveday", "Lopez-Lopez", "Luna", "McGruginson", "Love-Hewitt", "Grande", "Heeler", "Noir", "Square Garden", "Luther", "King", "Spinach", "Overkill", "Johansson", "Scrumsktstingston", "White", "Martz", "Nacho", "Phelps", "Norris", "McBroom", "McQueen", "Richie", "Hansen", "Walker", "Schrempf"] #dude just look at the variable name

const rareFirstNames = ["Marl", "Rob", "Tinky", "Guy", "Paul", "Mildly", "™", "Eggs Bennedict", "Doordash", "Lettuce", "Snoopy", "Marty", "Lump"] #only generated in pairs of first name and last name. Regular names roll once for a first name and again to pick a last name, whereas rare names only roll once and pick the corresponding first and last name. So picking "Rob" as a rare first name cannot result in the name "Rob Salad", it will always result in "Rob Ery" as they are both at the same index. This is to make seperating first and last names easier, but also preserve the rare name as originally intended.

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
	namePicker()
