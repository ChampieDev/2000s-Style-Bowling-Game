extends Control

@onready var h_bar: TextureProgressBar = $TextureProgressBar
@onready var c_bar: TextureProgressBar = $TextureProgressBar2

@export var p_value: int = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$anims.play("start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	h_bar.value = p_value
	c_bar.value = p_value
	
	
 
