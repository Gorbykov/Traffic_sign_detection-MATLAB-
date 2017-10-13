function [BW] = edge_adjust(Igray)
%     figure
    BW = edge(Igray,'canny',0.15,1);    
%     imshow(BW);
%     pause    
    BW = imfill(BW,'holes');
%     imshow(BW);
%     pause    
    SE = strel('disk',10);    
    BW = imopen(BW,SE);   
%     imshow(BW);
end