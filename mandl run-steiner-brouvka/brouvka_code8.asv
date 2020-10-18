clear all
clc
mandl_network = load('mandl Network.txt');
mandl_graph = build_skeleton(mandl_network,1);
[skims, back_nodes] = generate_skims(mandl_graph);
n = length(mandl_graph);
k = 1; % shomarandeye x(k)
z = 1; % shomarandeye a(z)
for i = 1:n
    for j = 1:n
        if mandl_graph(i,j) == 0
            mandl_graph(i,j) = NaN;
        elseif mandl_graph(i,j) == Inf
           mandl_graph(i,j) = NaN; 
        end
    end
end
brouvka = zeros(n,n);
for i = 1:n % shomare sotoon
    for j = 1:n % shomare satr
        if strcmp(num2str(mandl_graph(j,i)),'NaN') ~= 1
           x(k) = j;
           a(z) = mandl_graph(j,i); % addade deraye motanazer ba find
           k = k+1;
           z = z+1;
        end
    end
    flag = [];
    for H = 1:n % shomarandeye satr baraye sotoone i , baraye peyda kardane tedad derayehayi ke min hastan
        if mandl_graph(H,i) == min(a)
           flag = [flag,H]; % derayehaye motanazer ba min(a) dar mandl_graph
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
m = n*(n-1)/2;
bru_masir = cell(1,m);
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
             bru_masir{G}(1,:) = path;
             for W = 1:length(bru_masir{G})-1
                 for R = W+1:length(bru_masir{G})
                     mandl_graph(bru_masir{G}(1,W),bru_masir{G}(1,R)) = NaN;
                     mandl_graph(bru_masir{G}(1,R),bru_masir{G}(1,W)) = NaN;
                 end
             end
             k = k+1;
             G = G+1;
        end
    end
end 
[tree_mahyar,barg_mahyar,ef] = tree_produce(brouvka );
while length(ef) ~= 2
    forbidden = zeros(1,length(ef) - 1);
    kash = length(mandl_graph);
    forbidden_nodes = 1:kash;
    n = length(barg_mahyar);
    for i = 1:n
        if forbidden(i) == 0
          for j = 1:length(barg_mahyar{i})
              min_sotoon = 10000;
              cheq_tohi = 1;
              for w = 1:kash
                  if mandl_graph(w,barg_mahyar{i}(1,j)) < min_sotoon
                      if ismember(w,tree_mahyar{i}) == 0
                          min_sotoon = mandl_graph(w,j);
                          link_num = w;
                          cheq_tohi = 0;
                      end
                  end
              end
              if cheq_tohi == 1
                  link_num = [];
              end 
              for k = 1:n
                   if ismember(link_num,tree_mahyar{k}) == 1
                      if k ~= i
                         forbidden(k) = 1;
                         break
                      end
                   end
               end 
               if isempty(link_num) == 0
                   if ismember(link_num,forbidden_nodes) == 1
                       brouvka(barg_mahyar{i}(1,j),link_num) = 1;
                       brouvka(link_num,barg_mahyar{i}(1,j)) = 1;
                       mandl_graph(link_num,barg_mahyar{i}(1,j)) = NaN;
                       mandl_graph(barg_mahyar{i}(1,j),link_num) = NaN;
                   end
               end
               if isempty(link_num) == 0
                  forbidden_nodes(tree_mahyar{k}) = 0;
               end
          end
        end
     end
     [tree_mahyar,barg_mahyar,ef] = tree_produce(brouvka);    
end
        
            
            
        
    
