extends Node2D

class_name mushroom2 

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal mushroom2_healthChanged
var gravity = 500
var speed = 200
var direction = Vector2.ZERO  # Initially set to zero for idle state

@onready var animation = get_node("CharacterBody2D/CollisionShape2D/AnimatedSprite2D")

const MUSHROOM_DAMAGE_AMOUNT = 10
var damage: int = MUSHROOM_DAMAGE_AMOUNT
var is_player_inside = false
var is_alive = true
var has_died = false
var can_attack = false
var has_attacked

func _process(delta):

	if Globals.mushroom2_currentHealth <= 0:
		is_alive = false
	
	if is_alive:
		if is_player_inside:
			var adventurer = get_node("/root/Node2D/StaticBody2D/adventurer")  # Adjust the path accordingly
			# Move towards the player when inside the follow range
			direction = adventurer.position - position 
			direction = direction.normalized()
			# Disregard vertical movement
			direction.y = 0
			# Play the follow animation
			animation.play("mushroom_run")

		# Check if the player is on the ground before updating the slime's position
			if adventurer.is_on_floor() and not can_attack:
				# Move the slime based on the direction
				var velocity = direction * speed * delta
				position.x += velocity.x  # Only update the horizontal position

			# Flip the sprite based on the movement direction
				if direction.x > 0:
					animation.scale.x = abs(animation.scale.x)   # Flip horizontally
				if direction.x < 0:
					animation.scale.x = abs(animation.scale.x) * -1  # Reset to original scale
		else:
			# Handle the case where the player is outside the follow range
			direction = Vector2.ZERO
			animation.play("mushroom_idle")
	
			# Reset the sprite scale when idle
			animation.scale.x = abs(animation.scale.x)
	else:
		if not has_died:
			get_node("AnimatedSprite2D").play("mushroom_die")
			await get_node("AnimatedSprite2D").animation_finished
			self.queue_free()
			has_died = true
		#else:
		#queue_free()
			
func _on_area_2d_body_entered(body):
	if body.name =="adventurer":
		is_player_inside = true
		

func _on_area_2d_body_exited(body):
	if body.name == "adventurer":
		is_player_inside = false
		


func _on_attack_area_body_entered(body):
	if body.name == "adventurer":
	#	can_attack = true
		#animation.play("slime_attack")
		get_node("CharacterBody2D/CollisionShape2D/AnimatedSprite2D").play("mushroom_attack")
		#await get_node("AnimatedSprite2D").animation_finished
		body.take_damage(damage)
		#await get_tree().create_timer(1.0).timeout

		
	
func enemy_take_damage(amount: int):
	Globals.mushroom2_currentHealth -= amount
	mushroom2_healthChanged.emit()
	print(Globals.mushroom2_currentHealth)

	if Globals.mushroom2_currentHealth <= 0:
		on_enemy_death()
		
func on_enemy_death():
	pass


func _on_attack_area_body_exited(body):
	if body.name == "adventurer":
		#can_attack = false
		pass
