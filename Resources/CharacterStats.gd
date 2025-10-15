extends Resource
class_name CharacterStats

class Ability:
	var min_modifier: float
	var max_modifier: float
	
	var ability_score: int = 25:
		set(value):
			ability_score = clamp(value, 0, 100)
			
	func _init(min_value: float, max_value: float) -> void:
		min_modifier = min_value
		max_modifier = max_value
		
	func percentile_lerp(min_bound: float, max_bound: float) -> float:
		return lerp(min_bound, max_bound, ability_score / 100.0)
		
	func get_modifier() -> float:
		return percentile_lerp(min_modifier, max_modifier)

var level := 1
var xp := 0

# Damage bonus on attack.
var strength := Ability.new(2.0, 12.0)
# Movement speed.
var speed := Ability.new(3.0, 7.0)
# HP bonus per level.
var endurance := Ability.new(5.0, 25.0)
# Crit chance.
var agility := Ability.new(0.05, 0.25)

func get_base_speed() -> float:
	return speed.get_modifier()
