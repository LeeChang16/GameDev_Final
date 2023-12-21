extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Portal").play("final_portal")
	get_node("Portal2").play("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
