// Evento Create
velh = 0; // Velocidade horizontal
velv = 0; // Velocidade vertical
vel = 5;  // Velocidade de movimentação horizontal
grav = 0.3; // Força da gravidade
jump_force = -8; // Força do pulo

inputs = {
    left : ord("A"),  // Tecla A para mover para a esquerda
    right : ord("D"), // Tecla D para mover para a direita
    jump : ord("K"),   // Tecla K para pular
	attack: ord("Z") // Tecla Z para atacar
};

grounded = false; // Verifica se o objeto está no chão

sprite_idle = spr_player_idle; // Sprite de idle (parado)
sprite_walk = spr_player_walk; // Sprite de caminhada
sprite_jump = spr_player_jump; // Sprite de pulo
image_speed = 0.5; // Velocidade da animação (ajuste conforme necessário)

global.life = 2; // Vida inicial
invincible = false; // Estado de invencibilidade
invincible_timer = 0; // Temporizador de invencibilidade

attacking = false;

// Evento Create
room_speed = 60; // Define o jogo para rodar a 60 FPS
image_speed = 1; // Define a velocidade normal das animações
vel = 2; // Define a velocidade horizontal do jogador