extends TextureProgressBar

#initialize player here

@export var enemy: mushroom1
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.mushroom1_healthChanged.connect(update)
	update()
	
func update():
	value = Globals.mushroom1_currentHealth * 100 / Globals.mushroom1_maxHealth
	print(Globals.mushroom1_currentHealth)
	print(value)
