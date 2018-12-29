
function [fac_a]=face(I);

% I=imread('face400.jpg');
[skin_region ss]=skinhsv(I);

se = strel('disk',5);
se2 = strel('disk',3);
er = imerode(skin_region,se2);
cl = imclose(er,se);
dil = imdilate(cl,se);        % morphologic dilation
dil = imdilate(dil,se); 
cl2 = imclose(dil,se);
d2 = imfill(cl2, 'holes');   % morphologic fill
% facearea = bwdist(~d2);            % computing minimal euclidean distance to non-white pixel 
% figure;imshow(facearea,[]);

% imshow(d2);
fac(:,:,1)=double(I(:,:,1)).*d2;   
fac(:,:,2)=double(I(:,:,2)).*d2; 
fac(:,:,3)=double(I(:,:,3)).*d2; 
fac_a=uint8(fac);
figure;imshow(fac_a),title('face detected image');
