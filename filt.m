function fili=filt (x)
    a=imread(x);
    [r c]=size(a);
    as=a;
    for i=1:r
        for j=1:c
            as=a*(-1)^(i+j);
        end
    end
    
    ftas=fft(as);
    h=zeros(r,c);
    h((r/2)-10:(r/2)+10,(c/2)-10:(c/2)+10)=1;
    fil=h*ftas;
    fili=ifft(fil);
    for i=1:r
        for j=1:c
            fili=fili*(-1)^(i+j);
        end
    end
    
    imshow(fili);
    
end