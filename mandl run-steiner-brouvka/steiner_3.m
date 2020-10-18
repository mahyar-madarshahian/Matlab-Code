function steiner = steiner_3(back_nodes)
n = length(back_nodes);
steiner = zeros(n,n);
terminals = [1 14 5 9 12 7 2 11];
max_demand = terminals(ceil(rand*(length(terminals) - 1)));
    if mod(length(terminals),2) ~= 0
        terminals = [terminals max_demand];
    end
    lter = length(terminals);
    v = cell(1,lter/2);
    j = 1;
    set_node = [];
for i = 1:2:lter - 1
        a = terminals(i);
        b = terminals(i+1);
    pa = path_search(a,b,back_nodes);
    pa = es_path(pa,a);
    flag = 0;
    h = 0;
   [co, ipa, iv] = intersect(pa,set_node);
   if isempty(co) == 1
       flag = 2;
   end
   if flag ~= 2
       new = zeros(1,length(co));
   for yy = 1: length(co)
              new(yy) = find(pa == co(yy));
   end
              new = sort(new);
   for g = 1:length(co)
             co(g) = pa(new(g));
   end
   sd = zeros(1,j - 1);
   for k = 1:j - 1
     if isempty(setdiff(co,v{k}) == 0)
         kk = k;
         h = 1;
         break
     elseif sum(ismember(co,v{k}))
         sd(k) = k;
     end
   end
   rrr = find(sd == 0);
   sd(rrr) = [];
   esh = j - 1;
   if esh > 1
       we = zeros(esh); 
   for tt = 1: j - 2
       for yy = tt + 1:j - 1
           if isempty(intersect(v{tt},v{yy})) == 0
               we(tt,yy) = 1;
               we(yy,tt) = 1;
           end
       end
   end
   we(1:esh+1:end) = 1;
   [mas tek ef do] = dmperm(we);
   ham_no = length(ef) - 1;
   sub_we = cell(1,ham_no);
   for ii = 1:ham_no
       sub_we{ii} = mas(ef(ii):ef(ii+1)-1);
   end
   klid = zeros(length(co),ham_no);
   for gg = 1:length(co)
       for ii = 1:ham_no
           for rr = 1:length(sub_we{ii})
               if ismember(co(gg),v{sub_we{ii}(rr)})
                   klid(gg,ii) = 1;
               end
           end
       end
   end
  end
 end
 if h < 1
  p = 1;
  masirha = cell(1,30);
  for u = 1:length(co)
      aa = 0;
      ll = 0;
      qq = 0;
      dd = 0;
      gh = find(klid(u,:) == 1);
      for ii = 1:length(sub_we{gh})
          if u < 2
          if ismember(co(u),v{sub_we{gh}(ii)})
              if pa(1) ~= co(u)
                  if aa < 1
                  maseer = path_search(pa(1),co(u),back_nodes);
                  maseer = es_path(maseer,pa(1));
                  steiner = mat_esh(maseer,steiner);
                  masirha{p} = maseer;
                  p = p +1;
                  aa = 1;
                  if klid(u,:) == klid(u + 1,:)
                  if ll < 1
                  [sk, b_n] = generate_skims(steiner_aux);
                  maseer = path_search(co(u),co(u+1),b_n);
                  maseer = es_path(maseer,co(u));
                  steiner = mat_esh(maseer,steiner);
                  masirha{p} = maseer;
                  p = p +1;
                  ll = 1;
                  end
                  else
                      if dd < 1
                  maseer = path_search(co(u),co(u+1),back_nodes);
                  maseer = es_path(maseer,co(u));
                  steiner = mat_esh(maseer,steiner);
                  masirha{p} = maseer;
                  p = p +1;
                  dd = 1;
                  end
                  end
                  end
              end
          end
          elseif u == length(co)
              if co(end) ~= pa(end)
                  if qq < 1
                 maseer = path_search(co(end),pa(end),back_nodes);
                 maseer = es_path(maseer,co(end));
                 steiner = mat_esh(maseer,steiner);
                 masirha{p} = maseer;
                 p = p +1;
                 qq = 1;
                  end
              end
          else
              if klid(u,:) == klid(u + 1,:)
                  if ll < 1
                  [sk, b_n] = generate_skims(steiner_aux);
                  maseer = path_search(co(u),co(u+1),b_n);
                  maseer = es_path(maseer,co(u));
                  steiner = mat_esh(maseer,steiner);
                  masirha{p} = maseer;
                  p = p +1;
                  ll = 1;
                  end
              else
                  if dd < 1
                  maseer = path_search(co(u),co(u+1),back_nodes);
                  maseer = es_path(maseer,co(u));
                  steiner = mat_esh(maseer,steiner);
                  masirha{p} = maseer;
                  p = p +1;
                  dd = 1;
                  end
          end
      end
      end
  end
  for i = 1:p - 1
      v{j} = [v{j} masirha{i}];
  end
  ff = v{j};
  v{j} = es_v(ff);
