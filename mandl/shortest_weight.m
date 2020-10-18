clear a 
clc
weight = zeros(1,15);
j = 1;
k = 0;
for i = 1:15 % sotoone pathes
        while pathes(j,i) ~= 6
        k = k + mandl_graph(pathes(j,i),pathes(j+1,i));
        j = j+1;
        end
    weight(i) = k;
    j = 1;
    k = 0;
end

        
