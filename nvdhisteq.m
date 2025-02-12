function [heqim]=nvdhisteq(g,L)



[r c]=size(g);

[h normh]=nvdhist(g,L);

[ncdf]=nvdcdf(normh,L);

tr=zeros(L,1);
tr=round(ncdf*L);

heqim=zeros(r,c);

for i=1:r
    for j=1:c
        heqim(i,j)=tr(g(i,j)+1);
    end
end

heqim=uint8(heqim);

end