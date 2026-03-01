if (instance_exists(target)) {
    var _tx = clamp(target.x - cam_width/2, 0, room_width - cam_width);
    var _ty = clamp(target.y - cam_height/2, 0, room_height - cam_height);
    var _cx = camera_get_view_x(view_camera[0]);
    var _cy = camera_get_view_y(view_camera[0]);
    camera_set_view_pos(view_camera[0], lerp(_cx, _tx, smooth_speed), lerp(_cy, _ty, smooth_speed));
}