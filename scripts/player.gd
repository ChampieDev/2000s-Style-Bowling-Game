extends CharacterBody3D

var speed: int = 1

func _process(delta: float) -> void:
	
	#var input = Input.get_axis("left", "right")
	#
	#velocity.x = lerp(velocity.x, input * speed, 0.2)
	#
	#position.x = clampf(position.x, -0.5, 0.5)
	
	move_and_slide()
