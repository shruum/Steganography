
function [psn]=mse(M1,M2,N)

R1 = M1(:,:,1);
G1 = M1(:,:,2);
B1 = M1(:,:,3);

R2 = M2(:,:,1);
G2 = M2(:,:,2);
B2 = M2(:,:,3);

dR = uint8(R1) - uint8(R2);
dG = uint8(G1) - uint8(G2);
dB = uint8(B1) - uint8(B2);

mseR = sum(sum((dR(:).^2)))/N^2;
mseG = sum(sum((dG(:).^2)))/N^2;
mseB = sum(sum((dB(:).^2)))/N^2;

% mseR = (1/N^2)*mean(dR(:).^2);
% mseG = (1/N^2)*mean(dG(:).^2);
% mseB = (1/N^2)*mean(dB(:).^2);

mse = mseR + mseG + mseB/3;

psn= 10*log10(255^2/mse);