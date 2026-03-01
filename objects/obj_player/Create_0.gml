/// =======================
/// MOVEMENT
/// =======================
walk_speed = 4;
dash_speed = 5;
hsp = 0;

grav = 0.5;
vsp = 0;
jump_speed = -10;

max_jumps = 2;
jump_count = 0;

/// DOUBLE TAP
double_tap_time = 15;
left_tap_timer = 0;
right_tap_timer = 0;
left_tapped = false;
right_tapped = false;

/// DASH
dash_timer = 0;
dash_length = 10;

/// =======================
/// HEALTH + SHIELD
/// =======================
max_hp = 100;
hp = 100;

max_shield = 50;
shield = 50;

display_hp = hp;
damage_hp = hp;
display_shield = shield;

damage_amount = 10;
invincible_time = 30;
invincible_timer = 0;

pulse = 0;

/// =======================
/// DEATH
/// =======================
spawn_x = x;
spawn_y = y;
dead = false;
respawn_time = 90;
respawn_timer = 0;

/// CAMERA
cam = view_camera[0];