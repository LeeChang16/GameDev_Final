extends TextureProgressBar

#initialize player here

@export var enemy: hawk5
#var adventurer 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	enemy.hawk5_healthChanged.connect(update)
	update()
	
	
func update():
	value = Globals.hawk5_currentHealth * 100 / Globals.hawk5_maxHealth
	
	print(Globals.hawk5_currentHealth)
	print(value)
