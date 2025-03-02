// Evento Step
if (instance_exists(target)) {
    // Calcula a posição desejada da câmera (centrada no jogador)
    var target_x = target.x - camera_get_view_width(view_camera[0]) / 2;
    var target_y = target.y - camera_get_view_height(view_camera[0]) / 2;

    // Interpola a posição da câmera para suavizar o movimento
    cam_x = lerp(cam_x, target_x, camera_speed);
    cam_y = lerp(cam_y, target_y, camera_speed);

    // Limites da câmera
    var cam_width = camera_get_view_width(view_camera[0]);
    var cam_height = camera_get_view_height(view_camera[0]);
room_width = room_width;
room_height = room_height;

    cam_x = clamp(cam_x, 0, room_width - cam_width);
    cam_y = clamp(cam_y, 0, room_height - cam_height);

    // Aplica a posição da câmera
    camera_set_view_pos(view_camera[0], cam_x, cam_y);
}