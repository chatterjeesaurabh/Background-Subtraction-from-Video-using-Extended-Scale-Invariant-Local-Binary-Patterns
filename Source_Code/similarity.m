function [x] = similarity(Ik,Ic)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
tau=0.1;
if Ik > (1+tau)*Ic
    x = [0,1];
elseif Ik<(1-tau)*Ic
    x=[1,0];
else
    x=[0,0];
end
