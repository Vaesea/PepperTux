extends CharacterBody2D

# States
enum States {Normal, Fire}
var current_state = States.Normal

# Health
var max_health = 3
var health = 0
var can_take_damage = true
