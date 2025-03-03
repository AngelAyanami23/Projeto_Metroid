// Evento Draw GUI
var sprite_x = 10; // Posição X no canto esquerdo da tela
var sprite_y = 10; // Posição Y no canto superior da tela
var escala = 4; // Aumenta o tamanho da sprite em 2x

if(global.life = 2){
	draw_sprite_ext(spr_icon, 0, sprite_x, sprite_y, escala, escala, 0, c_white, 1)
}
if(global.life = 1){
	draw_sprite_ext(spr_icon_low, 0, sprite_x, sprite_y, escala, escala, 0, c_white, 1)
}
if(global.life = 0){
	draw_sprite_ext(spr_icon_no, 0, sprite_x, sprite_y, escala, escala, 0, c_white, 1)
}
