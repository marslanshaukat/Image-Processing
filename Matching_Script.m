%%%%%%%% Matching Script%%%%%%%%%%%%%%%%%%

tim=imread('H:\Personal\mypics\Friends\DSCN4071.jpg');
eim=imread('H:\Personal\mypics\Friends\DSCN4055.jpg');
redim=imhistm(tim(:,:,1),eim(:,:,1),256);
greim=imhistm(tim(:,:,2),eim(:,:,2),256);
bluim=imhistm(tim(:,:,3),eim(:,:,3),256);

newim=tim;
newim(:,:,1)=redim;
newim(:,:,2)=greim;
newim(:,:,3)=bluim;

imshow(tim)

figure
imshow(newim)