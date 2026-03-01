// --- HEART DISPLAY SETTINGS ---
var _margin  = 40; // Distance from top-left of screen
var _spacing = 40; // Space between each heart
var _size    = 12; // Radius of the heart circle

// Loop through each heart based on max_hp
for (var i = 0; i < max_hp; i++) {
    var _lx = _margin + (i * _spacing);
    var _ly = _margin;
    
    // 1. DRAW THE BLACK OUTLINE (The "Container")
    draw_set_color(c_black);
    draw_circle(_lx, _ly, _size + 2, false);
    
    // 2. DRAW THE RED FILLING
    if (hp > i) {
        draw_set_color(c_red);
        
        // Check if this specific heart is a "half-heart"
        if (hp < i + 1) { 
            draw_circle(_lx, _ly, _size * 0.7, false); // Smaller circle for partial health
        } else {
            draw_circle(_lx, _ly, _size, false); // Full circle
        }
    }
}

// Reset color to white so other game text/objects aren't red
draw_set_color(c_white);