close all,clear all, clc
I = imread('landsat_berlin1.jpg');
I=rgb2gray(I);
I=edge(I,'canny');
I=fft2(I);
%figure,imshow(I);
J = imread('landsat_berlin2.jpg');
J=rgb2gray(J);
J=edge(J,'canny');
J=fft2(J);
%figure,imshow(J);
d=I.*conj(J);
p=angle(d);

[M N]=size(p);

px=zeros(N,1);
for j=1:N
    t=0;
    for i=1:M
        t=t+p(i,j);
    end
    px(j)=t/M;
end

plot(px);


gradient=findGradient([1:N],px)

% py=zeros(N,1);
% t=0;
% for i=1:M
%     for J=1:N
%         t=t+p(M,N);
%     end
%     py(i)=t/N;
% end
% 
% plot(py);


        
    

% R = xcorr2(double(I),double(J));
% [r c]=size(R);
% 
% s=R>=max(max(R));
% %figure,imshow(s);
% [x y]=find(s)
% 
% %[maxVal maxInd]=findMaxIndex(R)
% 
