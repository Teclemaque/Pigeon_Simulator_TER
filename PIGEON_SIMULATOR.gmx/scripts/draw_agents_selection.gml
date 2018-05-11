/// draw_agents_selection(agents : ds_list | int)
/// @param agents : liste des agents, ou id d'un seul agent
/// met en evidence les agents selectionnés dans agents
var agents = argument0;
if( instance_exists( agents ) ){ /// agent seul
    // marquer visuellement l'agent et ses subalternes
    draw_agent_rectangle( agents , c_red);
    draw_agents_selection(agents.Regiment); // appel recursif sur les subalternes
    
    
}else if ( ds_exists(agents, ds_type_list) ) { // liste d'agents
    // marquer visuellement les agents, indistinctement    
    for (var i = 0; i < ds_list_size(agents); i++ ){
        draw_agent_rectangle( ds_list_find_value(agents, i) , c_blue)
    }
}else {
    show_error("impossible de trouver les agents selectionnés", false);
}
