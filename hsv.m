close all;
% clear all;
for i=1:25
    test_image = imread(['test_image/i' int2str(i) '.jpg']);
    %test_image = imread(['test_image/i3.jpg']);
    
    hsv_i = rgb2hsv(test_image);
    
    grayimg= rgb2gray(test_image);
    grayimg = imadjust(grayimg);
    bw = edge(grayimg,'canny',0.15,1);
    %imshow(bw);
    bw = imfill(bw,'holes');
    se = strel('disk',10);
    bw = imopen(bw,se);    
    
    % Split the original image into color bands.
    redBand = hsv_i(:,:, 1);
    saturation = hsv_i(:,:, 2);
    value = hsv_i(:,:, 3);
    
    % Threshold each color band.
    redMask = ((redBand > 0.7) & (redBand < 1));
    saturationMask = (saturation > 0.2) & (saturation < 1);
    valueMask = (value > 0.2) & (value < 1);
    
    
    
    % Combine the masks to find where all 3 are "true."
    redObjectsMask = uint8(redMask & saturationMask & valueMask);
    %imshow(redObjectsMask, []);
    hsv2 = imoverlay(test_image, redObjectsMask, [1 0 0]);
    
    in_filled = bw;
    %in_filled = imfill(bw, 'holes');
   %in_filled_perimeter = bwperim(in_filled);
    %in_filled_perimeter_thickened = imdilate(in_filled_perimeter, ones(3,3));
    %imshow(in_filled );
    black = zeros(size(grayimg));
    %rgb2 = imoverlay(black, in_filled&redObjectsMask,'yellow');
    img2 = in_filled&redObjectsMask;
    img2 = imdilate(img2,strel('disk',7));
    img2 = imerode(img2,strel('disk',6)) ;
    img2 = imdilate(img2,strel('disk',3));
    
    %imshow(img2);
    
    %figure
    imgg = imoverlay(test_image, img2, 'green');
    imshow(imgg);
    %imshowpair(test_image,imgg,'montage')
    %imshowpair(test_image,bw,'montage')
    %imshow(rgb2)
    title('1');
    
    %figure
    %imshowpair(hsv2,rgb2,'montage')
    %imshow(rgb2)
    %title('2');
    
    %figure
    %img = imdilate(rgb2,strel('disk',7));
    %img2 = imerode(img,strel('disk',4)) ;
    %imshowpair(test_image,img2,'montage')
    %title('3');
    pause;
end