
% close all
% clear all
% clc

B1 = double(imread ('B1.580.tif'));
B2 = double(imread ('B2.580.tif'));
B3 = double(imread ('B3.580.tif'));
B4 = double(imread ('B4.580.tif'));
B5 = double(imread ('B5.580.tif'));
B6 = double(imread ('B6.580.tif'));
B7 = double(imread ('B7.580.tif'));
B8 = double(imread ('B8.580.tif'));
B8A = double(imread ('B8A.580.tif'));
B9 = double(imread ('B9.580.tif'));
B11 = double(imread ('B11.580.tif'));
B12 = double(imread ('B12.580.tif'));
e = 0.000005;
ro = sqrt(B4.^2 + B2.^2+ B3.^2 + B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2+ B1.^2);
tet1 = atan(sqrt(B4.^2 + B2.^2+ B3.^2 + B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B1+e));
tet2 = atan(sqrt(B4.^2 + B3.^2 + B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B2+e));
tet3 = atan(sqrt(B4.^2 + B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B3+e));
tet4 = atan(sqrt(B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B4+e));
tet5 = atan(sqrt(B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B5+e));
tet6 = atan(sqrt(B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B6+e));
tet7 = atan(sqrt(B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B7+e));
tet8 = atan(sqrt(B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B8+e));
tet9 = atan(sqrt(B9.^2 + B11.^2 + B12.^2)./(B8A+e));
tet10 = atan(sqrt(B11.^2 + B12.^2)./(B9+e));
tet11 = 2.*atan((B12)./(B11+e + sqrt(B11.^2 + B12.^2)));
% tet1 = (tet1_im2d/(pi/4))-1;
% tet10 = (tet10_im2d/(pi/4))-1;
% tet11 = (tet11_im2d/(pi/2))-1;
t1 = (tet1 - min(tet1(:))) / (max(tet1(:))- min(tet1(:)));
t2 = (tet2 - min(tet2(:))) / (max(tet2(:))- min(tet2(:)));
t3 = (tet3 - min(tet3(:))) / (max(tet3(:))- min(tet3(:)));
t4 = (tet4 - min(tet4(:))) / (max(tet4(:))- min(tet4(:)));
t5 = (tet5 - min(tet5(:))) / (max(tet5(:))- min(tet5(:)));
t6 = (tet6 - min(tet6(:))) / (max(tet6(:))- min(tet6(:)));
t7 = (tet7 - min(tet7(:))) / (max(tet7(:))- min(tet7(:)));
t8 = (tet8 - min(tet8(:))) / (max(tet8(:))- min(tet8(:)));
t9 = (tet9 - min(tet9(:))) / (max(tet9(:))- min(tet9(:)));
t10 = (tet10 - min(tet10(:))) / (max(tet10(:))- min(tet10(:)));
t11 = (tet11 - min(tet11(:))) / (max(tet11(:))- min(tet11(:)));
% ___________________________________________________________________
% invert transformation
x1 = ro.*cos(tet1);
x2 = ro.*sin(tet1).*cos(tet2);
x3 = ro.*sin(tet1).*sin(tet2).*cos(tet3);
x4 = ro.*sin(tet1).*sin(tet2).*sin(tet3).*cos(tet4);
x5 = ro.*sin(tet1).*sin(tet2).*sin(tet3).*sin(tet4).*cos(tet5);
x6 = ro.*sin(tet1).*sin(tet2).*sin(tet3).*sin(tet4).*sin(tet5).*cos(tet6);
x7 = ro.*sin(tet1).*sin(tet2).*sin(tet3).*sin(tet4).*sin(tet5).*sin(tet6).*cos(tet7);
x8 = ro.*sin(tet1).*sin(tet2).*sin(tet3).*sin(tet4).*sin(tet5).*sin(tet6).*sin(tet7).*cos(tet8);
x9 = ro.*sin(tet1).*sin(tet2).*sin(tet3).*sin(tet4).*sin(tet5).*sin(tet6).*sin(tet7).*sin(tet8).*cos(tet9);
x10 = ro.*sin(tet1).*sin(tet2).*sin(tet3).*sin(tet4).*sin(tet5).*sin(tet6).*sin(tet7).*sin(tet8).*sin(tet9).*cos(tet10);
x11 = ro.*sin(tet1).*sin(tet2).*sin(tet3).*sin(tet4).*sin(tet5).*sin(tet6).*sin(tet7).*sin(tet8).*sin(tet9).*sin(tet10).*cos(tet11);
x12 = ro.*sin(tet1).*sin(tet2).*sin(tet3).*sin(tet4).*sin(tet5).*sin(tet6).*sin(tet7).*sin(tet8).*sin(tet9).*sin(tet10).*sin(tet11);



x1_uint16 = uint16(x1);
x2_uint16 = uint16(x2);
x3_uint16 = uint16(x3);
x4_uint16 = uint16(x4);
x5_uint16 = uint16(x5);
x6_uint16 = uint16(x6);
x7_uint16 = uint16(x7);
x8_uint16 = uint16(x8);
x9_uint16 = uint16(x9);
x10_uint16 = uint16(x10);
x11_uint16 = uint16(x11);
x12_uint16 = uint16(x12);

Ro_uint16=uint16(ro);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%    imwrite(ro,'Ro.tif');
%    imwrite(Ro_uint16,'Ro_uint16.tif');
%    imwrite(tet1,'Teta_1.tif');
%    imwrite(tet2,'Teta_2.tif');
%    imwrite(tet3,'Teta_3.tif');
%    imwrite(tet4,'Teta_4.tif');
%    imwrite(tet5,'Teta_5.tif');
%    imwrite(tet6,'Teta_6.tif');
%    imwrite(tet7,'Teta_7.tif');
%    imwrite(tet8,'Teta_8.tif');
%    imwrite(tet9,'Teta_9.tif');
%    imwrite(tet10,'Teta_10.tif');
%    imwrite(tet11,'Teta_11.tif');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    imwrite(x12_uint16,'x12_uint16.tif');
%    imwrite(x1_uint16,'x1_uint16.tif');
%    imwrite(x2_uint16,'x2_uint16.tif');
%    imwrite(x3_uint16,'x3_uint16.tif');
%    imwrite(x4_uint16,'x4_uint16.tif');
%    imwrite(x5_uint16,'x5_uint16.tif');
%    imwrite(x6_uint16,'x6_uint16.tif');
%    imwrite(x7_uint16,'x7_uint16.tif');
%    imwrite(x8_uint16,'x8_uint16.tif');
%    imwrite(x9_uint16,'x9_uint16.tif');
%    imwrite(x10_uint16,'x10_uint16.tif');
%    imwrite(x11_uint16,'x11_uint16.tif');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% b4_Uint16 = imread ('B4.580.tif');
% 
% b1_double = double(imread ('B1.580.tif'));
% IM = b1_Uint16 - min(b1_Uint16(:)) ;
% IM = IM / max(IM(:)) ;
% % % imshow(b_Uint16,[])
% histogram(IM);
% figure(2)
% histogram(b1_Uint16)