class_name Player extends CharacterBody3D

@onready var bowling_ball_spawner: Marker3D = $BowlingBallSpawner

@export var speed := 8.0
@export var force := 12.0

@export var bowling_ball_scene: PackedScene

var can_throw: bool = true

var inputs_finished: Array[String] = []
