clear path
clc
[skims, st_back] = generate_skims(steiner4);
terminals = [1	3	6	7	8	12	16	22	24	32	33	38	42	44	50	54	59	72	73	74	81	83	85	97	102	109	121	123	124	127	142	149	156	165	171	179	191	203	205	212	214	216	220	224	227	239	244	252	256	264	265	266	283	287	292	294	304	312	313	326	328	330	349	367	377	392	395	407	411	413	418	428	429	436	456	466	467	468	475	476	477	480	482	490	509	511	514	531	539	559	563	585	587	594	605	612	613	622	651	657	666	669	671	676	680	690	699	712	714	718	719	721	722	723	724];
terminals = terminals';
n = length(terminals);
m = n*(n-1)/2;
st = zeros(m,724)+NaN;
k = 1;
for i = 1:n-1
    for j = i+1:n
        pa = path_search(terminals(i), terminals(j), st_back);
        path = es_path(pa,terminals(i));
        for t = 1:length(path)
            st(k,t) = path(t);
        end
        
       % call fprintf to print the updated text strings
   fid = fopen('newfile.txt','a+'); % txt newfile ra besaz va addadha ra begir vali ghabliharo pak Nakon
   fprintf(fid, '%s\t', '[TYPE 3]')
   for tt=1:724
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
