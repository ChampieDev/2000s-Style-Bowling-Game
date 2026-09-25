extends Node3D

@onready var ball_spawn_point: Marker3D = $BallSpawnPoint

var speed: float = 2.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_axis = Input.get_axis("left", "right")
	
	global_position.x += input_axis * speed * delta
