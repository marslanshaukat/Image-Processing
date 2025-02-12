%%%%%%%% MY Hough Scrpt %%%%%%%%%%%%%%%%
close all, clear all, clc

I = imread('D:\Program Files\MATLAB\R2008a\toolbox\images\imdemos\coins.png');
imshow(I);
BW = edge(I,'canny');

r = 10;
[rows, columns] = size(BW);
acc = zeros(rows,columns);
centre_circle_array = zeros(rows,columns);

for x = 1 : columns
for y =1 :rows
if(BW(y,x)==0)
BW2(y,x)=255;
else
BW2(y,x) =0;
end
end
end
figure
imshow(BW2);

for x = 1 : columns
for y = 1 :rows
if(BW2(y,x) == 0)
for ang = 0:360
t = (ang*pi)/180;
x0 = round(x-r*cos(t));
y0 = round(y-r*sin(t));
if(x0<columns&x0>0 & y0<rows & y0>0)
acc(y0,x0) = acc(y0,x0) +1;
end
end
end
end
end

peak_value = 0;
for x=1 : columns
for y=1 :rows
if(acc(y,x)>peak_value)
peak_value=acc(y,x);
circle_centre_array(y,x)=peak_value;
end
end
end