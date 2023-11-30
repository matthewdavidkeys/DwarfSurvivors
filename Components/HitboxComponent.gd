extends Area2D
class_name HitboxComponent

signal hurtbox_hit(hurtbox : HurtboxComponent)
signal hurtbox_left(hurtbox : HurtboxComponent)

func _ready():
	self.area_entered.connect(_on_area_entered)
	self.area_exited.connect(_on_area_exited)
	
func _on_area_entered(area: Area2D):
	if area is HurtboxComponent:
		emit_signal("hurtbox_hit", area)

func _on_area_exited(area: Area2D):
	if area is HurtboxComponent:
		emit_signal("hurtbox_left", area)
