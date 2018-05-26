/// process_rectangle_selection()
/// Utilisé par le GUI Controller
/// Récupère les agents pris dans le rectangle de selection
/// En récupère les noms des regiments
/// Mets ces noms dans la textBox
/// Mets ces noms en préparation, pour les ajouter eventuellement
///     à une préselection du joueur, panneau gauche

ds_list_clear(Selection); // nouvelle selection : ecraser l'ancienne

Selection = collision_rectangle_list(
    click_origin_x, click_origin_y, 
    mouse_x, mouse_y, 
    obj_agent, 
    false, true);
    
var noms = ds_list_create();
var filtered = ds_list_create(); // pointeur temporaire pour stocker les agents qu'on garde dans la selection

    // Recuperer les noms des regiments (si elles en ont) des unités selectionnées
if( ! ds_list_empty(Selection) ){
    for( var i = 0; i < ds_list_size(Selection); i++ ){
        var agent = ds_list_find_value(Selection, i);
        // Garde fou : recuperer le nom si est chef de regiment
        var has_regiment = instance_exists(agent) && object_is_ancestor(agent.object_index, obj_meta_agent_C1) || object_is_ancestor(agent.object_index, obj_meta_agent_C2);
        if( instance_exists(agent) && has_regiment ){
            var nom = string(nomGroupe(agent))// arg2 = withName
            var str = "Nom de l'agent " + string(agent.id) + " : ";
            show_debug_message(str + nom);
            
            ds_list_add(noms, nom);
            ds_list_add(filtered, agent);
        }else { // Sinon, ne pas selectionner les agents simples (pas de Regiment)
            //var agent_pos = ds_list_find_index(Selection, agent);
            //ds_list_delete(Selection, agent_pos);
        }
    }
}

var to_delete = Selection;
Selection = filtered;
ds_list_destroy(to_delete);

// Noms filtrés
for(var i = 0; i < ds_list_size(noms); i++){
    var nom = ds_list_find_value(noms, i);
    show_debug_message("Lecture du nom : ");
    toolbox.Text += string(nom) + "";
}

ds_list_destroy(noms);