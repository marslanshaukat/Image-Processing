%%%%%%%%%% Point Detection %%%%%%%%%%%%%%%
close all, clear all, clc
w=[-1 -1 -1; -1 8 -1; -1 -1 -1];
f=imread('cameraman.tif');
gf=imfilter(double(f) ,w);
gabs=abs(gf);
T=max(gabs(:));
r1=gabs>=T/2; %%%%%%%%%% Equals to gf if T=1 and 

figure
imshow(f);
figure
imshow(gf);
figure
imshow(gabs);
figure
imshow(r1);

%%%%%%%%%%%%%%%%%% 2nd approach
% m=3
% n=3
% g=imsubtract(ordfilt2(f,m*n,ones(m,n)),ordfilt2(f,1,ones(m,n)));
% T=max(g(:))
% r2=g>=T;
% 
% figure
% imshow(g);
% figure
% imshow(r2);