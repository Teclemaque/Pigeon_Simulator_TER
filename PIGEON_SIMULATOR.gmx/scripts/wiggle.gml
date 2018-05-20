/// @description wiggle (degrees)
/// @param degrees angle max
/// Oriente l'agent dans une direction aléatoire comprise entre degrees et -(degrees)

if(argument_count == 0){
    argument0 = 45;
}

degrees = argument0
direction += random(2 * degrees) - degrees