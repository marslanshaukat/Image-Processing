%%%%%%%% MY Hough Scrpt %%%%%%%%%%%%%%%%
close all, clear all, clc

f = imread('cameraman.tif');
BW = edge(f,'canny');

[r c] = size(f);
figure
imshow(f);
figure
imshow(BW);

[rho theta H]=hought(1,1,BW,70);
figure
imshow(f);
hold on
for i=1:length(rho) 
        xx=1:r;
        yy=round((rho(i)/sin(theta(i))) - xx*(cos(theta(i)))/sin(theta(i)));
        plot(xx,yy,'g');
end
