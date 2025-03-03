// Evento Step do obj_player
// Verifica as teclas pressionadas
var _left, _right, _jump, _attack;
_left = keyboard_check(inputs.left); // Verifica se a tecla A está pressionada
_right = keyboard_check(inputs.right); // Verifica se a tecla D está pressionada
_jump = keyboard_check_pressed(inputs.jump); // Verifica se a tecla K foi pressionada
_attack = keyboard_check_pressed(inputs.attack); // Verifica se a tecla Z foi pressionada

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

// Animação de caminhada, idle, pulo e ataque
if (_attack && !attacking) { // Verifica se a tecla Z foi pressionada e se não está atacando
    attacking = true; // Define que o jogador está atacando
    sprite_index = spr_player_attack; // Usa a sprite de ataque
    image_index = 0; // Reinicia a animação de ataque
    image_speed = 1; // Define a velocidade da animação como normal
} else if (attacking) { // Se estiver atacando, verifica se a animação terminou
    if (image_index >= sprite_get_number(spr_player_attack) - 1) { // Verifica se a animação terminou
        attacking = false; // Finaliza o ataque
        sprite_index = sprite_idle; // Volta para a sprite de idle (ou outra sprite padrão)
    }
} else if (!grounded) {
    sprite_index = sprite_jump; // Usa a sprite de pulo quando estiver no ar
} else if (velh != 0) {
    sprite_index = sprite_walk; // Usa a sprite de caminhada quando estiver se movendo
} else {
    sprite_index = sprite_idle; // Usa a sprite de idle quando estiver parado
}

// Verificar colisão com inimigos durante o ataque
if (attacking) {
    var enemy = instance_place(x, y, obj_enemy); // Verifica colisão com obj_enemy
    if (enemy != noone) { // Se houver colisão com um inimigo
        enemy.hp -= 1; // Reduz a vida do inimigo em 1
        if (enemy.hp <= 0) { // Se a vida do inimigo chegar a 0
            instance_destroy(enemy); // Destroi o inimigo
        }
    }
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

// Verificar colisão vertical (para cima e para baixo)
if (place_meeting(x, y + velv, obj_ground)) {
    // Colisão abaixo (caindo no chão)
    while (!place_meeting(x, y + sign(velv), obj_ground)) {
        y += sign(velv); // Move o objeto pixel por pixel até a colisão
    }
    velv = 0; // Reseta a velocidade vertical
    grounded = true; // Define como estando no chão
} else if (place_meeting(x, y + velv, obj_ground)) {
    // Colisão acima (subindo e atingindo um teto)
    while (!place_meeting(x, y + sign(velv), obj_ground)) {
        y += sign(velv); // Move o objeto pixel por pixel até a colisão
    }
    velv = 0; // Reseta a velocidade vertical
}

// Verificar colisão horizontal
if (place_meeting(x + velh, y, obj_ground)) {
    // Colisão à direita ou à esquerda
    while (!place_meeting(x + sign(velh), y, obj_ground)) {
        x += sign(velh); // Move o objeto pixel por pixel até a colisão
    }
    velh = 0; // Reseta a velocidade horizontal
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

if (invincible) {
    invincible_timer -= 1;
    if (invincible_timer <= 0) {
        invincible = false; // Desativa a invencibilidade

        // Verifica se a vida chegou a 0 após o término da invencibilidade
        if (global.life <= 0) {
            instance_destroy(); // Destroi o jogador (ou chama uma função de "morte")
            game_end(); // Ou qualquer outra ação
        }
    }

    // Piscar o sprite do jogador (opcional)
    image_alpha = (image_alpha == 1) ? 0.5 : 1;
} else {
    image_alpha = 1; // Restaura a opacidade normal
}