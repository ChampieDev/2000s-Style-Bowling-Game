extends Control

@onready var h_bar: TextureProgressBar = $TextureProgressBar
@onready var c_bar: TextureProgressBar = $TextureProgressBar2
@onready var anims: AnimationPlayer = $anims

@export var p_value: float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	h_bar.value = p_value
	c_bar.value = p_value
	
func play_anim(anim_name: String):
	print("yokodfea")
	$anims.play(anim_name)
 
