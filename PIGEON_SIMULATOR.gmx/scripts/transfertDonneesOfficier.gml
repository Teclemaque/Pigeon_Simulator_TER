#define transfertDonneesOfficier
///transfertDonneesOfficier(ID)
{
ID = argument0;
//Fonction donnant toutes les infos transférées quand un agent est remplacé par un autre
Officiel = ID.Officiel;


if ds_exists(ID.Regiment, ds_type_list)
    {
    for (i = 1; i < ds_list_size(ID.Regiment); i++)
        {
        ds_list_add(Regiment,ds_list_find_value(ID.Regiment,i));
        A = ds_list_find_value(ID.Regiment,i);
        A.Officier = Officier.id;
        ds_list_delete(ID.Regiment,1);
        }
    }
exit;
}

#define transfertDonneesAgent
///transfertDonneesAgent(ID)
{
ID = argument0;

Camp = ID.Camp;
image_xscale = ID.image_xscale;
image_yscale = ID.image_yscale;
Moral = ID.Moral;
Execute = ID.Execute;
Argument = ID.Argument;
}
