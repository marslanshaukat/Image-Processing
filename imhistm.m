function [hmim]=imhistm(ti,ei,L)
% g=imread(x);
[rt ct]=size(ti);
[re ce]=size(ei);

[heqim lutt]=imhisteq(ti,L);
[heqim lute]=imhisteq(ei,L);

lutm=zeros(L,1);
min=255;
for k=1:L
    for i=1:L
        if(lutt(k)-lute(i)==0)
            lutm(k)=i;
        else if( abs(lutt(k)-lute(i)) < 10)
                if(lute(i) < min)
                    min=lute(i);
                    lutm(k)=i;
                end
            end
        end
    end
end
hmim=zeros(rt,ct);

for i=1:rt
    for j=1:ct
        hmim(i,j)=lutm(ti(i,j)+1);
    end
end

hmim=uint8(hmim);

end