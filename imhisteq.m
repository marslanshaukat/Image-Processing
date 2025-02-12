function [heqim lut]=imhisteq(g,L)
% g=imread(x);
[r c]=size(g);
tot=0;
y=zeros(L,1);
for i=1:r
    for j=1:c
        y(g(i,j)+1,1)=y(g(i,j)+1,1)+1;
    end
end
tot=r*c;
normy=y/tot;

% figure
% grlev=0:L-1;
% subplot(1,2,1);
% plot(grlev,y)

%%%%%%%%%%%%%%%%%cdffffff
cdff=zeros(L,1);
cdff(1,1)=normy(1,1);
for i=2:L
    cdff(i,1)=cdff(i-1,1)+normy(i,1);
end

lut=zeros(L,1);
lut=round(cdff*L);

% subplot(1,2,2); 
% plot(grlev,lut)

%%%%%%%%%%%%hist eq mapping
heqim=zeros(r,c);

for i=1:r
    for j=1:c
        heqim(i,j)=lut(g(i,j)+1);
    end
end

heqim=uint8(heqim);

end