fr=f1;
f2=fr;
size_f=size(fr);
figure,imshow(uint8(fr)),title('received image');

%% conversion from rgb to hsv for skin detection
[fac1r]=face(fr);
% imshow(uint8(skin1));
% figure,
% imshow(fac1);
%% cropping the image and applying DWT

[im_cropr]=imcrop(uint8(fr),[key]);

figure,imshow(uint8(im_cropr)),title('cropped received image');
% index1r=find(im_cropfacer(:,:,1)); 
% index2r=find(im_cropfacer(:,:,2)); 
% index3r=find(im_cropfacer(:,:,3)); 
 
 [ll1r,lh1r,hl1r,hh1r] = dwt2(double(im_cropr(:,:,1)),'haar');
 [ll2r,lh2r,hl2r,hh2r] = dwt2(double(im_cropr(:,:,2)),'haar');
 [ll3r,lh3r,hl3r,hh3r] = dwt2(double(im_cropr(:,:,3)),'haar');

[superxr]= colordwt(im_cropr);

% [llf1r,lhf1r,hlf1r,hhf1r] = dwt2(double(im_cropfacer(:,:,1)),'haar');
% [llf2r,lhf2r,hlf2r,hhf2r] = dwt2(double(im_cropfacer(:,:,2)),'haar');
% [llf3r,lhf3r,hlf3r,hhf3r] = dwt2(double(im_cropfacer(:,:,3)),'haar');
% skin1r=find(llf1r);
% skin2r=find(llf2r);
% skin3r=find(llf3r);

% rr=zeros(32);
% rr(1:1024)=hh2(index2(1:1024));
% rr1=rr;
 
rr(:,:,1)=zeros(32);
rr(:,:,2)=zeros(32);
rr(:,:,3)=zeros(32);
rr1=rr(:,:,1);
rr2=rr(:,:,2);
rr3=rr(:,:,3);

rr1(1:1024)=hh1r(skin1(1:1024));
rr2(1:1024)=hh2r(skin2(1:1024));
rr3(1:1024)=hh3r(skin3(1:1024));

rr(:,:,1)=rr1;
rr(:,:,2)=rr2;
rr(:,:,3)=rr3;

figure,
imshow(uint8(rr)),title('recovered secret image');;
