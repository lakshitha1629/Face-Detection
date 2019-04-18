format long g;
format compact;
fontSize =10;

%Reading Image
I = imread('1.png');
subplot(2,3,1); imshow(I); title('Original Image','FontSize',fontSize);

%Converting RGB image to Gray Level Image
gray = rgb2gray(I);
subplot(2,3,2); imshow(gray); title('Gray Level Image','FontSize', fontSize);

%imtool(gray)

%Thresholding to minimize the shadow from the image
image_thresholded = gray;
image_thresholded(gray>90) = 255;
subplot(2,3,3); imshow(image_thresholded); title('Thresholded Image','FontSize', fontSize);
binaryI = im2bw(image_thresholded);
%imtool(binaryI)
binaryI = imcomplement(binaryI);
%imtool(binaryI)

% Fill holes
binaryImage = bwconvhull(binaryI, 'objects', 4);
subplot(2,3,4); imshow(binaryImage); title('Binary Image with no holes','FontSize', fontSize);
imtool(binaryImage)

% Get rid of particles smaller than 2000 pixels.
binaryImage_ = bwareaopen(binaryImage, 2000);
subplot(2,3,5); imshow(binaryImage_); title('Binary Image without small particles','FontSize', fontSize);


% Label image.
[LabeledImage, numberOfCoins]=bwlabel(binaryImage_);

%numberOfCoins

prop=regionprops(LabeledImage,'Area','Centroid');

total = 0;

for n=1:size(prop,1)
    if prop(n).Area>640000
       total=total+2;
    elseif prop(n).Area>560000
        total=total+10;
    elseif prop(n).Area>510000
        total=total+1;
    elseif prop(n).Area>450000
        total=total+5;
    elseif prop(n).Area>330000
        total=total+1;
    end
end

subplot(2,3,6); imshow(binaryImage_); title(['Total value of money: ',num2str(total)]);
