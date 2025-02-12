function skin_detect(y,cb,cr)
% clc
% cb=[1 5 1;2 7 2 ; 1 4 0];
% cr=ones(3)*3;

m=[mean(mean(cb)) ; mean(mean(cr))]

p=cb;

[nr nc]=size(cb);
for i=1:nr
    for j=1:nc
        x=[cb(i,j) ; cr(i,j)];
        c=cov(x);
%         c=mean((x-m) * (x-m)' )
%         for k=1:2
%             c(k,k)=mean((x(k)-m(k)) * (x(k)-m(k)) )
%         end
%         c(1,2)=mean((x(1)-m(1)) * (x(2)-m(2)) )
%         c(2,1)=c(1,2)
        
%         t1=x-m
%         p(i,j)=exp(- 0.5* t1' * inv(c) * t1);
         p(i,j)=exp( - 0.5*(x - m)' * inv(c) * (x - m));
    end
end

imshow(mat2gray(p));
% 
% figure
% mesh(p)

p=p>=0.85;

figure,imshow(p)

% se = [1 0 1;0 1 0;1 0 1];
% p=imopen(p,se);
% figure,imshow(p),title('open')
% 
% p=imclose(p,se);
% figure,imshow(p),title('close')
% 
% p=imerode(p,se);
% figure,imshow(p),title('erosion')
% 
% p=imdilate(p,se);
% figure,imshow(p),title('dilate')
 

end