function [M, Hmask,Smask,Vmask] = hsv_mask(H,S,V)
    Hmask = ((H > 0.8) | (H < 0.1));
    Smask = (S > 0.3) & (S < 1);
    Vmask = (V > 0.1) & (V < 0.7);    
    M = Hmask & Smask & Vmask;
%     figure
%     subplot(3,1,1)
%     imshow(Hmask);
%     subplot(3,1,2)
%     imshow(Smask);
%     subplot(3,1,3)
%     imshow(Vmask);

  M = bwareaopen(M, 30);
%     M = medfilt2(M,[3 3]);  
%     M = imclose(M,strel('disk',3));
     %M = imdilate(M,strel('disk',5));
%      M = imerode(M,strel('disk',5));
%       M = imdilate(M,strel('disk',2));
    
end