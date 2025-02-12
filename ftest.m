%%%%%%%%%% Filter Test Script
f=imread('cameraman.tif');
[r c]=size(f);
d0=50;

F=fft2(double(f));
Fc=fftshift(F);

[H ,U,V]=ihpf(r,c,d0);
Gc=H.*Fc;
G=ifftshift(Gc);
g=real(ifft2(G));
figure
imshow(mat2gray(g));

[H ,U,V]=bhpf(r,c,d0,1);
Gc=H.*Fc;
G=ifftshift(Gc);
g=real(ifft2(G));
figure
imshow(mat2gray(g));

[H ,U,V]=ghpf(r,c,d0);
Gc=H.*Fc;
G=ifftshift(Gc);
g=real(ifft2(G));
figure
imshow(mat2gray(g));
