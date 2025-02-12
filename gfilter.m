function f=gfilter(f,w)
[r,c]=size(f);
%     imshow(f);
f=double(f);
[rw,cw]=size(w);
wsum=0;
for x=1:rw;
 for y=1:cw;
     wsum=wsum+w(x,y);
 end
end
     
s=ceil(rw/2);
t=ceil(cw/2);
sum=0;
for x=s:r-s+1;
 for y=t:c-t+1;
       for i=s-rw:1
           for j=t-cw:1
                sum=sum+w(s+i,t+j)*f(x+i,y+j);
           end
       end
       f(x,y)=round(sum/wsum);
       sum=0;
    end
end

f=uint8(f);
% figure
% imshow(f);
end