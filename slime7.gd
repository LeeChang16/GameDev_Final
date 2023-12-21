extends Node2D

class_name slime7

signal slime7_healthChanged

var speed = 200
var direction = Vector2.ZERO  # Initially set to zero for idle state
# var follow_range = 350  # Adjust the range based on your needs
var gravity = 500  # Adjust the gravity strength based on your needs

#@export var maxHealth = 50
#@onready var currentHealth: int = maxHealth

@onready var animation = $AnimatedSprite2D

#var adventurer = get_node("/root/Node2D/StaticBody2D/adventurer")

const SLIME_DAMAGE_AMOUNT = 10
var damage: int = SLIME_DAMAGE_AMOUNT
var is_player_inside = false
var is_alive = true
var has_died = false
var can_attack = false
var has_attacked

func _process(delta):
	#print(currentHealth)
	var adventurer = get_node("/root/Node2D/StaticBody2D/adventurer")
	if Globals.slime7_currentHealth <= 0:
		is_alive = false
	
	if is_alive:
		
		# Check if the adventurer node is inside the slime's detection area
		if is_player_inside:
			# Get a reference to the adventurer node
			# Adjust the path accordingly
			# Move towards the player when inside the follow range
			direction = adventurer.position - position 
			direction = direction.normalized()
			# Disregard vertical movement
			direction.y = 0
			# Play the follow animation
			animation.play("slime_move")

		# Check if the player is on the ground before updating the slime's position
			if adventurer.is_on_floor() and not can_attack:
				# Move the slime based on the direction
				var velocity = direction * speed * delta
				position.x += velocity.x  # Only update the horizontal position

			# Flip the sprite based on the movement direction
				if direction.x > 0:
					animation.scale.x = abs(animation.scale.x) * -1  # Flip horizontally
				elif direction.x < 0:
					animation.scale.x = abs(animation.scale.x)  # Reset to original scale
		else:
			# Handle the case where the player is outside the follow range
			direction = Vector2.ZERO
			animation.play("slime_idle")
	
			# Reset the sprite scale when idle
			animation.scale.x = abs(animation.scale.x)
	else:
		if not has_died:
			adventurer.slime7_died = true
			get_node("AnimatedSprite2D").play("slime_die")
			await get_node("AnimatedSprite2D").animation_finished
			self.queue_free()
			has_died = true
			
func _on_area_2d_body_entered(body):
	if body.name =="adventurer":
		is_player_inside = true
		

func _on_area_2d_body_exited(body):
	if body.name == "adventurer":
		is_player_inside = false
		


func _on_attack_area_body_entered(body):
	if body.name == "adventurer":
	#	can_attack = true
		animation.play("slime_attack")
		body.take_damage(damage)
		#await get_tree().create_timer(1.0).timeout

		
	
func enemy_take_damage(amount: int):
	Globals.slime7_currentHealth -= amount
	slime7_healthChanged.emit()
	print(Globals.slime7_currentHealth)

	if Globals.slime7_currentHealth <= 0:
		on_enemy_death()
		
func on_enemy_death():
	pass


func _on_attack_area_body_exited(body):
	if body.name == "adventurer":
		#can_attack = false
		pass
