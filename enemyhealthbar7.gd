extends TextureProgressBar

#initialize player here

@export var enemy: slime7
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.slime7_healthChanged.connect(update)
	update()
	
	
func update():
	value = Globals.slime7_currentHealth * 100 / Globals.slime7_maxHealth
	print(Globals.slime7_currentHealth)
	print(value)
