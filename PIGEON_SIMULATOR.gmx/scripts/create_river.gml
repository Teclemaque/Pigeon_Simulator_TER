var side = choose(0,1,2,3) //Wich side

var xx 
var yy

if(side == 0){ //top
    xx = random(width)
    yy = 0
} else if(side == 1){ //right
    xx = width-1
    yy = random(height)
} else if(side == 2){ //bottom
    xx = random(width)
    yy = height-1
}else{ //left
    xx = 0
    yy = random(height)
}
//then expand
if(ds_grid_get(terrain_map,xx,yy) != 1 and ds_grid_get(terrain_map,xx,yy) != 3 ){
    var finished = false
    while(finished == false){
        var test = ds_grid_get(terrain_map,xx,yy)
        if(test == 1 or test == 3)
            finished = true
        ds_grid_set(terrain_map,xx,yy,-2)
        
        if(side == 0){
            yy = yy+1
            xx = xx +choose(-2,-1,0,1,2)
        }
        else if(side == 1){
            xx = xx-1
            yy = yy +choose(-2,-1,0,1,2)
        }
        else if(side == 2){
            yy = yy-1
            xx = xx +choose(-2,-1,0,1,2)
        }
        else{
            xx = xx+1
            yy = yy +choose(-2,-1,0,1,2)
        }
        if(xx < 0 or xx > width-1 or yy < 0 or yy > height-1)
            finished = true
    }
    expand_river()
}
