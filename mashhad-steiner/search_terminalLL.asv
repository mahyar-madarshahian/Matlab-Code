clear path
clc
terminals = load('number_mash.txt');
terminals = terminals';
n = length(terminals);
m = n*(n-1)/2;
st = zeros(m,724)+NaN;
k = 1;
for i = 1:n-1
    for j = i+1:n
        pa = path_search(terminals(i), terminals(j), back_nodes);
        path = es_path(pa,terminals(i));
        for t = 1:length(path)
            st(k,t) = path(t);
            ss = xlswrite('masir.xls',st(1,:),'Ai');
        end
        k = k+1;
    end
end
