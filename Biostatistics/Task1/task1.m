%checking normality
drug1 = [5.7 6.3 6.1 4.9 4.8 5.9 5.5 6.0 5.4 5.3 6.9 4.4 4.6 5.7];
[h1,p,lstat,cv] = lillietest(drug1,0.01);

drug2 = [5.0 6.1 5.4 5.0 4.9 6.0 5.4 7.0 6.3 5.0 5.3 4.9 5.8 5.3];
[h2,p,lstat,cv] = lillietest(drug2,0.01);

drug3 = [7.0 7.1 6.8 6.7 7.1 6.4 6.5 5.5 5.8 7.3 4.5 6.0 6.6 5.9];
[h3,p,lstat,cv] = lillietest(drug3,0.01);

drug4 = [5.9 5.5 6.0 5.4 5.3 5.0 6.1 5.4 5.0 4.9 5.0 5.4 6.1 5.4];
[h4,p,lstat,cv] = lillietest(drug4,0.01);

drug5 = [6.8 6.7 6.5 5.5 5.8 7.1 6.4 6.5 5.5 5.8 6.9 7.3 4.9 6.0];
[h5,p,lstat,cv] = lillietest(drug5,0.01);

%variance equality
A = [drug1; drug2; drug3; drug4; drug5];
A = A';
[p,stats] = vartestn(A);
group = ["drug1" "drug2" "drug3" "drug4" "drug5"];
[p,table,stats]= anova1(A,group,'displayopt');
alpha = 0.1; 
c = multcompare(stats,alpha)

