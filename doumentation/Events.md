## Events



Events are not only complex, but also integral to this game's fabric, which means if you're making a mod, you'll probably need to learn how they work.



When you age up, there is a chance an event will spontaneously appear. When you perform an activity, such as applying for a job or complimenting a friend, an event will pop up confirming what you did.



Events are known by unique event IDs. If it is an age up event, this will usually be "ageRange-number", and for outcomes, "ageRange-sameNumber-oX", with X being the option you picked (could be 1 through 4). For non-randomly-occurring (age up) events, the ID is usually something more specific. For example, if you're being hired at a job: "jobName-applicationSuccess".



The revent variable is an array, meaning it can store multiple of these event IDs at once. By default, the event page will show the FIRST event in this array, i.e. the first one that was added to it. Once the player is done addressing that one, if there are more left, it will continue showing them back-to-back until the array is empty.





To add a new event to Bad Life Simulator:

If this is a random age up event:

1. Go to the events section of ageUp.gd.
2. Either a) Find the age group you want to make an event for and increase its max number in the randi\_range() by 1, but this will break as soon as new official events are added, or b) add another condition in the code block that makes it so that if there is going to be an event appended, there is a 1 in 2 chance for it to be official and a 1 in 2 chance for it to be from your mod. If it's from your mod, prefix the event ID with something like "modName-".
3. Go to event.gd and find the function for the age range your event is for.
4. Add an elif line after the last one in that function to detect your event ID.
5. Change the text for the heading, body, and options 1 through however many you want. You can disable options you do not want by changing their opacity to 0 ($buttonX.modulate.a = 0). They will not be visible and clicking them will do nothing so long as you don't program them to do something.
6. If your event is only notifying the player of something (only has one option), skip to step 10.
7. Once you've done that, go to the "on\_option\_x\_pressed" function for every option you're using and add a line on each that detects the ID of your event and calls the outcome() function for with the perameter "my-event-ID-oX" (X being the option number).
8. Once this is done for every option, go to each optionXoutcomes function for the options you've used and append a new elif condition that detects your event ID.
9. Update the page again (heading, body text, options 1 through 4) and make sure to add any unique effects this option is supposed to have, like affecting joy or the relationship you have with a family member. Remember: this is what will happen when you click on an option. This is not a new event.
10. If there is only one option for the effect (usually something like "okay" that will take you back home): navigate back to the "on\_option\_1\_pressed" function (SPECIFICALLY option 1 pressed), add a new line that detects "my-event-ID-o1" and calls the goHome() function. This will send the player back home.
11. If there is MORE than one option (not a confirmation, but another choice), repeat step 6, and keep in mind that your event ID now has "-oX" on the end of it.




If this is NOT a random age up event (something more specialised):

1. Go to the events section of ageUp.gd.
2. Navigate to the "specialised" function.
3. Resume at step 4 of the previous (above) guide.





