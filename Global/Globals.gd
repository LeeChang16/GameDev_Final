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

#=======
#>>>>>>> 58ead0fd782866083d8dda00362f781baf85dfc6
# Called when the node enters the scene tree for the first time.
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
