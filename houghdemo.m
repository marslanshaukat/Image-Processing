% houghdem.m - hough transform demonstration program
% call hough.m 
%
% copyright (c) 1997 by Yu Hen Hu
% created: 12/8/97
% modified 12/6/2002 to use the public domain hough.m
%
% given rho and theta, find the corresponding line in the plane
%
clear all
load p64int.txt;
im=edge(p64int,'sobel');
[mim,nim]=size(im);
figure(1), clf, colormap('gray'),
subplot(131),imagesc(im),title('original binary image')

[M,M1]=size(im);  
rho_max=mim/2; theta_max=nim/2;
[res,h3,pts]=hough(im,rho_max,theta_max);
figure(1),subplot(132),imagesc(res),title('hough transform results')
% res: rho_max by theta_max matrix
% h3: m x theta_max matrix, each row is the relative, rounded rho value
%   as an integer between 0 to rho_max-1
% to find the points relating to a point in the res matrix, 
% first find the res matrix coordinate resi, resj
% then find resj column of the h3 matrix
% find all rows that has the resi value. Those are the points in pts
% that belong to the same line with rho = resi, theta = resj

% first sort elements of res to find the top choices
sortres=-sort(-reshape(res,rho_max*theta_max,1));
figure(2),clf,stem(sortres(1:50))
npt=input('# of lines to be extracted = ');

newim=zeros(size(im));
for n=1:npt,
   [i,j]=find(res==sortres(n)); % coordinates in res matrix (rho_i, theta_j)
   % i, j may be vectors!
   len=length(i); 
   if len==1, 
      idx=find(h3(:,j)==i-1);
      cline=pts(idx,:); % coordinates of those fit within a staight line
      for k=1:length(idx),
         newim(cline(k,1),cline(k,2))=255-5*n;
      end
   elseif len>1,
      for m=1:len,
         idx=find(h3(:,j(m))==i(m)-1);
         cline=pts(idx,:); % coordinates of those fit within a staight line
         for k=1:length(idx),
            newim(cline(k,1),cline(k,2))=255-5*n;
         end
      end
   end
end
figure(1),subplot(133),imagesc(newim); 

         
   

