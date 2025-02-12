%%%%%  
%%%%%
%%%%%  
%%%%%  Gaussian Filter using different Sigma values

I = imread('cameraman.tif');
       subplot(2,2,1);imshow(I);title('Original Image'); 
       H = fspecial('gaussian',[5 5],0.2);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,2);imshow(blurred);title('Blurred Image 0.2');
       H = fspecial('gaussian',[5 5],0.4);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,3);imshow(blurred);title('Blurred Image 0.4');
       H = fspecial('gaussian',[5 5],0.8);
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,4);imshow(blurred);title('Blurred Image 0.8');