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
        }
    instance_destroy();
    }
}