///transfertNouvelOfficier(ID)
{
/*
Si un officier decede et doit transmettre le commandement a un agent simple, 
alors lui transmet tout son régiment ainsi que certaines stats propores aux officiers
*/
with(ds_list_find_value(Regiment,1))
    {
    ID = other.id;
    Groupe = instance_create(x,y,other.Off);
    ds_list_delete(other.Regiment,1);
    
    with(Groupe)
        {
        transfertDonneesAgent(other)
        transfertDonneesOfficier(other.ID);
        /*S = ds_list_size(other.ID.Regiment)
        for (k = 0; k < S; k++)
            {
            ds_list_add(Regiment,ds_list_find_value(other.ID.Regiment,1));
            A = ds_list_find_value(other.ID.Regiment,1);
            A.Officier = id;
            ds_list_delete(other.ID.Regiment,1);
            }*/
        }
    instance_destroy();
    }
}
