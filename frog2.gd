extends Node2D

var speed = 50  # Adjust the speed as needed
var direction = Vector2.LEFT
var change_direction_timer = 3.0  # Adjust the time interval for changing direction

const health = 30
var addhealth : int = health
var attacked

@onready var animation = get_node("CollisionShape2D/AnimatedSprite2D")

func _process(delta):
	attacked = Globals.frog2_is_attacked
	if not attacked:
		# Move the frog
		var velocity = direction * speed * delta
		position += velocity
		animation.play("frog_jump")

		# Update the timer
		change_direction_timer -= delta

	# Change direction when the timer reaches zero
		if change_direction_timer <= 0:
			direction = -direction
			animation.play("frog_jump")
			animation.scale.x *= -1  # Flip the sprite to match the new direction
			change_direction_timer = 3.0  # Reset the timer

	elif attacked:
		animation.play("die")
		await animation.animation_finished
		animation.play("cherry")
		
func _on_area_2d_body_entered(body):
	if body.name == "adventurer":
		if attacked:
			body.add_health(addhealth)
			self.queue_free()
	pass # Replace with function body.
