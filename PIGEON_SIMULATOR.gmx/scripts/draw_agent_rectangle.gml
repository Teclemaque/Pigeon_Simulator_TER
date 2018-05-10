/// draw_agent_rectangle(agent, color)

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