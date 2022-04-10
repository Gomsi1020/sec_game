extends KinematicBody2D

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()

func read_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
		
	if Input.is_action_pressed("down"):
		velocity.y += 1
		direction = Vector2(0, 1)
		
	if Input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2(1, 0)
		
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200)



func _physics_process(delta):
	read_input()
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		
		# Level 1
		if collision.collider.name.begins_with("Statue"):
			var dialog = Dialogic.start("Statue_clue")
			add_child(dialog)
		if collision.collider.name.begins_with("Well"):
			var dialog = Dialogic.start("Well_clue")
			add_child(dialog)
		if collision.collider.name.begins_with("Chest"):
			var dialog = Dialogic.start("Chest_clue")
			add_child(dialog)
		if collision.collider.name.begins_with("Sign"):
			var dialog = Dialogic.start("Sign_start")
			add_child(dialog)
		if collision.collider.name.begins_with("Portal"):
			var dialog = Dialogic.start("Portal")
			add_child(dialog)
		
		# Level 2
		if collision.collider.name.begins_with("Guidance1"):
			var dialog = Dialogic.start("Guidance1")
			add_child(dialog)
		if collision.collider.name.begins_with("Guidance2"):
			var dialog = Dialogic.start("Guidance2")
			add_child(dialog)
		if collision.collider.name.begins_with("Alien1"):
			var dialog = Dialogic.start("Alien1")
			add_child(dialog)
		if collision.collider.name.begins_with("Alien2"):
			var dialog = Dialogic.start("Alien2")
			add_child(dialog)
		if collision.collider.name.begins_with("Alien3"):
			var dialog = Dialogic.start("Alien3")
			add_child(dialog)
		if collision.collider.name.begins_with("Doorway"):
			var dialog = Dialogic.start("Doorway")
			add_child(dialog)
			
		# Level 3
		if collision.collider.name.begins_with("Marker"):
			var dialog = Dialogic.start("Marker")
			add_child(dialog)
		if collision.collider.name.begins_with("Final"):
			var dialog = Dialogic.start("Final")
			add_child(dialog)
		
		
