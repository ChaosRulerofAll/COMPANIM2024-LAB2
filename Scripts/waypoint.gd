class_name Waypoint
extends Node3D


var Pos : Vector3

@export var Adjacents : Array[Node3D]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Pos = global_position


func get_pos() -> Vector3:
	return Pos


func get_next() -> Node3D:
	var n = randi() % Adjacents.size()
	
	print("NEXT!")
	
	return Adjacents[n]
