extends Node


var test = 10


#<<<<<<< HEAD
#For PLayer

#=======
#>>>>>>> 58ead0fd782866083d8dda00362f781baf85dfc6
@export var collected = 0
@export var maxShard = 6
@onready var currentShard: int = collected

#Health Bar
@export var maxHealth = 100
@onready var currentHealth: int = maxHealth

#<<<<<<< HEAD

#For Enemy Slime
@export var slime1_maxHealth = 50
@onready var slime1_currentHealth: int = slime1_maxHealth

@export var slime2_maxHealth = 50
@onready var slime2_currentHealth: int = slime2_maxHealth

@export var slime3_maxHealth = 50
@onready var slime3_currentHealth: int = slime3_maxHealth

@export var slime4_maxHealth = 50
@onready var slime4_currentHealth: int = slime4_maxHealth

@export var slime5_maxHealth = 50
@onready var slime5_currentHealth: int = slime5_maxHealth

@export var slime6_maxHealth = 50
@onready var slime6_currentHealth: int = slime6_maxHealth

@export var slime7_maxHealth = 50
@onready var slime7_currentHealth: int = slime7_maxHealth



#For Hawk
@export var hawk1_maxHealth = 20
@onready var hawk1_currentHealth: int = hawk1_maxHealth

@export var hawk2_maxHealth = 20
@onready var hawk2_currentHealth: int = hawk2_maxHealth

@export var hawk3_maxHealth = 20
@onready var hawk3_currentHealth: int = hawk3_maxHealth

@export var hawk4_maxHealth = 20
@onready var hawk4_currentHealth: int = hawk4_maxHealth

@export var hawk5_maxHealth = 20
@onready var hawk5_currentHealth: int = hawk5_maxHealth


#Mushsroom
@export var mushroom1_maxHealth = 50
@onready var mushroom1_currentHealth: int = mushroom1_maxHealth

@export var mushroom2_maxHealth = 50
@onready var mushroom2_currentHealth: int = mushroom2_maxHealth

@export var mushroom3_maxHealth = 50
@onready var mushroom3_currentHealth: int = mushroom3_maxHealth

@export var skeleton1_maxHealth = 100
@onready var skeleton1_currentHealth: int = skeleton1_maxHealth

@export var skeleton2_maxHealth = 100
@onready var skeleton2_currentHealth: int = skeleton2_maxHealth
#=======
#>>>>>>> 58ead0fd782866083d8dda00362f781baf85dfc6
# Called when the node enters the scene tree for the first time.
@export var frog1_is_attacked = false
@export var frog2_is_attacked = false
@export var frog3_is_attacked = false
@export var frog4_is_attacked = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset_variables():
	#Player
	collected = 0
	currentShard = collected
	currentHealth = maxHealth
	
	#Frog
	frog1_is_attacked = false
	frog2_is_attacked = false
	frog3_is_attacked = false
	frog4_is_attacked = false
	
	#Slime
	slime1_currentHealth = slime1_maxHealth
	slime2_currentHealth = slime2_maxHealth
	slime3_currentHealth = slime3_maxHealth
	slime4_currentHealth = slime4_maxHealth
	slime5_currentHealth = slime5_maxHealth
	slime6_currentHealth = slime6_maxHealth
	slime7_currentHealth = slime7_maxHealth
	
	#Hawk
	hawk1_currentHealth = hawk1_maxHealth
	hawk2_currentHealth = hawk2_maxHealth
	hawk3_currentHealth = hawk3_maxHealth
	hawk4_currentHealth = hawk4_maxHealth
	hawk5_currentHealth = hawk5_maxHealth
	
	#Mushroom
	mushroom1_currentHealth = mushroom1_maxHealth
	mushroom2_currentHealth = mushroom2_maxHealth
	mushroom3_currentHealth = mushroom3_maxHealth
	
	skeleton1_currentHealth = skeleton1_maxHealth
	skeleton2_currentHealth = skeleton2_maxHealth
