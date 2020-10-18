function steiner = steiner_3(back_nodes)
n = length(back_nodes);
steiner = zeros(n,n);
terminals = [205 203 511 665 680 641 559 717 708 313 110 149 184 312 392 413 720 225 655 389 509 288 563 489 613 628 72	539	188	442	642	407	476	33	65	652	326	355	96	133	719	498	504	632	453	120	496	713	701	724	169	222	698	707	518	704	712	144	294	320	516	517	540	500	280	381	394	53 340 357 367 178 686	210	475	568	722	454	638	656	661	585	235	239	477	491	176	190	212	599	622	689	165	482	650	3 20 497 660 556 331 243 510 671 403 197 217 341 189 493 329 257 287 244 470 589 618 630 330 349 100 54	224	659	529	594	302	316	332	694	702	626	183	207	214	565	405	420	721	234	464	681	714	718	23	27	35	443	469	695	625	471	277	303	232	447	296	318	327	334	505	602	683	488	262	276	421	263	272	151	699	596	135	164	499	76	94	610	435	433	501	600	481	428	436	487	576	606	590	609	624	106	158	83	486	705	80	107	319	354	573	579	264	533	551	513	68	299	311	322	567	607	460	645	658	134	693	437	118	140	519	532	309	314	351	366	375	187	554	667	605	468	478	506	515	425	446	669	145	153	121	156	50	675	560	261	265	634	558	467	474	703	639	649	364	502	147	152	324	347	562	620	97	461	250	172	254	275	43	373	612	530	494	520	215	233	668	123	356	370	247	706	711	86	155	171	495	684	692	700	633	283	310	553	566	549	12	32	445	575	614	651	682	432	631	637	644	429	109	127	664	676	317	251	268	236	240	249	574	583	206	270	291	24	44	512	715	710	39	52	424	441	514	531	582	117	128	8	15	22	28	635	572	490	597	598	166	181	621	41	237	213	402	604	640	537	374	387	578	690	67	92	643	646	191	216	535	544	5	439	449	617	619	629	1	7	223	543	163	571	584	697	98	85	269	292	304	422	462	73	569	581	368	411	561	592	587	666	306	359	390	78	99	59	70	74	193	116	253	258	673	678	102	108	115	577	521	534	636	648	448	451	463	227	360	376	418	2	4	6	9	10	11	13	14	16	17	18	19	21	25	26	29	30	31	34	36	37	38	40	42	45	46	47	48	49	51	55	56	57	58	60	61	62	63	64	66	69	71	75	77	79	81	82	84	87	88	89	90	91	93	95	101	103	104	105	111	112	113	114	119	122	124	125	126	129	130	131	132	136	137	138	139	141	142	143	146	148	150	154	157	159	160	161	162	167	168	170	173	174	175	177	179	180	182	185	186	192	194	195	196	198	199	200	201	202	204	208	209	211	218	219	220	221	226	228	229	230	231	238	241	242	245	246	248	252	255	256	259	260	266	267	271	273	274	278	279	281	282	284	285	286	289	290	293	295	297	298	300	301	305	307	308	315	321	323	325	328	333	335	336	337	338	339	342	343	344	345	346	348	350	352	353	358	361	362	363	365	369	371	372	377	378	379	380	382	383	384	385	386	388	391	393	395	396	397	398	399	400	401	404	406	408	409	410	412	414	415	416	417	419	423	426	427	430	431	434	438	440	444	450	452	455	456	457	458	459	465	466	472	473	479	480	483	484	485	492	503	507	508	522	523	524	525	526	527	528	536	538	541	542	545	546	547	548	550	552	555	557	564	570	580	586	588	591	593	595	601	603	608	611	615	616	623	627	647	653	654	657	662	663	670	672	674	677	679	685	687	688	691	696	709	716	723];
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