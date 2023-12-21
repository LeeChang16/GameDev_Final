extends TextureProgressBar

#initialize player here

@export var enemy: hawk3
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.hawk3_healthChanged.connect(update)
	update()
	
	
func update():
	value = Globals.hawk3_currentHealth * 100 / Globals.hawk3_maxHealth
	
	print(Globals.hawk3_currentHealth)
	print(value)
