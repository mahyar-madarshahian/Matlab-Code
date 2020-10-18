clear a Allpath NewAllpath index 
k=1;
x=1;
Allpath=[];%in matrisi hast ke hich deraye nadare, hameye masira ro mikham to in zakhire konam, 
%payin mifahmi che niazi hast ke ino inja intori tarif mikonam :)
for R = 1:34% R noghteye entehaye masir ast
pathes=zeros(34,34)+NaN;
for j=1:34%j index halghe hast ke az 1 ta 15 avaz mishe, hala ke az har
     %noghte be 6 masir mikham, in vazife ro mizarim be doshe i
     k=j;
for i=1:34 
   if   strcmp( num2str(back_nodes(k,R)),'NaN') == 1 
        a=0;
       break
   end
    if back_nodes(k,R) ~= R
        a(i,:) = back_nodes(k,R);
        k=back_nodes(k,R);
    else
        a(i,:) = R;% in khat adade 6 ro dar akhar mizare.
        break
    end
end
pathes(1:size(a,1)+1,j)=[j;a];
clear a %bayad dobare a ro pak kone
end
Allpath=[Allpath,pathes];%halesho bebar, dar dore aval Allpath ye matrise tohi (khali)
%hast, matrise pathes be oon ezafe mishe, alamate "," baes mishe matrise
%jadide kenaresh biad, age be jash ";" bezari, ziresh khahad omad.dar dore
%dovom vaghti R=2 hast, Allpath dige tohi nist, va matrise masire jadid,
%kenare ghabli gharar migire va matrise jadido misaze. inkar kheli shabihe
%kari hast ke ghablan goftam yani k=k+1...

end
index = 0;
NewAllpath=Allpath(:,1);%avalin sotono mizarim tosh, chon ghatan tekrari nist
for i=2:size(Allpath,2);%i tamame sotonha ro yeki yeki mibine az sotone 2, sotone 1 ro ghablan didim(khate ghabl)
    for j=1:i-1%j tamame sotonhaye ghable i ro mibine
        %in chiza ke khate bad mibini khodam alan yad gereftam, union
        %ejtema 2 majmoe hast, intersect eshterak va akhari tafazol hamishe
        %ejtema bororgtar mosavi eshterake, pas age tafazoleshon sef shod
        %yani eyne ham bodan. pas do masire moshabe  hastan
        C=setdiff(union(Allpath(:,j),Allpath(:,i)),intersect(Allpath(:,j),Allpath(:,i)));%Allpath(:,i) sotone i hast, miad va ono ba
        if size(C,1)==0;
            index=1;% age index barabar ba 1 shod, yani hadaghal ye soton bode ke moshabeh bode, yani masir tekrari hast
        end
    end
    if index ~= 1%yani age index yek nabod...
    NewAllpath=[NewAllpath,Allpath(:,i)];
    end
    index = 0;
end
