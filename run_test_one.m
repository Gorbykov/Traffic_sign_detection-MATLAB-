clear all
close all
Itest = imread('test_image/i4.jpg');
M = red_detection(Itest);
imshow(imoverlay(Itest, M, 'green'));