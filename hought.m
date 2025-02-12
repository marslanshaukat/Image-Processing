%%%%%%% MY Hough Transform Function for line detection

function [rho,theta,H]=hought(rhostep,thetastep,binimage, thrashold)
[x y]=size(binimage);
[xind yind]=find(binimage);
rho=1:rhostep:ceil(sqrt(x^2+y^2));
theta=1:thetastep:180;

accum=zeros(length(rho) , length(theta));
for j=1:length(xind)
    p= round(xind(j)*cos(theta*pi/180) + yind(j)*sin(theta*pi/180));
    for i=1:length(theta)
        if (p(i)>0 & p(i) <= max(rho))
            accum(p(i),theta(i)) = accum(p(i),theta(i)) +1;
        end
    end
end
figure
imshow(accum);

H=accum >= thrashold;
[rho theta]=find(H);
end