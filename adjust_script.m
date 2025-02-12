%%%%%%%%%%%%%% Hist Eq Script %%%%%%%%

clc,close all

im=imread('H:\Personal\mypics\diff\5_n.jpg');


imshow(im);
newim=imadjust(im,,grayFlag,rgbFlag,low_in,high_in,low_out,high_out,gamma);

%     w=ones(3);
%    newim(:,:,1) =gfilter(im(:,:,1),w);
%    newim(:,:,2) =gfilter(im(:,:,2),w);
%    newim(:,:,3) =gfilter(im(:,:,3),w);
% 
% figure
% imshow(newim)
% 
% redim=imhisteq(newim(:,:,1),256);
% greim=imhisteq(newim(:,:,2),256);
% bluim=imhisteq(newim(:,:,3),256);
% 
% 
% newim(:,:,1)=redim;
% newim(:,:,2)=greim;
newim(:,:,3)=bluim;


figure
imshow(newim)