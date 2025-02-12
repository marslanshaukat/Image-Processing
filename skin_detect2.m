function skin_detect2(y,cb,cr)
clc
cb=[1 5 1;2 7 2 ; 1 4 0];
cr=ones(3)*3;

x=[cb,cr]'
m=mean(x)
c=cov(x)
m2=zeros(size(x));
for i=1:6
    m2(i,:)=m;
end
m2
(x-m2)' * inv(c)

% x = [cbs,crs]'
% % [nr nc]=size(x)
% % % imshow(x);
% m=mean(x)
% % size(m)
% c=cov(double(x))
% % size(c)
% % 
% % % P(Cb,Cr) = exp(-0.5*(x - m)' * inv(c) * (x - m));
% % t1=x;
% % for i=1:nr
% %     t1(i,:)=x(i,:)-m;
% % end
% % t1
% % size(t1)
% invc=inv(c)
% % size(invc)
% % t2=invc* t1
% % P=exp(-0.5*(x - m)' * inv(c) * (x - m));
% % t2=double(t1') * inv(c);
% % d=t1*t1';
% % c=matmul(t1,t1');
% % [row col]=size(t1);
% % d=t1(1:row/4,:)*t1';
% % c=mean(mean(d));

% 

end