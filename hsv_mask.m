function [M, Hmask,Smask,Vmask] = hsv_mask(H,S,V)
    Hmask = ((H > 0.7) & (H < 1));
    Smask = (S > 0.2) & (S < 1);
    Vmask = (V > 0.2) & (V < 1);    
    M = Hmask & Smask & Vmask;
%     figure
%     subplot(3,1,1)
%     imshow(Hmask);
%     subplot(3,1,2)
%     imshow(Smask);
%     subplot(3,1,3)
%     imshow(Vmask);
  
%     M = medfilt2(M,[3 3]);  
%     M = imclose(M,strel('disk',20));
     SE = strel('disk',7);
     M = imclose(M,SE);
     %M = imdilate(M,strel('disk',5));
      M = bwareaopen(M, 50);     
%      M = imerode(M,strel('disk',5));
      M = imdilate(M,strel('disk',2));
    
end