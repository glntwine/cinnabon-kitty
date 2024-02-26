extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("LMB") && !visible):
		var viewport_size = get_viewport().size
		var mouse_position = get_viewport().get_mouse_position()
		
		if (viewport_size.y > mouse_position.y + size.y):
			position = mouse_position
		else:
			position = Vector2(mouse_position.x, mouse_position.y - size.y)
			
		visible = true
	
	if (Input.is_action_just_released("LMB")):
		visible = false
