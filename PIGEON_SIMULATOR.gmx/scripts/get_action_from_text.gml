/// get_action_from_text(text:string):Action

// todo : câbler sur Marius

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
    log_toolbox_message("Erreur : le retour de CYK n'est pas un tableau ou une ds_map", c_red);
    
}

var recipients = analyzed[? 0];
var operations = analyzed[? 1];
var targets = analyzed[? 2];

var target = targets[| 0];
var action = operations[| 0];
var recipient = recipients[| 0]


//show_debug_message("target : " + target);

show_debug_message("destinataire : " + recipient);
show_debug_message("action : " + action);
//show_debug_message("cible : " + target);

var ordres = ds_list_create(); // message unitaires, avec chacun leur destinataire
var ordre; // ordre type qui sera dupliqué
ordre[0] = noone;

var numRecipient = idGroupe(recipient);

show_debug_message("Destinataire : " + recipient + ", id : " + string(numRecipient));
//show_debug_message("Cible : " + target + ", id : " + string(numTarget));

switch(action){
    case "VATK":
        ordre[1] = IA_Attaque;
        ordre[2] = idGroupe(target);
    break;
    
    case "VDEP":
        ordre[1] = IA_Deplacement;
        var dx = ds_list_find_value(targets, 0);
        var dy = ds_list_find_value(targets, 1);
        //show_debug_message("X : " + string(dx));
        //show_debug_message("Y : " + string(dy));
        ordre[] = noone
        ordre[] = noone
        ordre[] = noone
        ordre[] = dx
        ordre[] = dy
        ordre[] = -1;
        ordre[] = -1;
        ordre[] = -1;
        ordre[] = -1;
        ordre[] = -1;
        ordre[] = 1;
    break;
    
    default:
    log_toolbox_message("Tag non implémenté : " + action, c_orange);
    break;
}

for(var i = 0; i < ds_list_size(recipients); i++){
    ordre[0] = idGroupe(recipient);
    ds_list_add(ordres, array_copy(ordre));
}
return ordres;
