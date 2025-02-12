%%%%%%% Hough Transform for line %%%%%%%%%%%%%%%%%%
close all
f=imread('cameraman.tif');
ib = edge(f,'canny');

[r c] = size(f);

[p t Accumulator] = houghline(ib, 1 , 1 , 50);


rhostep=1;
thetastep=1;
thresh=3;

p = 1:rhostep:sqrt((size(ib,1))^2+(size(ib,2))^2);
teta = 0:thetastep:180-thetastep;

%Voting
Accumulator = zeros(length(p),length(teta));
[yind xind] = find(ib);
for cnt = 1:size(xind)
    Indteta = 0;
    for tetai = teta*pi/180
        Indteta = Indteta+1;
        roi = xind(cnt)*cos(tetai)+yind(cnt)*sin(tetai);
        if roi >= 1 & roi <= p(end)
            temp = abs(roi-p);
            mintemp = min(temp);
            Indp = find(temp == mintemp);
            Indp = Indp(1);
            Accumulator(Indp,Indteta) = Accumulator(Indp,Indteta)+1;
        end
    end
end

% Finding local maxima in Accumulator
Accum_Max = imregionalmax(Accumulator);
[Potential_p Potential_teta] = find(Accum_Max == 1);
Accumulatortemp = Accumulator - thresh;
p = [];t = [];
for cnt = 1:length(Potential_p)
    if Accumulatortemp(Potential_p(cnt),Potential_teta(cnt)) >= 0
        p = [p;Potential_p(cnt)];
        t = [t;Potential_teta(cnt)];
    end
end

% Calculation of detected lines parameters(Radius & Angle).
p = p * rhostep;
t = t *thetastep - thetastep;

imshow(f)

figure , imshow(ib);
figure, imshow(Accumulator)

figure,imshow(f),hold on

for i=1:length(p) 
        xx=1:r;
        yy=ceil((p(i)/sin(t(i))) - xx*(cos(t(i)))/sin(t(i)));
        plot(xx,yy,'g');
end
