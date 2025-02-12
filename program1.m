for i=2:1:18
    for j=2:2:19
        m(i,j)=0;
    end
end
m(9,9)=255;
imshow(m);
F=fft2(m);
G=real(F);
f=abs(G);
n=mat2gray(G)
figure, imshow(n);