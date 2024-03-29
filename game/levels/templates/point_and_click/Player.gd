extends CharacterBody2D

@export var player_speed: float = 400.0

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var navigation_region = $NavigationRegion2D
var navigation_target: Vector2

# This code is copy&paste code from doc. Basically a proof of concept.
func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	$AnimatedSprite2D.play("idle")

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(navigation_target)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

#func _physics_process(delta):
	#if (Input.is_action_pressed("LMB")):
		#navigation_target = get_viewport().get_mouse_position()
		#navigation_agent.target_position = navigation_target
		#
		## flip a sprite if target is the other way
		#var flip = position.direction_to(navigation_target).x < 0
		#$AnimatedSprite2D.flip_h = flip
		#
		#$AnimatedSprite2D.play("walk")
	#
	#if navigation_agent.is_navigation_finished():
		#$AnimatedSprite2D.play("idle")
		#return
	#
	#var current_agent_position: Vector2 = global_position
	#var next_path_position: Vector2 = navigation_agent.get_next_path_position()
#
	#velocity = current_agent_position.direction_to(next_path_position) * player_speed * delta
	#move_and_collide(velocity)
	

# object interaction logic 
func inspect():
	pass

func interact():
	pass

func communicate():
	pass
