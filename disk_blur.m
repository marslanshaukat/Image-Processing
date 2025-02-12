%%%%%  
%%%%%
%%%%%  
%%%%%  Disk Filter  
I = imread('cameraman.tif');
       subplot(2,2,1);imshow(I);title('Original Image'); 
       H = fspecial('disk',5);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,2);imshow(blurred);title('Blurred Image using radius 5');
       H = fspecial('disk',10);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,3);imshow(blurred);title('Blurred Image using radius 10');
       H = fspecial('disk',15);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,4);imshow(blurred);title('Blurred Image using radius 15');