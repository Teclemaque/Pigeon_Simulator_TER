/// checkActionType(sentence:ds_list):Action

var v = sentence[0];

var Dico_verbe = ds_map_create();

ds_map_add(Dico_verbe, "tuer", "kill");

var Dico_nom = ds_map_create();

ds_map_add(Dico_nom, "soldat1", "target");

var typeAction = noone;
var ActionReturned = noone;

if(ds_map_exists(Dico_verbe,v))
{
    typeAction = ds_map_find_value(Dico_verbe,v);
    ActionReturned = instance_create(0,0,Action_Kill);
}
else
{
    ActionReturned = instance_create(0,0,Action);
    ActionReturned.Error = "Le verbe "+v+" n'est pas reconnu !";
}

ds_list_add(ActionReturned.Mots, v);
//ds_list_add(ActionReturned.Reste, );

return ActionReturned;