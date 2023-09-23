function [y] = DEC_BIN(x)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% x:Takes Decimal value as input
% y:Returns a 16 bit binary value as output

z = [dec2bin(x,16)];
y = str2num(z');

end