%% Note : demo.m is the transmitter code
%%        demo2.m is the receiver code




clear all;
clc;

f=imread('face400.jpg');
f1=f;
N=400;
size_f=size(f);
figure,
imshow(f),title('original image');

%% conversion from rgb to hsv for skin detection
[fac1]=face(f);
           % all the skin pixels
%% cropping the image abd applying DWT

[im_crop rect]=imcrop(uint8(f),[50 50 256 256]);
size_crop=size(im_crop);
[im_cropface rect]=imcrop(uint8(fac1),[50 50 256 256]);

figure,imshow(uint8(im_crop)),title('crooped image (Area=key)');
key=rect;                                      % is the key at the decoder

 [ll1,lh1,hl1,hh1] = dwt2(double(im_crop(:,:,1)),'haar');
 [ll2,lh2,hl2,hh2] = dwt2(double(im_crop(:,:,2)),'haar');
 [ll3,lh3,hl3,hh3] = dwt2(double(im_crop(:,:,3)),'haar');
 
 [superx]= colordwt(im_crop);
 
s=imread('secret13.png');
%s=imread('secret8.jpg');

figure,imshow(uint8(s)),title('secret image to be hid');
% size(s);

[llf1,lhf1,hlf1,hhf1] = dwt2(double(im_cropface(:,:,1)),'haar');
 [llf2,lhf2,hlf2,hhf2] = dwt2(double(im_cropface(:,:,2)),'haar');
 [llf3,lhf3,hlf3,hhf3] = dwt2(double(im_cropface(:,:,3)),'haar');
skin1=find(llf1);
skin2=find(llf2);
skin3=find(llf3);


hh1(skin1(1:1024))=s(:,:,1);
hh2(skin2(1:1024))=s(:,:,2);
hh3(skin3(1:1024))=s(:,:,3);

%% image reconstruction by using inverse

 recon1=idwt2(ll1,lh1,hl1,hh1,'haar');
 recon2=idwt2(ll2,lh2,hl2,hh2,'haar');
 recon3=idwt2(ll3,lh3,hl3,hh3,'haar');
%  
%  imrecon1=make_image(recon1);
%  imrecon2=make_image(recon2);
%  imrecon3=make_image(recon3);
 
imgrecon(:,:,1)=recon1;
imgrecon(:,:,2)=recon2;
imgrecon(:,:,3)=recon3;

figure, imshow(uint8(imgrecon)),title('cropped stego image(original+secret)');

for i=0:256
    for j=0:256
        
    f1(50+i,j+50,1)=imgrecon(i+1,j+1,1);
    f1(50+i,j+50,2)=imgrecon(i+1,j+1,2);
    f1(50+i,j+50,3)=imgrecon(i+1,j+1,3);
    end
end

figure, imshow(uint8(f1)),title('reconstructed stego image to be transmitted');
psn=mse(f,f1,N)
