function [BW] = edge_adjust(Igray)
%     figure
    BW = edge(Igray,'canny',0.15,2);    
%     imshow(BW);
%     pause    
BW = imdilate(BW,strel('disk',2));
BW = imfill(BW,'holes');
%     imshow(BW);
%     pause    
%     SE = strel('disk',10);    
%     BW = imopen(BW,SE);   
%     imshow(BW);
    
end