end  
   if h == 1
      
       [co, ipa, iv] = intersect(pa,v{kk});
        new = zeros(1,length(co));
   for yy = 1: length(co)
              new(yy) = find(pa == co(yy));
   end
              new = sort(new);
   for g = 1:length(co)
             co(g) = pa(new(g));
   end
       if ismember(co(1),v{kk}) == 1
              if pa(1) ~= co(1)
              first_pa = path_search(pa(1),co(1),back_nodes);
              first_pa = es_path(first_pa,pa(1));
              end
              for ii = 1:length(first_pa)-1
                   steiner(first_pa(ii),first_pa(ii+1)) = 1;
                   steiner(first_pa(ii+1),first_pa(ii)) = 1;
              end
        end
           if ismember(co(end),v{kk}) == 1
               if pa(end) ~= co(end)
              end_pa = path_search(co(end),pa(end),back_nodes);
              end_pa = es_path(end_pa,co(end));
               for ii = 1:length(end_pa)-1
                   steiner(end_pa(ii),end_pa(ii+1)) = 1;
                   steiner(end_pa(ii+1),end_pa(ii)) = 1;
               end
               end
           end
           kkk = 0;
           ppp = 0;
           if isempty(first_pa) == 0
               oo = first_pa(end);
           else
               oo = pa(1);
               kkk = 1;
           end
           if isempty(end_pa) == 0
               ppp = 1;
               dd = end_pa(1);
           else
               dd = pa(end);
           end
           if oo~= dd
           [sk, b_n] = generate_skims(steiner_aux);
           mo = path_search(oo,dd,b_n);
           mo = es_path(mo,oo);
           elseif kkk == 1 && ppp == 1
               mo = pa(1);
           elseif kkk == 0 && ppp == 0
               mo = pa(end);
           else
               mo = [];
           end
           if isempty(first_pa) == 0
               fg = 1;
           else 
               fg = 0;
           end
           if isempty(end_pa) == 0
               eg = 1;
           else
               eg = 0;
           end
           if fg == 1 && eg == 1
               if isempty(mo) == 0
               first_pa(end) = [];
               end_pa(1) = [];
               else
                   first_pa(end) = [];
               end
           v{j} = [first_pa mo end_pa];
           elseif fg == 1 && eg == 0
               first_pa(end) = [];
               v{j} = [first_pa mo];
           elseif fg == 0 && eg == 1
               end_pa(1) = [];
               v{j} = [mo end_pa];
           elseif fg == 0 && eg == 0
               v{j} = mo;
           end      
end  
  if flag == 2
     steiner = mat_esh(pa,steiner);   
     v{j} = pa;  
  end  
  if j <= lter - 1
       [set_node qq bb] = union(set_node, v{j});
  end   
   steiner_aux = steiner;
   first_pa = [];
   end_pa = [];
   j = j +1;
end