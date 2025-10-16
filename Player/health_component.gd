extends Node
class_name HealthComponent

signal defeat()
signal health_changed()

@export var body: PhysicsBody3D

var max_health: float
var current_health: float:
	set(value):
		current_health = max(value, 0.0)
		if current_health == 0.0:
			defeat.emit()
		health_changed.emit()

func update_max_health(max_hp_in: float) -> void:
	max_health = max_hp_in
	current_health = max_health
	
func take_damage(damage_in: float, is_critical: bool) -> void:
	var damage = damage_in
	var damage_color: Color = Color.WHITE
	if is_critical:
		damage *= 2.0
		damage_color = Color.RED
	current_health -= damage
	VfxManager.spawn_damage_number(damage, damage_color, body.global_position)

func is_alive() -> bool:
	if current_health == 0:
		return false
	return true
