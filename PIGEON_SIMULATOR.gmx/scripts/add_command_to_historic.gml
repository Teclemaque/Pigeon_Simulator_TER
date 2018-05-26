/// add_command_to_historic(command:string, historic:ds_list<string>, historic_size:int)

var command = argument0;
var historic = argument1;
var historic_size = argument2;

ds_list_insert(historic, 0,  command); // insérer le texte en tête de l'histo    
    if(ds_list_size(historic) > historic_size) // ne garder que les X dernieres commandes
        ds_list_delete(historic, historic_size);