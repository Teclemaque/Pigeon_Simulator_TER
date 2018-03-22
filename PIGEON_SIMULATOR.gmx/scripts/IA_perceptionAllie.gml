///IA_perceptionAllie()
MA = instance_nearest(xx,y,Off)

if instance_exists(MA)
&& sqrt(sqr(MA.xx-xx)+sqr(MA.y-y)) < 500
&& MA.id != id
&& MA.Officiel == 0
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
                instance_destroy();
                }
            }
        }
    }
