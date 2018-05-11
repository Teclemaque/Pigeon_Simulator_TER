/// send_message_to_agents(ds_list_agents, ds_map_message)

var ds_list_agents = argument0;
var ds_map_message = argument1;


for(i = 0; i < ds_list_size(ds_list_agents); i++){
    var newMsg = ds_map_create();
    var exemplaire = ds_map_copy(newMsg, ds_map_message);
    
    // Todo : envoyer via messager ou moyen physique in-game
    // en attendant : 
    with( ds_list_agents[| i] ){
        ds_list_insert(Messages, 0, newMsg);
        //ds_list_add(Messages, ds_map_message);
    }
    
    
}
