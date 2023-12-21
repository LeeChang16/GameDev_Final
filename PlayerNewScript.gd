extends CharacterBody2D

class_name adventurer

signal healthChanged
signal collectShard
#commnet  
var SPEED = 300.0
var JUMP_VELOCITY = -580.0

#Double Jump
var prevX=0
var prevY=0
var has_double_jump=false
var animation_locked= false
var direction
var was_in_air= false
var facing_right=true
var new_game=false;

#To give priority to the current animation and pause other animation
var animation_play = true

#Shard Bar
#@export var collected = 0
#@export var maxShard = 6
#@onready var currentShard: int = collected

#Health Bar
#@export var maxHealth = 100
#@onready var currentHealth: int = maxHealth



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#audio_effects
var hit
var air_hit
var jump_audio

var is_alive = true
var die_locked = false
var has_attacked = false
var enemy_inside = false

var slime1
var enemy1 = false
var slime2
var enemy2 = false
var slime3
var enemy3 = false
var slime4
var enemy4 = false
var slime5
var enemy5 = false
var slime6
var enemy6 = false
var slime7
var enemy7 = false


var hawk1
var hawk1_enemy = false
var hawk2
var hawk2_enemy = false
var hawk3
var hawk3_enemy = false
var hawk4
var hawk4_enemy = false
var hawk5
var hawk5_enemy = false


var mushroom1
var mushroom1_enemy = false
var mushroom2
var mushroom2_enemy = false
var mushroom3
var mushroom3_enemy = false

var skeleton1
var skeleton1_enemy = false
var skeleton2
var skeleton2_enemy = false


var slime7_died = false
var slime6_died = false
var hawk1_died = false
var hawk2_died = false
var hawk3_died = false
var hawk4_died = false
var hawk5_died = false

const PLAYER_DAMAGE_AMOUNT = 20
var damage: int = PLAYER_DAMAGE_AMOUNT

@onready var anim= get_node("CollisionShape2D/AnimatedSprite2D")
func _ready():	
	
	
	
	hit = get_node("CollisionShape2D/AnimatedSprite2D/hit")
	air_hit = get_node("CollisionShape2D/AnimatedSprite2D/air_hit")
	jump_audio = get_node("CollisionShape2D/AnimatedSprite2D/jump")
	
	slime1 = get_node("/root/Node2D/StaticBody2D/slime1")
	slime2 = get_node("/root/Node2D/StaticBody2D/slime2")
	slime3 = get_node("/root/Node2D/StaticBody2D/slime3") 
	slime4 = get_node("/root/Node2D/StaticBody2D/slime4")
	slime5 = get_node("/root/Node2D/StaticBody2D/slime5")
	slime6 = get_node("/root/Node2D/StaticBody2D/slime6")
	slime7 = get_node("/root/Node2D/StaticBody2D/slime7")
	
	hawk1 = get_node("/root/Node2D/StaticBody2D/Hawk1")
	hawk2 = get_node("/root/Node2D/StaticBody2D/Hawk2")
	hawk3 = get_node("/root/Node2D/StaticBody2D/Hawk3")
	hawk4 = get_node("/root/Node2D/StaticBody2D/Hawk4")
	hawk5 = get_node("/root/Node2D/StaticBody2D/Hawk5")
	
	mushroom1 = get_node("/root/Node2D/StaticBody2D/mushroom")
	mushroom2 = get_node("/root/Node2D/StaticBody2D/mushroom2")
	mushroom3 = get_node("/root/Node2D/StaticBody2D/mushroom3")
	
	skeleton1 = get_node("/root/Node2D/StaticBody2D/skeleton")
	skeleton2 = get_node("/root/Node2D/StaticBody2D/skeleton2")
	
	if animation_play and is_alive:
		anim.play('idle')
	else:
		anim.play("die")
		
func _process(delta):

	if Globals.currentHealth <= 0:
		is_alive = false

	if is_alive:
		if not is_on_floor():
			velocity.y += gravity * delta
			was_in_air=true
		
		else:
			has_double_jump=false
			if was_in_air:
				land()	
				was_in_air=false;
	
		if Input.is_action_just_pressed("attack"):
			attack()
		
		if position.y >900:
			is_alive = false
			
		
	
		if Input.is_action_just_pressed("ui_accept"):
		#double jump
			if is_on_floor():
				jump()
			elif not has_double_jump:
				double_jump()
			
			
		direction = Input.get_axis("ui_left", "ui_right")		
		#animation for jump
		if not is_on_floor():
			jump_anim(delta)
