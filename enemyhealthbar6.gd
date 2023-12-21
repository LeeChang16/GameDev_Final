extends TextureProgressBar

#initialize player here

@export var enemy: slime6
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.slime6_healthChanged.connect(update)
	update()
	
	
func update():
	value = Globals.slime6_currentHealth * 100 / Globals.slime6_maxHealth
	print(Globals.slime6_currentHealth)
	print(value)
