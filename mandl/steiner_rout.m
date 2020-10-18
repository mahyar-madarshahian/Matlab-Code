clear a
clc
terminals = [1 14 12 9];
a = [];
i = 1;
j = 1;
set_path = cell(1,6);
n = length(steiner);
steiner_masir = zeros(n,n);
for k = 1:length(terminals)-1
    b = terminals(1,k);% deraye(k) matrise terminal
    R = terminals(1,k+1); % noghteye tavaghofe masire aval
        a = [a,b];
        while a(1,:) ~= terminals(1,length(terminals))% ta zamani ke (a) barabar ba addede akhare matrise terminals shavad
            if steiner(j,b) == 0
                j = j+1;
            end
            if steiner(j,b) == 1
                b = j;
                a = [a,b];
            end
            if  b == R
                i = i+1;
                R = terminals(1,k+i);
                set_path{i-1} = a;
                clear a
                a = [];
                a = [a,terminals(1,k)];
                j = 1;
            end
        end
              % in barnameyi ke man neveshtam , faghat az yek masir harkat
              % mikone , man mikham harchi yek hast barrasi beshe, ghat
              % zadaaaaaaam
end