function [ x ] = checkForNumber( x )
% Checks if x can be converted to number
if ~isnan(str2double(x))
    x = str2double(x);
end
end