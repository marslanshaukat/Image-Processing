function [rho,theta,H]=hought2(binimage)

xstep=1;
ystep=1;

[x y]=size(binimage);
[xind yind]=find(binimage);
m=1:xstep:x/2;
c=1:ystep:y/2;

accum=zeros(length(c), length(m));

cc = ceil(yind - m*xind)

cc = cc - min(cc)+1

for i=1:xstep:length(m)
    if (cc(i) > max(c) )
        cc(i)=max(c);
    end
end

accum(c,m) = accum(c,m) +1;


imshow(accum);

end