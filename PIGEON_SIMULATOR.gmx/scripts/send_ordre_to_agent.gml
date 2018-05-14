/// send_ordre_to_agent(action, target);

var action = argument0;
var target = argument1;

var messager = instance_create(x, y, obj_messager);

messager.Message = action;
messager.Destinataire = target;