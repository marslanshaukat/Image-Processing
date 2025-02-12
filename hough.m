function [res,h3,pts]=hough(im,RHO_MAX,THETA_MAX)
% Usage: [res,h3,pts]=hough(im,RHO_MAX,THETA_MAX)
%
% Name:			hough(im,RHO_MAX,THETA_MAX)
%
% Version:		v1.0
%
% Author: 		Dimitrios Ioannou
%			dioan@robotsg.nuceng.ufl.edu
%			dioan@alder.circa.ufl.edu
%
% Modified by Yu Hen Hu on 12/3/2003
% add output h3, pts
%
%
% Date:			08/23/95
%
% Arguments:
%			im: is the input,binary, image. If the
%			image is not binary pixels having
%			non-zero values are considered.
%			RHO_MAX: is an integer number specifying
%			the rho quantization.
%			THETA_MAX: is an integer number
%			specifying the theta quantization
%
% Purpose:
%			perform the hough transform of a binary
%			image
%
% Dependencies:
%			None
%
% Example:		v=hough(im,256,256)
%			input is the image im, and the
%			quantization is d_rho=X/256 and d_theta=pi/256
%			if the size of the image is 256 by 256
%			d_rho=1.
%
%			v is the number of votes in the
%			paremeter space. v(i,j) is the number 
%			of votes for the strip having distance from 
%			the center of the image equal to 
%			(i-RHO_MAX/2)*d_rho (d_rho=X/RHO_MAX, the 
%			image is X by X	pixels),and its normal has 
%			angle j*d_theta,(d_theta=pi/THETA_MAX)
%
%			for a 256 by 256 image, the center of the
%			image is the center of the pixel (128,128)
%			i=1 => rho=(i-1-128)*d_rho=-128*d_rho
%			i=256 => rho=(i-1-128)*d_rho=127*d_rho
%			this essentially means that:
%			'the image is not symmetric around its center'.
%

tic
[X,Y]=size(im);
if X~=Y
	fprintf(1,'Input image is not square. Exiting!\n');
	return;
elseif rem(X,2)==1
	fprintf(1,'Input image size has to be even in pixels. Exiting!\n');
	return
end

d_rho=X/RHO_MAX;
d_theta=pi/THETA_MAX;

theta=0:d_theta:pi-d_theta; % 1 x theta_max vector

smat=sin(theta);% 1 x theta_max vector
cmat=cos(theta);% 1 x theta_max vector

fprintf('Finding feature points.\n');
[x,y]=find(im); % x, y: m x 1
pts=[x y]; % m x 2

% translation by a pixel so that low left pixel has (0,0) 
% coordinates
x=x-1;
y=y-1;

fprintf('Translating so the origin is in the middle of the image.\n');
fprintf('Doing the Hough Transform.\n');
h1=((y-Y/2) * smat + (x-X/2) * cmat )/d_rho; % m x theta_max matrix
% represented as a number between 0 and rho_max;

h2=h1+RHO_MAX/2; % m x theta_max matrix

fprintf('Rounding.\n');
h3=round(h2);  % each row consists of the rho value (rounded into an
% integer between 0 and rho_max-1 for a particular data point


fprintf('Summing the votes.\n');
res=zeros(RHO_MAX,THETA_MAX);
for j=0:RHO_MAX-1
    temp=(h3==j);
    res(j+1,:)=sum(temp);
end
toc

