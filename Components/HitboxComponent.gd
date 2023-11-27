extends Area2D
class_name HitboxComponent

func _ready():
	self.area_entered.connect(_on_area_entered)
	
func _on_area_entered(area: Area2D):
	if area is HurtboxComponent:
		print("Hurtbox hit")

