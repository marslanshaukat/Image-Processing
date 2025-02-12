function f=filter(f,w)
[r,c]=size(f);
    imshow(f);
f=double(f);
s=2;
t=2;
for x=2:r-1
    for y=2:c-1    
        f(x,y)=round((w(s-1,t-1)*f(x-1,y-1)+w(s-1,t)*f(x-1,y)+w(s-1,t+1)*f(x-1,y+1)+w(s,t-1)*f(x,y-1)+w(s,t)*f(x,y)+w(s,t+1)*f(x,y+1)+w(s+1,t-1)*f(x+1,y-1)+w(s+1,t)*f(x+1,y)+w(s+1,t+1)*f(x+1,y+1))/9);    
    
    end
end
figure
imshow(mat2gray(f));
end

    