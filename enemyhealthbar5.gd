extends TextureProgressBar

#initialize player here

@export var enemy: slime5
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.slime5_healthChanged.connect(update)
	update()
	
	
func update():
	value = Globals.slime5_currentHealth * 100 / Globals.slime5_maxHealth
	print(Globals.slime5_currentHealth)
	print(value)
