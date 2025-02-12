function [ncdf]=nvdcdf(nvdpdf,L)
ncdf=zeros(L,1);
ncdf(1,1)=nvdpdf(1,1);
for i=2:L
    ncdf(i,1)=ncdf(i-1,1)+nvdpdf(i,1);
end
% grlev=0:L-1;
% plot(grlev,ncdf)
end