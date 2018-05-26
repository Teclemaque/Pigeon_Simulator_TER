/// idGroupe(String name): int
/// Retourne l'id de l'officier du groupe nommé ou -1 si pas trouvé

var name = argument0;
var allies = obj_joueur.RegimentAllie;

var num = ds_list_find_value(allies, name);

return num;
