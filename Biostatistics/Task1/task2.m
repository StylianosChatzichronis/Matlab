
%a
x = normcdf(73,70,2);
prob1 = 1 - x

%b
x = normcdf([65 75],70,2);
prob2 = x(2) - x(1)