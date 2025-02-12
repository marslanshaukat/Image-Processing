function f=lowpassfilter(size,cutoff,n)
if (cutoff<0) |(cutoff >0.5)
    error('cutoff frequency must be between 0 to 0.5')
end

if (n<1)
    error('n must be an integer >=1')
end
%[rows,cols]=size;
rows=size(1);
cols=size(2);

x=((ones(rows,1)*[1:cols]-(fix(cols/2)+ 1))/cols);
y=(([1:rows]*(ones(1,cols)-(fix(rows/2)+ 1))/rows);

radius=sqrt(x.^2+y.^2);

f=1./(1+(radius./cutoff).^(2*n));