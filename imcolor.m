%%%%%%%% Equlization Script%%%%%%%%%%%%%%%%%%


clc,close all,clear all
im=imread('image_0015.jpg');
redim=imhisteq(im(:,:,1),256);
greim=imhisteq(im(:,:,2),256);
bluim=imhisteq(im(:,:,3),256);

newim=im;
newim(:,:,1)=redim;
newim(:,:,2)=greim;
newim(:,:,3)=bluim;
figure
imshow(im)

figure
imshow(newim)


