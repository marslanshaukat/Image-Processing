function [pdetect,tdetect,Accumulator] = houghline(Imbinary,rhostep,thetastep,thresh)

p = 1:rhostep:sqrt((size(Imbinary,1))^2+(size(Imbinary,2))^2);
teta = 0:thetastep:180-thetastep;

%Voting
Accumulator = zeros(length(p),length(teta));
[yind xind] = find(Imbinary);
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
pdetect = [];tdetect = [];
for cnt = 1:length(Potential_p)
    if Accumulatortemp(Potential_p(cnt),Potential_teta(cnt)) >= 0
        pdetect = [pdetect;Potential_p(cnt)];
        tdetect = [tdetect;Potential_teta(cnt)];
    end
end

% Calculation of detected lines parameters(Radius & Angle).
pdetect = pdetect * rhostep;
tdetect = tdetect *thetastep - thetastep;