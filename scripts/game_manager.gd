extends Node

class_name GameManager

const TIME_BONUS: int = 20

@onready var score_label: Label = $ScoreLabel
@onready var congrats_label: Label = $CongratsLabel

var score: int = 0
var start_time: float = 0.0
var bonus: int = 0

func _ready() -> void:
	start_time = Time.get_unix_time_from_system()

func add_point() -> void:
	score += 2

func calculate_final_score() -> void:
	var end_time: float = Time.get_unix_time_from_system()
	var elapsed_time: int = roundf(end_time - start_time)
	bonus += TIME_BONUS - elapsed_time
	var final_score = bonus + score if(bonus > 0) else score
	congrats_label.text = "Hooray! You made it in " + str(elapsed_time) + " seconds!"
	score_label.text = "Your score: " + str(final_score)
	
func _on_special_bonus_body_entered(body: Node2D) -> void:
	bonus += 20
