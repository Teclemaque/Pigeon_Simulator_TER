///IA_Attaque(ListCible, Combat, Ordre);
{
/*if argument1 != -1
    {
    Combat = argument1;
    }*/

if Combat == 1
    {
    if t < obj_globVar.R_fusil // Variable actuellement globale de temps de recharge, on pourrait aussi faire appel à obj_globVar.R_fusil et plus besoin de globalité. Meilleur optimisation?
        {
        t++;
        } 
    else
        {
        if Ordre = 0
            {
            if Ordre = 0
                {
                direction = point_direction(x,y,Cible.x,Cible.y)
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
        //Execute = IA_Deplacement(noone,Cible,noone,-1,-1,Cadence,-1,0,0);
        }
    }
}