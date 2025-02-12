function d=matmul(a,b)

[m p]=size(a);
[p n]=size(b);
d=zeros(m,n);
for r=1:m
    t=0;
    for c=1:n
        for i=1:p
            t=t+a(r,i)*b(i,c);
        end
    end
    d(r,c)=t;
end      
end