extends TextureProgressBar

#initialize player here

@export var enemy: hawk1
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.hawk1_healthChanged.connect(update)
	update()
	
	
func update():
	value = Globals.hawk1_currentHealth * 100 / Globals.hawk1_maxHealth
	
	print(Globals.hawk1_currentHealth)
	print(value)
