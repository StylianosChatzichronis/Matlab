%Norm for calculating Mahanalobi distance
function [ distance ] = Norm_i(means, cov_matrix, sample)

Sigma = inv(cov_matrix);
 distance = ((minus(cell2mat(sample),means ))) * Sigma *(transpose(minus(cell2mat(sample),means )));  