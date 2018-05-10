var xx = floor(x / obj_MAP_controller.blockSize)
var yy = floor(y / obj_MAP_controller.blockSize)

var t = ds_list_create()
ds_list_add(t,xx,yy)
return t