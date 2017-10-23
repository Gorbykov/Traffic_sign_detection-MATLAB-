function [H, S, V, Ihsv] = hsv_adjust(Iin)
    sigma = 1.5;
    Ihsv = rgb2hsv(Iin);    
    H = Ihsv(:,:, 1);
    S = Ihsv(:,:, 2);
    V = Ihsv(:,:, 3);
%     figure;
%     subplot(3,1,1)
%     imshow(H);
%     subplot(3,1,2)
%     imshow(S);
%     subplot(3,1,3)
%     imshow(V);
end