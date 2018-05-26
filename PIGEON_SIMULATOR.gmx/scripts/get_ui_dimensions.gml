/// get_ui_dimensions() : ds_map
/// renvoie une ds_map paramétrée donnant les différentes dimensions 
/// et coordonnées des points pour dessiner l'UI

// si les dimensions sont déjà générées, les récupérer directement en mémoire


if( ds_map_exists(global.Dimensions, "height" )){
    return global.Dimensions;
}

//var minimap_width = 150
//var minimap_height = 150

if(!instance_exists( Obj_mini_map_controler )){ // la génération de la map a planté
    game_restart();
}

var minimap_width = Obj_mini_map_controler.w * 3
var minimap_height = Obj_mini_map_controler.h * 3



var margeD = minimap_width; // marge droite, en px
var margeG = margeD;        // marge gauche, en px
var margeH = 50 // marge haute, en px
var margeB = minimap_height;           // marge basse, en px

//var margeG_min = 200 ; // marge gauche min., en px
//var margeD_min = 200 ; // marge gauche min., en px

//margeG = max( margeG, margeG_min );
//margeD = max( margeD, margeD_min );

// startx, starty : coordonnées du coin haut/gauche de la vue
var startx = margeG;
var starty = margeH;

// endx, endy : coordonnées du coin bas/droite de la vue
var endx = room_width - margeD;
var endy = room_height - margeB;

var width = endx - startx
var height = endy - starty

var dimensions = global.Dimensions;

dimensions[? "margeG"] = margeG
dimensions[? "margeD"] = margeD
dimensions[? "margeH"] = margeH
dimensions[? "margeB"] = margeB
dimensions[? "startx"] = startx
dimensions[? "starty"] = starty
dimensions[? "endx"] = endx
dimensions[? "endy"] = endy
dimensions[? "width"] = width
dimensions[? "height"] = height

//global.Dimensions = dimensions; // stocker les dimensions en mémoire
return dimensions;
