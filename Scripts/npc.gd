extends CharacterBody3D


const SPEED = 1.5

@export var current_target : Node3D
@export var look_target : Node3D

@export var for_movement : Node3D


func _ready() -> void:
	look_target.set_target(current_target.get_pos())


func _process(delta: float) -> void:
	if (current_target.get_pos() - global_position).length() < 0.1:
		current_target = current_target.get_next()
		look_target.set_target(current_target.get_pos())


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if look_target.rotation.y < 0 && self.global_rotation.y > 1.3:
		look_target.rotation.y += TAU
	
	rotation.y = lerp(rotation.y, look_target.rotation.y, 0.07)
	
	velocity = (for_movement.global_position - global_position).normalized() * SPEED
	
	
	move_and_slide()
