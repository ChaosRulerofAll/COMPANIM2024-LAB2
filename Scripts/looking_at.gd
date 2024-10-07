extends Node3D


var target : Vector3
@export var pos : CharacterBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.look_at(target)
	position = pos.position

func  set_target(p : Vector3):
	target = p
