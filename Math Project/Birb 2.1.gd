extends RigidBody2D

var is_shot := false
var does_object_need_force := true

var velocity := Vector2(600, -1000)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !is_shot:
		if Input.is_action_just_pressed("ui_left_click"):
		is_shot = true

if !is_shot:
	self.position.x = get_global_mouse_position().x
	self.linear_velocity = Vector2.ZERO
elif does_object_need_force:
	self.position.x = self.position.x
	self.linear_velocity = velocity
	does_object_need_force = false

var hit_bodies : = get_colliding_bodies();
for body in hit_bodies:
	if body.is_in_group("Brick"):
		body.queue_free()
	elif body.is_in_group("Lost Wall"):
		get_tree().reload_current_scene()
pass
