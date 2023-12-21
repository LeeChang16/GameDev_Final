extends TextureProgressBar

#initialize player here

@export var enemy: hawk2
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.hawk2_healthChanged.connect(update)
	update()
	
	
func update():
	value = Globals.hawk2_currentHealth * 100 / Globals.hawk2_maxHealth
	
	print(Globals.hawk2_currentHealth)
	print(value)
