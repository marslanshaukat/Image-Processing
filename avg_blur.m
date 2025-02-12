%%%%%  
%%%%%
%%%%%  
%%%%%  Average Filter
I = imread('cameraman.tif');
       subplot(2,2,1);imshow(I);title('Original Image'); 
       H = fspecial('average',[3 3]);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,2);imshow(blurred);title('Blurred Image 3x3');
       H = fspecial('average',[5 5]);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,3);imshow(blurred);title('Blurred Image 5x5');
       H = fspecial('average',[15 15]);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,4);imshow(blurred);title('Blurred Image 15x15');