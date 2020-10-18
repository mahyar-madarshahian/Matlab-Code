function pa = path_search(O, D, back_nodes)
aux = zeros(1,2);
pa = [];
if back_nodes(D,O) == O
    aux(1,:) = [O D];
    pa = [pa,aux];
else
    aux(1,:) = [O D]; 
    pa = [path_search(O, back_nodes(D,O),back_nodes),aux];
end
    
    
    