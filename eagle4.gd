extends CharacterBody2D

class_name hawk4
signal hawk4_healthChanged

const eagle_damage = 20
var damage: int = eagle_damage
var speed = 70  
var direction = Vector2.LEFT
var change_direction_timer = 4.0 

var is_alive = true
var has_died = false

@onready var animation = get_node("CollisionShape2D/AnimatedSprite2D")

func _process(delta):
	if Globals.hawk4_currentHealth <= 0:
		is_alive = false
	var adventurer = get_node("/root/Node2D/StaticBody2D/adventurer") 
	
	if is_alive:
		var velocity = direction * speed * delta
		position += velocity
		animation.play("fly")

		change_direction_timer -= delta


		if change_direction_timer <= 0:
			direction = -direction
			animation.play("fly")
			animation.scale.x *= -1 
			change_direction_timer = 4.0  
	else:
		if not has_died:
			adventurer.hawk4_died = true
			get_node("CollisionShape2D/AnimatedSprite2D").play("die")
			await get_node("CollisionShape2D/AnimatedSprite2D").animation_finished
			self.queue_free()
			
			has_died = true


func _on_area_2d_body_entered(body):
	if body.name == "adventurer":
		body.take_damage(damage)
	


func _on_area_2d_body_exited(body):
	if body.name == "adventurer":
		pass


func enemy_take_damage(amount: int):
	Globals.hawk4_currentHealth -= amount
	hawk4_healthChanged.emit()
	print(Globals.hawk4_currentHealth)

	if Globals.hawk4_currentHealth <= 0:
		on_enemy_death()
		
func on_enemy_death():
	pass
