///IA_perceptionAllie()
{
MA = ds_list_find_value(PerceptAgentAllie,0);

if Classe == 1
&& MA != undefined
&& MA.Classe == 1
&& sqrt(sqr(MA.x-xx)+sqr(MA.y-y)) < 500
    {
    // On verifie qu'on mérite de devenir l'officier principal
    if MA.Officiel == 0
        {
        if Grade >= MA.Grade
            {
            if Grade == MA.Grade
                {
                if id < MA.id
                    {
                    //Si je suis deja a mon grade maximal
                    //if object_get_name(object_index) == object_get_name(Off_sup)
                        {
                        transfertDonneesOfficier(MA);
                        with(MA)
                            {
                            ID = other.id
                            //Je le remplace par un simple soldat
                            with(instance_create(xx,y,Allie))
                                {
                                transfertDonneesAgent(other);
                                Commandant = other.ID;
                                ds_list_add(other.ID.Regiment, id);
                                }
                            instance_destroy();
                            }
                        nomGroupe(id);
                        }
                    /*else
                        {
                        ID = MA;
                        
                        with(instance_create(xx,y,Off_sup))
                            {
                            transfertDonneesAgent(other);
                            transfertDonneesOfficier(other);
                            transfertDonneesOfficier(other.ID);
                            Officiel = other.Officiel;
                            with(other.ID)
                                {
                                ID = other.id
                                Officier = other.id
                                
                                with(instance_create(xx,y,Allie))
                                    {
                                    transfertDonneesAgent(other)
                                    Officier = other.ID;
                                    ds_list_add(other.ID.Regiment, id);
                                    }
                                instance_destroy();
                                }
                            nomGroupe(id);
                            }
                        instance_destroy();
                        }*/
                    }
                }
            else
                {
                //transfertDonneesOfficier(MA);
                with(MA)
                    {
                    ID = other.id;
                    with(instance_create(xx,y,Allie))
                        {
                        transfertDonneesAgent(other);
                        Commandant = other.ID;
                        ds_list_add(other.ID.Regiment, id);
                        }
                    /*if ds_exists(Regiment, ds_type_list)
                        {
                        for (i = 1; i < ds_list_size(Regiment); i++)
                            {
                            ds_list_add(other.Regiment,ds_list_find_value(Regiment,i));
                            A = ds_list_find_value(Regiment,i);
                            A.Officier = other.Officier;
                            }
                        }*/
                    //nomGroupe(ID);
                    instance_destroy();
                    }
                }
            }
        }
    exit;
    }
exit;
}
