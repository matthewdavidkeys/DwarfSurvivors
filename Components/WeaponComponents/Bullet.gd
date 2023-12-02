extends Area2D
class_name Bullet

var speed := 200
var direction = Vector2.ZERO
var damage

func _ready():
	self.area_entered.connect(_on_Bullet_area_entered)

func _process(delta):
	position += direction * speed * delta

func _on_Bullet_area_entered(area : Area2D):
	if area is HurtboxComponent:
		area.handleBulletCollision(self)
		bullet_delete()

func _on_Bullet_body_entered(body):
	#hit wall
	if body is TileMap:
		bullet_delete()

func bullet_delete():
	queue_free()
