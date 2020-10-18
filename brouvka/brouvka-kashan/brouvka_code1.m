clear all
clc
kashan_network = load('kashan Network.txt');
kashan_graph = build_skeleton(kashan_network,1);
[skims, back_nodes] = generate_skims(kashan_graph);
n = length(kashan_graph);
k = 1; % shomarandeye x(k)
z = 1; % shomarandeye a(z)
for i = 1:n
    for j = 1:n
        if kashan_graph(i,j) == 0
            kashan_graph(i,j) = NaN;
        elseif kashan_graph(i,j) == Inf
           kashan_graph(i,j) = NaN; 
        end
    end
end
brouvka = zeros(n,n);
for i = 1:n % shomare sotoon
    for j = 1:n % shomare satr
        if strcmp(num2str(kashan_graph(j,i)),'NaN') ~= 1
           x(k) = j;
           a(z) = kashan_graph(j,i); % addade deraye motanazer ba find
           k = k+1;
           z = z+1;
        end
    end
    flag = [];
    for H = 1:n % shomarandeye satr baraye sotoone i , baraye peyda kardane tedad derayehayi ke min hastan
        if kashan_graph(H,i) == min(a)
           flag = [flag,H]; % derayehaye motanazer ba min(a) dar kashan_graph
        end
    end
    flag1 = flag(floor(rand*length(flag))+1); % addade entekhab shode az rooye flag baraye sakhte brouvka
    brouvka(flag1,i) = 1;
    brouvka(i,flag1) = 1;
    clear x;
    clear a;
    k = 1;
    z = 1;
end
    [skims, brouvka_back] = generate_skims(brouvka);
    terminals = [];
for i = 1:n % sotoone brouvka
    term = [];
    for j = 1:n % satre brouvka
        if brouvka(j,i) == 1
            term = [term,i];
        end
    end
        if length(term) == 1
            terminals = [terminals,term]; % barghaye derakht (moshakhas nis ke beineshoon masir hast ya na!)
        end
    clear term
end
n = length(terminals);
bru_masir = zeros(n,n);
G = 1;
for E = 1:n-1
    for A = E+1:n
        pa = path_search(terminals(E), terminals(A),brouvka_back);
        path = es_path(pa,terminals(E));
        if isempty(path) == 0
            if path(end) ~= terminals(A)
               clear path
            end
               k = 1;
        end
        for  t = 1:length(path)
             st(k,t) = path(t);
        end
        if   isempty(path) == 0
            for z = 1:n
                bru_masir(z,1:length(path)) = path;
                for W = 1:length(bru_masir(z,length(path)))-1
                     for R = W+1:length(bru_masir(z,length(path)))
                         kashan_graph(bru_masir(z,W),bru_masir(z,R)) = NaN;
                         kashan_graph(bru_masir(z,R),bru_masir(z,W)) = NaN;
                     end
                 end
             end
             k = k+1;
             G = G+1;
        end
    end
end

      
        

    
