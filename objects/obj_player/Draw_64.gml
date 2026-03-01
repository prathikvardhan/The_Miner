/// ===============================
/// HEALTH BAR SETTINGS
/// ===============================
var bar_x = 40;
var bar_y = 40;
var bar_w = 300;
var bar_h = 28;

var percent = display_hp / max_hp;
var damage_percent = damage_hp / max_hp;
var shield_percent = display_shield / max_shield;


/// ===============================
/// LOW HP PULSE EFFECT
/// ===============================
if (hp < max_hp * 0.3)
{
    var glow = 0.6 + 0.4 * sin(pulse);
    draw_set_alpha(glow);
}
else
{
    draw_set_alpha(1);
}

/// ===============================
/// BACKGROUND SHADOW
/// ===============================
draw_set_color(make_color_rgb(20,20,20));
draw_roundrect(
    bar_x - 6,
    bar_y - 6,
    bar_x + bar_w + 6,
    bar_y + bar_h + 6,
    false
);


/// ===============================
/// DAMAGE LAG (Dark Red Behind)
/// ===============================
draw_set_color(make_color_rgb(120,0,0));
draw_roundrect(
    bar_x,
    bar_y,
    bar_x + (bar_w * damage_percent),
    bar_y + bar_h,
    false
);


/// ===============================
/// MAIN HP BAR (Gradient)
/// ===============================
draw_rectangle_colour(
    bar_x,
    bar_y,
    bar_x + (bar_w * percent),
    bar_y + bar_h,
    make_color_rgb(0,220,120),
    make_color_rgb(0,150,255),
    make_color_rgb(0,150,255),
    make_color_rgb(0,220,120),
    false
);


/// ===============================
/// SHIELD BAR (Above HP)
/// ===============================
draw_set_color(make_color_rgb(0,150,255));
draw_roundrect(
    bar_x,
    bar_y - 12,
    bar_x + (bar_w * shield_percent),
    bar_y - 4,
    false
);


/// ===============================
/// BORDER
/// ===============================
draw_set_color(c_white);
draw_roundrect(
    bar_x,
    bar_y,
    bar_x + bar_w,
    bar_y + bar_h,
    true
);


/// ===============================
/// HP TEXT
/// ===============================
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text(
    bar_x + bar_w/2,
    bar_y + bar_h/2,
    string(round(hp)) + " / " + string(max_hp)
);