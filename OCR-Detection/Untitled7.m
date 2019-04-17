

n=imread('50.jpg');
m=ocr(n);
% z=insertObjectAnnotation(n,'rectangle', ...
%     m.wordBoundingBoxes, ...
%     m.wordConfidences);
% imshow(z);


z = locateText(m, '-', 'IgnoreCase', true);
zz = insertShape(n, 'rectangle', z);
figure; imshow(zz);