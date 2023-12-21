extends TextureProgressBar

#initialize player here

@export var enemy: skeleton1
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.skeleton1_healthChanged.connect(update)
	update()
	
func update():
	value = Globals.skeleton1_currentHealth * 100 / Globals.skeleton1_maxHealth
	print(Globals.skeleton1_currentHealth)
	print(value)
