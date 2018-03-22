///IA_Groupe(ListGroup, NbGroupe, NbAgent, Separation)
{
ListOfficier = Argument[0];

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
                if Argument[1] == 0
                    {
                    Argument[1] = 2;
                    }
                Nbr = floor(ds_list_size(Regiment)/Argument[1]);
                }
            }
        else
            {
            if Argument[2] != 0
                {
                Argument[1] = floor(1/Argument[2]);
                Nbr = floor(ds_list_size(Regiment)/Argument[2])
                }
            else
                {
                if Argument[1] != 0
                    {
                    Nbr = floor(ds_list_size(Regiment)/Argument[1])
                    }
                else
                    {
                    Argument[1] = 2;
                    Nbr = floor(ds_list_size(Regiment)/Argument[1]);
                    }
                }
            }
////////////////////////////////////////////////////////////////////////////////////////
        for (j = 0; j < Argument[1]; j++)
            {
            with(ds_list_find_value(O.Regiment,0))
                {
                ID = other.id;
                Groupe = instance_create(x,y,other.O.Off_inf);
                ds_list_delete(other.Regiment,0);
                
                with(Groupe)
                    {
                    Officiel = 1;
                    
                    for (k = 0; k < other.Nbr; k++)
                        {
                        ds_list_add(Regiment,ds_list_find_value(other.id.Regiment,0));
                        ds_list_delete(other.id.Regiment,0);
                        }
                    }
                instance_destroy();
                }
            }
        }
    }
}
