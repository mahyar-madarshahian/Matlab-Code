function skeleton = build_skeleton(ladder, bidirectional)
ladder(:,1) = ladder(:,1)+1;
ladder(:,2) = ladder(:,2)+1;
n = max(max(ladder(:,1:2)));
skeleton = zeros(n,n);
for i = 1:length(ladder)
    skeleton(ladder(i, 2),ladder(i,1))= ladder(i, 3);
    if (bidirectional==1)
        skeleton(ladder(i,1),ladder(i,2))=ladder(i,3);
    end
end
skeleton(skeleton == 0) = inf;
for i = 1:n
    skeleton(i,i) = 0;
end
