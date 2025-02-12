%%%%%  
%%%%%
%%%%%  
%%%%%  motion blur using different length and angle 
I = imread('cameraman.tif');
       subplot(2,2,1);imshow(I);title('Original Image'); 
       H = fspecial('motion',20,45);
       MotionBlur = imfilter(I,H,'replicate');
       subplot(2,2,2);imshow(MotionBlur);title('Motion Blurred Image 20 45');
        H = fspecial('motion',20,270);
       MotionBlur = imfilter(I,H,'replicate');
       subplot(2,2,3);imshow(MotionBlur);title('Motion Blurred Image 20 90');
        H = fspecial('motion',1,90);
       MotionBlur = imfilter(I,H,'replicate');
       subplot(2,2,4);imshow(MotionBlur);title('Motion Blurred Image 1 45');
       