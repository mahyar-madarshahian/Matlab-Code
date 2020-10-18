function st = st_steiner(O,D,steiner)
n = length(steiner);
st = [];
   for i = 1:n
      if steiner(i,O) == 0
      end
      if steiner(i,O) == 1
             steiner(O,i) = 0;
             aux = [st,i];
             st = [aux,st_steiner(i,D,steiner)];
      end
   end