/// String nomGroupe(int agent, bool withName = true) : identifiant du groupe (bataillon, regiment, escouade) de l'agent
/// A utiliser pour créer et réserver le nom disponible pour son groupe dans global.Regiments
/// @param agent : l'id de l'agent dont on veut le nom du bataillon
/// @param withName :  ajoute le nom du type de groupe, ex : "Escouade123" si true, "123" sinon
if(argument_count < 2){
    Arg = true; // withName = true par défaut
}
else {
    Arg = argument[1];
}

var agent = argument[0];
var withName = Arg;

// Determiner le type de groupe selon sa taille
var groupName = "";

if instance_exists(agent){
if(withName){
    
    var groupSize = ds_list_size(agent.Regiment);
    
    if agent.Officiel == 1
        {
        if (groupSize > 804 && agent.Grade <= 12){
            groupName = "regiment"
            agent.Grade = 12;
        }else if (groupSize > 199 && agent.Grade <= 10){
            groupName = "bataillon"
            agent.Grade = 10;
        }else if (groupSize > 83 && agent.Grade <= 8){
            groupName = "compagnie"
            agent.Grade = 8;
        }else if(groupSize > 26 && agent.Grade <= 6){
            groupName = "troupe"
            agent.Grade = 6;
        }else if (groupSize > 10 && agent.Grade <= 4){
            groupName = "patrouille"
            agent.Grade = 4;
        }else if (groupSize > 1 && agent.Grade <= 2) {
            groupName = "escouade"
            agent.Grade = 2;
        }else {
            groupName = "soldat" // TODO : ou cavalier, messager, ...
            agent.Grade = 0;
        }
    }
    else {
        if groupSize > 1
            {
            groupName = "chef"
            //agent.Troupe = string(groupName);
            //agent.Numero = string(Num)+string(numero);
            //agent.Name = groupName;
            //exit;
            }
        else
            {
            groupName = "soldat" // TODO : ou cavalier, messager, ...
            //agent.Troupe = string(groupName);
            //agent.Numero = string(Num)+string(numero);
            //agent.Name = groupName;
            //exit;
            }
        agent.Grade = 0;
    }
}


/*if (groupName != "")*/{
    // Trouver le numero à attribuer au groupe
    
    var numero = "";
    N1 = 0;
    if instance_exists(agent.Commandant)
        {
        if (agent != agent.Commandant_sup && instance_exists(agent.Commandant_sup))
            { // si le père a le numero 12
            numero  = string(agent.Commandant_sup.Numero); // on prend le numero 121
            N1 = string_length(agent.Commandant_sup.Numero)
            
            if (groupName == agent.Commandant_sup.Troupe)
                {
                agent.Commandant_sup = agent.Commandant;
                }
            }  
        }

    // On affecte un numero par defaut a chaque type de formation
    if (groupName == "bataillon"){
        num = "0";
    }
    else if (groupName == "compagnie"){
        num = "00";
    }
    else if(groupName == "troupe"){
        num = "000";
    }
    else if(groupName == "patrouille"){
        num = "0000";
    }
    else if (groupName == "escouade"){
        num = "00000";
    }
    else if (groupName == "soldat"){
        num = "000000";
    }
    else {
        num = "";
    }
    // Si l'agent a un officer, on remplace le numero par defaut par celui de l'officier
    Val = "";
    for (i = 0; i < N1; i++){
        Val += "0";
    }
    
    N2 = string_length(num);
    numero = string_replace(num,Val,numero);
    
    Num = string(numero);
    
    
    // Trouver le premier nom disponible pour notre groupe :
    
    if (agent.Troupe != groupName){
        numero = 1; // les attributions de numero commencent a 1
        var fullName = string(groupName)+ string(Num) + string(numero); // ex : escouade121
        while(ds_map_exists(global.Regiments, fullName)){ // chercher tant que le nom est pris
            numero++;
            fullName = string(groupName)+ string(Num) + string(numero); // ex : essayer avec escouade122, escouade123, etc.
        }
        
        ds_map_delete(global.Regiments, agent.Name);
        ds_map_add(global.Regiments, fullName, agent); // on inscrit l'agent comme Officier du nouveau groupe
        
        stringer="SUJ->"+string(fullName);
        
        spliter = Split_Sentence(stringer,"->");
        spliter[1] = Split_Sentence(spliter[1],";");
        
        ds_list_delete(global.grammaire,ds_list_find_index(global.grammaire,"SUJ->"+string(agent.Name)+";"));
        if ds_list_find_index(global.grammaire,spliter) == -1
            {
            ds_list_add(global.grammaire,spliter);
            }
        ds_map_delete(global.Regiments_reverse, agent);
        ds_map_add(global.Regiments_reverse, agent, fullName);
        
        ds_list_delete(obj_joueur.Regiment,ds_list_find_index(obj_joueur.Regiment,agent.Name))
        ds_list_delete(obj_joueur.RegimentAllie,ds_list_find_index(obj_joueur.RegimentAllie,agent.Name))
        ds_list_delete(obj_joueur.RegimentEnnemi,ds_list_find_index(obj_joueur.RegimentEnnemi,agent.Name))
        agent.Troupe = string(groupName);
        agent.Numero = string(Num)+string(numero);
        agent.Name = fullName;
        
        
     
    }
       return agent.Name;
}
}
exit;
