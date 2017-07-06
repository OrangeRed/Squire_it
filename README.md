# Squire_it
Script that runs Baltane Squires

## YOU MUST USE THESE FEATURES

	must always start in AVALON
	BITMAP must be enabled
	ELECTRIC GRAY must be your background color (no UI mods)
	ESC must close windows
	STAT and EXP bar must be minimized
	
## WHAT IT DO ?

This is the ideal camera position 
![Ideal Camera Position](https://i.imgur.com/OgAqj5Br.jpg)

*There may be other positions that work better or just as well. You can pick whichever tickles your pickle.*

If the script does something weird **BUT** only does it once then its not broken. However if something gets repeated multiple times (5-10+) then in all likelihood the script is confused and if it doesn't rectify itself it will terminate .... eventually.

You can manually terminate the script by pressing ESC while the game is not your focus or not your active window. 

### Type = 0 (Conversation Only)

if Type = 0 all you need to do is start the script in AVALON and it will start conversing with the squires you specified in your .ini.

*conversations break when your target squire becomes locked during a likeability check (going from 3->4 or 4->5)*

### Type = 1 (Training Only)

If Type = 1 you need to select which training type and training level you want use. e.g. 55 cost DIV training or the 7 cost DEX training (specify this in your .ini). Then continue the script as if Type = 0. 

### Type = 2 (Mission Only)

If Type = 2 the script will first run Counsel() to set their stress to 0. Afterwards the script will run the missions located under "Preferences." Try to keep your preferences equal to the number of squires in your squad.

*You can't counsel a squire that isn't in your squad. In the event this happens you will need to have LOGOUT MID CONVERSATION enabled for the script to not terminate.*

*If a squire has 60+ stress they will refuse to go on their mission, however cycling continues*