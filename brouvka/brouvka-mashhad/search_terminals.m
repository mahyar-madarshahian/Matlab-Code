clear path
clc
[skims, st_back] = generate_skims(brouvka4);
terminals =[1	2	7	8	10	12	22	23	24	32	43	47	50	51	54	59	70	74	77	83	85	93	95	97	99	100	102	107	109	110	117	121	123	124	142	143	149	160	164	165	170	173	177	181	188	192	205	206	207	212	214	221	222	224	225	227	228	234	238	243	256	264	265	266	272	280	287	288	292	294	296	298	306	309	310	314	326	331	338	339	354	356	362	370	373	376	377	385	387	390	392	405	408	413	418	421	422	428	448	449	450	453	464	467	468	470	471	476	480	482	486	490	491	497	500	502	510	511	513	514	525	531	536	541	550	559	560	566	567	573	584	585	587	591	594	596	597	614	618	619	620	621	622	623	630	631	638	639	648	651	654	658	664	665	666	669	671	680	682	687	690	698	699	712	714	717	718	721	722	724];
n = length(terminals);
for i = 1:n
    for j = i+1:n-1
        if terminals(1,i) == terminals(1,j)
            terminals(:,j) = [];
            n = n-1;
        end
    end
end
ss = xlswrite('qqqq.xls',terminals','A1');
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
        k = k+1;
    end
end






