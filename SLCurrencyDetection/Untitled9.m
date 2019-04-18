clear
clc
[image_name,image_path]=uigetfile({'*.jpg;'});
J=imread([image_path,'/',image_name]);
%imtool(J)
im_name1='100.jpg';
im_name2='1000.jpg';
im_name3='20.jpg';
if strcmp(im_name1,image_name)==1
I = J(16:55,16:90,:); %crop the image
I1 = rgb2gray(I);
I2 = im2bw(I1, 0.70);
I3 = medfilt2(I2);
I4 = imcomplement(I3); %exchang white and black
I5=medfilt2(I4); % remove noise
results = ocr(I5, 'TextLayout', 'Block');
answer = results.Text
ans = answer;
%imtool(I5)
if strcmp(ans,answer)==1
  name='ONE HUNDRED RUPEES';
    value=100;
    result= fprintf('Recognized currency is : %s  %d \n', name, value);
else
end
elseif strcmp(im_name2,image_name)==1
I = J(19:45,16:102,:);
I1 = rgb2gray(I);
I2 = im2bw(I1, 0.70);
I3=medfilt2(I2);
I4 = imcomplement(I3);
I5=medfilt2(I4);
results = ocr(I5, 'TextLayout', 'Block');
answer=results.Text
ans=answer;
%imtool(I5)
if strcmp(ans,answer)==1
  name='ONE THOUSAND RUPEES';
    value=1000;
    result= fprintf('Recognized currency is : %s  %d \n', name, value);
else
end
elseif strcmp(im_name3,image_name)==1
I = J(36:80,32:124,:);
I1 = rgb2gray(I);
I2 = im2bw(I1, 0.70);
I3=medfilt2(I2);
I4 = imcomplement(I3);
I5=medfilt2(I4);
results = ocr(I5, 'TextLayout', 'Block');
answer=results.Text
ans=answer;
%imtool(I5)
if strcmp(ans,answer)==1
  name='TWENTY RUPEES';
    value=20;
    result= fprintf('Recognized currency is : %s  %d \n', name, value);
else
end
end
