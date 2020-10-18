%% Dar in cell mikhahim dar AA=[a1 a2 ... an], masirhaye az a1 ta baghi,
%va a2 ta baghi... ro bedat biarim
Apath=[];%matrisi ke mikhad beshe javabemon
AA=[27 9 32 5 1 26 34 17 10];
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