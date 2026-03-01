/// DEAD STATE
if (dead)
{
    respawn_timer--;
    if (respawn_timer <= 0)
    {
        x = spawn_x;
        y = spawn_y;
        hp = max_hp;
        shield = max_shield;
        dead = false;
    }
    exit;
}

/// GRAVITY
vsp += grav;
// Horizontal movement
var move_h = hsp;

while (move_h != 0)
{
    var step = sign(move_h);

    if (!place_meeting(x + step, y, obj_block) 
    && !place_meeting(x + step, y, obj_spikes))
    {
        x += step;
        move_h -= step;
    }
    else
    {
        hsp = 0;
        break;
    }
}
// Vertical movement
var move_v = vsp;

while (move_v != 0)
{
    var step = sign(move_v);

    if (!place_meeting(x, y + step, obj_block) 
    && !place_meeting(x, y + step, obj_spikes))
    {
        y += step;
        move_v -= step;
    }
    else
    {
        vsp = 0;
        break;
    }
}

/// DOUBLE TAP DASH
if (keyboard_check_pressed(vk_left)) {
    if (left_tapped && left_tap_timer > 0) {
        hsp = -dash_speed;
        dash_timer = dash_length;
    }
    left_tapped = true;
    left_tap_timer = double_tap_time;
}

if (keyboard_check_pressed(vk_right)) {
    if (right_tapped && right_tap_timer > 0) {
        hsp = dash_speed;
        dash_timer = dash_length;
    }
    right_tapped = true;
    right_tap_timer = double_tap_time;
}

if (left_tap_timer > 0) left_tap_timer--; else left_tapped = false;
if (right_tap_timer > 0) right_tap_timer--; else right_tapped = false;

/// DASH TRAIL
if (dash_timer > 0)
{
    dash_timer--;
    var t = instance_create_layer(x, y, layer, obj_dash_trail);
    t.sprite_index = sprite_index;
    t.image_index = image_index;
}

/// JUMP
if (keyboard_check_pressed(vk_space)) {
    if (jump_count < max_jumps) {
        vsp = jump_speed;
        jump_count++;
    }
}

/// HORIZONTAL COLLISION (BLOCK + SPIKES)
if (place_meeting(x + hsp, y, obj_block) || place_meeting(x + hsp, y, obj_spikes))
{
    while (!place_meeting(x + sign(hsp), y, obj_block) &&
           !place_meeting(x + sign(hsp), y, obj_spikes))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

/// VERTICAL COLLISION (BLOCK + SPIKES)
if (place_meeting(x, y + vsp, obj_block) || place_meeting(x, y + vsp, obj_spikes))
{
    while (!place_meeting(x, y + sign(vsp), obj_block) &&
           !place_meeting(x, y + sign(vsp), obj_spikes))
    {
        y += sign(vsp);
    }
    if (vsp > 0) jump_count = 0;
    vsp = 0;
}
y += vsp;

/// SPIKE DAMAGE
if (place_meeting(x, y, obj_spikes) && invincible_timer <= 0)
{
    var dmg = damage_amount;

    if (shield > 0)
    {
        shield -= dmg;
        if (shield < 0)
        {
            hp += shield;
            shield = 0;
        }
    }
    else
    {
        hp -= dmg;
    }

    invincible_timer = invincible_time;
}

if (invincible_timer > 0) invincible_timer--;


/// HEALTH SYSTEM
hp = clamp(hp, 0, max_hp);
shield = clamp(shield, 0, max_shield);

display_hp = lerp(display_hp, hp, 0.2);
display_shield = lerp(display_shield, shield, 0.2);

if (damage_hp > hp)
    damage_hp = lerp(damage_hp, hp, 0.05);
else
    damage_hp = hp;

/// LOW HP PULSE
if (hp < max_hp * 0.3)
    pulse += 0.15;
else
    pulse = 0;

/// DEATH
if (hp <= 0 && !dead)
{
    dead = true;
    respawn_timer = respawn_time;
}

/// VERY FAST ANIMATION
if (keyboard_check(vk_anykey))
{
    image_speed = 6;   // VERY FAST
}
else
{
    image_speed = 0;
}