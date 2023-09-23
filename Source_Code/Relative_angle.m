function [Da] = Relative_angle(vec_1,vec_2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a = 3*180/pi;
u = cross(vec_1,vec_2);
u = sqrt(sum(u.*u));
v = sum(uint8(vec_1).*uint8(vec_2));
ang = atan2(u,v);
Da = 1-exp(-max(0, ang-a));
end