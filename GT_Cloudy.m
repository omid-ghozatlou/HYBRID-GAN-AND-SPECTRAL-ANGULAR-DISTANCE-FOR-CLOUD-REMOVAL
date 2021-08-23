
% close all
% clear all
% clc
%%%%% 20200215 test data -----------------------------------------
cloudy_int = (imread('D:\Omid\UPB\Cloud_removal\Hybrid GAN & SAD\datasets\Paris_12bands\testA\S2B_MSIL2A_20200215T105029_RGB_249.tif'));
B4_cloudy_int = cloudy_int(:,:,4);
%%%%% 20200218 test data -----------------------------------------
cloudy_int = (imread('D:\Omid\UPB\Cloud_removal\Hybrid GAN & SAD\datasets\Paris_12bands\testA\S2B_MSIL2A_20200218T110009_RGB_193.tif'));
B4_cloudy_int = cloudy_int(:,:,4);
%%%%%% GT ----------------------------------------------------
GT_int = (imread('D:\Omid\UPB\Datasets\Paris\128x128 batches\Full_Bands_128\S2B_MSIL2A_20200319T105649_N0214_R094_T31UDQ_20200319T142847.SAFE\Stacked\S2B_MSIL2A_20200319T105649_RGB_193.tif'));
B4_GT_int = GT_int(:,:,4);
%%%%%%%%% Result 12 bands ----------------------
result_int = (imread('D:\Omid\UPB\Cloud_removal\Hybrid GAN & SAD\results\Paris_12bands_32 gf\result_120_S2B_MSIL2A_20200218T110009_RGB_193.tif'));
B4_result_int = result_int(:,:,4);
B4_result_12bands = double(B4_result_int).*0.5+0.5;
BW_result_12bands = edge(B4_result_12bands,'Canny');
%%%%%%%%% Result 10 bands ----------------------
result_int = (imread('D:\Omid\UPB\Cloud_removal\Hybrid GAN & SAD\results\Paris_10bands\result_120_S2B_MSIL2A_20200218T110009_RGB_193.tif'));
B4_result_int = result_int(:,:,3);
B4_result_10bands = double(B4_result_int).*0.5+0.5;
BW_result_10bands = edge(B4_result_10bands,'Canny');
%%%%%%%%% Result 4 bands ----------------------
result_int = (imread('D:\Omid\UPB\Cloud_removal\Hybrid GAN & SAD\results\Paris_IRRGB\result_120_S2B_MSIL2A_20200218T110009_RGB_193 - Copy.tif'));
B4_result_int = result_int(:,:,3);
B4_result_4bands = double(B4_result_int).*0.5+0.5;
BW_result_4bands = edge(B4_result_4bands,'Canny');
%%%%%%%%% Result 3 bands ----------------------
result_int = (imread('D:\Omid\UPB\Cloud_removal\Hybrid GAN & SAD\results\Paris_RGB_subnorm_1 bz\result_120_S2B_MSIL2A_20200218T110009_RGB_193.tif'));
B4_result_int = result_int(:,:,3);
B4_result_3bands = double(B4_result_int).*0.5+0.5;
BW_result_3bands = edge(B4_result_3bands,'Canny');

B4_cloudy=double(B4_cloudy_int)/8000;
B4_GT=double(B4_GT_int)/8000;
BW_cloudy = edge(B4_cloudy,'Canny'); 
BW_GT = edge(B4_GT,'Canny');



% cloudy_int_18 = (imread('S2B_MSIL2A_20200218T110009_RGB_229.tif'));
% B4_cloudy_int_18 = cloudy_int_18(:,:,4);
% B4_cloudy_18=double(B4_cloudy_int_18)/8000;
% ratio_18 = (B4_cloudy_18)./(B4_GT);
% sub_18 = (B4_cloudy_18) - (B4_GT);

ratio = (B4_cloudy)./(B4_GT);
sub = (B4_cloudy) - (B4_GT);
% sub = (sub)*1;
% figure
% subplot(3,3,1), imshow(B4_cloudy); title('cloudy ');
% subplot(3,3,4), imshow(B4_GT); title('GT ');
% subplot(3,3,3), imshow(sub); title('sub ');
% subplot(3,3,2), imshow(ratio); title('ratio ');
% subplot(3,3,6), imshow(sub,[]); title('sub [min , max] ');
% subplot(3,3,5), imshow(ratio,[]); title('ratio [min , max]');
% subplot(3,3,7), imshow(B4_cloudy_18); title('cloudy 18 ');
% subplot(3,3,9), imshow(sub_18,[]); title('sub 18 [min , max] ');
% subplot(3,3,8), imshow(ratio_18,[]); title('ratio 18 [min , max]');

% figure
% subplot(2,3,1), imshow(B4_cloudy); title('cloudy ');
% subplot(2,3,3), imshow(B4_GT); title('GT ');
% subplot(2,3,2), imshow(B4_result_12bands); title('result ');
% subplot(2,3,5), imshow(BW_result_12bands); title('canny result ');
% subplot(2,3,4), imshow(BW_cloudy); title('canny cloudy ');
% subplot(2,3,6), imshow(BW_GT); title('canny GT');

figure
subplot(2,6,1), imshow(B4_cloudy); title('cloudy ');
subplot(2,6,7), imshow(BW_cloudy); title('canny cloudy ');

subplot(2,6,2), imshow(B4_result_12bands); title('result 12 bands');
subplot(2,6,8), imshow(BW_result_12bands); title('canny result');

subplot(2,6,3), imshow(B4_result_10bands); title('result 10 bands');
subplot(2,6,9), imshow(BW_result_10bands); title('canny result');

subplot(2,6,4), imshow(B4_result_4bands); title('result IR & RGB bands');
subplot(2,6,10), imshow(BW_result_4bands); title('canny result');

subplot(2,6,5), imshow(B4_result_3bands); title('result RGB bands');
subplot(2,6,11), imshow(BW_result_3bands); title('canny result');

subplot(2,6,6), imshow(B4_GT); title('GT ');
subplot(2,6,12), imshow(BW_GT); title('canny GT');
