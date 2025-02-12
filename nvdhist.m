function [h normh]=nvdhist(g,L)

% g=imread('tire.tif');
% L=255;
[r c]=size(g);
tot=0;
h=zeros(L,1);
for i=1:r
    for j=1:c
        h(g(i,j)+1,1)=h(g(i,j)+1,1)+1;
    end
end
tot=r*c;
normh=h/tot;
% grlev=0:L-1;
% plot(grlev,h)
end