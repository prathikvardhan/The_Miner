// Check if the next room actually exists to prevent errors
if (room_next(room) != -1) {
    room_goto_next();
}