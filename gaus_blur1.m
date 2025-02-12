%%%%%  
%%%%%
%%%%%  
%%%%%  Gaussian Filter using different filter Size

I = imread('cameraman.tif');
       subplot(2,2,1);imshow(I);title('Original Image'); 
       H = fspecial('gaussian',[3 3],0.5);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,2);imshow(blurred);title('Blurred Image 3x3');
       H = fspecial('gaussian',[5 5],0.5);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,3);imshow(blurred);title('Blurred Image 5x5');
       H = fspecial('gaussian',[15 15],0.5);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,4);imshow(blurred);title('Blurred Image 15x15');