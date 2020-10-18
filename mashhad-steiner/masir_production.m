clear all
clc
masir2 = [274	560	739	1025	1059	1099	1482	1592	1923	2130	2501	2794	3406	3440	3658	3802	3840	3997	4112	4271	4293	4817	5028	5065	5195	5344	5496	5648	5662	5787	5852	5910	5956	5965	6081	6159	6266	6282	6310	6315	6398	6428	6526	6548	6615	6801	6924	6934	7191	7356	7393	7691	7763	7842	7990	8013	8142	8743	8756	9196	9648	9753	9819	10015	10219	10725	11004	11204	11554	11669	11900	12090	12261	12296	12403	12526	12871	12884	13009	13612	13619	13883	13929	14033	14107	14207	14270	14327	14475	14719	14907	15547	15550	15569	15636	15795	15856	15939	16028	16105	16205	16239	16307	16515	16517	16649
];
newfile = load('newfile.txt');
n = length(masir2);
m = length(newfile);
fid = fopen('masir2','a+'); % txt newfile ra besaz va addadha ra begir vali ghabliharo pak Nakon
  for i = 1:n
      for j = 0:m
          if masir2(1,i) == j
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
   fid = fopen('masir2','a+');  
  end   


    
