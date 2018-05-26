/// draw_group_rectangle(x, y, group) : rectangle_height
/// dessine le rectangle qui représente un groupe (une formation) dans le panneau de gauche
/// @param x, y : coordonnées de début de dessin
/// @return rectangle_height : la hauteur prise par le rectangle
var savedColor = draw_get_colour();
var startx = argument0;
var starty = argument1;
var endx   = argument2;
var group  = argument3;
var height  = 50;

draw_set_colour(c_black);
draw_rectangle(startx, starty, endx, starty + height, 1 );


draw_set_colour(savedColor);
return height;