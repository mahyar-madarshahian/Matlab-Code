function steiner = steiner_2(back_nodes)
n = length(back_nodes);
steiner = zeros(n,n);
terminals = [1 14 12 9 5 13];
max_demand = terminals(ceil(rand*4));
    if mod(length(terminals),2) ~= 0
        terminals = [terminals max_demand];
    end
    lter = length(terminals);
    v = cell(1,lter/2);
    j = 1;
for i = 1:2:lter - 1
        a = terminals(i);
        b = terminals(i+1);
    pa = path_search(a,b,back_nodes);
    pa = es_path(pa,a);
    flag = 0;
    for k = 1:lter/2
       [co, ipa, iv] = intersect(pa,v{k});
        if isempty(co) == 0
          l = setdiff(pa,v{k});
          if ipa(1) > 1
              first_pa = path_search(pa(1),pa(ipa(1)),back_nodes);
              first_pa = es_path(first_pa,pa(1));
              for ii = 1:length(first_pa)-1
                   steiner(first_pa(ii),first_pa(ii+1)) = 1;
                   steiner(first_pa(ii+1),first_pa(ii)) = 1;
              end
          end
           if ipa(end) < length(pa)
              end_pa = path_search(pa(ipa(end)),pa(end),back_nodes);
              end_pa = es_path(end_pa,pa(ipa(end)));
               for ii = 1:length(end_pa)-1
                   steiner(end_pa(ii),end_pa(ii+1)) = 1;
                   steiner(end_pa(ii+1),end_pa(ii)) = 1;
               end
           end
           flag = 1;
           v{j} = union(union(first_pa,co),end_pa);
           j = j + 1;
        break
        end
     end
     if flag == 0
        
       for ii = 1:length(pa)-1
                steiner(pa(ii),pa(ii+1)) = 1;
                steiner(pa(ii+1),pa(ii)) = 1;
       end
     end
    v{j} = pa;
    if flag == 0
    j = j + 1;
    end
end