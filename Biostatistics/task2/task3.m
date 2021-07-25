%a
density_body = [1.0708 1.0751 1.0549 1.0722 1.0622 1.0668 1.079 1.0775 1.055 1.0416 1.0853 1.034 1.0704 1.083 1.0551 1.0911 1.0862 1.0754 1.0322 1.0776 1.0414 1.0502 1.09 1.0812 1.064 1.091 1.0719 1.0664 1.0873 1.0542]';
fat = [0.126 0.109 0.19 0.12 0.161 0.142 0.094 0.099 0.19 0.245 0.069 0.278 0.12 0.075 0.19 0.046 0.065 0.108 0.286 0.099 0.246 0.206 0.051 0.085 0.153 0.047 0.134 0.144 0.061 0.191]';
x=[ones(size(density_body)) density_body];
[c,cint,r,rint,stats]  =regress(fat,x)
figure();
plotmatrix(density_body,fat);
xlabel('body density (Kgr/lt)')
ylabel('fat')

%b
figure();
plot(density_body,fat,'*');
hold on;
temp = (max(density_body)-min(density_body))/30;
x = min(density_body)-0.003:temp:max(density_body)+0.003;
y = c(1)+ c(2).*x;
plot([x(1) x(length(x))],[y(1) y(length(y))],'r','LineWidth',2)
xlabel('body density (Kgr/lt)')
ylabel('fat')
hold off

%R-square statistic,F statistic, p value for the full model
%,estimate of the error variance
stats 


%gamma
y1 = c(1)+ c(2)*1.045
y2 = c(1)+ c(2)*1.145

%delta
x=[ones(size(density_body)) density_body];
yest=x*c;
mean(r);
H=x*inv(x'*x)*x';
n=length(x(:,2));
p=length(c);
stand_r=r./(sqrt(sum(r.^2)/(n-p)*(1-diag(H)))) % standardized residuals
sigma=sum(r.^2)/(n-p-1)-(r.^2)./((n-p-1)*(1-diag(H)));
stud_r=r./(sqrt(sigma).*sqrt(1-diag(H))) % studentized residuals
[h3,p,lstat,cv] = lillietest(fat,0.05)
figure();
qqplot(r)
figure();
plot(yest,stud_r,'.')
