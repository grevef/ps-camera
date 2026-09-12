# ps-camera
The ps-camera script allows you to capture images throughout the city, serving as a tool for gathering evidence or simply snapping enjoyable photos!

# Setup

* Requires qb-core (framework) and ox_inventory (inventory system).

* Add items to ox_inventory > data > items.lua
```
	['camera'] = {
		label = 'Camera',
		weight = 1000,
		stack = false,
		close = true,
		description = 'Camera to take pretty pictures.',
	},
	['photo'] = {
		label = 'Saved Pic',
		weight = 500,
		stack = false,
		close = true,
		description = 'Brand new picture saved!',
	},
```
* Add pictures for items to ox_inventory > web > images

* Add Discord webhook to ps-camera > server > sv_config.lua

# Preview
* Camera Overlay
![image](https://user-images.githubusercontent.com/82112471/231553020-f5061241-e04a-462e-8266-a48b8efc9884.png)

* Picture Overlay
![image](https://user-images.githubusercontent.com/82112471/231553182-fd15c5f7-b908-42f7-a8d6-93185fd6e3c2.png)

* Picture With Flash 
![image](https://raw.githubusercontent.com/suryabhaiin/version-check/main/withflash.jpg)

* Picture Without Flash 
![image](https://raw.githubusercontent.com/suryabhaiin/version-check/main/noflash.jpg)

#KEY CONTROLS
```Lua
[F] key to toggle Flash
[MOUSELEFT] Capture Photo
[BACKSPACE] Cancel/Exit
```
