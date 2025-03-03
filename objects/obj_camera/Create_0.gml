
// Evento Create
target = obj_player; // Define o alvo da câmera (o jogador)
camera_speed = 1; // Velocidade de suavização da câmera (ajuste conforme necessário)

// Inicializa as variáveis da câmera
cam_x = camera_get_view_x(view_camera[0]); // Posição X inicial da câmera
cam_y = camera_get_view_y(view_camera[0]); // Posição Y inicial da câmera
