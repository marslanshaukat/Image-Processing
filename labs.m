close all,clear all
f=imread('cameraman.tif');
[r c]=size(f);

mask=zeros([r c]);

mur=mask;
rec=ones(7,11);

mur(1:7,1:11)=rec;

figure
imshow(mur);

%F=fft2(double(f));
H=fft2(mur);
figure
imshow(fftshift(H))
%G=H.*F;
%g=real(ifft2(G));

%figure

%imshow(mat2gray(g));
%%%%%%%mid
mid=mask;

mid(floor(r/2)-3:floor(r/2)+3,floor(c/2)-5:floor(c/2)+5)=rec;

figure
imshow(mid);

H=fft2(mid);
figure
imshow(fftshift(H))
%G=H.*F;
%g=real(ifft2(G));

%figure

%imshow(mat2gray(g));

%%%%%%%%bottem left

mbl=mask;

mbl(r-7:r-1,c-11:c-1)=rec;

figure
imshow(mbl);

H=fft2(mbl);
figure
imshow(fftshift(H))
%G=H.*F;
%g=real(ifft2(G));

%figure

%imshow(mat2gray(g));