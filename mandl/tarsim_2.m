p1 = node([0.5,9.5]);
p2 = node([3,8]);
p3 = node([4.3,8]);
p4 = node([2.5,7]);
p5 = node([0.4,7]);
p6 = node([4.5,7]);
p7 = node([8,5.6]);
p8 = node([5.5,6]);
p9 = node([9.5,7.8]);
p10 = node([6,3.5]);
p11 = node([3.5,2.5]);
p12 = node([1,4]);
p13 = node([6,1]);
p14 = node([8,1.3]);
p15 = node([7,7.5]);
p = node ([0.5,9.5;3,8;4.3,8;2.5,7;0.4,7;4.5,7;8,5.6;5.5,6;9.5,7.8;6,3.5;3.5,2.5;1,4;6,1;8,1.3;7,6.5]);
n = length(steiner);
k = 1;
for i = 1:n
    for j = 1:n
        if steiner(i,j) == 1
            L(k) = fline(p(i),p(j));
            k = k+1;
        end
    end
end
plot(L)
            
            