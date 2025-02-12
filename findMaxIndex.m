% findMaxIndex
%
% Finds the maximum value in 'data' and the corresponding index
%
% data: A matrix of any dimension
% maxVal: Maximum value in data
% maxIndex: The coordinates of the maximum (e.g. [y,x] in case of an image)

function [maxVal,maxInd]=findMaxIndex(data)
datSize = size(data);
datDim = numel(datSize);

maxVal = data;
ind = cell(datDim,1);
for i=1:datDim
    [maxVal,newInd] = max(maxVal);
    ind{i} = newInd;
end

maxInd = [ind{datDim}];
for i=datDim-1:-1:1
    backInd = sum([1,datSize(i+1:datDim-1)].*(maxInd-1))+1;
    maxInd = [ind{i}(backInd),maxInd];
end