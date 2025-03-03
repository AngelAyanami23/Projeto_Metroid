// Evento Step do obj_enemy
// Aplicar gravidade
velocidade_y += gravidade;

// Verificar colisão vertical (gravidade) com obj_ground
if (place_meeting(x, y + velocidade_y, obj_ground)) {
    while (place_meeting(x, y + sign(velocidade_y), obj_ground)) {
        y -= sign(velocidade_y);
    }
    velocidade_y = 0;
} else {
    y += velocidade_y;
}

// Verificar se há obj_ground abaixo antes de se mover horizontalmente
var pode_mover = true;
if (!place_meeting(x + (velocidade_x * direcao), y + 1, obj_ground)) {
    pode_mover = false; // Não há chão abaixo, não pode se mover
}

// Movimentação horizontal (apenas se houver chão abaixo)
if (pode_mover) {
    x += velocidade_x * direcao;
}

// Verificar colisão horizontal com obj_wall
if (place_meeting(x + (velocidade_x * direcao), y, obj_wall)) {
    direcao *= -1;

    // Mudar a sprite e a escala conforme a direção
    if (direcao == 1) {
        sprite_index = sprite_direita;
        image_xscale = 1;
    } else {
        sprite_index = sprite_esquerda;
        image_xscale = -1;
    }
}

// Verificar colisão horizontal com obj_ground (opcional)
if (place_meeting(x + (velocidade_x * direcao), y, obj_ground)) {
    direcao *= -1;

    // Mudar a sprite e a escala conforme a direção
    if (direcao == 1) {
        sprite_index = sprite_direita;
        image_xscale = 1;
    } else {
        sprite_index = sprite_esquerda;
        image_xscale = -1;
    }
}
if (hp = 0)
{
	instance_destroy();
}