function [op] = Dist(I_p, I_t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Dr= D_R(I_t);
Da = Relative_angle(I_p,I_t);
op = max(Da, Dr);
end