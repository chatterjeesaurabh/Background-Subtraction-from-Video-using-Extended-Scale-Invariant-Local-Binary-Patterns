function [x] = ESILBP(I)
%ESILBP Summary of this function goes here
% This function finds the ESILBP features of the pixel of image
%   Detailed explanation goes here
% I : 5x5 neighbourhood of the pixel
% Returns a decimal value of ESILBP value

tau=0.1;

x=zeros([16,1]);
x(1:2) = similarity(I(3,4), I(3,3));
x(3:4) = similarity(I(2,3), I(3,3));
x(5:6) = similarity(I(3,2), I(3,3));
x(7:8) = similarity(I(4,3), I(3,3));
x(9:10) = similarity(I(1,1), I(3,3));
x(11:12) = similarity(I(1,5), I(3,3));
x(13:14) = similarity(I(5,5), I(3,3));
x(15:16) = similarity(I(5,1), I(3,3));

x = logical(x)';

z = num2str(x);
z(isspace(z)) = '';
x= uint16(bin2dec(z));


end