clear all
clc
masir = [45 51 68];
newfile = load('newfile.txt');
n = length(masir);
m = length(newfile);
fid = fopen('masir','a+'); % txt newfile ra besaz va addadha ra begir vali ghabliharo pak Nakon
  for i = 1:n
      for j = 0:m
          if masir(1,i) == j
              for k = 1:m
                  stcontent = newfile(j+1,k);
                  if stcontent ~= 0
                  fprintf(fid, '%d\t', stcontent);
                  else
                      fprintf(fid, '\n', stcontent);% faghat boro khate bad
                      fclose(fid);
                      break
                  end
              end
          end
      end
   fid = fopen('masir','a+');  
  end   


    
