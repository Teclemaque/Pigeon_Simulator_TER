/// checkActionType(sentence:ds_list):Action

var v = sentence[0];

var Dico_verbe = ds_map_create();

ds_map_add(Dico_verbe, "tuer", "kill");

var Dico_nom = ds_map_create();

ds_map_add(Dico_nom, "soldat1", "target");

var typeAction = noone;

if(ds_map_exists(Dico_verbe,v))
{
    typeAction = ds_map_find_value(Dico_verbe,v);
}
else if(ds_map_exists(Dico_nom,v))
{
    typeAction = ds_map_find_value(Dico_nom,v);
}



