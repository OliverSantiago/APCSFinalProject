# APCS_Final_Project
APCS Final Project, Stardew Valley 
Starry Pelicans
Oliver Santiago Kermani
Shane Decatur

	Our project is going to be a farming simulator, based on Stardew Valley. We want to have a grid based system which are plots of land that can be interacted with. Each plot is going to be an object that, if interacted with another object, can change. For example, “using” the hoe object next to the plot will make the plot tilled. The purpose of the game is to interact with these plots to grow crops, and sell them to make money.

https://docs.google.com/document/d/1k316ZCcv5fZhJ0Xw1nEw3c_Qkn3JgrAG2Is2r0V6LFY/edit?usp=sharing

Development log

Oliver:

5/25: Initial creation of main file, made player class with basic display and movements. Made starting house and screen in main file, made a new Item class for all item subclasses to extend from. Made inventory arraylist in player, with adding and removing methods

5/26: Made new plot class for planting crops, which can be tilled, watered, planted, and harvested. Made money and timer counters. Made tool subclass extending from items. Displayed inventory to screen and item select using keys. Added basic filter over screen depending on time to show sun going down. Displayed plots on screen for testing.

5/27: Displayed the tools in inventory on screen. 

5/28: Created the selling of items, with moving items to a bin, a new Array List of sold items, and an end screen showing money earned. After end screen, reset farm to new day. Also removed extra subclasses that were unnessessary. 

6/1: New screen for the town, made temporary shop stand. 

6/3:  Made buying screen for new items that adds to inventory and decreases money. Updated display for inventory to show number of items in stack. Reorganized code for clarity. Made a new house screen that the player spawns in and movement between it and the farm. Added sleeping in bed to progress to next day. Fixed the selling of stacks of items. 


Shane:

5/25: Started working on the Crop and Seed classes for the start of the project. Focused on writing the basic/essential methods, keeping in mind how the classes would interact with others. Also made the crops have randomly selected "quality"

5/26: Edited and expanded on the Crop and Seed classes. Editing them to be integrated into the Item class, and edited various methods. Began working on the different types of crops and seeds as subclasses, foscusing first mainly on potato

5/27: Edited/fixed the the way that items were being displayed in the inventory bar (with counter). Worked on the different seed subclasses and their displays, then scrapped the subclasses, instead integrating info into Seed class using different booleans in constructor.

5/28: Updated display of hoe

5/31: Created the different displays for different seeds and crops.

6/1: Edited the time to track and display hours and minutes and fixed a visual glitch at the end of a day. Also worked on how plots interact with seeds and crops, making it possible to plant and harvest the crops.

6/3: Edited the player's interaction with crops and harvesting, writing code in mousePressed method. Wrote display for crops when planted vs when ready to harvest. Fixed small bugs in harvesting/planting crops and growing crops.

6/4: Started working on more detailed visuals of planted crops for different growth intervals, specifically 25% corn,melon,potato,pumpkin.

6/6: updated to display the plant visuals

6/7: Continued working on detailed crop visuals, finished corn,melon,potato 50% to 100%, pumpkin+tomato 50% to 70%.

6/8: Finished the remaining crop visuals. Made a new title screen.

6/9: Edited look of grown corn, made a short working tutorial/guide for when game is first started. Added in next+skip options and icons for tutorial. Fixed bugs with harvesting and edited growth times in Seed class.

6/10: Edited the day/night cycle and fixed some small bugs
