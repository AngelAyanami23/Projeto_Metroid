// Evento Step
lifespan -= 1;
if (lifespan <= 0) {
    instance_destroy(); // Destrói o objeto após o tempo de vida acabar
}