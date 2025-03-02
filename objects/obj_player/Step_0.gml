// Evento Step
// Verifica as teclas pressionadas
var _left, _right, _jump;
_left = keyboard_check(inputs.left); // Verifica se a tecla A está pressionada
_right = keyboard_check(inputs.right); // Verifica se a tecla D está pressionada
_jump = keyboard_check_pressed(inputs.jump); // Verifica se a tecla K foi pressionada

// Calcula a velocidade horizontal
velh = (_right - _left) * vel;

// Rotação da sprite
if (velh != 0) {
    if (velh > 0) {
        image_xscale = 1; // Virar para a direita
    } else {
        image_xscale = -1; // Virar para a esquerda
    }
}

// Animação de caminhada, idle e pulo
if (!grounded) {
    sprite_index = sprite_jump; // Usa a sprite de pulo quando estiver no ar
} else if (velh != 0) {
    sprite_index = sprite_walk; // Usa a sprite de caminhada quando estiver se movendo
} else {
    sprite_index = sprite_idle; // Usa a sprite de idle quando estiver parado
}

// Aplicar gravidade
if (!grounded) {
    velv += grav; // Aumenta a velocidade vertical com a gravidade
} else {
    velv = 0; // Reseta a velocidade vertical quando no chão
}

// Pular
if (_jump && grounded) {
    velv = jump_force; // Aplica a força do pulo
    grounded = false; // Define como não estando no chão
}

// Atualizar posição
x += velh; // Movimento horizontal
y += velv; // Movimento vertical

// Verificar colisão com o chão (substitua "obj_ground" pelo seu objeto de chão)
if (place_meeting(x, y + 1, obj_ground)) {
    grounded = true; // Define como estando no chão
    y = y - (y mod 1); // Ajusta a posição para evitar ficar "preso" no chão
} else {
    grounded = false;
}