extends TextureProgressBar

#initialize player here

@export var enemy: mushroom2
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.mushroom2_healthChanged.connect(update)
	update()
	
func update():
	value = Globals.mushroom2_currentHealth * 100 / Globals.mushroom2_maxHealth
	print(Globals.mushroom2_currentHealth)
	print(value)
