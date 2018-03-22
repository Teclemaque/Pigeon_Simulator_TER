///IA_Formation(Formation)
{
P = ds_list_find_index(Officier.Regiment,id);
J = P div Officier.Formation.image_yscale;
I = (P mod  Officier.Formation.image_xscale) //div Officier.Formation.image_xscale;

Dir1 = point_direction(x,y,Officier.Formation.x+I*40,Officier.Formation.y+J*64)

if distance_to_point(Officier.Formation.x+I*40,Officier.Formation.y+J*64) != 0
    {
    speed = 2
    //IA_Deplacement(noone,noone,noone,Dir,-1,2,-1,0,1);
    }
else
    {
    speed = 0;
    //x = Officier.Formation.x+I*40;
    //y = Officier.Formation.y+J*64
    //Ordre = 2;
    Dir1 = 0;
    //IA_Repos(0);
    }
exit;
}
