extends TextureProgressBar

#initialize player here

@export var enemy: hawk4
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.hawk4_healthChanged.connect(update)
	update()
	
	
func update():
	value = Globals.hawk4_currentHealth * 100 / Globals.hawk4_maxHealth
	
	print(Globals.hawk4_currentHealth)
	print(value)
