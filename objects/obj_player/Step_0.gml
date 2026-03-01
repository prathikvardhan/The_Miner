// 1. INPUTS
var _key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left_tap  = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
var _key_right_tap = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var _key_jump  = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));

// 2. SPRINT
if (dash_timer_left > 0)  dash_timer_left--;
if (dash_timer_right > 0) dash_timer_right--;
if (_key_right_tap) { if (dash_timer_right > 0) dash_speed_multiplier = 2; dash_timer_right = dash_delay; }
if (_key_left_tap)  { if (dash_timer_left > 0)  dash_speed_multiplier = 2; dash_timer_left = dash_delay; }
if (!_key_left && !_key_right) dash_speed_multiplier = 1;

// 3. HORIZONTAL
h_spd = (_key_right - _key_left) * (move_speed * dash_speed_multiplier);
if (place_meeting(x + h_spd, y, obj_block)) {
    while (!place_meeting(x + sign(h_spd), y, obj_block)) { x += sign(h_spd); }
    h_spd = 0;
}
x += h_spd;

// 4. VERTICAL & JUMP
var is_grounded = place_meeting(x, y + 1, obj_block);
if (!is_grounded) { v_spd += grav; } else { v_spd = 0; jumps_current = 0; }
if (_key_jump && jumps_current < jumps_max) { v_spd = jump_force; jumps_current++; }

if (place_meeting(x, y + v_spd, obj_block)) {
    while (!place_meeting(x, y + sign(v_spd), obj_block)) { y += sign(v_spd); }
    v_spd = 0;
}
y += v_spd;

// 5. DAMAGE & i-FRAMES
if (invincible_timer > 0) { invincible_timer--; image_alpha = 0.5; } else { image_alpha = 1.0; }

if (place_meeting(x, y, obj_spikes) && invincible_timer <= 0) {
    hp -= 1.0;
    invincible_timer = invincible_duration;
    v_spd = -4;
}

// 6. DEATH
if (hp <= 0) {
    x = start_x; y = start_y; hp = max_hp; v_spd = 0; h_spd = 0;
}