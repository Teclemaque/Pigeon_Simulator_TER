//reinitialisation de done
for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        ds_grid_set(done,i,j,0)
    }
}

for(var i = 0; i < width;i++){
    for(var j=0;j < height;j++){
        var cr = ds_list_create()
        
        if(ds_grid_get(terrain_map,i,j) == 1 and ds_grid_get(done,i,j) == 0){
            cr = mountain_list(i,j)
            
            //Nouveau code
            var crate = ds_list_create()
             var continu = true
            while(continu){
                continu = false
                for(var k=0; k < ds_list_size(cr);k++){
                    var test = ds_list_find_value((ds_list_find_value(cr,k)),0)
                    var xx = ds_list_find_value((ds_list_find_value(cr,k)),1)
                    var yy = ds_list_find_value((ds_list_find_value(cr,k)),2)
                    var count = 0
                    if(ds_grid_get(terrain_map,xx,yy) == 1){
                        var seuil = 6
                        //N4
                        if(yy-1 > -1){
                          if(ds_grid_get(grid,xx,yy-1) <= test)
                            count++
                        } else {
                            seuil--
                        }
                        
                        if(xx-1 > -1){
                        if(ds_grid_get(grid,xx-1,yy) <= test)
                            count++
                        } else {
                            seuil--
                        }

                        if(xx+1 < width){
                        if(ds_grid_get(grid,xx+1,yy) <= test)
                            count++
                        } else {
                            seuil--
                        }

                        if(yy+1 < height){
                        if(ds_grid_get(grid,xx,yy+1) <= test)
                            count++
                        } else {
                            seuil--
                        }

                        //N8
                        if(yy-1 > -1 and xx-1 > -1){  
                        if(ds_grid_get(grid,xx-1,yy-1) <= test)
                            count++
                        } else {
                            seuil--
                        }

                        if(xx+1 < width and yy-1 > -1){
                        if(ds_grid_get(grid,xx+1,yy-1) <= test)
                            count++
                        } else {
                            seuil--
                        }

                        if(xx-1 > -1 and yy+1 < height){
                        if(ds_grid_get(grid,xx-1,yy+1) <= test)
                            count++
                        } else {
                            seuil--
                        }

                        if(yy+1 < height and xx+1 < width){
                        if(ds_grid_get(grid,xx+1,yy+1) <= test)
                            count++
                        } else {
                            seuil--
                        }

                        
                        
                        
                        if(count >= seuil){
                            ds_grid_set(terrain_map,xx,yy,3)
                            continu = true  
                            ds_list_add(crate,ds_list_find_value(cr,k))
                        }
                        
                        
                    } // if still mountain
                
                    
                } // for list
                
            } // while continu
            if(ds_list_size(crate) > 0){
                var mini = ds_list_find_value((ds_list_find_value(crate,0)),0)
                var maxi = ds_list_find_value((ds_list_find_value(crate,0)),0)
                for(var k=1; k < ds_list_size(crate);k++){
                    var testMi = ds_list_find_value((ds_list_find_value(crate,k)),0)
                    var testMa = ds_list_find_value((ds_list_find_value(crate,k)),0)
                    if(testMi < mini){
                        mini = testMi
                    }
                    if(testMa > maxi){
                        maxi = testMa
                    }
                } // for list MinMax
                var range = (maxi - mini) * 0.65
                range = maxi - range
                
                for(var k=1;k < ds_list_size(crate);k++){
                    if(ds_list_find_value((ds_list_find_value(crate,k)),0)>=range){
                        ds_grid_set(terrain_map,
                        ds_list_find_value(ds_list_find_value(crate,k),1),
                        ds_list_find_value(ds_list_find_value(crate,k),2),
                        3)
                    } else {
                        ds_grid_set(terrain_map,
                        ds_list_find_value(ds_list_find_value(crate,k),1),
                        ds_list_find_value(ds_list_find_value(crate,k),2),
                        1)
                    }
                }
            }
            //Ancien code
            /*
            var mini = ds_list_find_value((ds_list_find_value(cr,0)),0)
            var maxi = ds_list_find_value((ds_list_find_value(cr,0)),0)
            for(var k=1; k < ds_list_size(cr);k++){
                var testMi = ds_list_find_value((ds_list_find_value(cr,k)),0)
                var testMa = ds_list_find_value((ds_list_find_value(cr,k)),0)
                if(testMi < mini){
                    mini = testMi
                }
                if(testMa > maxi){
                    maxi = testMa
                }
            } // for list MinMax
            var range = (maxi - mini) * 0.50
            var str = string(maxi) + " " + string(mini) + " : " + string(range)
            show_debug_message(str)
            range = maxi - range
            for(var k=0; k < ds_list_size(cr);k++){
                var testL = ds_list_find_value(cr,k)
                if(ds_list_find_value(testL,0) >= range){
                    var xx = ds_list_find_value(testL,1)
                    var yy = ds_list_find_value(testL,2)
                    ds_grid_set(terrain_map,xx,yy,3)
                }
            }// for terrain = high enough
            */
        } // if mountain found
    
    } // grid analysis
}
