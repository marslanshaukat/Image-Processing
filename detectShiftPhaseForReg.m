function [shift]=detectShiftPhaseForReg(img1, img2)
% img1: Gray value image
% img2: Gray value image
% shift: The precise offset between img1 and img2
I1=fft2(double(img1));
I2=fft2(double(img2));
%  Centre the spectra using fftshift
sI1=fftshift(I1);
sI2=fftshift(I2);
%  Compute d(w,v)
d=sI1.*conj(sI2);
%  Use angle to determine the phase of d(w,v), and mean to determine the average
% phase px(v) over w
p=angle(d);
[w v]=size(d);
px=zeros(v,1);
for j=1:v
    t=0;
    for i=1:w
        t=t+p(i,j);
    end
    px(j)=t/w;
end
%  Use findGradient to determine the gradient of the line px(v)
gx=findGradient([1:v],px);
%  Compute the sub-pixel offset in x
sx=v*gx/2*pi;
%  Compute py(w) similarly, and determine the corresponding offset
py=zeros(w,1);
for i=1:w
    t=0;
    for j=1:v
        t=t+p(i,j);
    end
    py(i)=t/v;
end
gy=findGradient([1:w],py);
sy=w*gy/2*pi;
%  Use sub-pixel information to improve the result of detectShiftCorr
disp('Sub-pixel')
shift=[sx sy];
shift=shift+pixelShift;
end