#			jump_anim(delta)	
		prevX= position.x
		prevY=position.y
		
		move_and_slide()
		update_facing_sprite()
		update_animation()
		
		if enemy_inside and has_attacked:
			if enemy1:
				slime1.enemy_take_damage(damage)
				has_attacked = false
			if enemy2:
				slime2.enemy_take_damage(damage)
				has_attacked = false
			if enemy3:
				slime3.enemy_take_damage(damage)
				has_attacked = false
			if enemy4:
				slime4.enemy_take_damage(damage)
				has_attacked = false
			if enemy5:
				slime5.enemy_take_damage(damage)
				has_attacked = false
			if enemy6 and not slime6_died:
				slime6.enemy_take_damage(damage)
				has_attacked = false
			if enemy7 and not slime7_died:
				slime7.enemy_take_damage(damage)
				has_attacked = false				
								
								
			if hawk1_enemy and not hawk1_died:
				hawk1.enemy_take_damage(damage)
				has_attacked = false
			if hawk2_enemy and not hawk2_died:
				hawk2.enemy_take_damage(damage)
				has_attacked = false
			if hawk3_enemy and not hawk3_died:
				hawk3.enemy_take_damage(damage)
				has_attacked = false
			if hawk4_enemy and not hawk4_died:
				hawk4.enemy_take_damage(damage)
				has_attacked = false
			if hawk5_enemy and not hawk5_died:
				hawk5.enemy_take_damage(damage)
				has_attacked = false
				
			if mushroom1_enemy:
				mushroom1.enemy_take_damage(damage)
				print("kanahan ka")
				has_attacked = false
			if mushroom2_enemy:
				mushroom2.enemy_take_damage(damage)
				print("lol")
				has_attacked = false
			if mushroom3_enemy:
				mushroom3.enemy_take_damage(damage)
				print("haysss")
				has_attacked = false

			if skeleton1_enemy:
				skeleton1.enemy_take_damage(damage)
				print("haysss")
				has_attacked = false
			if skeleton2_enemy:
				skeleton2.enemy_take_damage(damage)
				print("haysss")
				has_attacked = false
			
				
		else:
			has_attacked=false
		
	else:
		if not die_locked:
			anim.play("die")
			die_locked = true
			#get_tree().change_scene_to_file("res://game_over.tscn")
	
	
	
	
	
func update_animation():
	if not animation_locked:
		if direction:
			velocity.x = direction * SPEED
			if is_on_floor() and animation_play:
				anim.play('run')	
#				print(direction)	
				
				print("pressed run")
		else:
			if is_on_floor() and animation_play: 
				
				anim.play('idle')
					
					
				velocity.x = move_toward(velocity.x, 0, SPEED)
	#		else:
	#			velocity.x = move_toward(velocity.x, 0, SPEED)	
		
func update_facing_sprite():
	if direction:
		if direction < 0: # Check if moving left
			anim.flip_h = true # Flip the character horizontally
			facing_right=false
		else:
			anim.flip_h = false # Otherwise, don't flip
			facing_right=true
			
func jump_anim(delta):
	if not animation_locked:
		if position.y<prevY:
			anim.play("jump_air")
		else:
			anim.play("jump_down")
			velocity.x = direction * SPEED*0.5
			
	
	
func jump():
	anim.play("jump_up")
	jump_audio.play()
	velocity.y = JUMP_VELOCITY
	animation_locked=true
	
func double_jump():
	anim.play("jump_double")
	jump_audio.play()
	velocity.y = JUMP_VELOCITY*0.7
	has_double_jump=true
	animation_locked=true
	
func land():
	anim.play("jump_land")
	velocity.x = move_toward(velocity.x, 0, SPEED)
	








#Function to handle the Player's Attack
func attack():
	# Check if the character is on the ground
	if is_on_floor():
		# Play attack animation
		animation_play = false	
		anim.play("attack_1")
		has_attacked = true
		hit.play()
		
		print("Land_Attack")
		# Add logic to deal damage to enemies or perform other attack actions
		# For simplicity, let's assume dealing damage to an enemy (you should replace this logic)
		
	else:
		has_attacked = true
		animation_play = false
		get_node("CollisionShape2D/AnimatedSprite2D").play("air_attack_1")
		await get_node("CollisionShape2D/AnimatedSprite2D").animation_finished
		has_attacked = false
		air_hit.play()
		
		print("Air Attack")









func deal_damage_to_enemy():
	pass


func collect_shard(amount: int):
	Globals.currentShard +=amount
	collectShard.emit()
	
	#to handle adtional logics
	if Globals.currentShard == Globals.maxShard:
		pass



