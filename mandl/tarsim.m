clear p L
clc
p =  node ([0.5,9.5;3,8;4.3,8;2.5,7;0.4,7;4.5,7;8,5.6;5.5,6;9.5,7.8;6,3.5;3.5,2.5;1,4;6,1;8,1.3;7,6.5]);
n = length(steiner);
plot(p,'number')
hold on
for i = 1:n
    for j = 1:n
        if steiner(i,j) == 1
            L = fline(p(i),p(j));
            plot(L)
            hold on
        end
    end
end

            
            