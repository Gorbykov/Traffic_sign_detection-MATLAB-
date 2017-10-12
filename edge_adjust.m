function [BW] = edge_adjust(Igray)
    BW = edge(Igray,'canny',0.15,1);
    BW = imfill(BW,'holes');
    SE = strel('disk',10);
    BW = imopen(BW,SE);    
end