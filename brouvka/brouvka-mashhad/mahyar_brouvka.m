function final_brouvka = mahyar_brouvka (matrix_graph,cell_graph)
i = 1;
n = length(matrix_graph);
while cell_graph{i} == [];
    barg = cell_graph{i}(1,end);
    for j = 1:n
        if strcmp(num2str(matrix_graph(j,barg(1))),'NaN') ~= 1
           x(k) = j;
           a(z) = matrix_graph(j,barg(1));
           k = k+1;
           z = z+1;
        end
    end
    for j = 1:n
        if strcmp(num2str(matrix_graph(j,barg(2))),'NaN') ~= 1
           x(k) = j;
           a(z) = matrix_graph(j,barg(1));
           k = k+1;
           z = z+1;
        end
    end
    flag = [];
    for H = 1:n % shomarandeye satr baraye sotoone i , baraye peyda kardane tedad derayehayi ke min hastan
        if matrix_graph(H,barg(1)) == min(a)
           flag_1 = [flag,H]; % derayehaye motanazer ba min(a) dar kashan_graph
        end
    end
    for H = 1:n % shomarandeye satr baraye sotoone i , baraye peyda kardane tedad derayehayi ke min hastan
        if matrix_graph(H,barg(2)) == min(a)
           flag_2 = [flag,H]; % derayehaye motanazer ba min(a) dar kashan_graph
        end
    end
    flag = [flag_1,flag_2];
    flag1 = flag(floor(rand*length(flag))+1); % addade entekhab shode az rooye flag baraye sakhte brouvka
    if flag1 == flag_1(1,:)
    brouvka(flag1,barg(1)) = 1;
    brouvka(barg(1),flag1) = 1;
    clear x;
    clear a;
    k = 1;
    z = 1;
    else
    brouvka(flag1,barg(2)) = 1;
    brouvka(barg(2),flag1) = 1;  
    end
end