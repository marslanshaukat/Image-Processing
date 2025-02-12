function f=highpassfilter(size,cutoff,n)
if (cutoff<0) |(cutoff >0.5)
    error('cutoff frequency must be between 0 to 0.5')
end

if (n<1)
    error('n must be an integer >=1')
end

f=1.0- lowpassfilter(size,cutoff,n);
