extends TextureProgressBar

#initialize player here

@export var enemy: skeleton2
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.skeleton2_healthChanged.connect(update)
	update()
	
func update():
	value = Globals.skeleton2_currentHealth * 100 / Globals.skeleton2_maxHealth
	print(Globals.skeleton2_currentHealth)
	print(value)
