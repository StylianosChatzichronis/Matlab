corn = ones(27,3);
y =[65 56 45 49 59 46 51 55 51 66 50 69 45 45 39 52 43 57 38 65 49 50 53 46 55 39 51]';


corn(1,2) = 12.1;
corn(2,2) = 6.2;
corn(3,2) = 13.2;
corn(4,2) = 11.4;
corn(5,2) = 7.5;
corn(6,2) = 10.8;
corn(7,2) = 9.7;
corn(8,2) = 8.4;
corn(9,2) = 13.0;
corn(10,2) = 6.0;
corn(11,2) = 13.3;
corn(12,2) = 3.9;
corn(13,2) = 14.1;
corn(14,2) = 13.4;
corn(15,2) = 15.0;
corn(16,2) = 9.2;
corn(17,2) = 14.7;
corn(18,2) = 7.7;
corn(19,2) = 15.6;
corn(20,2) = 3.5;
corn(21,2) = 13.1;
corn(22,2) = 9.1;
corn(23,2) = 8.9;
corn(24,2) = 12.6;
corn(25,2) = 10.7;
corn(26,2) = 15.9;
corn(27,2) = 11.6;

corn(1,3) = 0.8;
corn(2,3) = 1.0;
corn(3,3) = 0.7;
corn(4,3) = 0.8;
corn(5,3) = 0.9;
corn(6,3) = 1.0;
corn(7,3) = 0.9;
corn(8,3) = 0.7;
corn(9,3) = 0.5;
corn(10,3) = 0.7;
corn(11,3) = 0.9;
corn(12,3) = 0.6;
corn(13,3) = 0.9;
corn(14,3) = 1.0;
corn(15,3) = 0.8;
corn(16,3) = 0.8;
corn(17,3) = 0.9;
corn(18,3) = 1.0;
corn(19,3) = 1.1;
corn(20,3) = 0.6;
corn(21,3) = 0.8;
corn(22,3) = 0.9;
corn(23,3) = 0.7;
corn(24,3) = 1.3;
corn(25,3) = 1.0;
corn(26,3) = 0.6;
corn(27,3) = 1.0;

corn(1,4) = 0.6;
corn(2,4) = 0.2;
corn(3,4) = 1.2;
corn(4,4) = 0.5;
corn(5,4) = 0.1;
corn(6,4) = 0.6;
corn(7,4) = 0.4;
corn(8,4) = 0.7;
corn(9,4) = 1.0;
corn(10,4) = 0.3;
corn(11,4) = 1.1;
corn(12,4) = 0.2;
corn(13,4) = 0.9;
corn(14,4) = 0.8;
corn(15,4) = 1.4;
corn(16,4) = 0.2;
corn(17,4) = 1.0;
corn(18,4) = 0.1;
corn(19,4) = 1.3;
corn(20,4) = 0.4;
corn(21,4) = 1.2;
corn(22,4) = 0.3;
corn(23,4) = 0.7;
corn(24,4) = 0.4;
corn(25,4) = 0.4;
corn(26,4) = 1.7;
corn(27,4) = 0.7;
[c,cint,r,rint,stats]  = regress(y,corn)



%b
yest=corn*c;
mean(r);
H=corn*inv(corn'*corn)*corn';
n=length(corn(:,2));
p=length(c);
stand_r=r./(sqrt(sum(r.^2)/(n-p)*(1-diag(H)))) % standardized residuals
sigma=sum(r.^2)/(n-p-1)-(r.^2)./((n-p-1)*(1-diag(H)));
stud_r=r./(sqrt(sigma).*sqrt(1-diag(H))) % studentized residuals
qqplot(r)


s  = stepwise(corn(:,2:4),y)