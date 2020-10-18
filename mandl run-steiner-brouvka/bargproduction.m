barg = [];
for i = 1:15
    if sum(brouvka(:,i)) == 1
        barg = [barg,i];
    end
end