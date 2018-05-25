///generation_balise(X, Y)
/*
Permet de donner un unique ID auX balises qui entourent un obstacle 
*/
X = argument0;
Y = argument1;

A = instance_position(X+obj_MAP_controller.blockSize,Y, Obj_Balise_Obstacle)

if A != noone
&& A.ID == -1
    {
    A.ID = ID;
    
    with(A)
        {
        generation_balise(other.X+obj_MAP_controller.blockSize,other.Y)
        }
    }
    
B = instance_position(X-obj_MAP_controller.blockSize,Y, Obj_Balise_Obstacle)

if B != noone
&& B.ID == -1
    {
    B.ID = ID;
    with(B)
        {
        generation_balise(other.X-obj_MAP_controller.blockSize,other.Y)
        }
    }

C = instance_position(X,Y+obj_MAP_controller.blockSize, Obj_Balise_Obstacle)

if C != noone
&& C.ID == -1
    {
    C.ID = ID;
    with(C)
        {
        generation_balise(other.X,other.Y+obj_MAP_controller.blockSize)
        }
    } 

D = instance_position(X,Y-obj_MAP_controller.blockSize, Obj_Balise_Obstacle)

if D != noone
&& D.ID == -1
    {
    D.ID = ID;
    with(D)
        {
        generation_balise(other.X,other.Y-obj_MAP_controller.blockSize)
        }
    }
    
E = instance_position(X+obj_MAP_controller.blockSize,Y+obj_MAP_controller.blockSize, Obj_Balise_Obstacle)

if E != noone
&& E.ID == -1
    {
    E.ID = ID;
    
    with(E)
        {
        generation_balise(other.X+obj_MAP_controller.blockSize,other.Y+obj_MAP_controller.blockSize)
        }
    }
    
F = instance_position(X-obj_MAP_controller.blockSize,Y+obj_MAP_controller.blockSize, Obj_Balise_Obstacle)

if F != noone
&& F.ID == -1
    {
    F.ID = ID;
    with(F)
        {
        generation_balise(other.X-obj_MAP_controller.blockSize,other.Y+obj_MAP_controller.blockSize)
        }
    }

G = instance_position(X+obj_MAP_controller.blockSize,Y-obj_MAP_controller.blockSize, Obj_Balise_Obstacle)

if G != noone
&& G.ID == -1
    {
    G.ID = ID;
    with(G)
        {
        generation_balise(other.X+obj_MAP_controller.blockSize,other.Y-obj_MAP_controller.blockSize)
        }
    } 

H = instance_position(X-obj_MAP_controller.blockSize,Y-obj_MAP_controller.blockSize, Obj_Balise_Obstacle)

if H != noone
&& H.ID == -1
    {
    H.ID = ID;
    with(H)
        {
        generation_balise(other.X-obj_MAP_controller.blockSize,other.Y-obj_MAP_controller.blockSize)
        }
    }
//exit;
