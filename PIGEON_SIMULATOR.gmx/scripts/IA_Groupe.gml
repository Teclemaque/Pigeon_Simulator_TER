///IA_Groupe(ListGroup, NbGroupe, NbAgent, Separation)
{
ListOfficier = Argument[0];
NbGroupe = Argument[1]
Nbr = Argument[2];

if Argument[3] == 1
    {
    for (i = 0; i < array_length_1d(ListOfficier); i++)
        {
        O = ListOfficier[i];
        O.Officiel = 1;
        if Argument[2] > 1
            {
            if ds_list_size(Regiment) > Argument1*Argument2
                {
                Nbr = Argument[2];
                }
            else
                {
                if NbGroupe == 0
                    {
                    NbGroupe = 2;
                    }
                Nbr = floor(ds_list_size(Regiment)/NbGroupe);
                }
            }
        else
            {
            if Argument[2] != 0
                {
                NbGroupe = floor(1/Argument[2]);
                Nbr = floor(ds_list_size(Regiment)*Argument[2])
                }
            else
                {
                if NbGroupe != 0
                    {
                    Nbr = floor(ds_list_size(Regiment)/NbGroupe)
                    }
                else
                    {
                    NbGroupe = 2;
                    Nbr = floor(ds_list_size(Regiment)/NbGroupe);
                    }
                }
            }
////////////////////////////////////////////////////////////////////////////////////////
        for (j = 0; j < NbGroupe-1; j++)
            {
             
            with(ds_list_find_value(O.Regiment,1))
                {
                ID = other.O.id;
                Groupe = instance_create(x,y,other.O.Off_sup);
                ds_list_delete(other.O.Regiment,1);
                
                with(Groupe)
                    {
                    Officiel = 1;
                    Execute = IA_Repos;
                    
                    for (k = 0; k < other.ID.Nbr; k++)
                        {
                        ds_list_add(Regiment,ds_list_find_value(other.ID.Regiment,1));
                        A = ds_list_find_value(other.ID.Regiment,1);
                        A.Officier = id;
                        ds_list_delete(other.ID.Regiment,1);
                        }
                    }
                instance_destroy();
                }
            }
        }
    }
else
    {
        ListOfficier[0].Officiel = 1;
        
        for (i = 1; i < array_length_1d(ListOfficier); i++)
            {
            for (j = 0; j < ds_list_size(ListOfficier[i].Regiment);j++)
                {
                a = ds_list_find_value(ListOfficier[i].Regiment,j);
                ds_list_add(ListOfficier[0].Regiment, a)
                a.Officier = ListOfficier[0]
                }
            with(instance_create(x,y,ListOfficier[i].Allie))
                {
                ds_list_add(other.ListOfficier[0].Regiment,id);
                Officier = other.ListOfficier[0]
                }
            instance_destroy();
            }
    }
Execute = IA_Repos;
Argument[0] = 0;
}
