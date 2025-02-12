%%%%%%%%%% IDEAL hPF
function [H U V]=ihpf(r,c,d0)
close all
%r=256;c=256;d0=40;
H=ones(r,c);
for U=1:r
    for V=1:c
        d=sqrt(((U-r/2)^2) + ((V-c/2)^2));
        if d <= d0
            H(U,V)=0;
        end
    end
end
    imshow(H)
end