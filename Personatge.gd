extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat := 350
var moviment := Vector2.ZERO
var gravetat := Vector2.DOWN * 800
var direccio := Vector2.ZERO
var salt := 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta): 
	direccio.x = 0
	moviment.x = 0
	moviment += gravetat*delta
	if Input.is_action_pressed("ui_right"):
		direccio += Vector2.RIGHT
		$Label.text = "DRETA"
	if Input.is_action_pressed("ui_left"):
		direccio += Vector2.LEFT
		$Label.text = "ESQUERRA"
	if Input.is_action_pressed("ui_up") and is_on_floor():
		$Label.text = "SALTA"
		moviment.y = -salt

	moviment += direccio.normalized() * velocitat
	moviment = move_and_slide(moviment, Vector2.UP)
