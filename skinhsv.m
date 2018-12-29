function [I im]=skinhsv(f);

f=double(f);
hsv_f=rgb2hsv(f);

H=hsv_f(:,:,1)*90; % hue
S=hsv_f(:,:,2); % saturation
V=hsv_f(:,:,3); % value

%% perform skin detection and store it in 'im'.
%  I= zeros(225,225);
for i=1:400
    for j=1:400
  
    if (H(i,j)>0 & H(i,j)<50 & S(i,j)>0.23 & S(i,j)<0.68)
        I(i,j)=1;
    else 
        I(i,j)=0;
    end     
    end  
end
im(:,:,1)=f(:,:,1).*I;   
im(:,:,2)=f(:,:,2).*I; 
im(:,:,3)=f(:,:,3).*I; 
figure, imshow(uint8(im)),title('skin detection');
