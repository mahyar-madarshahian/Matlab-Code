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
                     kashan_graph(bru_masir{G}(1,W),bru_masir{G}(1,R)) = NaN;
                     kashan_graph(bru_masir{G}(1,R),bru_masir{G}(1,W)) = NaN;
                 end
             end
             k = k+1;
             G = G+1;
        end
    end
end
k = 1;
i = 1;
n = length(kashan_graph);
barg_tree = [];
while isempty(bru_masir{i}) ~= 1;
    barg = [];
    barg = [barg,bru_masir{i}(1,1)];
    barg = [barg,bru_masir{i}(1,end)];
    barg_tree = [barg_tree;barg];% barghaye har matrise cell
    i = i+1;
end
i = 2;
for Y = 1:length(barg_tree)-1
    for C = Y+1:length(barg_tree)
        if strcmp(num2str(barg_tree(Y,2)),'NaN') == 0
             if  barg_tree(Y,2) == barg_tree(C,2)
                 barg_tree(Y,i+1) = barg_tree(C,1);
                 barg_tree(C,:) = NaN;
                 i = i+1;
             end
        end
    end
    i = 2;
end
for i = 1:length(barg_tree)
    for j = 1:length(barg_tree(i,:))
        if barg_tree(i,j) == 0
            barg_tree(i,j) = NaN;
        end
    end
end
barg_search = []; %  bargha dar har cell ke varede matris mishavad
barg_search1 = [];
barg_new = [];
for i = 1:length(barg_tree)
    for j = 1:length(barg_tree(i,:))
        barg_search = [barg_search,barg_tree(i,j)];
    end
        
        for k = 1:length(barg_search)
            for z = 1:length(kashan_graph)
                if strcmp(num2str(barg_search(k)),'NaN') ~= 1
                   if strcmp(num2str(kashan_graph(z,barg_search(k))),'NaN') ~= 1
                       if isempty(barg_search1) == 0 ;
                           
                           
                           clear barg_masir
                           barg_masir = [];
                           for L = 1:length(barg_tree)
                               if find(bru_masir{L}(1,:) == z)
                                   barg_masir = [barg_masir,L];
                               end
                           end
                           if isempty(barg_masir) == 0
                               clear path
                               clear path1
                               path1 = [];
                               [skims, back_nodes] = generate_skims(brouvka); %% chek shavad ke masir doros ast??
                           for R = 1:length(barg_masir)
                               for RR = 1:length(bru_masir{barg_masir(R)}) %% kheili chek shavad, shayada faghat bru_masir{R} basahad
                                   pa = path_search(barg_search(k), bru_masir{barg_masir(R)}(1,RR), back_nodes);
                                   path = es_path(pa,z);
                                   path1 = [path1,path];
                               end
                           end
                           if isempty(path1) == 1  
                                 if strcmp(num2str(pa),'NaN') ~= 1
                                                   if kashan_graph(z,barg_search(k))< barg_search1(1,:)
                                                      clear barg_new
                                                      barg_search1 = [kashan_graph(z,barg_search(k))];% inja az halate tasadofi dar miad, khodam dar ayande behboodesh midam
                                                      barg_new = [z,barg_search(k)];
                                                   end   
                                 end
                           else
                              
                               break %%% eshtebah ast, az halgheye birooni aghaz mikonad, shayadam eshtebah nabashe !!!
                           end
                           
                           end
                        
                    else
                            barg_search1 = [barg_search1,kashan_graph(z,barg_search(k))];
                            
                            clear barg_masir
                            barg_masir = [];
                            for L = 1:length(barg_tree)
                                if find(bru_masir{L}(1,:) == z)
                                   barg_masir = [barg_masir,L];
                                end
                            end
                            if isempty(barg_masir) == 0
                               clear path
                               clear path1
                               path1 = [];
                               [skims, back_nodes] = generate_skims(brouvka); %% chek shavad ke masir doros ast??
                           for R = 1:length(barg_masir)
                               for RR = 1:length(bru_masir{R})
                                   pa = path_search(barg_search(k), bru_masir{barg_masir(R)}(1,RR), back_nodes);
                                   path = es_path(pa,z);
                                   path1 = [path1,path];
                               end
                           end
                           if isempty(path1) == 1
                            
                           barg_new = [z,barg_search(k)];
                           end
                           end
                       end
                   end
                else
                    break
                end
            end
        end
        if isempty(barg_new) == 1
             clear barg_search
             clear barg_search1
             clear barg_new
             barg_search = [];
             barg_search1 = [];
             barg_new = [];
        else
        brouvka(barg_new(1),barg_new(2)) = 1;
        brouvka(barg_new(2),barg_new(1)) = 1;
        [skims, back_nodes] = generate_skims(brouvka); %% chek shavad ke masir doros ast??
        kashan_graph(barg_new(1),barg_new(2)) = NaN;
        kashan_graph(barg_new(2),barg_new(1)) = NaN;
        clear barg_search
        barg_search = [];
        clear barg_search1
        barg_search1 = [];
        clear barg_new
        barg_new = [];
        end
end

                      
                       
                %barg_search2 = find(min(barg_search1));
                %barg_search3 = 
                
                %barg_min = barg_search1(floor(rand*length(barg_search1))+1);
                %brouvka(flag1,barg(2)) = 1;
                %brouvka(barg(2),flag1) = 1;
                






%k = 1;
%i = 1;
%while isempty(bru_masir{i}) ~= 1;
 %   barg = [];
  %  barg = [barg,bru_masir{i}(1,1)];
   % barg = [barg,bru_masir{i}(1,end)];
    %for j = 1:n
     %   if strcmp(num2str(kashan_graph(j,barg(1))),'NaN') ~= 1
      %     x(k) = j;
       %    a(z) = kashan_graph(j,barg(1));
        %   k = k+1;
        %   z = z+1;
        %end
   % end
    %for j = 1:n
     %   if strcmp(num2str(kashan_graph(j,barg(2))),'NaN') ~= 1
      %     x(k) = j;
       %    a(z) = kashan_graph(j,barg(1));
        %   k = k+1;
         %  z = z+1;
        %end
    %end
    %flag = [];
    %flag_1 = [];
    %flag_2 = [];
    %for H = 1:n % shomarandeye satr baraye sotoone i , baraye peyda kardane tedad derayehayi ke min hastan
     %   if kashan_graph(H,barg(1)) == min(a)
      %     flag_1 = [flag,H]; % derayehaye motanazer ba min(a) dar kashan_graph
       % end
    %end
    %for H = 1:n % shomarandeye satr baraye sotoone i , baraye peyda kardane tedad derayehayi ke min hastan
    %    if kashan_graph(H,barg(2)) == min(a)
     %      flag_2 = [flag,H]; % derayehaye motanazer ba min(a) dar kashan_graph
      %  end
    %end
    %flag = [flag_1,flag_2];
    %flag1 = flag(floor(rand*length(flag))+1); % addade entekhab shode az rooye flag baraye sakhte brouvka
    %if flag1 == flag_1(1,:)
    %brouvka(flag1,barg(1)) = 1;
    %brouvka(barg(1),flag1) = 1;
    %clear x;
    %clear a;
    %k = 1;
    %z = 1;
    %else
    %brouvka(flag1,barg(2)) = 1;
    %brouvka(barg(2),flag1) = 1;  
    %end
    %clear barg
    %i = i+1;
%end

      
        

    
