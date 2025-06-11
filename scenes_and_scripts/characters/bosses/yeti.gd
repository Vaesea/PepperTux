extends Boss

# Yeti will work like this:
# 1. After standing for a certain amount of time, he'll start throwing 5 times.
# 2. When he takes damage, he'll start walking / running to the other side.
# 3. When he reaches the other side, it repeats.

# Movement
var speed = 350
var jump_force = -576

# Iframes
var invincibility = 1

# States
enum States {Standing, Walking, Throwing}
var current_state = States.Standing

# Ice Bullet
const ice_bullet = preload("res://scenes_and_scripts/characters/enemies/projectiles/ice_bullet.tscn")
var can_shoot = true
var cooldown = 1

# Direction
var direction = 1
var facing_direction = 1

# Throwing
var max_throws = 5
var throws_remaining = 5

# Other
var is_alive = true
var is_doing_yeti_stuff = false
