extends Node2D

class_name skeleton1
signal skeleton1_healthChanged

var speed = 50
var direction = Vector2.RIGHT
var change_direction_timer = 2.0
var is_alive = true
var has_died = false
const  SKELETON_DAMAGE = 20
var damage: int = SKELETON_DAMAGE

@onready var animation = $CollisionShape2D/AnimatedSprite2D
var is_player_inside = false
var has_attacked = false

func _process(delta):
	var adventurer = get_node("/root/Node2D/StaticBody2D/adventurer")
	if Globals.skeleton1_currentHealth <=0:
		is_alive = false
	if is_alive:
		if is_player_inside and not has_attacked:
			#direction = 0
			animation.scale.x = abs(animation.scale.x) * -1 
			animation.play("skeleton_attack")
			await animation.animation_finished
			#adventurer.take_damage(damage)
			has_attacked = true
			
		else:
			animation.scale.x = abs(animation.scale.x) * -1 
			animation.play("skeleton_idle") 
			has_attacked = false
			# Move the slime when the player is outside the area
			#var velocity = direction * speed * delta
			#position += velocity

			# Update the timer
			#change_direction_timer -= delta

			# Change direction when the timer reaches zero
			#if change_direction_timer <= 0:
			#	direction = -direction
			#	animation.play("skeleton_walk")
			#	animation.scale.x *= -1  # Flip the sprite to match the new direction
			#	change_direction_timer = 2.0  # Reset the timer
		
	else:
		if not has_died:
			get_node("CollisionShape2D/AnimatedSprite2D").play("skeleton_die")
			await get_node("CollisionShape2D/AnimatedSprite2D").animation_finished
			self.queue_free()
			has_died = true

func _on_area_2d_body_entered(body):
	if body.name == "adventurer":
		is_player_inside = true
		body.take_damage(damage)

func _on_area_2d_body_exited(body):
	if body.name == "adventurer":
		is_player_inside = false
		# Reset the direction and resume moving when the player exits the area
		#direction = Vector2.LEFT
		#change_direction_timer = 2.0
		#animation.play("skeleton_walk")
func enemy_take_damage(amount: int):
	Globals.skeleton1_currentHealth -= amount
	skeleton1_healthChanged.emit()
