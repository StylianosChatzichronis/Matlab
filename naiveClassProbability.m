function [ probability ] = naiveClassProbability(means, variances, sample)
% Calculates the probability that the sample belongs
% to a class

exponents_product = 1;

for x = 1:length(sample)
    exponents_product = exponents_product*exp(-((sample{x} - means(x))^2/(2*variances(x))));     
end

dimensions_exp = length(sample)/2;

probability = (1/(((2*pi)^dimensions_exp)*prod(sqrt(variances))))*exponents_product;
end