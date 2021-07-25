pesticide_A = [1 1 1 1 1 1 2 2 2 2 2 2 3 3 3 3 3 3 4 4 4 4 4 4 5 5 5 5 5 5]';
pesticide_B = [1 1 1 2 2 2 1 1 1 2 2 2 1 1 1 2 2 2 1 1 1 2 2 2 1 1 1 2 2 2]';

death = [6 8 12 16 18 21 24 24 28 42 38 35 44 46 34 38 40 45 44 36 40 47 49 46 47 43 50 48 55 49]';

%kolmogorov-smirnov's test
flag = 1;
for i = 4:3:length(death)
        [h,p,ksstat]=kstest2(death(1:3,1),death(i:(i+2),1),0.01);
        if(h == 1 )
            flag = 0;
        end
end
flag

%variance BrownForsythe's test
x = zeros(3,length(death)/3);
for i = 1:3:length(death)
x(:,(i+2)/3) = death(i:(i+2),:);
end
[p,stats] = vartestn(x,'TestType','BrownForsythe','Display','off');






%Friedman's test
X = [6 24 44 44 47; 8 24 46 36 47;12 28 34 40 50; 16 42 38 47 48; 18 38 40 49 55; 21 35 45 46 49];
[p,table,stats1] = friedman(X,3,'on');
%Friedman's test 
new_X = [6 16;8 18;12 21;24 42;24 38;28 35;44 38;46 40;34 45;44 47;36 49;40 46;47 48;43 55;50 49];
[p,table,stats2] = friedman(new_X,3,'on');

c1 = multcompare(stats1,0.05,'on','tukey-kramer','column');
figure();
c2 = multcompare(stats2,0.05,'on','tukey-kramer','column');


