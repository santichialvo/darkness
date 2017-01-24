extends RigidBody2D

var player
var feet
var jump_height = 	400
var move_speed = 	300

func _ready():
	set_process(true)
	feet = get_node("feet")
	feet.set_enabled(true)
	feet.add_exception(self)
	set_mode(2)
	self.get_node("Sprite").set_frame(0)
	
	
func _process(delta):
	if feet.is_colliding():
		print("lala")
		if Input.is_key_pressed(32):
			set_axis_velocity(Vector2(0,-jump_height))
		if Input.is_action_pressed("ui_right"):
			set_axis_velocity(Vector2(move_speed,0))
			if self.get_node("Sprite").get_frame() == self.get_node("Sprite").get_sprite_frames().get_frame_count(self.get_node("Sprite").get_animation())-1:
				self.get_node("Sprite").set_frame(0)
			else:
				self.get_node("Sprite").set_frame(self.get_node("Sprite").get_frame()+1)
			self.get_node("Sprite").set_flip_h(false)
		if Input.is_action_pressed("ui_left"):
			set_axis_velocity(Vector2(-move_speed,0))
			if self.get_node("Sprite").get_frame() == self.get_node("Sprite").get_sprite_frames().get_frame_count(self.get_node("Sprite").get_animation())-1:
				self.get_node("Sprite").set_frame(0)
			else:
				self.get_node("Sprite").set_frame(self.get_node("Sprite").get_frame()+1)
			self.get_node("Sprite").set_flip_h(true)
		if get_linear_velocity() == Vector2(0,0):
			self.get_node("Sprite").set_frame(7)

	if Input.is_key_pressed(81):
		get_tree().quit()
		
	if Input.is_key_pressed(82):
		get_tree().reload_current_scene()
		