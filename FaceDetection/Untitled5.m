a = imread('n.jpg');
a = imresize(a,0.3);
imshow(a);

detector = vision.CascadeObjectDetector;

detector.MergeThreshold = 7;

bbox = step(detector, a);

Out = insertObjectAnnotation(a,'rectangle',bbox,'detection');
imshow(Out);
