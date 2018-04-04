var range = argument0
var num = 0
switch(argument_count){
    case 2:
        num = argument1
    case 3:
        num = argument1 + argument2 * 65536
        break
}

var seed = num + obj_MAP_controller.seed //plus c'est gros, moins sa ce répéte

random_set_seed(seed)
rand = irandom_range(0,range)

return rand
