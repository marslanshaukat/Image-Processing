close all, clear all, clc 
I = imread('lena.jpg');
[r c]=size(I);
ISP = imnoise(I,'salt & pepper', .02);
imshow(I)
figure,imshow(ISP)

IG = imnoise(I,'gaussian');
figure,imshow(IG)

[X Y]=meshgrid(1:r,1:c);
n=sin(X+Y);
% figure
% mesh(n);
% figure
% surf(X,Y,n);
% plot3(X,Y,n)
IP=n+im2double(I);
figure,imshow(mat2gray(IP))

% m=3;
% n=3;
% fI = imfilter(ISP, fspecial('average',[m n]));
% figure,imshow(fI)
% 
% f2 = exp(imfilter(log(im2double(ISP)), ones(m, n), 'replicate')) .^ (1/(m*n));
% figure,imshow(f2);
% 
% f3 = m*n ./ imfilter(1 ./ (ISP + .001), ones(m, n), 'replicate');
% figure,imshow(f3);

fI=ordfilt2(ISP,5,ones(3,3));
figure,imshow(fI)

IPF=abs(fft2(IP));
imview(fftshift(IPF),[])