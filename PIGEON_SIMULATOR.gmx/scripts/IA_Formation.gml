///IA_Formation(Formation)
{
P = ds_list_find_index(Officier.Regiment,id);
if Officier.Formation.image_yscale != 0
    {J = (P-1) div Officier.Formation.image_yscale;}
else
    {J = 1;}
if Officier.Formation.image_xscale != 0
    {I = (P-1) mod  Officier.Formation.image_xscale} //div Officier.Formation.image_xscale;
else
    {I = 1;}

D = sqrt(sqr(32*I)+sqr(32*J));

Angle = point_direction(Officier.Formation.x,Officier.Formation.y,Officier.Formation.x+32*I,Officier.Formation.y+32*J)

Dir1 = point_direction(x,y,Officier.Formation.x+D*cos(degtorad(Angle+Officier.Formation.direction)),Officier.Formation.y-D*sin(degtorad(Angle+Officier.Formation.direction)))

//speed = 2;
Dist = distance_to_point(Officier.Formation.x+D*cos(degtorad(Angle+Officier.Formation.direction)),Officier.Formation.y-D*sin(degtorad(Angle+Officier.Formation.direction)))
if Dist != 0
    {
    speed = 2;
    //IA_Deplacement(noone,noone,noone,Dir1,-1,Dist/2+1,0,0,1);
    /*Execute = IA_Deplacement;
    Argument[0] = noone;
    Argument[1] = noone;
    Argument[2] = noone;
    Argument[3] = Dir1;
    Argument[4] = -1;
    Argument[5] = Dist/2+1;
    Argument[6] = 0;
    Argument[7] = 0;
    Argument[8] = 1;
    exit;*/
    //speed = 0
    //x = Officier.Formation.x+D*cos(degtorad(Angle+Officier.Formation.direction));
    //y = Officier.Formation.y-D*sin(degtorad(Angle+Officier.Formation.direction));  

    //Dir1 = Officier.Dir1;
    }
else
    {
        {
        speed = 0
        x = Officier.Formation.x+D*cos(degtorad(Angle+Officier.Formation.direction));
        y = Officier.Formation.y-D*sin(degtorad(Angle+Officier.Formation.direction));
        }

    Dir1 = Officier.Dir1;

    }
exit;
}
