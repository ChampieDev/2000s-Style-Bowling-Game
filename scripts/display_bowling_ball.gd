extends Node3D

var speed: float = 2.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_axis = Input.get_axis("left", "right")
	
	global_position.x += input_axis * speed * delta
