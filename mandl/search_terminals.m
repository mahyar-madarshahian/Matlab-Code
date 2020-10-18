clear path
clc
terminals =[1 14 5 9 12 7 2 11 13 6];
n = length(terminals);
m = n*(n-1)/2;
st = zeros(m,34)+NaN;
k = 1;
for i = 1:n-1
    for j = i+1:n
        pa = path_search(terminals(i), terminals(j), st_back);
        path = es_path(pa,terminals(i));
        for t = 1:length(path)
            st(k,t) = path(t);
        end
        k = k+1;
    end
end
