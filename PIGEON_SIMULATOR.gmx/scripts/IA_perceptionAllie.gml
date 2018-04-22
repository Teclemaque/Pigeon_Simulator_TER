///IA_perceptionAllie()
{
MA = instance_nearest(xx,y,Off);
//M = ds_list_find_index(PerceptAgentAllie,MA)

if Classe == 1//is_undefined(M) == false
&& instance_exists(MA)
&& ds_list_find_index(PerceptAgentAllie,MA) != undefined//collision_line(xx,y,MA.x,MA.y,Obj_Terrain_Crete,1,1) == noone//ds_list_find_index(PerceptAgentAllie,MA) != undefined//is_undefined(ds_list_find_index(PerceptAgentAllie,MA)) == false
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
                    if object_get_name(object_index) == object_get_name(Off_sup)
                        {
                        transfertDonneesOfficier(MA);
                        nomGroupe(id);
                        with(MA)
                            {
                            ID = other.id
                            //Je le remplace par un simple soldat
                            with(instance_create(xx,y,Allie))
                                {
                                transfertDonneesAgent(other);
                                Officier = other.ID;
                                ds_list_add(other.ID.Regiment, id);
                                }
                            instance_destroy();
                            }
                        }
                    else
                        {
                        ID = MA;
                        
                        with(instance_create(xx,y,Off_sup))
                            {
                            
                            transfertDonneesAgent(other);
                            transfertDonneesOfficier(other);
                            transfertDonneesOfficier(other.ID);
                            Officiel = other.Officiel;
                            nomGroupe(id);
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
                            }
                        instance_destroy();
                        /*with(MA)
                            {
                            ID = other.id;
                            with(ID)
                                {
                                //Off_sup = other.ID.Off_sup;
                                with(instance_create(xx,y,Off_sup))
                                    {
                                    Camp = other.Camp;
                                    other.ID = id;
                                    }
                                other.ID = ID;
                                instance_destroy();
                                }
                            
                            with(instance_create(xx,y,Allie))
                                {
                                Camp = other.Camp;
                                Officier = other.ID;
                                ds_list_add(other.ID.Regiment, id);
                                }
                            if ds_exists(Regiment, ds_type_list)
                                {
                                for (i = 1; i < ds_list_size(Regiment); i++)
                                    {
                                    ds_list_add(other.Regiment,ds_list_find_value(Regiment,i));
                                    A = ds_list_find_value(Regiment,i);
                                    A.Officier = other.Officier;
                                    }
                                }
                            instance_destroy();
                            }*/
                        }
                    }
                }
            else
                {
                //transfertDonneesOfficier(MA);
                nomGroupe(id);
                with(MA)
                    {
                    ID = other.id;
                    
                    with(instance_create(xx,y,Allie))
                        {
                        transfertDonneesAgent(other);
                        Officier = other.ID;
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
                    instance_destroy();
                    }
                }
            }
        }
    exit;
    }
exit;
}
