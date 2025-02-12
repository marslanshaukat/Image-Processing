function [y0detect,x0detect,Accumulator] = houghcircle(Imbinary,r,thresh)

%Voting
Accumulator = zeros(size(Imbinary));
[yIndex xIndex] = find(Imbinary);
for cnt = 1:length(xIndex)
    low=xIndex(cnt)-r;
    high=xIndex(cnt)+r;
    if (low<1) low=1; end
    if (high>size(Imbinary,2)) high=size(Imbinary,2); end
    for x0 = low:high
        y01 = yIndex(cnt)-sqrt(r^2-(xIndex(cnt)-x0)^2);
        y02 = yIndex(cnt)+sqrt(r^2-(xIndex(cnt)-x0)^2);
        y01 = round(y01); y02 = round(y02);
        if y01 < size(Imbinary,1) & y01 >= 1
            Accumulator(y01,x0) = Accumulator(y01,x0)+1;
        end
        if y02 < size(Imbinary,1) & y02 >= 1
            Accumulator(y02,x0) = Accumulator(y02,x0)+1;
        end
    end
end

% Finding local maxima in Accumulator
y0detect = []; x0detect = [];
AccumulatorbinaryMax = imregionalmax(Accumulator);
[Potential_y0 Potential_x0] = find(AccumulatorbinaryMax == 1);
Accumulatortemp = Accumulator - thresh;
for cnt = 1:length(Potential_y0)
    if Accumulatortemp(Potential_y0(cnt),Potential_x0(cnt)) >= 0
        y0detect = [y0detect;Potential_y0(cnt)];
        x0detect = [x0detect;Potential_x0(cnt)];
    end
end

