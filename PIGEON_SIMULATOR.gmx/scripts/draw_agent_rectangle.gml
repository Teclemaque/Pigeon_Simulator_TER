/// draw_agent_rectangle(agent, color)
/// @param id : id de l'agent
/// @param color : c_color (ex: c_blue, c_red ...)
/// dessine un rectangle autour de l'agent, pour le faire ressortir sur l'UI

var agent = argument0;
var color = argument1;

var savedColor = draw_get_colour();
draw_set_color( color );
with(agent){
    var vx = x - sprite_xoffset
    var vy = y - sprite_yoffset
    draw_rectangle(vx, vy, vx + sprite_width, vy + sprite_height, 1);    
}

draw_set_colour( savedColor );