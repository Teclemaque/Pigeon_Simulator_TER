/// is_clicked(orig_x, orig_y, sprite)
/// retourne true si l'objet dont on donne les coordonnées d'origine et le sprite sont dans la souris

var orig_x = argument0;
var orig_y = argument1;
var sprite = argument2;

var max_x = orig_x + sprite_get_width(sprite);
var max_y = orig_y + sprite_get_height(sprite);
var mousex = mouse_x
var mousey = mouse_y

var x_in = mouse_x >= orig_x && mouse_x <= max_x
var y_in = mouse_y >= orig_y && mouse_y <= max_y

return ( mouse_x >= orig_x && mouse_y >= orig_y) && (mouse_x <= max_x && mouse_y <= max_y);
