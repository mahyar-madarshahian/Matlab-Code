clear p L
clc
a = load('vertexpose.txt');
p = node (a);
n = length(brouvka4);
plot(p,'number');
hold on
for i = 1:n
    for j = 1:n
        if brouvka4(i,j) == 1
            L = fline(p(i),p(j));
            plot(L)
            hold on
        end
    end
end

            
            