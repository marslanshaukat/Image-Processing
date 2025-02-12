
close all ,clc,clear all
addpath('C:\industrial trip haripur hazarah\100KZ730');
addpath( 'C:\industrial trip haripur hazarah\DCIM\100KZ730');
% addpath( 'H:\7S\Digital Image Processing\DIP Lab\faces');
f= imread('C:\Users\Arslan\a shot\p.jpg');
g=f;%imresize(f,0.25);
% imshow(g);
% ghsi=rgb2hsi(g);
% h=ghsi(:,:,1);
% % imview(h);
% 
% [r c]=size(h);
% 
% for i=1:r 
% 	for j=1:c
%                 if (h(i,j)>0.08)
%                 h(i,j) = 1;
%             else 
%                 h(i,j) = 0;
%         
% 
%     end
%     end
% end 
% h=round(h*256);
% figure,
% imshow(uint8(h));

[y cb cr]=rgb2ycbcr(double(g));
% figure,imshow(y);
% figure,imshow(cb);
% figure,imshow(cr);
figure

skin_detect(y,cb,cr)




