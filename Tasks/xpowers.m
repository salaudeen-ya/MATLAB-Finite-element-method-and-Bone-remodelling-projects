function [sq,cub, sine, cosine, trig] = xpowers(input)
sq = input.^2;
cub = input.^3;
sine = sin(input);
cosine = cos(input);
trig = sin(input.^2) + cos(input.^2);