clc
close all
clear all
%-----------------------------------
% images=zeros(205,800,800,4);
location = 'D:\Omid\UPB\SVM\Galaxy-classification-master\data\Animal\dogs\*.jpg';       %  folder in which your images exists
ds = datastore(location);         %  Creates a datastore for all images in your folder
i=1;
while hasdata(ds) 
%     for i = 1 : length(ds.Files)
    img = read(ds) ; 
%     images(i,:,:,:) = read(ds);
%     end
    % read image from datastore
%     images(i) = img;
%     i=i+1;
%     figure, imshow(img);    % creates a new window for each image
end
images = double(images);
img=zeros(40,800,800,3);
for  i=1:40
    img = imread(char(ds.Files(i)));
end
% %--------------------------------------------
% images = load('imgs.mat');
% images = double(images.images);
% B8A=zeros(); B1=zeros();B2=zeros(); B3=zeros();B11=zeros(); B12=zeros();
% B4=zeros(); B5=zeros();B6=zeros(); B7=zeros();B8=zeros(); B9=zeros();

% % % 
n = 1312;
B1 = images(1:n,:,:);
B11 = images(n+1:n*2,:,:);
B12 = images(n*2+1:n*3,:,:);
B2 = images(n*3+1:n*4,:,:);
B3 = images(n*4+1:n*5,:,:);
B4 = images(n*5+1:n*6,:,:);
B5 = images(n*6+1:n*7,:,:);
B6 = images(n*7+1:n*8,:,:);
B7 = images(n*8+1:n*9,:,:);
B8 = images(n*9+1:n*10,:,:);
B8A = images(n*10+1:n*11,:,:);
B9 = images(n*11+1:n*12,:,:);
% n = 29;m=0;
% B1 = images(1:n,:,:);
% B11 = images(n+1:n+m,:,:);
% B12 = images(n*2+1:n*2+m,:,:);
% B2 = images(n*3+1:n*3+m,:,:);
% B3 = images(n*4+1:n*4+m,:,:);
% B4 = images(n*5+1:n*5+m,:,:);
% B5 = images(n*6+1:n*6+m,:,:);
% B6 = images(n*7+1:n*7+m,:,:);
% B7 = images(n*8+1:n*8+m,:,:);
% B8 = images(n*9+1:n*9+m,:,:);
% B8A = images(n*10+1:n*10+m,:,:);
% B9 = images(n*11+1:n*11+m,:,:);
%   
% for i=1:n
%     B1(i,:,:) = (B1(i,:,:) - min(min(B1(i,:,:)))) / (max(max(B1(i,:,:)))- min(min(B1(i,:,:))));
%     B2(i,:,:) = (B2(i,:,:) - min(min(B2(i,:,:)))) / (max(max(B2(i,:,:)))- min(min(B2(i,:,:))));
%     B3(i,:,:) = (B3(i,:,:) - min(min(B3(i,:,:)))) / (max(max(B3(i,:,:)))- min(min(B3(i,:,:))));
%     B4(i,:,:) = (B4(i,:,:) - min(min(B4(i,:,:)))) / (max(max(B4(i,:,:)))- min(min(B4(i,:,:))));
%     B5(i,:,:) = (B5(i,:,:) - min(min(B5(i,:,:)))) / (max(max(B5(i,:,:)))- min(min(B5(i,:,:))));
%     B6(i,:,:) = (B6(i,:,:) - min(min(B6(i,:,:)))) / (max(max(B6(i,:,:)))- min(min(B6(i,:,:))));
%     B7(i,:,:) = (B7(i,:,:) - min(min(B7(i,:,:)))) / (max(max(B7(i,:,:)))- min(min(B7(i,:,:))));
%     B8(i,:,:) = (B8(i,:,:) - min(min(B8(i,:,:)))) / (max(max(B8(i,:,:)))- min(min(B8(i,:,:))));
%     B8A(i,:,:) = (B8A(i,:,:) - min(min(B8A(i,:,:)))) / (max(max(B8A(i,:,:)))- min(min(B8A(i,:,:))));
%     B9(i,:,:) = (B9(i,:,:) - min(min(B9(i,:,:)))) / (max(max(B9(i,:,:)))- min(min(B9(i,:,:))));
%     B11(i,:,:) = (B11(i,:,:) - min(min(B11(i,:,:)))) / (max(max(B11(i,:,:)))- min(min(B11(i,:,:))));
%     B12(i,:,:) = (B12(i,:,:) - min(min(B12(i,:,:)))) / (max(max(B12(i,:,:)))- min(min(B12(i,:,:))));
% end
% 
%  
ro = sqrt(B4.^2 + B2.^2+ B3.^2 + B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2+ B1.^2);
ro_int16 = uint16(ro);
tet1 = atan(sqrt(B4.^2 + B2.^2+ B3.^2 + B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B1+0.05));
tet2 = atan(sqrt(B4.^2 + B3.^2 + B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B2+0.05));
tet3 = atan(sqrt(B4.^2 + B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B3+0.05));
tet4 = atan(sqrt(B5.^2 + B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B4+0.05));
tet5 = atan(sqrt(B6.^2+ B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B5+0.05));
tet6 = atan(sqrt(B7.^2 + B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B6+0.05));
tet7 = atan(sqrt(B8.^2 + B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B7+0.05));
tet8 = atan(sqrt(B8A.^2+ B9.^2 + B11.^2 + B12.^2)./(B8+0.05));
tet9 = atan(sqrt(B9.^2 + B11.^2 + B12.^2)./(B8A+0.05));
tet10 = atan(sqrt(B11.^2 + B12.^2)./(B9+0.05));
tet11 = 2.*atan((B12)./(B11+0.05 + sqrt(B11.^2 + B12.^2)));

