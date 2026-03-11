# Bad Life Simulator



Bad Life Simulator is an open-source mobile life simulator game.



### 

### Guide to modding



##### Global script

Bad Life Simulator uses one global script that persists across all parts of the game in order to keep track of variables that need to be able to be accessed or changed at any time. To access a global variable, type "global." before the variable name (e.g. "global.firstName = 'Brian'")



##### Array handling

BLS uses a lot of arrays. If you know gdscript, there's not much to write home about. However, when picking a random item in an array, I write "randi\_range(0, arrayName.size() - 1)". This is because .size() gets the total number of items in an array. The number it returns will be 1 higher than the index of the last item. Therefore, "randi\_range(0, arrayName.size() - 1)" will pick a random item, including the first and last ones.



##### Naming

Variables, styles, and nodes are named in camelCase. Scenes are named in snake\_case, and assets are named in kebab-case. This may seem arbitrary. It is.

