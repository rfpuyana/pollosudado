###

ANIMATION PROTOTYPE
WRITTEN BY: RAFAEL PUYANA 2014
FOR: POLLOSUDADO.COM
LARGE TEXT FROM: http://bigtext.org/
aa
###

#MULTILAYER CLASS
class MultiLayer	
	constructor: (@imgArray) ->
		for item in @imgArray
			#item.superLayer=@container
			item.opacity = 0

		@imgArray[0].opacity=1	

	Timer:(time) ->
		imgArray =  @imgArray
		@count = 0
		IntervalName =Utils.interval time, ->		
			for item in imgArray	
				@newOpacity = !Boolean(item.opacity)
				item.opacity = Number(@newOpacity)
	Tap: ->
		imgArray =  @imgArray

		@container.on Events.Click, ->
			for item in imgArray	
				@newOpacity = !Boolean(item.opacity)
				item.opacity = Number(@newOpacity)

###
 ____  _____ _____ _   _ ____  
/ ___|| ____|_   _| | | |  _ \ 
\___ \|  _|   | | | | | | |_) |
 ___) | |___  | | | |_| |  __/ 
|____/|_____| |_|  \___/|_|    
                               
### 

Framer.Defaults.Animation = {
    curve: "spring(100,30,10)"
}

pollo_sudado_psd = Framer.Importer.load "imported/pollo_sudado"


# layer setup

all = pollo_sudado_psd.all
all.center()

pollo = pollo_sudado_psd.pollo

pollo.originX = 0
pollo.originY = 0

###
 ____   ___  ______   __
| __ ) / _ \|  _ \ \ / /
|  _ \| | | | | | \ V / 
| |_) | |_| | |_| || |  
|____/ \___/|____/ |_|  
                        
###


pollo.states.add({
	stateA:{y:-30,rotationZ:5}	
	stateB:{y:-50,rotationZ:0}		
	stateC:{y:-30,rotationZ:5}			
})

###
 _______   _______ ____  
| ____\ \ / / ____/ ___| 
|  _|  \ V /|  _| \___ \ 
| |___  | | | |___ ___) |
|_____| |_| |_____|____/ 
                        
###
eyes = pollo_sudado_psd.eyes
eyes_b = pollo_sudado_psd.eyes_b
eyes_multi = new MultiLayer([eyes_b,eyes])
eyes_multi.Timer(2)
###
 __  __  ___  _   _ _____ _   _ 
|  \/  |/ _ \| | | |_   _| | | |
| |\/| | | | | | | | | | | |_| |
| |  | | |_| | |_| | | | |  _  |
|_|  |_|\___/ \___/  |_| |_| |_|
                               
###
mouth = pollo_sudado_psd.mouth

mouth.states.add({
	stateA:{rotationZ:-10}	
	stateB:{rotationZ:0}		
	stateC:{,rotationZ:5}			
})

###
 _     _____ ____ ____  
| |   | ____/ ___/ ___| 
| |   |  _|| |  _\___ \ 
| |___| |__| |_| |___) |
|_____|_____\____|____/ 

###

right_leg = pollo_sudado_psd.right_leg
left_leg = pollo_sudado_psd.left_leg

right_leg.originX = 0
right_leg.originY = 0

left_leg.originX = 0
left_leg.originY = 0


right_leg.states.add({
	stateA:{rotationZ:-15}	
	
})

left_leg.states.add({
	stateA:{rotationZ:15}	
	
})

###
    _    ____  __  __ ____  
   / \  |  _ \|  \/  / ___| 
  / _ \ | |_) | |\/| \___ \ 
 / ___ \|  _ <| |  | |___) |
/_/   \_\_| \_\_|  |_|____/ 
                            
###
# LEFT
left_arm= pollo_sudado_psd.left_arm
left_arm.originX = 1
left_arm.originY = 1

left_arm.states.add({
	stateA:{opacity:0,rotationZ:-20,blur:4}	
})


left_arm_B= pollo_sudado_psd.left_arm_B
left_arm_B.originX = 1
left_arm_B.originY = 0.3

left_arm_B.states.add({
	stateA:{opacity:0,rotationZ:40,blur:4}	
})

# RIGHT
right_arm= pollo_sudado_psd.right_arm
right_arm.originX = 0
right_arm.originY = 1
right_arm.states.add({
	stateA:{opacity:0,rotationZ:30,blur:4}	
})

right_arm_B= pollo_sudado_psd.right_arm_B
right_arm_B.originX = 0
right_arm_B.originY = 1
right_arm_B.states.add({
	stateA:{opacity:0,rotationZ:-40,blur:4}	
})



###
 ____  _   _    _    ____   _____        __
/ ___|| | | |  / \  |  _ \ / _ \ \      / /
\___ \| |_| | / _ \ | | | | | | \ \ /\ / / 
 ___) |  _  |/ ___ \| |_| | |_| |\ V  V /  
|____/|_| |_/_/   \_\____/ \___/  \_/\_/   
                                           
###

shadow = pollo_sudado_psd.shadow

shadow.states.add({
	stateB:{opacity:.8,scaleX:.8}	
	stateC:{opacity:.7,scaleX:.8}		
	stateD:{opacity:1,scaleX:1}			
})

###
 ____  ____   ___  ____  
|  _ \|  _ \ / _ \|  _ \ 
| | | | |_) | | | | |_) |
| |_| |  _ <| |_| |  __/ 
|____/|_| \_\\___/|_|    
###

drop = pollo_sudado_psd.drop
drop.superLayer = pollo


dropAnimation = new Animation({
	layer: drop,
	properties:{y:50,opacity:0}

})

dropAnimation.start()
dropAnimation.on Events.AnimationEnd,->
	drop.y=30
	drop.opacity=1
	dropAnimation.start()



###
 _____ ___ __  __ _____ ____  ____  
|_   _|_ _|  \/  | ____|  _ \/ ___| 
  | |  | || |\/| |  _| | |_) \___ \ 
  | |  | || |  | | |___|  _ < ___) |
  |_| |___|_|  |_|_____|_| \_\____/ 
                                   		
###
Utils.interval 2, ->
	pollo.states.next()
	shadow.states.next()
	right_leg.states.next()
	left_leg.states.next()		
	mouth.states.next()



Utils.interval .1, ->
	left_arm.states.next()	
	left_arm_B.states.next()		
	
	right_arm.states.next()			
	right_arm_B.states.next()			

		
