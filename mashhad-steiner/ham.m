function h = ham(graph)
n = length(graph);
h = graph;
for i = 1:n
   row = i;
   link = find(graph(i,:)== 1);
   for k = 1:length(link)
       for j = 1:n
           if (graph(link(k),j) == 1 && j ~= row)
               h(row,j) = 1;
           end
       end
   end
end