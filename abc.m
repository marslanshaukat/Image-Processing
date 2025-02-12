close all
 f = imread('circuit.tif');
%         BW1 = edge(I,'prewitt');
%         BW2 = edge(I,'canny');
%         imshow(BW1)
%         figure
%         imshow(BW2)
%         
%         
%         %I = imread('cameraman.tif');
%         figure
%        subplot(2,2,1);imshow(I);title('Original Image'); 
%        H = fspecial('prewitt');
%        M = imfilter(I,H,'replicate');
%        M=M >=50;       
%        subplot(2,2,2);imshow(M);
       %f=magic(5);

    T=0.5*(double(min(f(:)))+double(max(f(:))));
       done=false;
       while ~done
           g=f >= T;
           Tnext = 0.5*(mean(f(g))+mean(f(~g)))
           done= abs(T-Tnext) < 0.5;
           T=Tnext;
           figure
           imshow(g);
       end