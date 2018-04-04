#define IA_Attaque
///IA_Attaque(ListCible, Combat, Ordre);
{
if Argument[0] != -1
    {
    Combat = Argument[0];
    }
Ordre = Argument[1];


/*CibleA = Argument[0];
Cible = CibleA[0];*/

if instance_exists(Officier)
    {
    Cible = ds_list_find_value(Officier.CibleAttaque,0/*round(random(ds_list_size(Officier.CibleAttaque)))*/);
    }
else
    {
    Cible = instance_nearest(x,y,Ennemi);
    }

if instance_exists(Cible)
    {
    if Combat == 1
        {
        if t < obj_globVar.R_fusil // Variable actuellement globale de temps de recharge, on pourrait aussi faire appel à obj_globVar.R_fusil et plus besoin de globalité. Meilleur optimisation?
            {
            t++;
            speed = 0;
            } 
        else
            {
            //if Ordre = 0
                {
                //Cible = //instance_nearest(x,y,Ennemi);
                //if Ordre = 0
                    {
                    Dir1 = point_direction(x,y,Cible.x,Cible.y)
                    }
                if collision_line(x,y,Cible.x,Cible.y,Allie,1,1) == noone
                    {
                    with(instance_create(x,y,obj_arme))
                        {
                        direction = other.direction;//On fait partir la balle dans sa direction
                        ID = other.id;//On s'assure que la balle va pas nous considérer comme la cible
                        }
                    t = 0;
                    }
                }
            }
        }
    else
        {
        if distance_to_object(Cible) < 10
            {
            speed = random(1);// Combat au corps a corps
            }
        else
            {
            if distance_to_object(Cible) > 150
                {
                Cadence = MSpeed / 4;
                }
            else
                {
                Cadence = MSpeed / 2;
                }
            Execute = IA_Deplacement
            Argument[0] = noone;
            Argument[1] = Cible;
            Argument[2] = noone;
            Argument[3] = -1;
            Argument[4] = -1;
            Argument[5] = Cadence;
            Argument[6] = -1;
            Argument[7] = 0;
            Argument[8] = 0;
            }
        }
    }
}

#define IA_Regiment_Attaque
///IA_Regiment_Attaque(ListCible, Combat, Ordre)
{
if Argument[0] != -1
    {
    Combat = Argument[0];
    }
Ordre = Argument[1];


/*CibleA = Argument[0];
Cible = CibleA[0];*/

if instance_exists(Officier)
    {
    Cible = ds_list_find_value(Officier.CibleAttaque,round(random(ds_list_size(Officier.CibleAttaque)-1)));
    }
else
    {
    Cible = instance_nearest(x,y,Ennemi);
    }

if instance_exists(Cible)
    {
    if Combat == 1
        {
        if t < obj_globVar.R_fusil // Variable actuellement globale de temps de recharge, on pourrait aussi faire appel à obj_globVar.R_fusil et plus besoin de globalité. Meilleur optimisation?
            {
            t++;
            speed = 0;
            } 
        else
            {
            //if Ordre = 0
                {
                //Cible = //instance_nearest(x,y,Ennemi);
                //if Ordre = 0
                    {
                    Dir1 = point_direction(x,y,Cible.x,Cible.y)
                    }
                if collision_line(x,y,Cible.x,Cible.y,Allie,1,1) == noone
                    {
                    with(instance_create(x,y,obj_arme))
                        {
                        direction = other.direction;//On fait partir la balle dans sa direction
                        ID = other.id;//On s'assure que la balle va pas nous considérer comme la cible
                        }
                    t = 0;
                    }
                }
            }
        }
    else
        {
        if distance_to_object(Cible) < 10
            {
            speed = random(1);// Combat au corps a corps
            }
        else
            {
            if distance_to_object(Cible) > 150
                {
                Cadence = MSpeed / 4;
                }
            else
                {
                Cadence = MSpeed / 2;
                }
            Execute = IA_Deplacement
            Argument[0] = noone;
            Argument[1] = Cible;
            Argument[2] = noone;
            Argument[3] = -1;
            Argument[4] = -1;
            Argument[5] = Cadence;
            Argument[6] = -1;
            Argument[7] = 0;
            Argument[8] = 0;
            }
        }
    }
}






