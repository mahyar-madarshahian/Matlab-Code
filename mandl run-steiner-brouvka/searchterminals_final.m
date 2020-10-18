clear path
clc
brouvka = load('brouvka.txt');
[skims, st_back] = generate_skims(brouvka);
terminals = [10 6 1 2 3 4 5 7 8 9 11 12 13 14 15];
terminals = terminals';
n = length(terminals);
m = n*(n-1)/2;
st = zeros(m,15)+NaN;
k = 1;
for i = 1:3
    for j = i+1:n
        pa = path_search(terminals(i), terminals(j), st_back);
        path = es_path(pa,terminals(i));
        for t = 1:length(path)
            st(k,t) = path(t);
        end
        
       % call fprintf to print the updated text strings
   fid = fopen('newfile.txt','a+'); % txt newfile ra besaz va addadha ra begir vali ghabliharo pak Nakon
   fprintf(fid, '%s\t', '[TYPE 3]')
   for tt=1:15
       stcontent=st(k,tt);
       if (strcmp(num2str(stcontent),'NaN')==1)
       fprintf(fid, '\n', stcontent);% faghat boro khate bad    
           break;
       end
      fprintf(fid, '%d\t', stcontent); % addad ra vered va yek tab fasele bede
  end   
    fclose(fid); % fid ra beband
    
%     fid2 = fopen('newfile1.txt','r');
%     scancontent=fscanf(fid2,'%d')
%     fclose(fid2);
    
        k = k+1;
    end
end
