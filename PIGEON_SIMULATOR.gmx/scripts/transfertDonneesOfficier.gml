///transfertDonneesOfficier(ID)
{
/*
Lorsqu'un officier doit recuperer le régiment d'un autre officier
*/
ID = argument0;
//Fonction donnant toutes les infos transférées quand un agent est remplacé par un autre
//Officiel = ID.Officiel;

//Regiment = ds_list_create();

if ds_exists(ID.Regiment, ds_type_list)
    {
    for (i = 1; i < ds_list_size(ID.Regiment); i++)
        {
        ds_list_add(Regiment,ds_list_find_value(ID.Regiment,1));
        A = ds_list_find_value(ID.Regiment,1);
        A.Commandant = Commandant.id;
        ds_list_delete(ID.Regiment,1);
        }
    }
exit;
}
