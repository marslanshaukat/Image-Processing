%%%%%  
%%%%%
%%%%%  
%%%%%  Log Filter using different Filter Size

I = imread('cameraman.tif');
       subplot(2,2,1);imshow(I);title('Original Image'); 
       H = fspecial('log',[3 3],0.2);
       sharpened = imfilter(I,H,'replicate');
       subplot(2,2,2);imshow(sharpened+I);title('Sharpened Image 3x3');
       H = fspecial('log',[5 5],0.2);
       sharpened = imfilter(I,H,'replicate');
       subplot(2,2,3);imshow(sharpened+I);title('Sharpened Image 5x5');
       H = fspecial('log',[15 15],0.2);
       sharpened = imfilter(I,H,'replicate');
       subplot(2,2,4);imshow(sharpened+I);title('Sharpened Image 15x15');