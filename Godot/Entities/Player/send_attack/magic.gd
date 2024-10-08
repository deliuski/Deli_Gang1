extends Area2D

@export var speed = 200
@export var damage = 15

var direction:Vector2

func _ready():
	await get_tree().create_timer(2).timeout
	queue_free()

func set_direction(bulletDirection ,combos):
	if combos == 1:
		$AnimatedSprite2D.play("attack_1")
	else :
		$AnimatedSprite2D.play("attack_2")
		
	direction = bulletDirection
	rotation_degrees = rad_to_deg(global_position.angle_to_point(global_position+direction))

func _physics_process(delta):
	global_position += direction * speed * delta
	
	
func _on_body_entered(body):
	if body.has_method("enemy"):
		print("body mederleeeeee")
		var knockback_direction = (body.position - position).normalized() * -1
		body.take_damage(damage , knockback_direction)
		queue_free()
