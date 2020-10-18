barg = [];
for i = 1:34
    if sum(steiner(:,i)) == 1
        barg = [barg,i];
    end
end