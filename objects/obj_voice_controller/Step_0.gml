// Press Q to play the Intro Voice (14s)
if (keyboard_check_pressed(ord("Q"))) {
    // Stop other sounds first so they don't overlap
    audio_stop_all(); 
    audio_play_sound(snd_intro, 10, false);
}

// Press W to play the Background Music
if (keyboard_check_pressed(ord("W"))) {
    audio_stop_all();
    audio_play_sound(snd_bg, 5, true); // 'true' makes it loop
}

// Press E to play the Outro
if (keyboard_check_pressed(ord("E"))) {
    audio_stop_all();
    audio_play_sound(snd_outro, 10, false);
}