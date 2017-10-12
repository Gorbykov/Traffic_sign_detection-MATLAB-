for i=1:25
    Itest = imread(['test_image/i' int2str(i) '.jpg']);
    M = red_detection(Itest);
    imshow(imoverlay(Itest, M, 'green'));
    pause;
end