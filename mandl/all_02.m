clear a Allpath NewAllpath index
k=1;
x=1;
Allpath=[];%in matrisi hast ke hich deraye nadare, hameye masira ro mikham to in zakhire konam,
%payin mifahmi che niazi hast ke ino inja intori tarif mikonam :)
for R = 1:15% R noghteye entehaye masir ast
    pathes=zeros(15,15);
    for j=1:15%j index halghe hast ke az 1 ta 15 avaz mishe, hala ke az har
        %noghte be 6 masir mikham, in vazife ro mizarim be doshe i
        k=j;
        for i=1:15
            if   strcmp( num2str(st_back(k,R)),'NaN') == 1
                a=0;
                break
            end
            if st_back(k,R) ~= R
                a(i,:) = st_back(k,R);
                k=st_back(k,R);
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
%% Dar in cell mikhahim dar AA=[a1 a2 ... an], masirhaye az a1 ta baghi,
%va a2 ta baghi... ro bedat biarim
Apath=[];%matrisi ke mikhad beshe javabemon
AA=[1 14 12 9 5 13];
for i=1:length(AA)
    Ai=AA(i);
    BB=setdiff(AA,Ai);%matrise hame noghat joz Ai
    for j=1:length(BB)
        Aj=BB(j);
        for j=1:size(NewAllpath,2);
            if NewAllpath(1,j) == Ai
                D1=NewAllpath(:,j);
                D2=D1(D1>0);
                if D2(end) == Aj
                    Apath=[Apath,NewAllpath(:,j)];
                end
            end
            
        end
    end
end