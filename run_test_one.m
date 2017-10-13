clear all
close all
Itest = imread('test_image/i1.jpg');
M = red_detection(Itest);
imshow(imoverlay(Itest, M, 'green'));