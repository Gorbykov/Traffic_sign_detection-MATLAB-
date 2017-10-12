function [BW] = morphological_adjust(BW)
    BW = imdilate(BW,strel('disk',7));
    BW = imerode(BW,strel('disk',6)) ;
    BW = imdilate(BW,strel('disk',3));
end