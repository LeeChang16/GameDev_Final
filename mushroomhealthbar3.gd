extends TextureProgressBar

#initialize player here

@export var enemy: mushroom3
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.mushroom3_healthChanged.connect(update)
	update()
	
func update():
	value = Globals.mushroom3_currentHealth * 100 / Globals.mushroom3_maxHealth
	print(Globals.mushroom3_currentHealth)
	print(value)