% t2 = zeros(size(tet1));

% for i=1:n
%     tet1(i,:,:) = (tet1(i,:,:) - min(min(tet1(i,:,:)))) / (max(max(tet1(i,:,:)))- min(min(tet1(i,:,:))));
%     tet2(i,:,:) = (tet2(i,:,:) - min(min(tet2(i,:,:)))) / (max(max(tet2(i,:,:)))- min(min(tet2(i,:,:))));
%     tet3(i,:,:) = (tet3(i,:,:) - min(min(tet3(i,:,:)))) / (max(max(tet3(i,:,:)))- min(min(tet3(i,:,:))));
%     tet4(i,:,:) = (tet4(i,:,:) - min(min(tet4(i,:,:)))) / (max(max(tet4(i,:,:)))- min(min(tet4(i,:,:))));
%     tet5(i,:,:) = (tet5(i,:,:) - min(min(tet5(i,:,:)))) / (max(max(tet5(i,:,:)))- min(min(tet5(i,:,:))));
%     tet6(i,:,:) = (tet6(i,:,:) - min(min(tet6(i,:,:)))) / (max(max(tet6(i,:,:)))- min(min(tet6(i,:,:))));
%     tet7(i,:,:) = (tet7(i,:,:) - min(min(tet7(i,:,:)))) / (max(max(tet7(i,:,:)))- min(min(tet7(i,:,:))));
%     tet8(i,:,:) = (tet8(i,:,:) - min(min(tet8(i,:,:)))) / (max(max(tet8(i,:,:)))- min(min(tet8(i,:,:))));
%     tet9(i,:,:) = (tet9(i,:,:) - min(min(tet9(i,:,:)))) / (max(max(tet9(i,:,:)))- min(min(tet9(i,:,:))));
%     tet10(i,:,:) = (tet10(i,:,:) - min(min(tet10(i,:,:)))) / (max(max(tet10(i,:,:)))- min(min(tet10(i,:,:))));
%     tet11(i,:,:) = (tet11(i,:,:) - min(min(tet11(i,:,:)))) / (max(max(tet11(i,:,:)))- min(min(tet11(i,:,:))));
%     ro(i,:,:) = (ro(i,:,:) - min(min(ro(i,:,:)))) / (max(max(ro(i,:,:)))- min(min(ro(i,:,:))));
% end
% Teta = zeros(320,366,366,11);
Teta(:,:,:,1) = tet1;Teta(:,:,:,2) = tet2;Teta(:,:,:,3) = tet3;
Teta(:,:,:,4) = tet4;Teta(:,:,:,5) = tet5;Teta(:,:,:,6) = tet6;
Teta(:,:,:,7) = tet7;Teta(:,:,:,8) = tet8;Teta(:,:,:,9) = tet9;
Teta(:,:,:,10) = tet10;Teta(:,:,:,11) = tet11;

% save('Teta_2.mat','tet2');save('Teta_11.mat','tet11');save('Teta_10.mat','tet10');
% save('Teta_3.mat','tet3');save('Teta_4.mat','tet4');save('Teta_5.mat','tet5');
% save('Teta_6.mat','tet6');save('Teta_7.mat','tet7');save('Teta_8.mat','tet8');
% save('Teta_9.mat','tet9');save('Teta_1.mat','tet1');save('ro_128.mat','ro');

% % for i=580:580+320
% % %     t1 = reshape((tet2(i-579,:,:)), [366,366]);
% %     imwrite(reshape((ro(i-579,:,:)), [366,366]),sprintf('ro_%d.tif',i))
% %     imwrite(reshape((ro_int16(i-579,:,:)), [366,366]),sprintf('roint_%d.tif',i))
% % %     imwrite(reshape((tet5(i-579,:,:)), [366,366]),sprintf('Teta5_%d.tif',i))
% % %     imwrite(reshape((tet6(i-579,:,:)), [366,366]),sprintf('Teta6_%d.tif',i))
% % %     imwrite(reshape((tet7(i-579,:,:)), [366,366]),sprintf('Teta7_%d.tif',i))
% % %     imwrite(reshape((tet8(i-579,:,:)), [366,366]),sprintf('Teta8_%d.tif',i))
% % %     imwrite(reshape((tet9(i-579,:,:)), [366,366]),sprintf('Teta9_%d.tif',i))
% % %     imwrite(reshape((tet10(i-579,:,:)), [366,366]),sprintf('Teta10_%d.tif',i))
% % %     imwrite(reshape((tet11(i-579,:,:)), [366,366]),sprintf('Teta11_%d.tif',i))
% % %     tet1(i,:,:,:))
% % end