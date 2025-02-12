%%%%%  
%%%%%
%%%%%  
%%%%%  Laplacian Filter
I = imread('cameraman.tif');
       subplot(2,2,1);imshow(I);title('Original Image'); 
       H = fspecial('laplacian',0.2);
       sharpened = imfilter(I,H,'replicate');
       subplot(2,2,2);imshow(sharpened+I);title('Sharpened Image using alpha 0.2');
       H = fspecial('laplacian',0.4);
       sharpened = imfilter(I,H,'replicate');
       subplot(2,2,3);imshow(sharpened+I);title('Sharpened Image using alpha 0.4');
       H = fspecial('laplacian',0.8);
       sharpened = imfilter(I,H,'replicate');
       subplot(2,2,4);imshow(sharpened+I);title('Sharpened Image using alpha 0.8');