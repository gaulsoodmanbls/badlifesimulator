extends Node #author(s): Ethan Scott

#this is this game's global script. It is accessibile from any script at any point. If you need to access or change a variable from here, for instance, firstName, in a different scene, type "global." before the variable name: "global.firstName".


#personal
var firstName = "" #both this and last name should begin with a capital
var lastName = ""
var age = 0 #in years
var sex = "" #will become either M for Male or F for Female during new life generation. For simplicity's sake I am not yet adding intersexuality, but I may later.
