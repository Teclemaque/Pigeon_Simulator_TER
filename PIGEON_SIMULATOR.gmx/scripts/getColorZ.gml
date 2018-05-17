var zz = argument0  //zz is between 0 and 100
var xx = argument1
var yy = argument2
var r=0,b=0,g=0;


var type = ds_grid_get(terrain_map,xx,yy)

if(type == 2){
    g = 220 + (zz/100)* 200
} else if(type == -1) { 
    b = 120 + ((zz-water_level) / (100-water_level)) * 200
}   
else if(type == 0){
    g = 100 + ((zz - water_level) / (100-water_level)) * 200
  
} else if(type == 3) { 
      r = 250
} else {
    r = 70 + ((zz - mountain_level) / (100-mountain_level) ) * 200
    g = 60 + ((zz - mountain_level) / (100-mountain_level) ) * 200
    b = 50 + ((zz - mountain_level) / (100-mountain_level) ) * 200
}


return make_color_rgb(r,g,b)
