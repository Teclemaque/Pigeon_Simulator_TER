///IA_deplacement()
{
if Ordre = 0
    {
    if place_meeting(x,y,obj_agent) == false
        {
        if distance_to_object(P) > 15
            {
            speed = 2
            direction = point_direction(x,y,P.x,P.y)
            }
        else
            {
            speed = 0;
            direction = random(360)
            }
        }
    else
        {
        direction = point_direction(x,y,P.x,P.y)+180
        speed = 1
        }
    }
else
    {
    direction = 180
    speed = 0.5
    }
exit;
}
