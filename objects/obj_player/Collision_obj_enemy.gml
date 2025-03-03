if (!invincible) {
    if (global.life > 0) {
        global.life -= 1;
        invincible = true; // Ativa a invencibilidade
        invincible_timer = 2* room_speed; // 3 segundos de invencibilidade
    }

    // Verifica se a vida chegou a 0 após a colisão
    if (global.life <= 0) {
        instance_destroy(); // Destroi o jogador (ou chama uma função de "morte")
        game_end(); // Ou qualquer outra ação
    }
}