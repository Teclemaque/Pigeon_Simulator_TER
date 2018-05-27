///IA_Groupe(ListGroup, NbGroupe, NbAgent, Separation)
{
ListOfficier[] = Argument[0];
NbGroupe = Argument[1]
Nbr = Argument[2];

show_debug_message(array_length_1d(ListOfficier))

MODE = "GROUPE"
if Argument[3] == 1
    {
    for (i = 0; i < array_length_1d(ListOfficier); i++)
        {
        O = ListOfficier[i];
        O.Officiel = 1;
        if Argument[2] > 1
            {
            if ds_list_size(Regiment) > Argument[1]*Argument[2]
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
                Groupe = instance_create(other.x,other.y,other.O.Off);
                //instance_create(other.x+lengthdir_x(other.j*other.Nbr,other.direction),other.y+lengthdir_y(other.j*other.Nbr,other.direction),other.O.Off);
                ds_list_delete(other.O.Regiment,1);
                J = other.j+1;
                nbr = other.Nbr;
                direction = direction;
                with(Groupe)
                    {
                    //nomGroupe(other.id)
                    Officiel = 1;
                    
                    Execute = IA_Deplacement;
                    Argument[0] = noone;
                    Argument[1] = noone;
                    Argument[2] = noone;
        
                    Argument[3] = x+lengthdir_x(other.J*other.nbr,other.direction);
                    Argument[4] = y+lengthdir_y(other.J*other.nbr,other.direction);
                    Argument[5] = -1;
        
                    Argument[6] = -1;
                    Argument[7] = 2;
                    Argument[8] = 0;
                    Argument[9] = Alpha//round(random(8))+2;
                    Argument[10] = 1;
                    
                    for (k = 0; k < other.ID.Nbr; k++)
                        {
                        ds_list_add(Regiment,ds_list_find_value(other.ID.Regiment,1));
                        A = ds_list_find_value(other.ID.Regiment,1);
                        A.Commandant = id;
                        ds_list_delete(other.ID.Regiment,1);
                        }
                    Commandant_sup = other.ID;
                    nomGroupe(id);
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
            for (j = 1; j < ds_list_size(ListOfficier[i].Regiment);j++)
                {
                a = ds_list_find_value(ListOfficier[i].Regiment,j);
                ds_list_add(ListOfficier[0].Regiment, a)
                show_debug_message(ListOfficier[0]);
                a.Commandant = ListOfficier[0].id;
                //Commandant_sup = ListOfficier[0].id;;
                }
            with(instance_create(x,y,ListOfficier[i].Allie))
                {
                ds_list_add(other.ListOfficier[0].Regiment,id);
                Commandant = other.ListOfficier[0]
                //Commandant_sup = ListOfficier[0].id;
                }
            with(ListOfficier[i])
                {
                instance_destroy();
                }
            }
    }
Execute = IA_Repos;
Argument[0] = 0;
}
