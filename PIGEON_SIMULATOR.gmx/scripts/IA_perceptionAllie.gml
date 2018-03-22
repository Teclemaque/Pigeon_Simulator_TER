///IA_perceptionAllie()

MA = instance_nearest(xx,y,Off);
show_debug_message(MA.id);

if instance_exists(MA) 
&& is_undefined(ds_list_find_index(PerceptAgentAllie,MA)) == false
&& sqrt(sqr(MA.xx-xx)+sqr(MA.y-y)) < 500
{
if MA.Officiel == 0
    {
    if Grade >= MA.Grade
        {
        if Grade == MA.Grade
            {
            if id < MA.id
                {
                if object_get_name(object_index) == object_get_name(Off_sup)
                    {
                    with(MA)
                        {
                        ID = other.id
                        
                        with(instance_create(xx,y,Allie))
                            {
                            Camp = other.Camp;
                            Officier = other.ID;
                            ds_list_add(other.ID.Regiment, id);
                            }
                            
                        if ds_exists(Regiment, ds_type_list)
                            {
                            for (i = 0; i < ds_list_size(Regiment); i++)
                                {
                                ds_list_add(other.Regiment,ds_list_find_value(Regiment,i));
                                A = ds_list_find_value(Regiment,i);
                                A.Officier = other.Officier;
                                }
                            }
                        instance_destroy();
                        }
                    }
                else
                    {
                    with(MA)
                        {
                        with(other)
                            {
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
                            for (i = 0; i < ds_list_size(Regiment); i++)
                                {
                                ds_list_add(other.Regiment,ds_list_find_value(Regiment,i));
                                A = ds_list_find_value(Regiment,i);
                                A.Officier = other.Officier;
                                }
                            }
                        instance_destroy();
                        }
                    }
                }
            }
        else
            {
            with(MA)
                {
                ID = other.id
                
                with(instance_create(xx,y,Allie))
                    {
                    Camp = other.Camp;
                    Officier = other.ID;
                    ds_list_add(other.ID.Regiment, id);
                    }
                if ds_exists(Regiment, ds_type_list)
                    {
                    for (i = 0; i < ds_list_size(Regiment); i++)
                        {
                        ds_list_add(other.Regiment,ds_list_find_value(Regiment,i));
                        A = ds_list_find_value(Regiment,i);
                        A.Officier = other.Officier;
                        }
                    }
                instance_destroy();
                }
            }
        }
    }
exit;
}
