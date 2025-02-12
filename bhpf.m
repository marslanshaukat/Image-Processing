%%%%%%%%%% Butterworth hPF
function [H U V]=bhpf(r,c,d0,n)
close all
%r=256;c=256;d0=40;n=1;
H=ones(r,c);
for U=1:r
    for V=1:c
        d=sqrt(((U-r/2)^2) + ((V-c/2)^2));
        H(U,V)=1-(1/(1+(d/d0)^2*n));
     end
  end
    imshow(H)
end