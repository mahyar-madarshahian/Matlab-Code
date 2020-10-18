barg = [];
for i = 1:724
    if sum(brouvka4(:,i)) == 1
        barg = [barg,i];
    end
end