extends Resource
class_name CharacterStats

class Ability:
	var min_modifier: float
	var max_modifier: float
	
	var ability_score: int = 25:
		set(value):
			ability_score = clamp(value, 0, 100)
			
	func _init(min: float, max: float) -> void:
		min_modifier = min
		max_modifier = max

var level := 1
var xp := 0

var strength
var speed = Ability.new(3.0, 7.0)
var endurance
var agility
