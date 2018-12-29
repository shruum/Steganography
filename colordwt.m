
function [superx]=colordwt(image);

[ll1,lh1,hl1,hh1] = dwt2(double(image(:,:,1)),'haar');
 [ll2,lh2,hl2,hh2] = dwt2(double(image(:,:,2)),'haar');
 [ll3,lh3,hl3,hh3] = dwt2(double(image(:,:,3)),'haar');
% 
 imll1=make_image(ll1);
 imlh1=make_image(lh1);
 imhl1=make_image(hl1);
 imhh1=make_image(hh1);
 
 imll2=make_image(ll2);
 imlh2=make_image(lh2);
 imhl2=make_image(hl2);
 imhh2=make_image(hh2);
 
 imll3=make_image(ll3);
 imlh3=make_image(lh3);
 imhl3=make_image(hl3);
 imhh3=make_image(hh3);
 
[M_row, M_col] = size(imll1);                    % create a large matrix to put the subimages (256x256)
superx =zeros(M_row*2, M_col*2, 3, 'uint8');
% ll in the top left
superx(1:M_row, 1:M_col,1) = imll1;
superx(1:M_row, 1:M_col,2) = imll2;
superx(1:M_row, 1:M_col,3) = imll3;
 
%Likewise, we combine the color components for each of the details, and put themin their respective corners. put lh in top right
superx(1:M_row, M_col+1:M_col*2,1) = imlh1;
superx(1:M_row, M_col+1:M_col*2,2) = imlh2;
superx(1:M_row, M_col+1:M_col*2,3) = imlh3;

%put hl in bottom left
superx(M_row+1:M_row*2, 1:M_col,1) = imhl1;
superx(M_row+1:M_row*2, 1:M_col,2) = imhl2;
superx(M_row+1:M_row*2, 1:M_col,3) = imhl3;

%put hh in bottom 
superx(M_row+1:M_row*2, M_col+1:M_col*2,1) = imhh1;
superx(M_row+1:M_row*2, M_col+1:M_col*2,2) = imhh2;
superx(M_row+1:M_row*2, M_col+1:M_col*2,3) = imhh3;
 
 
 figure,
 imshow(superx),title('2D DWT image with four subbands');