if (other.invincible_timer <= 0) {
    other.hp -= 2.0; // Take 2 whole circles away
    other.invincible_timer = other.invincible_duration;
    other.v_spd = -7; // Jump the player up
}