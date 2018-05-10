/// mouse_x_gui retourne mouse_x adapté au GUI selon le zoom / déplacement de la camera
return device_mouse_x_to_gui(0); 
return (mouse_x - view_xview[0]) * 2 //+ obj_VIEW_controller.Zoom * (obj_VIEW_controller.ZoomStep * 1)
+ obj_VIEW_controller.ZoomStep *   (mouse_x  + obj_VIEW_controller.Zoom)