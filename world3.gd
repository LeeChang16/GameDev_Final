extends Node2D


#var anim = get_node("StaticBody2D/AnimatedSprite2D")
# Called when the node enters the scene tree for the first time.
@onready var shard1 = get_node("StaticBody2D/Shard1")
@onready var shard2 = get_node("StaticBody2D/Shard2")
@onready var shard3 = get_node("StaticBody2D/Shard3")
@onready var shard4 = get_node("StaticBody2D/Shard4")
@onready var shard5 = get_node("StaticBody2D/Shard5")
@onready var shard6 = get_node("StaticBody2D/Shard6")

@onready var portal = get_node("StaticBody2D/Portal")

var req1 = false
var req2 = false
var req3 = false
var req4 = false
var req5 = false
var req6 = false

func _ready():
	$StaticBody2D/AudioStreamPlayer
	shard1.hide()
	shard2.hide()
	shard3.hide()
	shard4.hide()
	shard5.hide()
	shard6.hide()

	portal.hide()

func _process(delta):
	if req1 and req2 and req3 and req4 and req5 and req6:
		portal.show()
		portal.play("final_portal")
		pass
	



func _on_s_1_body_entered(body):
	if body.name == "adventurer":
		if Globals.currentShard == Globals.maxShard:
			req1 = true
			shard1.show()
			shard1.play("shard")

func _on_s_2_body_entered(body):
	if body.name == "adventurer":
		if Globals.currentShard == Globals.maxShard:
			req2 = true
			shard2.show()
			shard2.play("shard")

func _on_s_3_body_entered(body):
	if body.name == "adventurer":
		if Globals.currentShard == Globals.maxShard:
			req3 = true
			shard3.show()
			shard3.play("shard")

func _on_s_4_body_entered(body):
	if body.name == "adventurer":
		if Globals.currentShard == Globals.maxShard:
			req4 = true
			shard4.show()
			shard4.play("shard")

func _on_s_5_body_entered(body):
	if body.name == "adventurer":
		if Globals.currentShard == Globals.maxShard:
			req5 = true
			shard5.show()
			shard5.play("shard")

func _on_s_6_body_entered(body):
	if body.name == "adventurer":
		if Globals.currentShard == Globals.maxShard:
			req6 = true
			shard6.show()
			shard6.play("shard")


func _on_area_2d_body_entered(body):
	if body.name == "adventurer":
		if req1 and req2 and req3 and req4 and req5 and req6:
			get_tree().change_scene_to_file("res://win.tscn")
	
