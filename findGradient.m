% findGradient
%
% Determines the gradient of a line
% x: x coordinate of each point on the line (vector)
% y: y coordinate of each point on the line (vector)
% gradient: The estimated gradient of the line

function [gradient]=findGradient(x,y)
datLen = length(y);
y = y(:)';
x = x(:)';
w = abs(y) < 0.1*pi;
soln = [sum(x.^2.*w), sum(x.*w); sum(x.*w), sum(w)];
soln = soln \ [sum(x.*y.*w); sum(y.*w)];

figure;
hold on;
plot(x,y);
plot(x,soln(1)*x + soln(2),'r');
hold off;

gradient = soln(1);
