%%%%%  
%%%%%
%%%%%  
%%%%%  prewitt Filter  
I = imread('cameraman.tif');
       subplot(2,2,1);imshow(I);title('Original Image'); 
       H = fspecial('prewitt');
       blurred = imfilter(I,H,'replicate');
       subplot(2,2,2);imshow(blurred);title(' horz Edges');
       H = fspecial('prewitt');
       blurred = imfilter(I,H','replicate');
       subplot(2,2,3);imshow(blurred);title(' vert Edges');
       H = fspecial('prewitt');
      