# Function to handle the player taking damage
func take_damage(amount: int):
	Globals.currentHealth -= amount
	print(Globals.currentHealth)
	healthChanged.emit()
	# Ensure health doesn't go below zero
	#currentHealth = max(0, currentHealth)
	
	# Emit the healthChanged signal with the updated health values
	#emit_signal("healthChanged", currentHealth, maxHealth)

	# Add logic to handle player death if needed
	if Globals.currentHealth == 0:
		on_player_death()



# Add any additional logic for player death here
func on_player_death():
	# For example, reload the scene or show a game over screen
	pass




#Function to handle the animation lock
func _on_animated_sprite_2d_animation_finished():
#	print("anim",anim.animation)
	if(anim.animation=="jump_down"):
		animation_locked=false
		print("jump_down")
	if(anim.animation=="jump_up"):
		animation_locked=false
		print("jump_up")
	if(anim.animation=="jump_double"):
		animation_locked=false
		print("jump_double")
	if(anim.animation=="jump_land"):
		animation_locked=false
		print("jump_land")
	
	if(anim.animation == "die_fall"):
		get_tree().change_scene_to_file("res://game_over.tscn")
	if(anim.animation == "die"):
		get_tree().change_scene_to_file("res://game_over.tscn")
		
		
		
	#To handle the attack animations
	if(anim.animation=="run_punch"):
		animation_play=true
	if(anim.animation=="attack_1"):
		animation_play=true
	if(anim.animation=="air_attack_1"):
		animation_play=true


func _on_attack_range_body_entered(body):
	if body.name == "slime1":
		enemy_inside = true
		enemy1 = true
	if body.name == "slime2":
		enemy_inside = true
		enemy2 = true
	if body.name == "slime3":
		enemy_inside = true
		enemy3 = true
	if body.name == "slime4":
		enemy_inside = true
		enemy4 = true
	if body.name == "slime5":
		enemy_inside = true
		enemy5 = true	
	if body.name == "slime6":
		enemy_inside = true
		enemy6 = true
	if body.name == "slime7":
		enemy_inside = true
		enemy7 = true



	if body.name == "Hawk1":
		enemy_inside = true
		hawk1_enemy = true
	if body.name == "Hawk2":
		enemy_inside = true
		hawk2_enemy = true
	if body.name == "Hawk3":
		enemy_inside = true
		hawk3_enemy = true
	if body.name == "Hawk4":
		enemy_inside = true
		hawk4_enemy = true
	if body.name == "Hawk5":
		enemy_inside = true
		hawk5_enemy = true
		
	if body.name == "mushroom":
		enemy_inside = true
		mushroom1_enemy = true
	if body.name == "mushroom2":
		enemy_inside = true
		mushroom2_enemy = true
	if body.name == "mushroom3":
		enemy_inside = true
		mushroom3_enemy = true
		
	if body.name == "skeleton":
		enemy_inside = true
		skeleton1_enemy = true
	if body.name == "skeleton2":
		enemy_inside = true
		skeleton2_enemy = true

func _on_attack_range_body_exited(body):
	if body.name == "slime1":
		enemy_inside = false
		enemy1 = false
	if body.name == "slime2":
		enemy_inside = false
		enemy2 = false
	if body.name == "slime3":
		enemy_inside = false
		enemy3 = false
	if body.name == "slime4":
		enemy_inside = false
		enemy4 = false
	if body.name == "slime5":
		enemy_inside = false
		enemy5 = false	
	if body.name == "slime6":
		enemy_inside = false
		enemy6 = false	
	if body.name == "slime7":
		enemy_inside = false
		enemy7 = false	
		
	if body.name == "Hawk1":
		enemy_inside = false
		hawk1_enemy = false
	if body.name == "Hawk2":
		enemy_inside = false
		hawk2_enemy = false
	if body.name == "Hawk3":
		enemy_inside = false
		hawk3_enemy = false
	if body.name == "Hawk4":
		enemy_inside = false
		hawk4_enemy = false
	if body.name == "Hawk5":
		enemy_inside = false
		hawk5_enemy = false
		
	if body.name == "mushroom":
		enemy_inside = false
		mushroom1_enemy = false
	if body.name == "mushroom2":
		enemy_inside = false
		mushroom2_enemy = false
	if body.name == "mushroom3":
		enemy_inside = false
		mushroom3_enemy = false
	
	if body.name == "skeleton":
		enemy_inside = false
		skeleton1_enemy = false
	if body.name == "skeleton2":
		enemy_inside = false
		skeleton2_enemy = false

	
	
