/// get_action_from_text(text:string):Action

if(string_length(string(argument0)) < 2){
    exit;
}

var input = Split_Sentence(argument0, " ");

var analyzed = CYK(input, global.grammaire);

if( is_string(analyzed) ){
    var error = ("Erreur : " + analyzed);
    log_toolbox_message(error, c_red);
    exit;
}else if (analyzed == noone){
    log_toolbox_message("Erreur : phrase incorrecte", c_red);
    exit;
}else if (!ds_exists(analyzed, ds_type_map)){
    log_toolbox_message("Erreur : le retour de CYK n'est pas une ds_map", c_red);
    
}

var recipients = analyzed[? 0];
var operations = analyzed[? 1];
var targets = analyzed[? 2];

var target = targets[| 0];
var action = operations[| 0];
var recipient = recipients[| 0]


//show_debug_message("target : " + target);

//show_debug_message("destinataire : " + recipient);
//show_debug_message("action : " + action);
//show_debug_message("cible : " + target);

var ordres = ds_list_create(); // message unitaires, avec chacun leur destinataire
var ordre; // ordre type qui sera dupliqué
ordre[0] = noone;

var numRecipient = idGroupe(recipient);

//show_debug_message("Destinataire : " + recipient + ", id : " + string(numRecipient));
//show_debug_message("Cible : " + target + ", id : " + string(numTarget));

switch(action){
    case "VATK":
        ordre[1] = IA_Attaque;
        ordre[2] = idGroupe(target);
    break;
    
    case "VDEP": // déplacement vers coordonnées
        ordre[1] = IA_Deplacement;
        
        var dx = ds_list_find_value(targets, 0);
        var dy = ds_list_find_value(targets, 1);
        //show_debug_message("X : " + string(dx));
        //show_debug_message("Y : " + string(dy));
        ordre[2] = noone
        ordre[3] = noone
        ordre[4] = noone
        ordre[5] = dx
        ordre[6] = dy
        ordre[7] = -1;
        ordre[8] = -1;
        ordre[9] = 5;
        ordre[10] = 0;
        ordre[11] = numRecipient.Alpha;
        ordre[12] = 1;
    break;
    
    case "VDEPS": // déplacement vers un sujet
        ordre[1] = IA_Deplacement;
        
        //show_debug_message( "target : " );
        //show_debug_message( string(target)); 
        show_debug_message("Name-reverse = ID de l'agent cible : " + string(idGroupe(target)));
        var destination = idGroupe(target);
        
        var dx = round(destination.x);
        var dy = round(destination.y);
        ordre[2] = noone
        ordre[3] = noone
        ordre[4] = noone
        ordre[5] = dx
        ordre[6] = dy
        ordre[7] = -1;
        ordre[8] = -1;
        ordre[9] = 5;
        ordre[10] = 0;
        ordre[11] = numRecipient.Alpha;
        ordre[12] = 1;
    break;
    
    case "VREG":
        ordre[1] = IA_Groupe;
        ordre[2] = numRecipient;
        ordre[3] = 0.5;
        ordre[4] = -1;
        ordre[5] = -1;
    break;
    
    case "VUPG":
        ordre[1] = IA_Grade;
        ordre[2] = numRecipient;
        ordre[3] = abs(numRecipient.Officiel-1);
        ordre[4] = -1;
    break;
    
    default:
    log_toolbox_message("Tag non implémenté : " + string(action), c_orange);
    break;
}

for(var i = 0; i < ds_list_size(recipients); i++){
    ordre[0] = idGroupe(recipient);
    ds_list_add(ordres, array_copy(ordre));
}

///// debug


show_debug_message("****************************");
show_debug_message("Nombre de Messages : " + string(ds_list_size(ordres)));
for(var i = 0; i < ds_list_size(ordres); i++){
    var msg = ds_list_find_value(ordres, i);
    var str = "[ "
    for(var j = 0; j < array_length_1d(msg); j++){
        str += string( msg[j] ) + ", ";
    }
    str += " ]";
    show_debug_message(str);
    show_debug_message("----------");
    
    
}
show_debug_message("****************************");


return ordres;
