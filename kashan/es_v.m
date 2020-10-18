function v = es_v(v)
d = zeros(size(v));
for i = 1:length(v) - 1
    if v(i) == v(i+1)
        d(i+1) = 1;
    end
end
d = find(d == 1);
 v(d) = [];
 